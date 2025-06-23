<?php

namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\Employee;
use App\Models\BookingForm;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator; // Add this import
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\User;
use App\Models\Unit; // Add this import
use Illuminate\Validation\Rule; // Add this line



class BookingFormController extends Controller{
    public function index(Request $request)
    {
        if (Auth::user()->can('Manage TimeSheet')) {
            $query = BookingForm::with(['employee', 'project']); // Eager load relationships

            // For employees, only show their own bookings
            if (Auth::user()->type == 'employee') {
                $query->where('employee_id', Auth::user()->id);
            }

            // Filter by start_date and end_date
            if (!empty($request->start_date)) {
                $query->whereDate('booking_date', '>=', $request->start_date);
            }

            if (!empty($request->end_date)) {
                $query->whereDate('booking_date', '<=', $request->end_date);
            }

            // Filter by project if selected
            if (!empty($request->project)) {
                $query->where('project_id', $request->project);
            }

            $bookings = $query->get();

            // Load projects for filter dropdown
            // For employees, only show projects they're assigned to
            if (Auth::user()->type == 'employee') {
                $employee = Employee::where('user_id', Auth::user()->id)->first();
                $projects = [];
                
                if ($employee) {
                    $allProjects = Project::all();
                    foreach ($allProjects as $project) {
                        if (empty($project->assigned_data)) continue;
                        
                        $isAssigned = false;
                        $assignedData = $project->assigned_data;
                        
                        foreach ($assignedData as $assignment) {
                            if (isset($assignment['employee_ids']) && 
                                is_array($assignment['employee_ids']) &&
                                in_array($employee->id, $assignment['employee_ids'])) {
                                $isAssigned = true;
                                break;
                            }
                        }
                        
                        if ($isAssigned) {
                            $projects[$project->id] = $project->project_name;
                        }
                    }
                }
            } else {
                // For admins/managers, get all projects
                $projects = Project::pluck('project_name', 'id');
            }

            return view('booking.index', compact('bookings', 'projects'));
        }

        return redirect()->back()->with('error', 'Permission denied.');
    }
    
    public function create(Request $request)
    {
        if (Auth::user()->can('Create TimeSheet')) {
            try {
                $employees = Employee::pluck('name', 'user_id')->prepend('Select Employee', '');
                
                // Initialize projects array
                $projects = [];
                
                if (Auth::user()->type == 'employee') {
                    // Get current employee ID (from employees table id column)
                    $employee = Employee::where('user_id', Auth::user()->id)->first();
                    
                    if ($employee) {
                        // Get all projects and filter those assigned to this employee
                        $allProjects = Project::all();
                        
                        foreach ($allProjects as $project) {
                            if (empty($project->assigned_data)) {
                                continue;
                            }
                            
                            // Check if this employee is assigned to the project
                            $isAssigned = false;
                            $assignedData = $project->assigned_data;
                            
                            foreach ($assignedData as $assignment) {
                                if (isset($assignment['employee_ids']) && 
                                    is_array($assignment['employee_ids']) &&
                                    in_array($employee->id, $assignment['employee_ids'])) {
                                    $isAssigned = true;
                                    break;
                                }
                            }
                            
                            if ($isAssigned) {
                                $projects[$project->id] = $project->project_name;
                            }
                        }
                    }
                } else {
                    // For admins/managers, get all projects
                    $projects = Project::pluck('project_name', 'id');
                }

                $units = Unit::pluck('unit_name', 'id');
                $bookingForm = null;

                if ($request->has('booking_id')) {
                    $bookingForm = BookingForm::with(['project', 'unit'])->find($request->booking_id);
                }

                return view('booking.create', compact('employees', 'projects', 'bookingForm'));

            } catch (\Exception $e) {
                \Log::error('Error in BookingFormController@create', [
                    'error' => $e->getMessage(),
                    'trace' => $e->getTraceAsString()
                ]);
                return redirect()->back()->with('error', 'Error loading form. Check logs for details.');
            }
        }
        return redirect()->back()->with('error', 'Permission denied.');
    }
    
