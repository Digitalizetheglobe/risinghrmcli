<?php

namespace Database\Seeders;

use App\Models\LeaveType;
use Illuminate\Database\Seeder;

class LeaveTypeSeeder extends Seeder
{
    public function run()
    {
        LeaveType::create([
            'name' => 'Earned Leave',
            'short_code' => 'EL',
            'is_earned_leave' => true,
            'allow_carry_forward' => true,
            'carry_forward_limit' => 15,
        ]);
        
        LeaveType::create([
            'name' => 'Sick Leave',
            'short_code' => 'SL',
            'is_sick_leave' => true,
            'allow_carry_forward' => true,
            'carry_forward_limit' => 10,
        ]);
        
        // Add more leave types as needed
    }
}