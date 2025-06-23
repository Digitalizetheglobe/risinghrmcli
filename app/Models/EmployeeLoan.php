<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class EmployeeLoan extends Model
{
    protected $fillable = [
        'employee_id',
        'total_amount',
        'number_of_months',
        'monthly_emi',
        'start_month',
        'remaining_amount',
        'reason',
        'created_by',
    ];

    protected $dates = [
        'start_month'
    ];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function deductions()
    {
        return $this->hasMany(LoanDeduction::class, 'loan_id'); // ✅ correct column name
    }

}