    public function store(Request $request)
    {
        
        if (Auth::user()->can('Create TimeSheet')) {
            \Log::info('Booking form submission started', $request->all());

            // Convert array fields to single values if needed
            $request->merge([
                'booking_date' => is_array($request->booking_date) ? $request->booking_date[0] : $request->booking_date,
                'mode_of_payment' => is_array($request->mode_of_payment) ? $request->mode_of_payment : [$request->mode_of_payment],
                'payment_detail' => is_array($request->payment_detail) ? $request->payment_detail : [$request->payment_detail],
                'amount' => is_array($request->amount) ? $request->amount : [$request->amount],
            ]);

            $validator = Validator::make($request->all(), [
                // Primary Applicant
                'primary_applicant_name' => 'nullable|string|max:255',
                'primary_applicant_contact_no' => 'nullable|string|max:20',
                'primary_applicant_email' => 'nullable|email|max:255',
                'primary_applicant_occupation' => 'nullable|string|max:255',
                'primary_applicant_company' => 'nullable|string|max:255',
                'primary_applicant_designation' => 'nullable|string|max:255',
                'primary_applicant_birth_date' => 'nullable|date',
                'primary_applicant_nationality' => 'nullable|string|max:100',
                'primary_applicant_pan_no' => 'nullable|string|max:20',
                'primary_applicant_aadhar_no' => 'nullable|string|max:20',

                // Secondary Applicant
                'secondary_applicant_name' => 'nullable|string|max:255',
                'secondary_applicant_contact_no' => 'nullable|string|max:20',
                'secondary_applicant_email' => 'nullable|email|max:255',
                'secondary_applicant_occupation' => 'nullable|string|max:255',
                'secondary_applicant_company' => 'nullable|string|max:255',
                'secondary_applicant_designation' => 'nullable|string|max:255',
                'secondary_applicant_birth_date' => 'nullable|date',
                'secondary_applicant_nationality' => 'nullable|string|max:100',
                'secondary_applicant_pan_no' => 'nullable|string|max:20',
                'secondary_applicant_aadhar_no' => 'nullable|string|max:20',

                // Project Details
                'project_id' => 'required|exists:projects,id',
                'unit_id' => 'required|exists:units,id',
                'booking_date' => 'nullable|date',
                'plot_area' => 'nullable|numeric',
                'carpet_area' => 'nullable|numeric',
                'rate_per_sq_ft' => 'nullable|numeric',
                'basic_cost' => 'nullable|numeric',
                'cost_infrastructure' => 'nullable|numeric',
                'gst' => 'nullable|numeric',
                'stamp_duty' => 'nullable|numeric',
                'registration' => 'nullable|numeric',
                'maintenance_cost' => 'nullable|numeric',
                'other' => 'nullable|numeric',
                'total_cost' => 'nullable|numeric',

                // Payment Details
                'mode_of_payment.*' => 'nullable|string|max:255',
                'payment_detail.*' => 'nullable|string|max:255',
                'amount.*' => 'nullable|numeric',
                'remaining' => 'nullable|numeric',
            ]);

            if ($validator->fails()) {
                \Log::error('Validation failed', $validator->errors()->toArray());
                return redirect()->back()
                    ->withErrors($validator)
                    ->withInput();
            }

            try {
                // Prepare Payment Data
                $paymentData = [];
                if ($request->has('mode_of_payment') && is_array($request->mode_of_payment)) {
                    foreach ($request->mode_of_payment as $key => $mode) {
                        $paymentData[] = [
                            'mode_of_payment' => $mode ?? null,
                            'date' => $request->booking_date ?? null, // Use the main booking date
                            'payment_detail' => $request->payment_detail[$key] ?? null,
                            'amount' => $request->amount[$key] ?? null,
                        ];
                    }
                }

                // Calculate remaining amount
                $totalCost = $request->total_cost ?? 0;
                $paidAmount = collect($paymentData)->sum('amount') ?? 0;
                $remaining = $totalCost - $paidAmount;

                $bookingData = $request->except([
                    'mode_of_payment', 
                    'payment_detail', 
                    'amount', 
                    '_token',
                    'confirm_total_cost'
                ]);

            
                $project = Project::find($request->project_id);
                $unit = Unit::find($request->unit_id);
                $bookingData = $request->all();

                $bookingData['project_name'] = $project ? $project->project_name : null;
                $bookingData['unit_name'] = $unit ? $unit->unit_name : null;    

                // Add unit_size and maintenance_cost from the unit
                $bookingData['unit_size'] = $unit ? $unit->unit_size : null;
                    
                $bookingData['employee_id'] = Auth::user()->type == 'employee' 
                    ? Auth::user()->id 
                    : $request->employee_id;
                
                $bookingData['payment_data'] = !empty($paymentData) ? json_encode($paymentData) : null;
                $bookingData['remaining'] = $remaining > 0 ? $remaining : null;

                // Create booking
                $booking = BookingForm::create($bookingData);

                \Log::info('Booking created successfully', ['id' => $booking->id]);
                return redirect()->route('booking.index')
                    ->with('success', __('Booking successfully created.'));

            } catch (\Exception $e) {
                \Log::error('Booking creation failed', ['error' => $e->getMessage()]);
                return redirect()->back()
                    ->with('error', 'Error creating booking: '.$e->getMessage())
                    ->withInput();
            }
        }
        

        return redirect()->back()->with('error', 'Permission denied.');
    }

