<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AttendanceEmployee extends Model
{

    const STATUS_PRESENT = 'Present';
    const STATUS_HALF_DAY = 'Half Day';
    const STATUS_ABSENT = 'Absent';
    const STATUS_SINGLE_PUNCH = 'Single Punch In';
    const REQUIRED_WORKING_HOURS = 8.5; // 8 hours 30 minutes in decimal


    protected $fillable = [
        'employee_id',
        'date',
        'status',
        'clock_in',
        'clock_out',
        'late',
        'early_leaving',
        'overtime',
        'total_rest',
        'created_by',
        'clock_in_latitude',
        'clock_in_longitude',
        'clock_in_location',
        'clock_out_latitude',
        'clock_out_longitude',
        'clock_out_location',
    ];

    public function employees()
    {
        return $this->hasOne('App\Models\Employee', 'user_id', 'employee_id');
    }

    public function employee()
    {
        return $this->hasOne('App\Models\Employee', 'id', 'employee_id');
    }
    
    
}
