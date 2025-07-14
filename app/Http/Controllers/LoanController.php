<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\EmployeeLoan;
use App\Models\LoanDeduction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

class LoanController extends Controller
{
    public function index()
    {
        try {
            if(\Auth::user()->can('Manage Employee')) {
                $loans = EmployeeLoan::with(['employee', 'deductions'])
                    ->where('created_by', \Auth::user()->creatorId())
                    ->get();
                    
                return view('loan.index', compact('loans'));
            }
            return redirect()->back()->with('error', __('Permission denied.'));
        } catch (\Exception $e) {
            Log::error('LoanController index error: ' . $e->getMessage());
            return redirect()->back()->with('error', __('Something went wrong.'));
        }
    }

    public function create()
    {
        try {
            if(\Auth::user()->can('Create Employee')) {
                $employees = Employee::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                return view('loan.create', compact('employees'));
            }
            return redirect()->back()->with('error', __('Permission denied.'));
        } catch (\Exception $e) {
            Log::error('LoanController create error: ' . $e->getMessage());
            return redirect()->back()->with('error', __('Something went wrong.'));
        }
    }

    public function store(Request $request)
{
    if(\Auth::user()->can('Create Employee')) {
        DB::beginTransaction();
        try {
            $validator = \Validator::make(
                $request->all(), [
                    'employee_id' => 'required',
                    'total_amount' => 'required|numeric|min:1',
                    'number_of_months' => 'required|integer|min:1',
                    'start_month' => 'required|date',
                    'reason' => 'nullable|string',
                ]
            );

            if($validator->fails()) {
                return redirect()->back()->with('error', $validator->errors()->first());
            }

            $startMonth = Carbon::parse($request->start_month);
            $monthlyEmi = $request->total_amount / $request->number_of_months;

            $loan = EmployeeLoan::create([
                'employee_id' => $request->employee_id,
                'total_amount' => $request->total_amount,
                'number_of_months' => $request->number_of_months,
                'monthly_emi' => $monthlyEmi,
                'start_month' => $startMonth,
                'remaining_amount' => $request->total_amount,
                'created_by' => \Auth::user()->creatorId(),
                'reason' => $request->reason,
                'extended_months' => 0,
            ]);

            // Create deduction records for each month
            for ($i = 0; $i < $request->number_of_months; $i++) {
                $deductionMonth = $startMonth->copy()->addMonths($i)->startOfMonth();
                
                LoanDeduction::create([
                    'loan_id' => $loan->id,
                    'month' => $deductionMonth,
                    'emi_amount' => $monthlyEmi,
                    'is_deducted' => false,
                ]);
            }

            DB::commit();
            return redirect()->route('loan.index')->with('success', __('Loan successfully created.'));
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::error('Loan creation failed: '.$e->getMessage());
            return redirect()->back()->with('error', __('Failed to create loan. Please try again.'));
        }
    }
    return redirect()->back()->with('error', __('Permission denied.'));
}

    public function show($id)
    {
        try {
            if(\Auth::user()->can('Show Employee')) {
                $loan = EmployeeLoan::with(['employee', 'deductions'])->findOrFail($id);
                
                // Convert dates to Carbon instances and calculate original end month
                $loan->start_month = \Carbon\Carbon::parse($loan->start_month);
                $loan->original_end_month = $loan->start_month->copy()->addMonths($loan->number_of_months - 1);
                
                return view('loan.show', compact('loan'));
            }
            return redirect()->back()->with('error', __('Permission denied.'));
        } catch (\Exception $e) {
            Log::error('LoanController show error: ' . $e->getMessage());
            return redirect()->back()->with('error', __('Loan not found.'));
        }
    }

    public function editDeduction(LoanDeduction $deduction)
    {
        try {
            if(\Auth::user()->can('Edit Employee')) {
                return view('loan.edit_deduction', compact('deduction'));
            }
            return redirect()->back()->with('error', __('Permission denied.'));
        } catch (\Exception $e) {
            Log::error('LoanController editDeduction error: ' . $e->getMessage());
            return redirect()->back()->with('error', __('Failed to load deduction details.'));
        }
    }

public function updateDeduction(Request $request, LoanDeduction $deduction)
{
    if (!\Auth::user()->can('Edit Employee')) {
        return redirect()->back()->with('error', __('Permission denied.'));
    }

    DB::beginTransaction();
    try {
        $loan = $deduction->loan;

        // If admin selects "No Deduction"
        if ($request->is_deducted == false) {
            // Check if already marked as No Deduction
            if ($deduction->remark === 'No Deduction') {
                return redirect()->back()->with('error', __('This month is already marked as No Deduction.'));
            }

            // Mark this deduction as skipped
            $deduction->update([
                'is_deducted' => false,
                'remark' => 'No Deduction',
            ]);

            // Find the last scheduled deduction month
            $lastDeduction = $loan->deductions()
                ->orderBy('month', 'desc')
                ->first();

            // Create a new deduction in the next month
            $newMonth = Carbon::parse($lastDeduction->month)->addMonth();
            
            LoanDeduction::create([
                'loan_id' => $loan->id,
                'month' => $newMonth,
                'emi_amount' => $deduction->emi_amount,
                'is_deducted' => false,
                'remark' => null,
            ]);

            // Update loan remaining amount and extended status
            $loan->remaining_amount += $deduction->emi_amount; // Add back the amount
            $loan->extended_months += 1;
            $loan->save();

            DB::commit();
            return redirect()->route('loan.show', $loan->id)
                ->with('success', __('Deduction successfully deferred to next month.'));
        } 
        // If admin switches back to "Yes Deduct"
        else {
            // Check if this deduction was previously deferred
            if ($deduction->remark === 'No Deduction') {
                // Find the extended deduction (the last one)
                $lastDeduction = $loan->deductions()
                    ->orderBy('month', 'desc')
                    ->first();

                // Only remove if it's not the same as current deduction
                if ($lastDeduction->id != $deduction->id) {
                    $lastDeduction->delete();
                    $loan->extended_months -= 1;
                }

                // Revert this deduction to normal
                $deduction->update([
                    'is_deducted' => true,
                    'remark' => null,
                ]);
                
                // Update loan remaining amount
                $loan->remaining_amount -= $deduction->emi_amount;
            } else {
                // Just update normally
                $deduction->update([
                    'is_deducted' => true,
                    'remark' => null,
                ]);
            }

            $loan->save();
            DB::commit();
            return redirect()->route('loan.show', $loan->id)
                ->with('success', __('Deduction status updated successfully.'));
        }
    } catch (\Exception $e) {
        DB::rollBack();
        Log::error('Loan deduction update failed: ' . $e->getMessage());
        Log::error('Stack trace: ' . $e->getTraceAsString());
        return redirect()->back()->with('error', __('Action failed. Error: ') . $e->getMessage());
    }
}
    public function destroy($id)
    {
        try {
            if(\Auth::user()->can('Delete Employee')) {
                $loan = EmployeeLoan::findOrFail($id);
                $loan->delete();
                return redirect()->route('loan.index')->with('success', __('Loan successfully deleted.'));
            }
            return redirect()->back()->with('error', __('Permission denied.'));
        } catch (\Exception $e) {
            Log::error('LoanController destroy error: ' . $e->getMessage());
            return redirect()->back()->with('error', __('Failed to delete loan.'));
        }
    }

}
