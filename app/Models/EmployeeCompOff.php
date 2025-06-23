<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EmployeeCompOff extends Model
{
    use HasFactory;

    protected $fillable = [
        'employee_id',
        'comp_off_date',
        'reason',
        'status',
        'leave_id',
        'created_by'
    ];

    protected $dates = [
        'comp_off_date',
        'created_at',
        'updated_at'
    ];

    // Relationships
    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function leave()
    {
        return $this->belongsTo(LocalLeave::class, 'leave_id');
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    // Scopes
    public function scopeApproved($query)
    {
        return $query->where('status', 'approved');
    }

    public function scopeAvailable($query)
    {
        return $query->approved()->whereNull('leave_id');
    }
}