   public function edit(BookingForm $bookingForm)
    {
        if (Auth::user()->can('Edit TimeSheet')) {
            $employees = Employee::pluck('name', 'user_id')->prepend('Select Employee', '');
            $employeeId = Auth::user()->type == 'employee' ? (string)Auth::user()->id : null;

            // Initialize projects array
                $projects = [];
                
                if (Auth::user()->type == 'employee') {
                    // Get current employee ID (from employees table id column)
                    $employee = Employee::where('user_id', Auth::user()->id)->first();
                    
                    if ($employee) {
                        // Get all projects and filter those assigned to this employee
                        $allProjects = Project::all();
                        
                        foreach ($allProjects as $project) {
                            if (empty($project->assigned_data)) {
                                continue;
                            }
                            
                            // Check if this employee is assigned to the project
                            $isAssigned = false;
                            $assignedData = $project->assigned_data;
                            
                            foreach ($assignedData as $assignment) {
                                if (isset($assignment['employee_ids']) && 
                                    is_array($assignment['employee_ids']) &&
                                    in_array($employee->id, $assignment['employee_ids'])) {
                                    $isAssigned = true;
                                    break;
                                }
                            }
                            
                            if ($isAssigned) {
                                $projects[$project->id] = $project->project_name;
                            }
                        }
                    }
                } else {
                    // For admins/managers, get all projects
                    $projects = Project::pluck('project_name', 'id');
                }

            $units = Unit::where('project_id', $bookingForm->project_id)->pluck('unit_name', 'id');

            // Decode payment data if it's not an array
            if (!is_array($bookingForm->payment_data)) {
                $bookingForm->payment_data = json_decode($bookingForm->payment_data, true);
            }

            return view('booking.edit', [
                'bookingForm' => $bookingForm,
                'employees' => $employees,
                'projects' => $projects,
                'units' => $units,
                'selectedProjectId' => $bookingForm->project_id,
                'selectedUnitId' => $bookingForm->unit_id,
            ]);
        }

        return redirect()->back()->with('error', 'Permission denied.');
    }
    
