<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LoanDeduction extends Model
{
    use HasFactory;

    protected $fillable = [
        'loan_id',
        'month',
        'emi_amount',
        'is_deducted',
        'remark'
    ];

    protected $dates = [
        'month'
    ];

   public function loan()
{
    return $this->belongsTo(EmployeeLoan::class, 'loan_id');
}

}