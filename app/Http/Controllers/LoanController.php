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
                $deductionMonth = $startMonth->copy()->addMonths($i)->format('Y-m');
                
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

     \Log::info('Update Deduction Request:', [
        'deduction_id' => $deduction->id,
        'input' => $request->all()
    ]);
    
    // Start with detailed logging
    Log::channel('loan')->info('Starting deduction update', [
        'deduction_id' => $deduction->id,
        'user_id' => Auth::id(),
        'input_data' => $request->all()
    ]);

    if (!\Auth::user()->can('Edit Employee')) {
        Log::channel('loan')->warning('Permission denied', [
            'user_id' => Auth::id(),
            'action' => 'update_deduction'
        ]);
        return redirect()->back()->with('error', __('Permission denied.'));
    }

    DB::beginTransaction();
    try {
        // Validate input with detailed error logging
        $validator = \Validator::make($request->all(), [
            'is_deducted' => 'required|boolean',
            'remark' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            Log::channel('loan')->error('Validation failed', [
                'errors' => $validator->errors()->all(),
                'input' => $request->all()
            ]);
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        // Load loan with existence check
        $loan = $deduction->loan()->first();
        if (!$loan) {
            Log::channel('loan')->error('Loan not found', [
                'deduction_id' => $deduction->id
            ]);
            throw new \Exception("Associated loan not found for deduction");
        }

        Log::channel('loan')->debug('Loan loaded', [
            'loan_id' => $loan->id,
            'remaining_amount' => $loan->remaining_amount
        ]);

        // Update deduction record
        $updateResult = $deduction->update([
            'is_deducted' => $request->is_deducted,
            'remark' => $request->remark,
        ]);

        if (!$updateResult) {
            throw new \Exception("Failed to update deduction record");
        }

        if ($request->is_deducted == false) {
            // Handle skipped deduction
            Log::channel('loan')->info('Processing skipped deduction');
            
            $updateData = [
                'extended_months' => $loan->extended_months + 1,
                'number_of_months' => $loan->number_of_months + 1
            ];
            
            if (!$loan->update($updateData)) {
                throw new \Exception("Failed to update loan extension data");
            }

            $newEndMonth = Carbon::parse($loan->start_month)
                ->addMonths($loan->number_of_months - 1);
            
            Log::channel('loan')->debug('Creating new deduction', [
                'new_end_month' => $newEndMonth
            ]);

            $newDeduction = LoanDeduction::create([
                'loan_id' => $loan->id,
                'month' => $newEndMonth,
                'emi_amount' => $loan->monthly_emi,
                'is_deducted' => false,
            ]);

            if (!$newDeduction) {
                throw new \Exception("Failed to create new deduction record");
            }
        } else {
            // Handle successful deduction
            Log::channel('loan')->info('Processing successful deduction');
            
            $newRemaining = $loan->remaining_amount - $deduction->emi_amount;
            if ($newRemaining < 0) {
                throw new \Exception("Remaining amount would go negative");
            }

            if (!$loan->decrement('remaining_amount', $deduction->emi_amount)) {
                throw new \Exception("Failed to update remaining amount");
            }
        }

        DB::commit();
        
        Log::channel('loan')->info('Deduction updated successfully');
        return redirect()->route('loan.show', $deduction->loan_id)
            ->with('success', $request->is_deducted 
                ? __('Deduction marked as paid.') 
                : __('Deduction skipped. Loan term extended.'));
            
    } catch (\Exception $e) {
        DB::rollBack();
        
        Log::channel('loan')->error('Deduction update failed', [
            'error' => $e->getMessage(),
            'trace' => $e->getTraceAsString(),
            'deduction_id' => $deduction->id,
            'loan_id' => $loan->id ?? null
        ]);
        
        return redirect()->back()
            ->with('error', __('Failed to update deduction. Please try again.'))
            ->withInput();
    }
}

}