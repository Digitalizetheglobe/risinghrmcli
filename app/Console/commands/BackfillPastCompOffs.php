<?php

namespace App\Console\Commands;
use App\Models\Employee;
use App\Models\AttendanceEmployee;
use App\Models\CompOffLeave;
use Illuminate\Console\Command;

class BackfillPastCompOffs extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:backfill-past-comp-offs';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $employees = Employee::all();

        foreach ($employees as $employee) {
            if (!$employee->week_off_day) {
                continue; // skip employees with no week off defined
            }

            $weekOffDay = $employee->week_off_day;

            $pastCompOffDates = AttendanceEmployee::where('employee_id', $employee->id)
                ->where('status', 'Present')
                ->whereRaw("DAYNAME(date) = ?", [$weekOffDay])
                ->pluck('date')
                ->toArray();

            foreach ($pastCompOffDates as $date) {
                $alreadyExists = CompOffLeave::where('employees_id', $employee->id)
                    ->where('comp_off_date', $date)
                    ->exists();

                if (!$alreadyExists) {
                    CompOffLeave::create([
                        'employees_id'  => $employee->id,
                        'comp_off_date' => $date,
                        'comp_off_data' => '1',
                        'created_at'    => now(),
                        'updated_at'    => now(),
                    ]);
                    $this->info("✅ Added comp-off for employee ID {$employee->id} on {$date}");
                }
            }
        }


        $this->info("✅ Past comp-off entries inserted successfully.");
    }
}
