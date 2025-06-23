<?php

namespace Database\Seeders;

use App\Models\MonthlyLeavePolicy;
use Illuminate\Database\Seeder;

class MonthlyLeavePolicySeeder extends Seeder
{
    public function run()
    {
        // Earned Leave - 1.5 days/month
        MonthlyLeavePolicy::create([
            'leave_type_id' => 1, // Make sure this matches your Earned Leave ID
            'days' => 1.5,
            'is_default' => true,
        ]);
        
        // Sick Leave - 0.5 days/month
        MonthlyLeavePolicy::create([
            'leave_type_id' => 2, // Make sure this matches your Sick Leave ID
            'days' => 0.5,
            'is_default' => true,
        ]);
    }
}