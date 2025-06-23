<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Employee;
use App\Models\Attendance;
use App\Models\CompOffLeave;
use Carbon\Carbon;

class ProcessCompOffEarnings extends Command
{
    protected $signature = 'comp-off:process {--date= : Specific date to process (Y-m-d)}';
    protected $description = 'Process comp-off earnings for employees who worked on their week-off days';

    public function handle()
    {
        $processDate = $this->option('date') 
            ? Carbon::parse($this->option('date'))
            : Carbon::yesterday();

        $this->info("Processing comp-off earnings for: " . $processDate->format('Y-m-d'));

        // Get day name (e.g., "Wednesday") for the processing date
        $dayName = $processDate->format('l');
        $this->info("Day name: " . $dayName);

        // Get employees whose week_off_day matches today's day
        $eligibleEmployees = Employee::where('week_off_day', $dayName)->get();
        $this->info("Found " . $eligibleEmployees->count() . " eligible employees");

        foreach ($eligibleEmployees as $employee) {
            $this->info("Processing employee ID: " . $employee->id);

            // Check if employee had attendance on this date
            $attendance = Attendance::where([
                'employee_id' => $employee->id,
                'date' => $processDate->format('Y-m-d')
            ])->first();

            if ($attendance) {
                $this->info("Found attendance for employee ID: " . $employee->id);

                // Check if comp-off already exists for this date
                $existingCompOff = CompOffLeave::where([
                    'employees_id' => $employee->id,
                    'comp_off_date' => $processDate->format('Y-m-d')
                ])->exists();

                if (!$existingCompOff) {
                    // Create new comp-off
                    CompOffLeave::create([
                        'employees_id' => $employee->id,
                        'comp_off_date' => $processDate->format('Y-m-d'),
                        'created_at' => now(),
                        'updated_at' => now()
                    ]);

                    $this->info("Comp-off credited for employee ID: {$employee->id} for date: {$processDate->format('Y-m-d')}");
                } else {
                    $this->info("Comp-off already exists for employee ID: {$employee->id} for date: {$processDate->format('Y-m-d')}");
                }
            } else {
                $this->info("No attendance found for employee ID: " . $employee->id);
            }
        }

        $this->info('Comp-off processing completed!');
    }
}