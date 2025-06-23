<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;

    protected $fillable = [
        'project_name', 'location',
        'project_startdate', 'project_enddate',
        'assigned_data', 'created_by'
    ];

    protected $casts = [
        'assigned_data' => 'array', // This will automatically handle JSON decode/encode
    ];

    // Helper method to get department names
    public function getDepartmentNames()
    {
        $departmentIds = collect($this->assigned_data)->pluck('department_id')->toArray();
        return Department::whereIn('id', $departmentIds)->pluck('name', 'id');
    }

    // Helper method to get employee names
    public function getEmployeeNames()
    {
        $employeeIds = collect($this->assigned_data)
            ->pluck('employee_ids')
            ->flatten()
            ->unique()
            ->toArray();
            
        return Employee::whereIn('id', $employeeIds)->pluck('name', 'id');
    }

    // In your Project model
    public function departments()
    {
        return $this->belongsToMany(Department::class, 'project_department')
                    ->withTimestamps();
    }

    public function employees()
    {
        return $this->belongsToMany(Employee::class, 'project_employee')
                    ->withTimestamps();
    }

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

// In Project model
// In Project model
public function scopeAssignedToEmployee($query, $employeeId)
{
    return $query->where(function($q) use ($employeeId) {
        $q->whereJsonContains('assigned_data', [['employee_ids' => [(string)$employeeId]]])
          ->orWhereJsonContains('assigned_data', [['employee_ids' => [$employeeId]]])
          ->orWhereJsonContains('assigned_data', ['employee_ids' => (string)$employeeId])
          ->orWhereJsonContains('assigned_data', ['employee_ids' => $employeeId]);
    });
}
}