<?php

namespace App\Http\Controllers;

use App\Models\Project;
use Illuminate\Http\Request;
use App\Models\Department;
use App\Models\Employee;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class ProjectController extends Controller
{
    public function index()
    {
        $projects = Project::all();
        
        // Preload all needed departments and employees
        $departmentIds = [];
        $employeeIds = [];
        
        foreach ($projects as $project) {
            if (is_array($project->assigned_data)) {
                foreach ($project->assigned_data as $assignment) {
                    if (!empty($assignment['department_id'])) {
                        $departmentIds[] = $assignment['department_id'];
                    }
                    if (!empty($assignment['employee_ids']) && is_array($assignment['employee_ids'])) {
                        $employeeIds = array_merge($employeeIds, $assignment['employee_ids']);
                    }
                }
            }
        }
        
        // Get unique IDs
        $departmentIds = array_unique($departmentIds);
        $employeeIds = array_unique($employeeIds);
        
        // Preload data
        $departments = Department::whereIn('id', $departmentIds)->get()->keyBy('id');
        $employees = Employee::with('user')->whereIn('id', $employeeIds)->get()->keyBy('id');
        
        return view('projects.index', compact('projects', 'departments', 'employees'));
    }

    public function create()
    {
        if (Auth::user()->can('Create Employee')) {
            $departments = Department::all();
            return view('projects.create', compact('departments'));
        }
        return redirect()->back()->with('error', 'Permission denied.');
    }

    public function store(Request $request)
{
    $validated = $request->validate([
        'project_name' => 'required|string|max:255',
        'location' => 'nullable|string|max:255',
        'project_startdate' => 'required|date',
        'project_enddate' => 'nullable|date|after_or_equal:project_startdate', // Changed to nullable
        'assigned_data' => 'required|json',
    ]);

    try {
        $assignedData = json_decode($request->assigned_data, true);
        
        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new \Exception('Invalid JSON in assigned_data: ' . json_last_error_msg());
        }

        if (!is_array($assignedData)) {
            throw new \Exception('assigned_data must be an array');
        }

        // Rest of your validation and creation logic...
        
        $project = Project::create([
            'project_name' => $validated['project_name'],
            'location' => $validated['location'],
            'project_startdate' => $validated['project_startdate'],
            'project_enddate' => $validated['project_enddate'] ?? null, // Handle null case
            'assigned_data' => $assignedData,
            'created_by' => auth()->id(),
        ]);

        return redirect()->route('projects.index')->with('success', 'Project created successfully!');
    } catch (\Exception $e) {
        return redirect()->back()
            ->with('error', 'Error: ' . $e->getMessage())
            ->withInput();
    }
}
    public function edit($id)
{
    if (Auth::user()->can('Edit Employee')) { // Changed from 'Edit Employee'
        $project = Project::findOrFail($id);
        $departments = Department::all();
        
        // Ensure assigned_data is properly formatted as an array
        if (is_string($project->assigned_data)) {
            $decoded = json_decode($project->assigned_data, true);
            $project->assigned_data = (json_last_error() === JSON_ERROR_NONE) ? $decoded : [];
        } elseif (!is_array($project->assigned_data)) {
            $project->assigned_data = [];
        }
        
        return view('projects.edit', compact('project', 'departments'));
    }
    return redirect()->back()->with('error', 'Permission denied.');
}
    
    public function update(Request $request, $id)
{
    $validated = $request->validate([
        'project_name' => 'required|string|max:255',
        'location' => 'nullable|string|max:255',
        'project_startdate' => 'required|date',
        'project_enddate' => 'nullable|date|after_or_equal:project_startdate',
        'assigned_data' => 'required|json',
    ]);

    DB::beginTransaction();

    try {
        $project = Project::findOrFail($id);
        
        // Decode and validate JSON
        $assignedData = json_decode($request->assigned_data, true);
        
        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new \Exception('Invalid JSON in assigned_data: ' . json_last_error_msg());
        }

        // Validate structure
        if (!is_array($assignedData)) {
            throw new \Exception('assigned_data must be an array');
        }

        foreach ($assignedData as $assignment) {
            if (!isset($assignment['department_id']) || !isset($assignment['employee_ids'])) {
                throw new \Exception('Each assignment must have department_id and employee_ids');
            }

            // Convert employee_ids to array if it's a string
            if (is_string($assignment['employee_ids'])) {
                $assignment['employee_ids'] = explode(',', $assignment['employee_ids']);
            }

            // Validate department exists
            if (!Department::find($assignment['department_id'])) {
                throw new \Exception('Invalid department_id: ' . $assignment['department_id']);
            }

            // Validate employees exist
            $existingEmployees = Employee::where('department_id', $assignment['department_id'])
                ->pluck('id')
                ->toArray();

            $invalidEmployees = array_diff($assignment['employee_ids'], $existingEmployees);
            
            if (!empty($invalidEmployees)) {
                throw new \Exception('Invalid employee_ids: ' . implode(',', $invalidEmployees));
            }
        }

        // Update project
        $project->update([
            'project_name' => $validated['project_name'],
            'location' => $validated['location'],
            'project_startdate' => $validated['project_startdate'],
            'project_enddate' => $validated['project_enddate'],
            'assigned_data' => $assignedData,
        ]);

        DB::commit();

        return redirect()->route('projects.index')->with('success', 'Project updated successfully!');
    } catch (\Exception $e) {
        DB::rollBack();
        return redirect()->back()
            ->with('error', 'Error: ' . $e->getMessage())
            ->withInput();
    }
}



    public function getEmployeesByDepartment($id)
    {
        try {
            $employees = Employee::where('department_id', $id)
                ->orderBy('name')
                ->get(['id', 'name', 'department_id']);
                
            return response()->json($employees);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Failed to load employees',
                'message' => $e->getMessage()
            ], 500);
        }
    }
    
    public function getEmployeesByDepartments(Request $request)
    {
        try {
            $departmentIds = $request->input('department_ids', []);
            
            $results = Department::whereIn('id', $departmentIds)
                ->with(['employees' => function($query) {
                    $query->select('id', 'name', 'department_id');
                }])
                ->get()
                ->map(function($department) {
                    return [
                        'department_id' => $department->id,
                        'employees' => $department->employees
                    ];
                });
                
            return response()->json($results);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Failed to load employees',
                'message' => $e->getMessage()
            ], 500);
        }
    }
 
    public function destroy(Project $project)
    {
        if (!Auth::user()->can('Delete Employee')) {
            abort(403, 'Permission Denied');
        }

        $project->delete();
        return redirect()->route('projects.index')->with('success', 'Project deleted successfully!');
    }
}