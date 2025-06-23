<?php

namespace App\Http\Controllers;

use App\Imports\AttendanceImport;
use App\Models\AttendanceEmployee;
use App\Models\Branch;
use App\Models\Department;
use App\Models\Employee;
use App\Models\IpRestrict;
use App\Models\User;
use App\Models\Utility;
use Carbon\Carbon;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;  // Add this line
use App\Models\Leave as LocalLeave;  // Add this line

class AttendanceEmployeeController extends Controller
{

    public function index(Request $request)
    {
        if (\Auth::user()->can('Manage Attendance')) {
            $branch = Branch::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
            $branch->prepend('All', '');

            $department = Department::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
            $department->prepend('All', '');

              // Get employees for filter dropdown
            $employees = Employee::where('created_by', \Auth::user()->creatorId())
                ->with('user')
                ->get()
                ->pluck('name', 'id');
            $employees->prepend('All', '');

            if (\Auth::user()->type == 'employee') {
                $emp = !empty(\Auth::user()->employee) ? \Auth::user()->employee->id : 0;

                $attendanceEmployee = AttendanceEmployee::where('employee_id', $emp)
                                ->orderBy('date', 'desc')
                                ->orderBy('clock_in', 'desc');

                if ($request->type == 'monthly' && !empty($request->month)) {
                    $month = date('m', strtotime($request->month));
                    $year  = date('Y', strtotime($request->month));


                    $start_date = date($year . '-' . $month . '-01');
                    $end_date = date('Y-m-t', strtotime('01-' . $month . '-' . $year));

                    // old date
                    // $end_date   = date($year . '-' . $month . '-t');

                    $attendanceEmployee->whereBetween(
                        'date',
                        [
                            $start_date,
                            $end_date,
                        ]
                    );
                } elseif ($request->type == 'daily' && !empty($request->date)) {
                    $attendanceEmployee->where('date', $request->date);
                } else {
                    $month      = date('m');
                    $year       = date('Y');
                    $start_date = date($year . '-' . $month . '-01');
                    $end_date = date('Y-m-t', strtotime('01-' . $month . '-' . $year));

                    // old date
                    // $end_date   = date($year . '-' . $month . '-t');

                    $attendanceEmployee->whereBetween(
                        'date',
                        [
                            $start_date,
                            $end_date,
                        ]
                    );
                }

                $attendanceEmployee = $attendanceEmployee->get();
            } else {
                $employee = Employee::select('id')->where('created_by', \Auth::user()->creatorId());
                if (!empty($request->branch)) {
                    $employee->where('branch_id', $request->branch);
                }

                if (!empty($request->department)) {
                    $employee->where('department_id', $request->department);
                }

                $employee = $employee->get()->pluck('id');

                $attendanceEmployee = AttendanceEmployee::whereIn('employee_id', $employee)
                                ->orderBy('date', 'desc')
                                ->orderBy('clock_in', 'desc');
                
                if ($request->type == 'monthly' && !empty($request->month)) {

                    $month = date('m', strtotime($request->month));
                    $year  = date('Y', strtotime($request->month));
                    $start_date = date($year . '-' . $month . '-01');
                    $end_date = date('Y-m-t', strtotime('01-' . $month . '-' . $year));

                    // old date
                    // $end_date   = date($year . '-' . $month . '-t');

                    $attendanceEmployee->whereBetween(
                        'date',
                        [
                            $start_date,
                            $end_date,
                        ]
                    );
                } elseif ($request->type == 'daily' && !empty($request->date)) {
                    $attendanceEmployee->where('date', $request->date);
                } else {

                    $month      = date('m');
                    $year       = date('Y');
                    $start_date = date($year . '-' . $month . '-01');
                    $end_date = date('Y-m-t', strtotime('01-' . $month . '-' . $year));
                    // old date
                    // $end_date   = date($year . '-' . $month . '-t');

                    $attendanceEmployee->whereBetween(
                        'date',
                        [
                            $start_date,
                            $end_date,
                        ]
                    );
                }

                $attendanceEmployee = $attendanceEmployee->get();
            }

            return view('attendance.index', compact('attendanceEmployee', 'branch', 'department', 'employees'));
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    public function create()
    {
        if (\Auth::user()->can('Create Attendance')) {
            $employees = User::where('created_by', '=', Auth::user()->creatorId())->where('type', '=', "employee")->get()->pluck('name', 'id');

            return view('attendance.create', compact('employees'));
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    
    public function store(Request $request)
    {
        if (\Auth::user()->can('Create Attendance')) {
            $validator = \Validator::make(
                $request->all(),
                [
                    'employee_id' => 'required',
                    'date' => 'required',
                    'clock_in' => 'required',
                    'clock_out' => 'required',
                ]
            );

            if ($validator->fails()) {
                $messages = $validator->getMessageBag();
                return redirect()->back()->with('error', $messages->first());
            }

            $startTime  = Utility::getValByName('company_start_time');
            $endTime    = Utility::getValByName('company_end_time');
            $attendance = AttendanceEmployee::where('employee_id', '=', $request->employee_id)
                ->where('date', '=', $request->date)
                ->where('clock_out', '=', '00:00:00')
                ->get()
                ->toArray();

            if ($attendance) {
                return redirect()->route('attendanceemployee.index')->with('error', __('Employee Attendance Already Created.'));
            } else {
                $date = date("Y-m-d");

                $totalLateSeconds = strtotime($request->clock_in) - strtotime($date . $startTime);
                $hours = floor($totalLateSeconds / 3600);
                $mins  = floor($totalLateSeconds / 60 % 60);
                $secs  = floor($totalLateSeconds % 60);
                $late  = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);

                $totalEarlyLeavingSeconds = strtotime($date . $endTime) - strtotime($request->clock_out);
                $hours                    = floor($totalEarlyLeavingSeconds / 3600);
                $mins                     = floor($totalEarlyLeavingSeconds / 60 % 60);
                $secs                     = floor($totalEarlyLeavingSeconds % 60);
                $earlyLeaving             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);

                if (strtotime($request->clock_out) > strtotime($date . $endTime)) {
                    $totalOvertimeSeconds = strtotime($request->clock_out) - strtotime($date . $endTime);
                    $hours                = floor($totalOvertimeSeconds / 3600);
                    $mins                 = floor($totalOvertimeSeconds / 60 % 60);
                    $secs                 = floor($totalOvertimeSeconds % 60);
                    $overtime             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);
                } else {
                    $overtime = '00:00:00';
                }

                $employeeAttendance = new AttendanceEmployee();
                $employeeAttendance->employee_id   = $request->employee_id;
                $employeeAttendance->date          = $request->date;
                $employeeAttendance->status        = 'Present';
                $employeeAttendance->clock_in      = $request->clock_in . ':00';
                $employeeAttendance->clock_out     = $request->clock_out . ':00';
                $employeeAttendance->late          = $late;
                $employeeAttendance->early_leaving = $earlyLeaving;
                $employeeAttendance->overtime      = $overtime;
                $employeeAttendance->total_rest    = '00:00:00';
                $employeeAttendance->created_by    = \Auth::user()->creatorId();
                $employeeAttendance->save();

                // Send Email Notification
                $emailData = [
                    'employee_name' => \Auth::user()->name,
                    'date'          => $request->date,
                    'clock_in'      => $request->clock_in,
                ];

                Mail::to('connect360.software@gmail.com')->send(new AttendanceNotification($emailData));

                return redirect()->route('attendanceemployee.index')->with('success', __('Employee attendance successfully created and email sent.'));
            }
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }
    
    public function show(Request $request)
    {
        // return redirect()->back();
        return redirect()->route('attendanceemployee.index');
    }

    public function edit($id)
    {
        if (\Auth::user()->can('Edit Attendance')) {
            $attendanceEmployee = AttendanceEmployee::where('id', $id)->first();
            $employees          = Employee::where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('name', 'id');

            return view('attendance.edit', compact('attendanceEmployee', 'employees'));
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    // public function update(Request $request, $id)
    // {
    //     if (\Auth::user()->type == 'company' || \Auth::user()->type == 'hr') {
    //         $employeeId      = AttendanceEmployee::where('employee_id', $request->employee_id)->first();
    //         $check = AttendanceEmployee::where('employee_id', '=', $request->employee_id)->where('date', $request->date)->first();

    //         $startTime = Utility::getValByName('company_start_time');
    //         $endTime   = Utility::getValByName('company_end_time');

    //         $clockIn = $request->clock_in;
    //         $clockOut = $request->clock_out;

    //         if ($clockIn) {
    //             $status = "present";
    //         } else {
    //             $status = "leave";
    //         }

    //         $totalLateSeconds = strtotime($clockIn) - strtotime($startTime);

    //         $hours = floor($totalLateSeconds / 3600);
    //         $mins  = floor($totalLateSeconds / 60 % 60);
    //         $secs  = floor($totalLateSeconds % 60);
    //         $late  = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);

    //         $totalEarlyLeavingSeconds = strtotime($endTime) - strtotime($clockOut);
    //         $hours                    = floor($totalEarlyLeavingSeconds / 3600);
    //         $mins                     = floor($totalEarlyLeavingSeconds / 60 % 60);
    //         $secs                     = floor($totalEarlyLeavingSeconds % 60);
    //         $earlyLeaving             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);

    //         if (strtotime($clockOut) > strtotime($endTime)) {
    //             //Overtime
    //             $totalOvertimeSeconds = strtotime($clockOut) - strtotime($endTime);
    //             $hours                = floor($totalOvertimeSeconds / 3600);
    //             $mins                 = floor($totalOvertimeSeconds / 60 % 60);
    //             $secs                 = floor($totalOvertimeSeconds % 60);
    //             $overtime             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);
    //         } else {
    //             $overtime = '00:00:00';
    //         }
    //         if ($check->date == date('Y-m-d')) {
    //             $check->update([
    //                 'late' => $late,
    //                 'early_leaving' => ($earlyLeaving > 0) ? $earlyLeaving : '00:00:00',
    //                 'overtime' => $overtime,
    //                 'clock_in' => $clockIn,
    //                 'clock_out' => $clockOut
    //             ]);

    //             return redirect()->route('attendanceemployee.index')->with('success', __('Employee attendance successfully updated.'));
    //         } else {
    //             return redirect()->route('attendanceemployee.index')->with('error', __('You can only update current day attendance'));
    //         }
    //     }

    //     $employeeId      = !empty(\Auth::user()->employee) ? \Auth::user()->employee->id : 0;
    //     $todayAttendance = AttendanceEmployee::where('employee_id', '=', $employeeId)->where('date', date('Y-m-d'))->first();
    //     if (!empty($todayAttendance) && $todayAttendance->clock_out == '00:00:00') {
    //         $startTime = Utility::getValByName('company_start_time');
    //         $endTime   = Utility::getValByName('company_end_time');
    //         if (Auth::user()->type == 'employee') {

    //             $date = date("Y-m-d");
    //             $time = date("H:i:s");

    //             //early Leaving
    //             $totalEarlyLeavingSeconds = strtotime($date . $endTime) - time();
    //             $hours                    = floor($totalEarlyLeavingSeconds / 3600);
    //             $mins                     = floor($totalEarlyLeavingSeconds / 60 % 60);
    //             $secs                     = floor($totalEarlyLeavingSeconds % 60);
    //             $earlyLeaving             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);

    //             if (time() > strtotime($date . $endTime)) {
    //                 //Overtime
    //                 $totalOvertimeSeconds = time() - strtotime($date . $endTime);
    //                 $hours                = floor($totalOvertimeSeconds / 3600);
    //                 $mins                 = floor($totalOvertimeSeconds / 60 % 60);
    //                 $secs                 = floor($totalOvertimeSeconds % 60);
    //                 $overtime             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);
    //             } else {
    //                 $overtime = '00:00:00';
    //             }

    //             $attendanceEmployee                = AttendanceEmployee::find($id);
    //             $attendanceEmployee->clock_out     = $time;
    //             $attendanceEmployee->early_leaving = $earlyLeaving;
    //             $attendanceEmployee->overtime      = $overtime;
    //             $attendanceEmployee->save();

    //             return redirect()->route('dashboard')->with('success', __('Employee successfully clock Out.'));
    //         } else {
    //             $date = date("Y-m-d");
    //             //late
    //             $totalLateSeconds = strtotime($request->clock_in) - strtotime($date . $startTime);

    //             $hours = floor($totalLateSeconds / 3600);
    //             $mins  = floor($totalLateSeconds / 60 % 60);
    //             $secs  = floor($totalLateSeconds % 60);
    //             $late  = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);

    //             //early Leaving
    //             $totalEarlyLeavingSeconds = strtotime($date . $endTime) - strtotime($request->clock_out);
    //             $hours                    = floor($totalEarlyLeavingSeconds / 3600);
    //             $mins                     = floor($totalEarlyLeavingSeconds / 60 % 60);
    //             $secs                     = floor($totalEarlyLeavingSeconds % 60);
    //             $earlyLeaving             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);


    //             if (strtotime($request->clock_out) > strtotime($date . $endTime)) {
    //                 //Overtime
    //                 $totalOvertimeSeconds = strtotime($request->clock_out) - strtotime($date . $endTime);
    //                 $hours                = floor($totalOvertimeSeconds / 3600);
    //                 $mins                 = floor($totalOvertimeSeconds / 60 % 60);
    //                 $secs                 = floor($totalOvertimeSeconds % 60);
    //                 $overtime             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);
    //             } else {
    //                 $overtime = '00:00:00';
    //             }
    
    //             $attendanceEmployee                = AttendanceEmployee::find($id);
    //             $attendanceEmployee->employee_id   = $request->employee_id;
    //             $attendanceEmployee->date          = $request->date;
    //             $attendanceEmployee->clock_in      = $request->clock_in;
    //             $attendanceEmployee->clock_out     = $request->clock_out;
    //             $attendanceEmployee->late          = $late;
    //             $attendanceEmployee->early_leaving = $earlyLeaving;
    //             $attendanceEmployee->overtime      = $overtime;
    //             $attendanceEmployee->total_rest    = '00:00:00';

    //             $attendanceEmployee->save();

    //             return redirect()->route('attendanceemployee.index')->with('success', __('Employee attendance successfully updated.'));
    //         }
    //     } else {
    //         return redirect()->back()->with('error', __('Employee are not allow multiple time clock in & clock for every day.'));
    //     }
    // }

    public function update(Request $request, $id)
    {
        if (\Auth::user()->type == 'company' || \Auth::user()->type == 'hr') {
            $employeeId      = AttendanceEmployee::where('employee_id', $request->employee_id)->first();
            $check = AttendanceEmployee::where('id', '=', $id)->where('employee_id', '=', $request->employee_id)->where('date', $request->date)->first();

            $startTime = Utility::getValByName('company_start_time');
            $endTime   = Utility::getValByName('company_end_time');

            $clockIn = $request->clock_in;
            $clockOut = $request->clock_out;

            if ($clockIn) {
                $status = "present";
            } else {
                $status = "leave";
            }

            $totalLateSeconds = strtotime($clockIn) - strtotime($startTime);

            $hours = floor($totalLateSeconds / 3600);
            $mins  = floor($totalLateSeconds / 60 % 60);
            $secs  = floor($totalLateSeconds % 60);
            $late  = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);

            $totalEarlyLeavingSeconds = strtotime($endTime) - strtotime($clockOut);
            $hours                    = floor($totalEarlyLeavingSeconds / 3600);
            $mins                     = floor($totalEarlyLeavingSeconds / 60 % 60);
            $secs                     = floor($totalEarlyLeavingSeconds % 60);
            $earlyLeaving             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);

            if (strtotime($clockOut) > strtotime($endTime)) {
                //Overtime
                $totalOvertimeSeconds = strtotime($clockOut) - strtotime($endTime);
                $hours                = floor($totalOvertimeSeconds / 3600);
                $mins                 = floor($totalOvertimeSeconds / 60 % 60);
                $secs                 = floor($totalOvertimeSeconds % 60);
                $overtime             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);
            } else {
                $overtime = '00:00:00';
            }
            if ($check->date == date('Y-m-d')) {
                $check->update([
                    'late' => $late,
                    'early_leaving' => ($earlyLeaving > 0) ? $earlyLeaving : '00:00:00',
                    'overtime' => $overtime,
                    'clock_in' => $clockIn,
                    'clock_out' => $clockOut
                ]);

                return redirect()->route('attendanceemployee.index')->with('success', __('Employee attendance successfully updated.'));
            } else {
                return redirect()->route('attendanceemployee.index')->with('error', __('You can only update current day attendance.'));
            }
        }

        $employeeId      = !empty(\Auth::user()->employee) ? \Auth::user()->employee->id : 0;
        $todayAttendance = AttendanceEmployee::where('employee_id', '=', $employeeId)->where('date', date('Y-m-d'))->first();

        $startTime = Utility::getValByName('company_start_time');
        $endTime   = Utility::getValByName('company_end_time');
        if (Auth::user()->type == 'employee') {

            $date = date("Y-m-d");
            $time = date("H:i:s");

            //early Leaving
            $totalEarlyLeavingSeconds = strtotime($date . $endTime) - time();
            $hours                    = floor($totalEarlyLeavingSeconds / 3600);
            $mins                     = floor($totalEarlyLeavingSeconds / 60 % 60);
            $secs                     = floor($totalEarlyLeavingSeconds % 60);
            $earlyLeaving             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);

            if (time() > strtotime($date . $endTime)) {
                //Overtime
                $totalOvertimeSeconds = time() - strtotime($date . $endTime);
                $hours                = floor($totalOvertimeSeconds / 3600);
                $mins                 = floor($totalOvertimeSeconds / 60 % 60);
                $secs                 = floor($totalOvertimeSeconds % 60);
                $overtime             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);
            } else {
                $overtime = '00:00:00';
            }

            $attendanceEmployee['clock_out']     = $time;
            $attendanceEmployee['early_leaving'] = $earlyLeaving;
            $attendanceEmployee['overtime']      = $overtime;

            if (!empty($request->date)) {
                $attendanceEmployee['date']       =  $request->date;
            }
            AttendanceEmployee::where('id', $id)->update($attendanceEmployee);

            return redirect()->route('dashboard')->with('success', __('Employee successfully clock Out.'));
        } else {
            $date = date("Y-m-d");
            $clockout_time = date("H:i:s");
            //late
            $totalLateSeconds = strtotime($clockout_time) - strtotime($date . $startTime);

            $hours            = abs(floor($totalLateSeconds / 3600));
            $mins             = abs(floor($totalLateSeconds / 60 % 60));
            $secs             = abs(floor($totalLateSeconds % 60));

            $late  = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);