    public function update(Request $request, BookingForm $bookingForm)  // Changed parameter to $bookingForm
    {
        if (Auth::user()->can('Edit TimeSheet')) {
            \Log::info('Booking form update started', $request->all());

            // Convert array fields to single values if needed
            $request->merge([
                'booking_date' => is_array($request->booking_date) ? $request->booking_date[0] : $request->booking_date,
                'mode_of_payment' => is_array($request->mode_of_payment) ? $request->mode_of_payment : [$request->mode_of_payment],
                'payment_detail' => is_array($request->payment_detail) ? $request->payment_detail : [$request->payment_detail],
                'amount' => is_array(value: $request->amount) ? $request->amount : [$request->amount],
            ]);

            $validator = Validator::make($request->all(), [
                // Primary Applicant
                'primary_applicant_name' => 'nullable|string|max:255',
                'primary_applicant_contact_no' => 'nullable|string|max:20',
                'primary_applicant_email' => 'nullable|email|max:255',
                'primary_applicant_occupation' => 'nullable|string|max:255',
                'primary_applicant_company' => 'nullable|string|max:255',
                'primary_applicant_designation' => 'nullable|string|max:255',
                'primary_applicant_birth_date' => 'nullable|date',
                'primary_applicant_nationality' => 'nullable|string|max:100',
                'primary_applicant_pan_no' => 'nullable|string|max:20',
                'primary_applicant_aadhar_no' => 'nullable|string|max:20',

                // Secondary Applicant
                'secondary_applicant_name' => 'nullable|string|max:255',
                'secondary_applicant_contact_no' => 'nullable|string|max:20',
                'secondary_applicant_email' => 'nullable|email|max:255',
                'secondary_applicant_occupation' => 'nullable|string|max:255',
                'secondary_applicant_company' => 'nullable|string|max:255',
                'secondary_applicant_designation' => 'nullable|string|max:255',
                'secondary_applicant_birth_date' => 'nullable|date',
                'secondary_applicant_nationality' => 'nullable|string|max:100',
                'secondary_applicant_pan_no' => 'nullable|string|max:20',
                'secondary_applicant_aadhar_no' => 'nullable|string|max:20',

                // Project Details
                'project_id' => 'required|exists:projects,id',
                'unit_id' => 'required|exists:units,id',
                'booking_date' => 'nullable|date',
                'plot_area' => 'nullable|numeric',
                'carpet_area' => 'nullable|numeric',
                'rate_per_sq_ft' => 'nullable|numeric',
                'basic_cost' => 'nullable|numeric',
                'cost_infrastructure' => 'nullable|numeric',
                'gst' => 'nullable|numeric',
                'stamp_duty' => 'nullable|numeric',
                'registration' => 'nullable|numeric',
                'maintenance_cost' => 'nullable|numeric',
                'other' => 'nullable|numeric',
                'total_cost' => 'nullable|numeric',

                // Payment Details
                'mode_of_payment.*' => 'nullable|string|max:255',
                'payment_detail.*' => 'nullable|string|max:255',
                'amount.*' => 'nullable|numeric',
                'remaining' => 'nullable|numeric',
            ]);


            if ($validator->fails()) {
                return redirect()->back()
                    ->withErrors($validator)
                    ->withInput();
            }
    
            try {
                // Prepare Payment Data
                $paymentData = [];
                if ($request->has('mode_of_payment') && is_array($request->mode_of_payment)) {
                    foreach ($request->mode_of_payment as $key => $mode) {
                        $paymentData[] = [
                            'mode_of_payment' => $mode ?? null,
                            'date' => $request->payment_date[$key] ?? null,
                            'payment_detail' => $request->payment_detail[$key] ?? null,
                            'amount' => $request->amount[$key] ?? null,
                        ];
                    }
                }
    
                // Calculate remaining amount
                $totalCost = $request->total_cost ?? $bookingForm->total_cost;
                $paidAmount = collect($paymentData)->sum('amount') ?? 0;
                $remaining = $totalCost - $paidAmount;

                $project = Project::find($request->project_id);
                 $unit = Unit::find($request->unit_id);
    
                $bookingData = $request->except([
                    'mode_of_payment', 
                    'payment_detail', 
                    'amount', 
                    '_token',
                    '_method',
                    'confirm_total_cost',
                    'payment_date'
                ]);
                $bookingData['project_name'] = $project ? $project->project_name : null;
                $bookingData['unit_name'] = $unit ? $unit->unit_name : null;

                    // Add unit_size and maintenance_cost from the unit
                $bookingData['unit_size'] = $unit ? $unit->unit_size : null;



                $bookingData['employee_id'] = Auth::user()->type == 'employee' 
                    ? Auth::user()->id 
                    : $request->employee_id;
                
                    $bookingData['payment_data'] = !empty($paymentData) ? json_encode($paymentData) : null;
                    $bookingData['remaining'] = $remaining > 0 ? $remaining : null;



                    if ($request->unit_id != $bookingForm->unit_id) {
                        // Release old unit
                        $oldUnit = Unit::find($bookingForm->unit_id);
                        if ($oldUnit) {
                            $oldUnit-> is_approved = 1;
                            $oldUnit->save();
                        }
            
                        // Book new unit
                        $newUnit = Unit::find($request->unit_id);
                        if ($newUnit && $newUnit-> is_approved) {
                            $newUnit-> is_approved = 0;
                            $newUnit->save();
                        } else {
                            throw new \Exception('New unit is not available for booking');
                        }
                    }
    
                // Update booking
                $bookingForm->update($bookingData);
    
                return redirect()->route('booking.index')
                    ->with('success', __('Booking successfully updated.'));
    
            } catch (\Exception $e) {
                \Log::error('Booking update failed', ['error' => $e->getMessage()]);
                return redirect()->back()
                    ->with('error', 'Error updating booking: '.$e->getMessage())
                    ->withInput();
            }
        }
    
        return redirect()->back()->with('error', 'Permission denied.');
    
    
    }
    
