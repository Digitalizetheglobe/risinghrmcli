<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\AttendanceEmployee;
use App\Models\CompOffLeave;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class BackfillController extends Controller
{
    public function run()
    {
        $employees = Employee::all();
        $added = 0;
        
        // Get current month start and end dates
        $currentMonthStart = Carbon::now()->startOfMonth();
        $currentMonthEnd = Carbon::now()->endOfMonth();

        foreach ($employees as $employee) {
            $weekOffDay = $employee->week_off_day ?? null;

            if (!$weekOffDay) continue;

            $pastDates = AttendanceEmployee::where('employee_id', $employee->id)
                ->where('status', 'Present')
                ->whereRaw("DAYNAME(date) = ?", [$weekOffDay])
                ->whereBetween('date', [$currentMonthStart, $currentMonthEnd]) // Only current month
                ->pluck('date')
                ->toArray();

            foreach ($pastDates as $date) {
                $exists = CompOffLeave::where('employees_id', $employee->id)
                    ->where('comp_off_date', $date)
                    ->exists();

                if (!$exists) {
                    CompOffLeave::create([
                        'employees_id'  => $employee->id,
                        'comp_off_date' => $date,
                        'comp_off_data' => 1,
                        'created_at'    => now(),
                        'updated_at'    => now(),
                    ]);
                    $added++;
                }
            }
        }

        return response()->json([
            'message' => '✅ Backfill completed for current month only.',
            'total_added' => $added,
            'month_processed' => Carbon::now()->format('F Y')
        ]);
    }
}