<?php

namespace App\Models;
use App\Models\Leave; // Make sure to use the correct model name


use Illuminate\Database\Eloquent\Model;

class LeaveType extends Model
{
    protected $fillable = [
        'title',
        'days',
        'created_by',
    ];

    protected $casts = [
        'days' => 'float', // ✅ Not 'integer'
    ];


    public function getUsedLeaves($employeeId = null)
{
    if (!$employeeId && \Auth::user()->type == 'employee') {
        $employeeId = Employee::where('user_id', \Auth::user()->id)->first()->id;
    }

    $date = Utility::AnnualLeaveCycle();

    return Leave::where('leave_type_id', $this->id)
        ->when($employeeId, function($query) use ($employeeId) {
            return $query->where('employee_id', $employeeId);
        })
        ->where('status', 'Approved')
        ->whereBetween('created_at', [$date['start_date'], $date['end_date']])
        ->sum('total_leave_days');
}

public function getMonthlyBalance($employeeId, $year = null, $month = null)
{
    $now = now();
    $year = $year ?? $now->year;
    $month = $month ?? $now->month;
    
    $balance = EmployeeLeaveBalance::where('employee_id', $employeeId)
        ->where('leave_type_id', $this->id)
        ->where('year', $year)
        ->where('month', $month)
        ->first();
        
    return $balance ? $balance->available_days : 0;
}
}
