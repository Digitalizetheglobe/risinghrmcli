<?php

namespace App\Http\Controllers;

use App\Models\AccountList;
use App\Models\Announcement;
use App\Models\AttendanceEmployee;
use App\Models\Employee;
use App\Models\Event;
use App\Models\LandingPageSection;
use App\Models\Meeting;
use App\Models\Job;
use App\Models\Order;
use App\Models\Payees;
use App\Models\Payer;
use App\Models\Plan;
use App\Models\Ticket;
use App\Models\User;
use App\Models\Utility;
use Illuminate\Support\Facades\Auth;
use App\Models\DailyQuote;  
use App\Models\Department; 
use App\Models\Site;
use App\Models\LeaveType;  
use App\Models\Project;  
use App\Models\ToDoList;  
use Carbon\Carbon;
use App\Models\Deposit;
use App\Models\Expense;
use App\Models\Holiday;
use App\Models\Notice;
use App\Models\TimeSheet; // Make sure to import the TimeSheet model at the top
use App\Models\BookingForm;
use App\Models\Leave;
use Illuminate\Http\Request;


class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {

        if (Auth::check()) {
            $user = Auth::user();
            if ($user->type == 'employee') {
                $emp = Employee::with(['user', 'designation'])->where('user_id', '=', $user->id)->first();
            
                $announcements = Announcement::orderBy('announcements.id', 'desc')
                    ->take(5)
                    ->leftJoin('announcement_employees', 'announcements.id', '=', 'announcement_employees.announcement_id')
                    ->where('announcement_employees.employee_id', '=', $emp->id)
                    ->orWhere(function ($q) {
                        $q->where('announcements.department_id', 0)->where('announcements.employee_id', 0);
                    })
                    ->get();
            
                $employees = Employee::get();
                $meetings = Meeting::orderBy('meetings.id', 'desc')
                        ->leftJoin('meeting_employees', 'meetings.id', '=', 'meeting_employees.meeting_id')
                        ->where('meeting_employees.employee_id', '=', $emp->id)
                        ->orWhere(function ($q) {
                            $q->where('meetings.department_id', 0)->where('meetings.employee_id');
                        })
                        ->take(5)
                        ->get();
                
                
                $events = Event::select('events.*', 'events.id as event_id', 'event_employees.*')
                    ->leftJoin('event_employees', 'events.id', '=', 'event_employees.event_id')
                    ->where('event_employees.employee_id', '=', $emp->id)
                    ->orWhere(function ($q) {
                        $q->where('events.department_id', 0)->where('events.employee_id', 0);
                    })
                    ->get();
            
                $arrEvents = [];
            
                foreach ($events as $event) {
                    $arr['id'] = $event['event_id'];
                    $arr['title'] = $event['title'];
                    $arr['start'] = $event['start_date'];
                    $arr['end'] = $event['end_date'];
                    $arr['className'] = $event['color'];
                    $arr['url'] = (!empty($event['event_id'])) ? route('eventsshow', $event['event_id']) : '0';
                    $arrEvents[] = $arr;
                }
            
                $date = date("Y-m-d");

                // Fetch the latest attendance record for today
                $employeeAttendance = AttendanceEmployee::where('employee_id', '=', $emp->id ?? 0)
                    ->where('date', '=', $date)
                    ->first();

                  // Pass clock-in time if available
                $clockInTime = $employeeAttendance ? $employeeAttendance->clock_in : null;    
                

                            
                $officeTime['startTime'] = Utility::getValByName('company_start_time');
                $officeTime['endTime'] = Utility::getValByName('company_end_time');
            
                // Fetch a random daily quote
                $quote = DailyQuote::inRandomOrder()->first();


                
                $todos = ToDoList::where('user_id', Auth::id())
                ->whereDate('created_at', Carbon::today()) // Filter by today's date
                ->get();

                $today = Carbon::today();

                $notices = Notice::select('title', 'notice_startdate', 'notice_enddate')
                    ->where('created_by', '=', \Auth::user()->creatorId())
                    ->whereDate('notice_enddate', '>=', $today) // Show only notices with an end date today or in the future
                    ->orderBy('notice_startdate', 'asc') // Sort by start date in ascending order
                    ->take(5) // Limit to the latest 5 notices
                    ->get();
                

                
            
            
                // Pass employee details to the dashboard
                return view('dashboard.dashboard', compact('notices', 'arrEvents', 'announcements', 'employees', 'meetings', 'employeeAttendance', 'officeTime', 'quote', 'emp', 'clockInTime', 'todos'));
            }
            else if ($user->type == 'super admin') {
                $user                       = \Auth::user();
                $user['total_user']         = $user->countCompany();
                $user['total_paid_user']    = $user->countPaidCompany();
                $user['total_orders']       = Order::total_orders();
                $user['total_orders_price'] = Order::total_orders_price();
                $user['total_plan']         = Plan::total_plan();
                $user['most_purchese_plan'] = (!empty(Plan::most_purchese_plan()) ? Plan::most_purchese_plan()->name : '');

                $chartData = $this->getOrderChart(['duration' => 'week']);
                // **Daily Quote Logic for Super Admin Dashboard**
                $quote = DailyQuote::inRandomOrder()->first();

                return view('dashboard.super_admin', compact('user', 'chartData', 'quote'));


            } 
            else if ($user->type == 'company' || $user->type == 'hr') {

                $today = Carbon::today();
                $startOfMonth = $today->copy()->startOfMonth();
                $endOfMonth = $today->copy()->endOfMonth();

                $events = Event::where('created_by', '=', \Auth::user()->creatorId())
                    ->whereBetween('start_date', [$startOfMonth, $endOfMonth]) // Filter for current month
                    ->whereDate('start_date', '>=', $today) // Only today or future events
                    ->orderBy('start_date', 'asc') // Sort so today comes first, then future events
                    ->get();

                $arrEvents = [];

                foreach ($events as $event) {
                    $arr['id']    = $event['id'];
                    $arr['title'] = $event['title'];
                    $arr['start'] = $event['start_date'];
                    $arr['end']   = $event['end_date'];
                    $arr['className'] = $event['color'];
                    $arr['employee'] = $event['employee_id'];
                    $arr['url']   = route('event.edit', $event['id']);

                    $arrEvents[] = $arr;
                }



                $announcements = Announcement::orderBy('announcements.id', 'desc')->take(5)->where('created_by', '=', \Auth::user()->creatorId())->get();

                $employees = User::where('type', '=', 'employee')->where('created_by', '=', \Auth::user()->creatorId())->get();
                $countEmployee = count($employees);

                

                $user      = User::where('type', '!=', 'employee')->where('created_by', '=', \Auth::user()->creatorId())->get();
                $countUser = count($user);
                $countTicket      = Ticket::where('created_by', '=', \Auth::user()->creatorId())->count();
                $countOpenTicket  = Ticket::where('status', '=', 'open')->where('created_by', '=', \Auth::user()->creatorId())->count();
                $countCloseTicket = Ticket::where('status', '=', 'close')->where('created_by', '=', \Auth::user()->creatorId())->count();

                $currentDate = Carbon::today()->format('Y-m-d');

                // Get employees who have clocked in today
                $clockedInEmployees = AttendanceEmployee::where('date', '=', $currentDate)
                    ->whereNotNull('clock_in')
                    ->where('clock_in', '!=', '00:00:00')
                    ->pluck('employee_id');

                // $employees     = User::where('type', '=', 'employee')->where('created_by', '=', \Auth::user()->creatorId())->get();
                // $countEmployee = count($employees);
                $notClockIn = AttendanceEmployee::where('date', '=', $currentDate)->pluck('employee_id');

                // Get employees on approved leave today
                $employeesOnLeaveToday = Leave::where('created_by', \Auth::user()->creatorId())
                    ->where('start_date', '<=', $currentDate)
                    ->where('end_date', '>=', $currentDate)
                    ->where('status', 'approved')
                    ->pluck('employee_id');

                // Merge both to exclude from "not clock in" list
                $excludeIds = $notClockIn->merge($employeesOnLeaveToday)->unique();

                $notClockIns = Employee::where('created_by', '=', \Auth::user()->creatorId())
                    ->whereNotIn('id', $excludeIds)
                    ->get();


                $employeesOnLeaveToday = Leave::where('created_by', \Auth::user()->creatorId())
                    ->where('start_date', '<=', $currentDate)
                    ->where('end_date', '>=', $currentDate)
                    ->where('status', 'approved') // only approved leaves
                    ->pluck('employee_id');


                // Get employees on approved leave today
                $onLeaveEmployees = Leave::with(['employees', 'leaveType'])
                    ->where('created_by', \Auth::user()->creatorId())
                    ->where('start_date', '<=', $currentDate)
                    ->where('end_date', '>=', $currentDate)
                    ->where('status', 'approved')
                    ->get();

                // Get employees who have week off today (just IDs first)
$todayWeekDay = strtolower(Carbon::today()->format('l'));
$employeesOnWeekOffIds = Employee::where('created_by', \Auth::user()->creatorId())
    ->where('week_off_day', 'like', "%$todayWeekDay%")
    ->pluck('id');

// Combine all IDs to exclude from "not clocked in" list
$excludeIds = $clockedInEmployees
    ->merge($employeesOnLeaveToday)
    ->merge($employeesOnWeekOffIds)
    ->unique();

// Get employees who haven't clocked in and aren't on leave/week off
$notClockIns = Employee::where('created_by', '=', \Auth::user()->creatorId())
    ->whereNotIn('id', $excludeIds)
    ->get();

// Now get full employee objects for week off (for display)
$employeesOnWeekOff = Employee::where('created_by', \Auth::user()->creatorId())
    ->where('week_off_day', 'like', "%$todayWeekDay%")
    ->get();

// Get employees on approved leave (with relationships for display)
$onLeaveEmployees = Leave::with(['employees', 'leaveType'])
    ->where('created_by', \Auth::user()->creatorId())
    ->where('start_date', '<=', $currentDate)
    ->where('end_date', '>=', $currentDate)
    ->where('status', 'approved')
    ->get();

// Prepare the final list for display
$employeesNotWorkingToday = collect();

// Add leave employees
foreach ($onLeaveEmployees as $leave) {
    if ($leave->employees) {
        $employeesNotWorkingToday->push([
            'employee_name' => $leave->employees->name ?? 'N/A',
            'status' => $leave->leaveType->title ?? 'Leave'
        ]);
    }
}

// Add week off employees (excluding duplicates)
foreach ($employeesOnWeekOff as $employee) {
    $exists = $employeesNotWorkingToday->contains(function ($item) use ($employee) {
        return $item['employee_name'] === $employee->name;
    });
    
    if (!$exists) {
        $employeesNotWorkingToday->push([
            'employee_name' => $employee->name,
            'status' => 'Week Off'
        ]);
    }
}



                // Fetch present employees based on today's date
               // Get the total number of employees
                $totalEmployees = Employee::count();
                
                

                // Get present employees for today
                $presentEmployees = AttendanceEmployee::where('date', '=', $currentDate)
                    ->whereNotNull('clock_in')
                    ->where('clock_in', '!=', '00:00:00')
                    ->get();

                // Calculate the attendance percentage
                $attendancePercentage = $totalEmployees > 0 ? (count($presentEmployees) / $totalEmployees) * 100 : 0;

                // Get employees who are present and their clock-in time
                $presentEmployeesWithClockIn = AttendanceEmployee::where('date', '=', $currentDate)
                    ->whereNotNull('clock_in')
                    ->where('clock_in', '!=', '00:00:00')
                    ->with('employee') // Eager load the employee relationship
                    ->get()
                    ->map(function ($attendance) {
                        return [
                            'employee' => $attendance->employee,
                            'clock_in' => $attendance->clock_in,
                            'clock_in_location' => $attendance->clock_in_location ?? 'Location not available',
                            'clock_in_latitude' => $attendance->clock_in_latitude,
                            'clock_in_longitude' => $attendance->clock_in_longitude,
                            'clock_in_accuracy' => $attendance->clock_in_accuracy,
                            'clock_out' => $attendance->clock_out ?? '--:--',
                            'clock_out_location' => $attendance->clock_out_location ?? 'Location not available',
                            'clock_out_latitude' => $attendance->clock_out_latitude,
                            'clock_out_longitude' => $attendance->clock_out_longitude,
                            'clock_out_accuracy' => $attendance->clock_out_accuracy,
                            'status' => $attendance->status,
                        ];
                    });

                $accountBalance = AccountList::where('created_by', '=', \Auth::user()->creatorId())->sum('initial_balance');
                $activeJob   = Job::where('status', 'active')->where('created_by', '=', \Auth::user()->creatorId())->count();
                $inActiveJOb = Job::where('status', 'in_active')->where('created_by', '=', \Auth::user()->creatorId())->count();

                $totalPayee = Payees::where('created_by', '=', \Auth::user()->creatorId())->count();
                $totalPayer = Payer::where('created_by', '=', \Auth::user()->creatorId())->count();

                // $meetings = Meeting::where('created_by', '=', \Auth::user()->creatorId())->limit(8)->get();

                $meetings = Meeting::where('created_by', Auth::id())
                 ->whereDate('created_at', Carbon::today()) // Filter by today's date
                 ->get();
                

                $users = User::find(\Auth::user()->creatorId());
                $plan = Plan::find($users->plan);
                if ($plan->storage_limit > 0) {
                    $storage_limit = ($users->storage_limit / $plan->storage_limit) * 100;
                } else {
                    $storage_limit = 0;
                } 
                 // **Daily Quote Logic for Other Users Dashboard**
                 $quote = DailyQuote::inRandomOrder()->first();


                 $totalDepartment = Department::where('created_by', '=', \Auth::user()->creatorId())->count();

                 $totalleaves = LeaveType::where('created_by', '=', \Auth::user()->creatorId())->count();

                 $projects = Project::all(); // Gets all projects without any conditions

                 // With this:
                 // Get all projects
                 $projects = Project::where('created_by', '=', \Auth::user()->creatorId())->get();
                 
                 // Prepare employee data for projects (similar to ProjectController)
                 $departmentIds = [];
                 $employeeIds = [];
                 
                 foreach ($projects as $project) {
                     if (is_array($project->assigned_data)) {
                         foreach ($project->assigned_data as $assignment) {
                             if (!empty($assignment['department_id'])) {
                                 $departmentIds[] = $assignment['department_id'];
                             }
                             if (!empty($assignment['employee_ids']) && is_array($assignment['employee_ids'])) {
                                 $employeeIds = array_merge($employeeIds, $assignment['employee_ids']);
                             }
                         }
                     }
                 }
                 
                 // Get unique IDs
                 $departmentIds = array_unique($departmentIds);
                 $employeeIds = array_unique($employeeIds);
                 
                 // Preload data
                 $departments = Department::whereIn('id', $departmentIds)->get()->keyBy('id');
                 $employees = Employee::with('user')->whereIn('id', $employeeIds)->get()->keyBy('id');
                 
                 
                 $totalProjects = Project::count();

                 $totalHolidays = Holiday::count();

                 $todos = ToDoList::where('user_id', Auth::id())
                 ->whereDate('created_at', Carbon::today()) // Filter by today's date
                 ->get();
             

                    // Fetch income and expense data for the current month
                    $currentMonth = date('m');
                    $currentYear = date('Y');

                    // Fetch income data for the current month
                    $incomeData = Deposit::where('created_by', \Auth::user()->creatorId())
                        ->whereMonth('date', $currentMonth)
                        ->whereYear('date', $currentYear)
                        ->get()
                        ->groupBy(function ($date) {
                            return \Carbon\Carbon::parse($date->date)->format('d M Y'); // Group by day
                        })
                        ->map(function ($row) {
                            return $row->sum('amount');
                        });

                    // Fetch expense data for the current month
                    $expenseData = Expense::where('created_by', \Auth::user()->creatorId())
                        ->whereMonth('date', $currentMonth)
                        ->whereYear('date', $currentYear)
                        ->get()
                        ->groupBy(function ($date) {
                            return \Carbon\Carbon::parse($date->date)->format('d M Y'); // Group by day
                        })
                        ->map(function ($row) {
                            return $row->sum('amount');
                        });

                    // Prepare labels (dates) for the chart
                    $labels = $incomeData->keys()->merge($expenseData->keys())->unique()->sort();

                    // Prepare data for the chart
                    $incomeChartData = $labels->map(function ($date) use ($incomeData) {
                        return $incomeData->has($date) ? $incomeData[$date] : 0;
                    });

                    $expenseChartData = $labels->map(function ($date) use ($expenseData) {
                        return $expenseData->has($date) ? $expenseData[$date] : 0;
                    });

                    // Format data for the chart (same as income&expense.blade.php)
                    $data = [
                        [
                            'name' => 'Income',
                            'data' => $incomeChartData->values(),
                        ],
                        [
                            'name' => 'Expense',
                            'data' => $expenseChartData->values(),
                        ],
                    ];

                    // Pass data to the view
                    $chartData = [
                        'labels' => $labels->values(),
                        'data' => $data,
                    ];

                    $notices = Notice::select('title', 'notice_startdate', 'notice_enddate')
                    ->where('created_by', '=', \Auth::user()->creatorId())
                    ->orderBy('notice_startdate', 'desc')
                    ->take(5) // Limit to the latest 5 notices
                    ->get();


                    $todayEnquiryCount = TimeSheet::whereDate('created_at', Carbon::today())->count();

                    $todayBookingCount = BookingForm::whereDate('created_at', Carbon::today())->count();

                    



                return view('dashboard.company', compact('employeesNotWorkingToday', 'todayEnquiryCount', 'todayBookingCount','notices','totalHolidays', 'arrEvents', 'announcements', 'employees', 'activeJob', 'inActiveJOb', 'meetings', 'countEmployee', 'countUser', 'countTicket', 'countOpenTicket', 'countCloseTicket', 'notClockIns','onLeaveEmployees', 'accountBalance', 'totalPayee', 'totalPayer', 'users', 'plan', 'storage_limit', 'quote','attendancePercentage', 'presentEmployeesWithClockIn', 'totalEmployees', 'totalDepartment', 'totalleaves', 'projects', 'todos','chartData', 'totalProjects'));
            }
        } 
    }


   public function filterDashboardData(Request $request)
{
    $filterType = $request->filter_type;
    $customDate = $request->custom_date ?? null;
    
    // Determine the date to filter by
    if ($filterType === 'yesterday') {
        $date = Carbon::yesterday();
    } elseif ($filterType === 'custom' && $customDate) {
        $date = Carbon::parse($customDate);
    } else {
        $date = Carbon::today(); // Default to today
    }
    
    $dateString = $date->format('Y-m-d');
    
    // Get data for the selected date
    $todayEnquiryCount = TimeSheet::whereDate('created_at', $date)->count();
    $todayBookingCount = BookingForm::whereDate('created_at', $date)->count();
    
    // Get attendance data
    $presentEmployeesWithClockIn = AttendanceEmployee::where('date', '=', $dateString)
        ->whereNotNull('clock_in')
        ->where('clock_in', '!=', '00:00:00')
        ->with('employee')
        ->get()
        ->map(function ($attendance) {
            return [
                'employee' => $attendance->employee,
                'clock_in' => $attendance->clock_in,
                'clock_in_location' => $attendance->clock_in_location ?? 'Location not available',
                'clock_in_latitude' => $attendance->clock_in_latitude,
                'clock_in_longitude' => $attendance->clock_in_longitude,
                'clock_out' => $attendance->clock_out ?? '--:--',
                'clock_out_location' => $attendance->clock_out_location ?? 'Location not available',
                'clock_out_latitude' => $attendance->clock_out_latitude,
                'clock_out_longitude' => $attendance->clock_out_longitude,
            ];
        })->toArray();
    
    // Get not clocked in employees
    $notClockIn = AttendanceEmployee::where('date', '=', $dateString)
        ->where('created_by', \Auth::user()->creatorId())
        ->pluck('employee_id');
    
    $employeesOnLeaveToday = Leave::where('created_by', \Auth::user()->creatorId())
        ->where('start_date', '<=', $dateString)
        ->where('end_date', '>=', $dateString)
        ->where('status', 'approved')
        ->pluck('employee_id');
    
    $excludeIds = $notClockIn->merge($employeesOnLeaveToday)->unique();
    
    $notClockIns = Employee::where('created_by', '=', \Auth::user()->creatorId())
        ->whereNotIn('id', $excludeIds)
        ->get()
        ->map(function ($employee) {
            return [
                'name' => $employee->name,
                'id' => $employee->id
            ];
        })->toArray();
    
    // Get employees on leave
    $onLeaveEmployees = Leave::with('employees')
        ->where('created_by', \Auth::user()->creatorId())
        ->where('start_date', '<=', $dateString)
        ->where('end_date', '>=', $dateString)
        ->where('status', 'approved')
        ->get()
        ->map(function ($leave) {
            return [
                'employees' => [
                    'name' => $leave->employees->name ?? 'N/A'
                ],
                'leave_start_date' => $leave->leave_start_date,
                'leave_end_date' => $leave->leave_end_date
            ];
        })->toArray();
    
    return response()->json([
        'success' => true,
        'todayEnquiryCount' => $todayEnquiryCount,
        'todayBookingCount' => $todayBookingCount,
        'presentEmployeesWithClockIn' => $presentEmployeesWithClockIn,
        'notClockIns' => $notClockIns,
        'onLeaveEmployees' => $onLeaveEmployees,
        'selectedDate' => $dateString,
    ]);
}
    

    public function clockOut(Request $request)
    {
        $user = Auth::user();
        $employee = Employee::where('user_id', $user->id)->first();

        if ($employee) {
            $attendance = AttendanceEmployee::where('employee_id', $employee->id)
                ->where('date', date('Y-m-d'))
                ->first();

            if ($attendance && !$attendance->clock_out) {
                $attendance->clock_out = now()->format('H:i:s');
                $attendance->save();

                return redirect()->back()->with('success', 'You have successfully clocked out.');
            } else {
                return redirect()->back()->with('error', 'You have already clocked out today.');
            }
        }

        return redirect()->back()->with('error', 'Employee not found.');
    }

    public function getOrderChart($arrParam)
    {
        $arrDuration = [];
        if ($arrParam['duration']) {
            if ($arrParam['duration'] == 'week') {
                $previous_week = strtotime("-2 week +1 day");
                for ($i = 0; $i < 14; $i++) {
                    $arrDuration[date('Y-m-d', $previous_week)] = date('d-M', $previous_week);
                    $previous_week                              = strtotime(date('Y-m-d', $previous_week) . " +1 day");
                }
            }
        }

        $arrTask          = [];
        $arrTask['label'] = [];
        $arrTask['data']  = [];
        foreach ($arrDuration as $date => $label) {

            $data               = Order::select(\DB::raw('count(*) as total'))->whereDate('created_at', '=', $date)->first();
            $arrTask['label'][] = $label;
            $arrTask['data'][]  = $data->total;
        }

        return $arrTask;
    }

    private function extractMainLocation($fullLocation)
{
    if (empty($fullLocation)) {
        return '';
    }

    // Example 1: If location is comma-separated (like "Building A, Floor 3, Room 101")
    $parts = explode(',', $fullLocation);
    return trim($parts[0]); // Returns "Building A"

    // OR Example 2: If you have specific logic to determine main location
    // return your_custom_logic_to_extract_main_location($fullLocation);
    
    // OR Example 3: If location is JSON, decode it first
    // $locationData = json_decode($fullLocation, true);
    // return $locationData['main_location'] ?? $locationData['building'] ?? '';
}
}