<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class TimeSheet extends Model
{
    use HasFactory;
    
    protected $table = 'time_sheets';
    
    protected $fillable = [
        'employee_id',
        'presale_employee_id',
        'project_id',
        'unit_id',
        'date',
        'full_name',
        'mobile_no',
        'email_id',
        'address',
        'recommended_by',
        'cp_data',
        'refrence_data',
        'other_data',
        'primary_reason',
        'square_feet_range',
        'price_range',
        'client_status',
        'executive_remark',
        'feedback_information',
    ];
    
   // In app/Models/TimeSheet.php
    protected $casts = [
        'feedback_information' => 'array'
    ];

    public function getFeedbacksAttribute()
    {
        return $this->feedback_information ?? [];
    }
    
   // In TimeSheet.php
public function employee()
{
    return $this->belongsTo(User::class, 'employee_id');
}
    
    public function project()
    {
        return $this->belongsTo(Project::class);
    }
    
    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }

    // In Employee model
public function user()
{
    return $this->belongsTo(User::class);
}

// In TimeSheet.php
public function presaleEmployee()
{
    return $this->belongsTo(Employee::class, 'presale_employee_id');
}
}