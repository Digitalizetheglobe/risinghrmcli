<?php

namespace App\Http\Controllers;

use App\Models\Unit;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\UnitsImport;
use App\Models\Project;
use Illuminate\Http\Request;

class UnitController extends Controller
{
    public function index(Request $request)
    {
        $projects = Project::all(); // Get all projects for the dropdown
        
        // Filter units based on project if selected
        $unitsQuery = Unit::with('project');
        
        if ($request->has('project_id') && $request->project_id != '') {
            $unitsQuery->where('project_id', $request->project_id);
        }
        
        $units = $unitsQuery->get();
        
        return view('units.index', compact('units', 'projects'));
    }

    
    public function create()
{
    // Add explicit HR check
    if (Auth::user()->can('Create Employee') && !Auth::user()->hasRole('HR')) {
        $projects = Project::all(); 
        return view('units.create', compact('projects'));
    }
    return redirect()->back()->with('error', 'Permission denied.');
}


    public function import(Request $request)
{
    try {
        $request->validate([
            'import_file' => 'required|file|mimes:xlsx,csv,xls,txt',
            'project_id' => 'required|integer|exists:projects,id'
        ]);

        \Log::info('Starting import for project: ' . $request->project_id);
        
        Excel::import(new UnitsImport($request->project_id), $request->file('import_file'));

        \Log::info('Import completed successfully');
        
        return back()->with('success', 'Units imported successfully!');
    } catch (\Exception $e) {
        \Log::error('Import failed: ' . $e->getMessage());
        return back()->with('error', 'Import failed: ' . $e->getMessage());
    }
}

    
    public function getUnitsByProject($projectId)
{
    $units = Unit::where('project_id', $projectId)->get();
    return response()->json(['units' => $units]);
}


public function destroy(Unit $unit)
{
    if (!Auth::user()->can('Delete Employee')) {
        abort(403, 'Permission Denied');
    }

    $unit->delete();
    return redirect()->route('units.index')->with('success', 'Unit deleted successfully!');
}

}