            //early Leaving
            $totalEarlyLeavingSeconds = strtotime($date . $endTime) - strtotime($clockout_time);
            $hours                    = floor($totalEarlyLeavingSeconds / 3600);
            $mins                     = floor($totalEarlyLeavingSeconds / 60 % 60);
            $secs                     = floor($totalEarlyLeavingSeconds % 60);
            $earlyLeaving             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);


            if (strtotime($clockout_time) > strtotime($date . $endTime)) {
                //Overtime
                $totalOvertimeSeconds = strtotime($clockout_time) - strtotime($date . $endTime);
                $hours                = floor($totalOvertimeSeconds / 3600);
                $mins                 = floor($totalOvertimeSeconds / 60 % 60);
                $secs                 = floor($totalOvertimeSeconds % 60);
                $overtime             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);
            } else {
                $overtime = '00:00:00';
            }

            $attendanceEmployee                = AttendanceEmployee::find($id);
            $attendanceEmployee->clock_out     = $clockout_time;
            $attendanceEmployee->late          = $late;
            $attendanceEmployee->early_leaving = $earlyLeaving;
            $attendanceEmployee->overtime      = $overtime;
            $attendanceEmployee->total_rest    = '00:00:00';

            $attendanceEmployee->save();

            return redirect()->back()->with('success', __('Employee attendance successfully updated.'));
        }
    }

    public function destroy($id)
    {
        if (\Auth::user()->can('Delete Attendance')) {
            $attendance = AttendanceEmployee::where('id', $id)->first();

            $attendance->delete();

            return redirect()->route('attendanceemployee.index')->with('success', __('Attendance successfully deleted.'));
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    // public function attendance(Request $request)
    // {
    //     $settings = Utility::settings();

    //     if ($settings['ip_restrict'] == 'on') {
    //         $userIp = request()->ip();
    //         $ip     = IpRestrict::where('created_by', \Auth::user()->creatorId())->whereIn('ip', [$userIp])->first();
    //         if (!empty($ip)) {
    //             return redirect()->back()->with('error', __('this ip is not allowed to clock in & clock out.'));
    //         }
    //     }

    //     $employeeId      = !empty(\Auth::user()->employee) ? \Auth::user()->employee->id : 0;
    //     $todayAttendance = AttendanceEmployee::where('employee_id', '=', $employeeId)->where('date', date('Y-m-d'))->first();
    //     if (empty($todayAttendance)) {

    //         $startTime = Utility::getValByName('company_start_time');
    //         $endTime   = Utility::getValByName('company_end_time');

    //         $attendance = AttendanceEmployee::orderBy('id', 'desc')->where('employee_id', '=', $employeeId)->where('clock_out', '=', '00:00:00')->first();

    //         if ($attendance != null) {
    //             $attendance            = AttendanceEmployee::find($attendance->id);
    //             $attendance->clock_out = $endTime;
    //             $attendance->save();
    //         }

    //         $date = date("Y-m-d");
    //         $time = date("H:i:s");

    //         //late
    //         $totalLateSeconds = time() - strtotime($date . $startTime);
    //         $hours            = floor($totalLateSeconds / 3600);
    //         $mins             = floor($totalLateSeconds / 60 % 60);
    //         $secs             = floor($totalLateSeconds % 60);
    //         $late             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);


    //         $checkDb = AttendanceEmployee::where('employee_id', '=', \Auth::user()->id)->get()->toArray();


    //         if (empty($checkDb)) {
    //             $employeeAttendance                = new AttendanceEmployee();
    //             $employeeAttendance->employee_id   = $employeeId;
    //             $employeeAttendance->date          = $date;
    //             $employeeAttendance->status        = 'Present';
    //             $employeeAttendance->clock_in      = $time;
    //             $employeeAttendance->clock_out     = '00:00:00';
    //             $employeeAttendance->late          = $late;
    //             $employeeAttendance->early_leaving = '00:00:00';
    //             $employeeAttendance->overtime      = '00:00:00';
    //             $employeeAttendance->total_rest    = '00:00:00';
    //             $employeeAttendance->created_by    = \Auth::user()->id;

    //             $employeeAttendance->save();

    //             return redirect()->route('dashboard')->with('success', __('Employee Successfully Clock In.'));
    //         }
    //         foreach ($checkDb as $check) {


    //             $employeeAttendance                = new AttendanceEmployee();
    //             $employeeAttendance->employee_id   = $employeeId;
    //             $employeeAttendance->date          = $date;
    //             $employeeAttendance->status        = 'Present';
    //             $employeeAttendance->clock_in      = $time;
    //             $employeeAttendance->clock_out     = '00:00:00';
    //             $employeeAttendance->late          = $late;
    //             $employeeAttendance->early_leaving = '00:00:00';
    //             $employeeAttendance->overtime      = '00:00:00';
    //             $employeeAttendance->total_rest    = '00:00:00';
    //             $employeeAttendance->created_by    = \Auth::user()->id;

    //             $employeeAttendance->save();

    //             return redirect()->route('dashboard')->with('success', __('Employee Successfully Clock In.'));
    //         }
    //     } else {
    //         return redirect()->back()->with('error', __('Employee are not allow multiple time clock in & clock for every day.'));
    //     }
    // }

    
    public function bulkAttendance(Request $request)
    {
        if (\Auth::user()->can('Create Attendance')) {

            $branch = Branch::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
            $branch->prepend('Select Branch', '');

            $department = Department::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
            $department->prepend('Select Department', '');

            $employees = [];
            if (!empty($request->branch) && !empty($request->department)) {
                $employees = Employee::where('created_by', \Auth::user()->creatorId())->where('branch_id', $request->branch)->where('department_id', $request->department)->get();
            }

            return view('attendance.bulk', compact('employees', 'branch', 'department'));
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    public function bulkAttendanceData(Request $request)
    {
        if (\Auth::user()->can('Create Attendance')) {
            if (!empty($request->branch) && !empty($request->department)) {
                $startTime = Utility::getValByName('company_start_time');
                $endTime   = Utility::getValByName('company_end_time');
                $date      = $request->date;

                $employees = $request->employee_id;
                $atte      = [];
                foreach ($employees as $employee) {
                    $present = 'present-' . $employee;
                    $in      = 'in-' . $employee;
                    $out     = 'out-' . $employee;
                    $atte[]  = $present;
                    if ($request->$present == 'on') {

                        $in  = date("H:i:s", strtotime($request->$in));
                        $out = date("H:i:s", strtotime($request->$out));

                        $totalLateSeconds = strtotime($in) - strtotime($startTime);

                        $hours = floor($totalLateSeconds / 3600);
                        $mins  = floor($totalLateSeconds / 60 % 60);
                        $secs  = floor($totalLateSeconds % 60);
                        $late  = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);

                        //early Leaving
                        $totalEarlyLeavingSeconds = strtotime($endTime) - strtotime($out);
                        $hours                    = floor($totalEarlyLeavingSeconds / 3600);
                        $mins                     = floor($totalEarlyLeavingSeconds / 60 % 60);
                        $secs                     = floor($totalEarlyLeavingSeconds % 60);
                        $earlyLeaving             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);


                        if (strtotime($out) > strtotime($endTime)) {
                            //Overtime
                            $totalOvertimeSeconds = strtotime($out) - strtotime($endTime);
                            $hours                = floor($totalOvertimeSeconds / 3600);
                            $mins                 = floor($totalOvertimeSeconds / 60 % 60);
                            $secs                 = floor($totalOvertimeSeconds % 60);
                            $overtime             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);
                        } else {
                            $overtime = '00:00:00';
                        }

                        $attendance = AttendanceEmployee::where('employee_id', '=', $employee)->where('date', '=', $request->date)->first();

                        if (!empty($attendance)) {
                            $employeeAttendance = $attendance;
                        } else {
                            $employeeAttendance              = new AttendanceEmployee();
                            $employeeAttendance->employee_id = $employee;
                            $employeeAttendance->created_by  = \Auth::user()->creatorId();
                        }

                        $employeeAttendance->date          = $request->date;
                        $employeeAttendance->status        = 'Present';
                        $employeeAttendance->clock_in      = $in;
                        $employeeAttendance->clock_out     = $out;
                        $employeeAttendance->late          = $late;
                        $employeeAttendance->early_leaving = ($earlyLeaving > 0) ? $earlyLeaving : '00:00:00';
                        $employeeAttendance->overtime      = $overtime;
                        $employeeAttendance->total_rest    = '00:00:00';
                        $employeeAttendance->save();
                    } else {
                        $attendance = AttendanceEmployee::where('employee_id', '=', $employee)->where('date', '=', $request->date)->first();

                        if (!empty($attendance)) {
                            $employeeAttendance = $attendance;
                        } else {
                            $employeeAttendance              = new AttendanceEmployee();
                            $employeeAttendance->employee_id = $employee;
                            $employeeAttendance->created_by  = \Auth::user()->creatorId();
                        }

                        $employeeAttendance->status        = 'Leave';
                        $employeeAttendance->date          = $request->date;
                        $employeeAttendance->clock_in      = '00:00:00';
                        $employeeAttendance->clock_out     = '00:00:00';
                        $employeeAttendance->late          = '00:00:00';
                        $employeeAttendance->early_leaving = '00:00:00';
                        $employeeAttendance->overtime      = '00:00:00';
                        $employeeAttendance->total_rest    = '00:00:00';
                        $employeeAttendance->save();
                    }
                }

                return redirect()->back()->with('success', __('Employee attendance successfully created.'));
            } else {
                return redirect()->back()->with('error', __('Branch & department field required.'));
            }
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    public function importFile()
    {
        return view('attendance.import');
    }

    public function import(Request $request)
    {
        $rules = [
            'file' => 'required|mimes:csv,txt,xlsx',
        ];
        $validator = \Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            $messages = $validator->getMessageBag();

            return redirect()->back()->with('error', $messages->first());
        }

        $attendance = (new AttendanceImport())->toArray(request()->file('file'))[0];

        $email_data = [];
        foreach ($attendance as $key => $employee) {
            if ($key != 0) {
                echo "<pre>";
                if ($employee != null && Employee::where('email', $employee[0])->where('created_by', \Auth::user()->creatorId())->exists()) {
                    $email = $employee[0];
                } else {
                    $email_data[] = $employee[0];
                }
            }
        }
        $totalattendance = count($attendance) - 1;
        $errorArray    = [];

        $startTime = Utility::getValByName('company_start_time');
        $endTime   = Utility::getValByName('company_end_time');

        if (!empty($attendanceData)) {
            $errorArray[] = $attendanceData;
        } else {
            foreach ($attendance as $key => $value) {
                if ($key != 0) {
                    $employeeData = Employee::where('email', $value[0])->where('created_by', \Auth::user()->creatorId())->first();
                    // $employeeId = 0;
                    if (!empty($employeeData)) {
                        $employeeId = $employeeData->id;


                        $clockIn = $value[2];
                        $clockOut = $value[3];

                        if ($clockIn) {
                            $status = "present";
                        } else {
                            $status = "leave";
                        }

                        $totalLateSeconds = strtotime($clockIn) - strtotime($startTime);

                        $hours = floor($totalLateSeconds / 3600);
                        $mins  = floor($totalLateSeconds / 60 % 60);
                        $secs  = floor($totalLateSeconds % 60);
                        $late  = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);

                        $totalEarlyLeavingSeconds = strtotime($endTime) - strtotime($clockOut);
                        $hours                    = floor($totalEarlyLeavingSeconds / 3600);
                        $mins                     = floor($totalEarlyLeavingSeconds / 60 % 60);
                        $secs                     = floor($totalEarlyLeavingSeconds % 60);
                        $earlyLeaving             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);

                        if (strtotime($clockOut) > strtotime($endTime)) {
                            //Overtime
                            $totalOvertimeSeconds = strtotime($clockOut) - strtotime($endTime);
                            $hours                = floor($totalOvertimeSeconds / 3600);
                            $mins                 = floor($totalOvertimeSeconds / 60 % 60);
                            $secs                 = floor($totalOvertimeSeconds % 60);
                            $overtime             = sprintf('%02d:%02d:%02d', $hours, $mins, $secs);
                        } else {
                            $overtime = '00:00:00';
                        }

                        $check = AttendanceEmployee::where('employee_id', $employeeId)->where('date', $value[1])->first();
                        if ($check) {
                            $check->update([
                                'late' => $late,
                                'early_leaving' => ($earlyLeaving > 0) ? $earlyLeaving : '00:00:00',
                                'overtime' => $overtime,
                                'clock_in' => $value[2],
                                'clock_out' => $value[3]
                            ]);
                        } else {
                            $time_sheet = AttendanceEmployee::create([
                                'employee_id' => $employeeId,
                                'date' => $value[1],
                                'status' => $status,
                                'late' => $late,
                                'early_leaving' => ($earlyLeaving > 0) ? $earlyLeaving : '00:00:00',
                                'overtime' => $overtime,
                                'clock_in' => $value[2],
                                'clock_out' => $value[3],
                                'created_by' => \Auth::user()->id,
                            ]);
                        }
                    }
                } else {
                    $email_data = implode(' And ', $email_data);
                }
            }
            if (!empty($email_data)) {
                return redirect()->back()->with('status', 'this record is not import. ' . '</br>' . $email_data);
            } else {
                if (empty($errorArray)) {
                    $data['status'] = 'success';
                    $data['msg']    = __('Record successfully imported');
                } else {

                    $data['status'] = 'error';
                    $data['msg']    = count($errorArray) . ' ' . __('Record imported fail out of' . ' ' . $totalattendance . ' ' . 'record');


                    foreach ($errorArray as $errorData) {
                        $errorRecord[] = implode(',', $errorData->toArray());
                    }

                    \Session::put('errorArray', $errorRecord);
                }

                return redirect()->back()->with($data['status'], $data['msg']);
            }
        }
    }



    public function attendance(Request $request)
{
    $settings = Utility::settings();

    // IP Restriction Check
    if (!empty($settings['ip_restrict']) && $settings['ip_restrict'] == 'on') {
        $userIp = request()->ip();
        $ip = IpRestrict::where('created_by', Auth::user()->creatorId())->whereIn('ip', [$userIp])->first();
        if (empty($ip)) {
            return redirect()->back()->with('error', __('This IP is not allowed to clock in & clock out.'));
        }
    }

    $employeeId = !empty(\Auth::user()->employee) ? \Auth::user()->employee->id : 0;
    $employee = Employee::find($employeeId);
    $date = date("Y-m-d");
    $time = date("H:i:s");
    
    // Get location data from request
    $latitude = $request->input('latitude');
    $longitude = $request->input('longitude');
    $location = $request->input('location');
    $accuracy = $request->input('accuracy');

    // Check if the user has already punched in today
    $todayAttendance = AttendanceEmployee::where('employee_id', $employeeId)
                                        ->where('date', $date)
                                        ->first();

    if (!$todayAttendance) {
        // First check if there's any pending clock-in (to prevent duplicates from multiple clicks)
        $pendingClockIn = AttendanceEmployee::where('employee_id', $employeeId)
                                          ->where('date', $date)
                                          ->where('clock_in', '!=', '00:00:00')
                                          ->where('clock_out', '00:00:00')
                                          ->first();
        
        if ($pendingClockIn) {
            return redirect()->back()->with('error', __('Your clock-in is already being processed.'));
        }

        // PUNCH IN
        $expectedStartTime = $date . ' ' . Utility::getValByName('company_start_time');
        $actualClockInTime = $date . ' ' . $time;
        $totalLateSeconds = max(strtotime($actualClockInTime) - strtotime($expectedStartTime), 0);
        $late = gmdate("H:i:s", $totalLateSeconds);

        $employeeAttendance = new AttendanceEmployee();
        $employeeAttendance->employee_id = $employeeId;
        $employeeAttendance->date = $date;
        $employeeAttendance->status = 'Present';
        $employeeAttendance->clock_in = $time;
        $employeeAttendance->clock_out = '00:00:00';
        $employeeAttendance->late = $late;
        $employeeAttendance->early_leaving = '00:00:00';
        $employeeAttendance->overtime = '00:00:00';
        $employeeAttendance->total_rest = '00:00:00';
        $employeeAttendance->created_by = \Auth::user()->id;
        
        // Save location data if available
        if ($latitude && $longitude) {
            $employeeAttendance->clock_in_latitude = $latitude;
            $employeeAttendance->clock_in_longitude = $longitude;
            $employeeAttendance->clock_in_location = $location;
            $employeeAttendance->clock_in_accuracy = $accuracy;
        }
        
        $employeeAttendance->save();

        

        return redirect()->back()->with('success', __('Employee Successfully Clocked In.'));
    } 
    elseif ($todayAttendance->clock_out == '00:00:00') {
        // PUNCH OUT
        $clockInTime = strtotime($todayAttendance->clock_in);
        $clockOutTime = strtotime($time);
        $workedSeconds = $clockOutTime - $clockInTime;
        $totalWorked = gmdate("H:i:s", $workedSeconds);

        $todayAttendance->clock_out = $time;
        $todayAttendance->overtime = $totalWorked;

        // Save clock-out location if available
        if ($latitude && $longitude) {
            $todayAttendance->clock_out_latitude = $latitude;
            $todayAttendance->clock_out_longitude = $longitude;
            $todayAttendance->clock_out_location = $location;
            $todayAttendance->clock_out_accuracy = $accuracy;
        }

        $todayAttendance->save();

        return redirect()->back()->with('success', __('Employee Successfully Clocked Out.'));
    } 

    return redirect()->back()->with('error', __('You have already clocked out today.'));
}
    
    /**
     * Validate if the employee is within allowed company premises
     */
    private function isLocationValid($latitude, $longitude, $accuracy)
    {
        // Get company location settings
        $companyLatitude = Utility::getValByName('company_latitude');
        $companyLongitude = Utility::getValByName('company_longitude');
        $allowedRadius = Utility::getValByName('allowed_radius') ?: 100; // meters
    
        // If company location isn't set, skip validation
        if (empty($companyLatitude) || empty($companyLongitude)) {
            return true;
        }
    
        // Check if accuracy is too low (more than 50 meters)
        if ($accuracy > 50) {
            return false;
        }
    
        // Calculate distance between employee and company location
        $distance = $this->calculateDistance(
            $companyLatitude,
            $companyLongitude,
            $latitude,
            $longitude
        );
    
        return $distance <= $allowedRadius;
    }
    
    /**
     * Calculate distance between two coordinates in meters
     * Using Haversine formula
     */
    private function calculateDistance($lat1, $lon1, $lat2, $lon2)
    {
        $earthRadius = 6371000; // meters
    
        $dLat = deg2rad($lat2 - $lat1);
        $dLon = deg2rad($lon2 - $lon1);
    
        $a = sin($dLat/2) * sin($dLat/2) +
             cos(deg2rad($lat1)) * cos(deg2rad($lat2)) *
             sin($dLon/2) * sin($dLon/2);
        $c = 2 * atan2(sqrt($a), sqrt(1-$a));
    
        return $earthRadius * $c;
    }

    public function calendar(Request $request)
    {
        if (\Auth::user()->can('Manage Attendance')) {
            $employees = [];
            $selectedEmployee = null;
            $allEmployees = Employee::where('created_by', \Auth::user()->creatorId())->get();

            // For employee users - automatically select their own record
            if (\Auth::user()->type == 'employee') {
                $selectedEmployee = Employee::where('user_id', \Auth::user()->id)->first();
                if ($selectedEmployee) {
                    $employees = [$selectedEmployee];
                }
            } 
            // For company users - check if employee is selected
            else {
                if ($request->has('employee_id') && $request->employee_id) {
                    $selectedEmployee = Employee::find($request->employee_id);
                    if ($selectedEmployee) {
                        $employees = [$selectedEmployee];
                    }
                }
            }

            // Get current month and year
            $currentMonth = request()->input('month', date('m'));
            $currentYear = request()->input('year', date('Y'));

            $currentDate = \Carbon\Carbon::create($currentYear, $currentMonth, 1);
            $previousMonth = $currentDate->copy()->subMonth();
            $nextMonth = $currentDate->copy()->addMonth();

            $attendanceData = [];

            // Only process data if we have a selected employee
            if ($selectedEmployee) {
                foreach ($employees as $employee) {
                    // Get all attendance records (no month filter)
                    $attendances = DB::table('attendance_employees')
                        ->where('employee_id', $employee->id)
                        ->get()
                        ->map(function ($item) {
                            $date = \Carbon\Carbon::parse($item->date)->format('Y-m-d');
                            return [
                                'date' => $date,
                                'clock_in' => $item->clock_in,
                                'clock_out' => $item->clock_out
                            ];
                        });

                    // Get all approved leaves (no month filter)
                    $leaves = LocalLeave::where('employee_id', $employee->id)
                        ->where('status', 'Approved')
                        ->get()
                        ->map(function ($item) {
                            return [
                                'start_date' => \Carbon\Carbon::parse($item->start_date)->format('Y-m-d'),
                                'end_date' => \Carbon\Carbon::parse($item->end_date)->format('Y-m-d'),
                                'leave_reason' => $item->leave_reason
                            ];
                        });

                    $weekOffDay = strtolower($employee->week_off_day); // e.g. 'sunday'

                    $employeeData = [];

                    // Mark 'present' from attendance records
                    foreach ($attendances as $attendance) {
                        $employeeData[$attendance['date']] = [
                            'type' => 'present',
                            'clock_in' => $attendance['clock_in'],
                            'clock_out' => $attendance['clock_out']
                        ];
                    }

                    // Mark 'leave' days
                    foreach ($leaves as $leave) {
                        $start = \Carbon\Carbon::parse($leave['start_date']);
                        $end = \Carbon\Carbon::parse($leave['end_date']);

                        for ($date = $start->copy(); $date->lte($end); $date->addDay()) {
                            $formattedDate = $date->format('Y-m-d');

                            if (!isset($employeeData[$formattedDate])) {
                                $employeeData[$formattedDate] = [
                                    'type' => 'leave',
                                    'reason' => $leave['leave_reason']
                                ];
                            }
                        }
                    }

                    // Fill in 'week_off' and 'absent' for all dates in the calendar view
                    // We'll process 3 months to ensure smooth navigation
                    $startRange = $currentDate->copy()->subMonth(); // Show previous month
                    $endRange = $currentDate->copy()->addMonth(); // Show next month
                    
                    for ($date = $startRange->copy(); $date->lte($endRange); $date->addDay()) {
                        $dateFormatted = $date->format('Y-m-d');
                        $dayName = strtolower($date->format('l')); // e.g. 'sunday'

                        if (!isset($employeeData[$dateFormatted])) {
                            if ($weekOffDay && $dayName === $weekOffDay) {
                                $employeeData[$dateFormatted] = ['type' => 'week_off'];
                            } elseif (!$weekOffDay && in_array($dayName, ['saturday', 'sunday'])) {
                                $employeeData[$dateFormatted] = ['type' => 'week_off'];
                            } elseif ($date->lte(\Carbon\Carbon::today())) {
                                $employeeData[$dateFormatted] = ['type' => 'absent'];
                            }
                            // else: future dates remain unmarked
                        }
                    }

                    // Sort data by date
                    ksort($employeeData);

                    $attendanceData[$employee->id] = [
                        'name' => $employee->name,
                        'data' => $employeeData
                    ];
                }
            }

            return view('attendance.calendar', [
                'attendanceData' => $attendanceData,
                'currentMonth' => $currentMonth,
                'currentYear' => $currentYear,
                'previousMonth' => $previousMonth->format('m'),
                'previousYear' => $previousMonth->format('Y'),
                'nextMonth' => $nextMonth->format('m'),
                'nextYear' => $nextMonth->format('Y'),
                'allEmployees' => $allEmployees,
                'selectedEmployee' => $selectedEmployee
            ]);
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    public function export(Request $request)
    {
        if (\Auth::user()->can('Manage Attendance')) {
            // Get the same filtered data as the index method
            if (\Auth::user()->type == 'employee') {
                $emp = !empty(\Auth::user()->employee) ? \Auth::user()->employee->id : 0;
                $query = AttendanceEmployee::where('employee_id', $emp);
            } else {
                $employee = Employee::select('id')->where('created_by', \Auth::user()->creatorId());
                
                if (!empty($request->branch)) {
                    $employee->where('branch_id', $request->branch);
                }

                if (!empty($request->department)) {
                    $employee->where('department_id', $request->department);
                }

                // Add employee filter
                if (!empty($request->employee)) {
                    $employee->where('id', $request->employee);
                }

                $employee = $employee->get()->pluck('id');
                $query = AttendanceEmployee::whereIn('employee_id', $employee);
            }
            
            // Apply date filters
            if ($request->type == 'monthly' && !empty($request->month)) {
                $month = date('m', strtotime($request->month));
                $year = date('Y', strtotime($request->month));
                $start_date = date($year . '-' . $month . '-01');
                $end_date = date('Y-m-t', strtotime('01-' . $month . '-' . $year));
                
                $query->whereBetween('date', [$start_date, $end_date]);
            } elseif ($request->type == 'daily' && !empty($request->date)) {
                $query->where('date', $request->date);
            } else {
                $month = date('m');
                $year = date('Y');
                $start_date = date($year . '-' . $month . '-01');
                $end_date = date('Y-m-t', strtotime('01-' . $month . '-' . $year));
                
                $query->whereBetween('date', [$start_date, $end_date]);
            }

            $attendanceEmployee = $query->orderBy('date', 'desc')
                                    ->orderBy('clock_in', 'desc')
                                    ->get();

            // Generate CSV
            $fileName = 'attendance_' . date('Y-m-d') . '.csv';
            $headers = array(
                "Content-type"        => "text/csv",
                "Content-Disposition" => "attachment; filename=$fileName",
                "Pragma"              => "no-cache",
                "Cache-Control"       => "must-revalidate, post-check=0, pre-check=0",
                "Expires"             => "0"
            );

            $columns = [];
            if (\Auth::user()->type != 'employee') {
                $columns = ['Employee', 'Employee ID', 'Date', 'Status', 'Clock-In Time', 'Clock-In Location', 'Clock-Out Time', 'Clock-Out Location', 'Late', 'Early Leaving', 'Overtime'];
            } else {
                $columns = ['Date', 'Status', 'Clock-In Time', 'Clock-In Location', 'Clock-Out Time', 'Clock-Out Location', 'Late', 'Early Leaving', 'Overtime'];
            }

            $callback = function() use($attendanceEmployee, $columns) {
                $file = fopen('php://output', 'w');
                fputcsv($file, $columns);

                foreach ($attendanceEmployee as $attendance) {
                    $row = [];
                    if (\Auth::user()->type != 'employee') {
                        $row[] = !empty($attendance->employee) ? $attendance->employee->name : '';
                        $row[] = !empty($attendance->employee) ? $attendance->employee->employee_id : '';   
                                }
                    
                    $row[] = \Auth::user()->dateFormat($attendance->date);
                    $row[] = $attendance->status;
                    $row[] = $attendance->clock_in != '00:00:00' ? \Auth::user()->timeFormat($attendance->clock_in) : '00:00';
                    $row[] = str_replace('<br>', ' ', $attendance->clock_in_location);
                    $row[] = $attendance->clock_out != '00:00:00' ? \Auth::user()->timeFormat($attendance->clock_out) : '00:00';
                    $row[] = str_replace('<br>', ' ', $attendance->clock_out_location);
                    $row[] = $attendance->late;
                    $row[] = $attendance->early_leaving;
                    $row[] = $attendance->overtime;

                    fputcsv($file, $row);
                }

                fclose($file);
            };

            return response()->stream($callback, 200, $headers);
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    
   
}