    public function destroy($id)
    {
        DB::beginTransaction();
    
        try {
            $booking = BookingForm::findOrFail($id);
            $unit = Unit::find($booking->unit_id);
            
            if ($unit) {
                $unit-> is_approved = 1;
                $unit->save();
            }
    
            $booking->delete();
    
            DB::commit();
    
            return redirect()->route('booking.index')
                ->with('success', 'Booking deleted successfully!');
    
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()
                ->with('error', 'Error deleting booking: '.$e->getMessage());
        }
    }
    
    public function show(BookingForm $bookingForm)
    {
        if (Auth::user()->can('View Booking')) {
            $projectName = $bookingForm->project_name;
            $unitName = $bookingForm->unit_name;
            return view('booking.show', compact('bookingForm','projectName', 'unitName'));
        }

        return redirect()->back()->with('error', 'Permission denied.');
    }

    public function export()
    {
        // Implement your export logic here (e.g., export to CSV, Excel, etc.)
        return response()->json(['message' => 'Export feature will be implemented soon.']);
    }

    public function pdf($id)
    {
        $booking = BookingForm::with('project')->findOrFail($id);
        return view('booking.pdf', compact('booking'));
    }

    public function payslip($id)
    {
        $booking = BookingForm::findOrFail($id);
        return view('booking.pdf', compact('booking'));
    }

   public function getUnitsByProject($project_id)
    {
        $units = Unit::where('project_id', $project_id)
                    ->where('is_approved', 0)
                    ->get(['id', 'unit_name', 'unit_size']);

        return response()->json(['units' => $units]);
    }

   public function getUnitDetails($unit_id)
    {
        $unit = Unit::find($unit_id, ['id', 'unit_name', 'unit_size']);
        
        return response()->json([
            'unit_name' => $unit->unit_name ?? null,
            'unit_size' => $unit->unit_size ?? null
        ]);
    }


    public function getEmployeeProjects($userId)
    {
        try {
            // Get the employee record from employees table where user_id matches
            $employee = Employee::where('user_id', $userId)->first();
            
            if (!$employee) {
                return response()->json(['projects' => []]);
            }

            // Get all projects
            $allProjects = Project::all();
            $assignedProjects = [];

            foreach ($allProjects as $project) {
                if (empty($project->assigned_data)) {
                    continue;
                }

                // Check if this employee is assigned to the project
                $isAssigned = false;
                $assignedData = $project->assigned_data;

                foreach ($assignedData as $assignment) {
                    if (isset($assignment['employee_ids']) && 
                        is_array($assignment['employee_ids']) &&
                        in_array($employee->id, $assignment['employee_ids'])) {
                        $isAssigned = true;
                        break;
                    }
                }

                if ($isAssigned) {
                    $assignedProjects[] = [
                        'id' => $project->id,
                        'project_name' => $project->project_name
                    ];
                }
            }

            return response()->json(['projects' => $assignedProjects]);
        } catch (\Exception $e) {
            \Log::error("Error getting employee projects: " . $e->getMessage());
            return response()->json(['projects' => []], 500);
        }
    }
}
