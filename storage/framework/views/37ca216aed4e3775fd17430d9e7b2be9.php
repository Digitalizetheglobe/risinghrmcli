<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Dashboard')); ?>

<?php $__env->stopSection(); ?>
<?php
    $setting = App\Models\Utility::settings();
    
?>
<?php $__env->startSection('content'); ?>

<style>

.fc-prev-button, .fc-next-button {
    padding: 5px 8px !important; /* Smaller arrow buttons */
    font-size: 14px !important;
    background-color: #007bff !important; /* Bootstrap primary color */
    border-radius: 5px !important;
    border: none !important;
    color: white !important;
}

.fc-prev-button:hover, .fc-next-button:hover {
    background-color: #0056b3 !important;
}

#calendar {
    margin-bottom: 10px; /* Space between calendar and arrows */
}

.calendar-navigation {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-top: 10px;
}

</style>


<div >
    <div class="row">
        <?php if(session('status')): ?>
            <div class="alert alert-success" role="alert">
                <?php echo e(session('status')); ?>

            </div>
        <?php endif; ?>


        <?php if(\Auth::user()->type == 'employee'): ?>

                <div class="col-xxl-9">
                            <div class="row">
                                    <div class="col-xl-12">
                                        <div class="row">
                                            <div class="col-xl-6">
                                                <div class="card">  
                                                    <div class="card-header  d-flex align-items-center  ">
                                                        <img src="<?php echo e(asset('https://connect360.in//storage/uploads/avatar/' . ($emp->user->avatar ?? 'default-avatar.png'))); ?>" 
                                                            alt="Profile Image" 
                                                            class="rounded-circle me-4" 
                                                            width="60" 
                                                            height="60">
                                                        <div>
                                                            <h4 class="mb-0" style="color:black;"><?php echo e($emp->name); ?></h4>
                                                            <small style="font-size: 12px; color:black;"><?php echo e($emp->department->name ?? 'No Department'); ?> Team</small><small style="font-size:16px; color:black;"> &nbsp<?php echo e($emp->designation->name ?? 'No Designation'); ?>&nbsp</small>
                                                        </div>
                                                    </div>
                                                    <div class="card-body">
                                                        <p><strong>Phone Number:<br></strong> <?php echo e($emp->phone ?? 'N/A'); ?></p><br>
                                                        <p><strong>Email Address:<br></strong> <?php echo e($emp->email ?? 'N/A'); ?></p><br>
                                                        <p><strong>Joined On:<br></strong> <?php echo e(\Carbon\Carbon::parse($emp->company_doj)->format('d M Y')); ?></p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5 style="font-size:20px;color:black"><?php echo e(__('Attendance')); ?></h5>
                                                        <p id="currentDateTime"></p>
                                                    </div>
                                                    <div class="card-body text-center p-1">
                                                        <div class="progress-container">
                                                            <svg width="140" height="170" viewBox="0 0 100 100">
                                                                <!-- Background Circle -->
                                                                <circle cx="50" cy="50" r="45" stroke="#e0e0e0" stroke-width="8" fill="none"></circle>
                                                                <!-- Progress Circle -->
                                                                <circle id="progressCircle" cx="50" cy="50" r="45" 
                                                                    stroke="#4CAF50" stroke-width="7" fill="none"
                                                                    stroke-dasharray="283" stroke-dashoffset="283"
                                                                    stroke-linecap="round">
                                                                </circle>
                                                                <!-- Centered Text -->
                                                                <text id="progressTime" x="50" y="55" font-size="12" text-anchor="middle" fill="#333">0:00:00</text>
                                                            </svg>
                                                        </div>

                                                        <p id="attendanceStatus" class="font-bold">
                                                            <?php if(!isset($employeeAttendance) || !$employeeAttendance->clock_in): ?>
                                                                <span class="text-primary"><i class="fas fa-fingerprint"></i> Not Punched In</span>
                                                            <?php elseif($employeeAttendance->clock_out == '00:00:00' || !$employeeAttendance->clock_out): ?>
                                                                <span class="text-success"><i class="fas fa-fingerprint"></i> Punched In at <?php echo e(\Carbon\Carbon::parse($employeeAttendance->clock_in)->format('h:i A')); ?></span>
                                                            <?php else: ?>
                                                                <span class="text-danger"><i class="fas fa-sign-out-alt"></i> Punched Out at <?php echo e(\Carbon\Carbon::parse($employeeAttendance->clock_out)->format('h:i A')); ?></span>
                                                            <?php endif; ?>
                                                        </p>

                                                        <?php echo e(Form::open(['url' => 'attendanceemployee/attendance', 'method' => 'post'])); ?>

                                                        <?php if(empty($employeeAttendance) || $employeeAttendance->clock_out != '00:00:00'): ?>
                                                            <button type="submit" value="0" name="in" id="clock_in" class="btn btn-primary"><?php echo e(__('Punch In')); ?></button>
                                                        <?php else: ?>
                                                            <button type="submit" value="1" name="out" id="clock_out" class="btn btn-danger"><?php echo e(__('Punch Out')); ?></button>
                                                        <?php endif; ?>
                                                        <?php echo e(Form::close()); ?>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>



                                    <div class="col-xl-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="card">
                                                    <div class="card-header card-body table-border-style d-flex justify-content-between align-items-center">
                                                        <h5 style="font-size:20px; color:black; margin: 0;"><?php echo e(__('Notices')); ?></h5>
                                                    </div>
                                                    <div class="card-body" style="height: 325px; overflow: auto; padding: 10px; padding-top:25px;">
                                                        <div class="table-responsive" style="max-width:452px;">
                                                            <table class="table table-bordered text-center">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 60%;">Title</th>
                                                                        <th style="width: 40%;">Date</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <?php $__currentLoopData = $notices; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $notice): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                    <tr>
                                                                        <td style="word-wrap: break-word; white-space: normal;">
                                                                            <?php echo e(Str::limit($notice->title, 50, '...')); ?>

                                                                        </td>
                                                                        <td>
                                                                            <?php echo e(\Carbon\Carbon::parse($notice->notice_startdate)->format('d M Y')); ?> - 
                                                                            <?php echo e(\Carbon\Carbon::parse($notice->notice_enddate)->format('d M Y')); ?>

                                                                        </td>
                                                                    </tr>
                                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="card">
                                                    <div class="card-header card-body table-border-style" style="">
                                                        <h5 style="font-size:20px;color:black"><?php echo e(__('TO-DO Lists')); ?></h5>
                                                    </div>
                                                    <div class="card-body" style="height: 324px; overflow:auto;">
                                                        <div class="table-responsive"> 
                                                            <table class="table">
                                                                <thead>
                                                                    <tr >
                                                                    <th><?php echo e(__('Task Title')); ?></th>
                                                                    <th><?php echo e(__('Priority')); ?></th>
                                                                    <th><?php echo e(__('Due Date')); ?></th>
                                                                    <th><?php echo e(__('Status')); ?></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="list">
                                                                    <?php $__currentLoopData = $todos; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $todo): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                        <tr>
                                                                            <td><?php echo e($todo->task); ?></td>
                                                                            <td>
                                                                                <?php if($todo->priority == 1): ?>
                                                                                    <span class="badge bg-danger"><?php echo e(__('High')); ?></span>
                                                                                <?php elseif($todo->priority == 2): ?>
                                                                                    <span class="badge bg-warning"><?php echo e(__('Medium')); ?></span>
                                                                                <?php else: ?>
                                                                                    <span class="badge bg-success"><?php echo e(__('Low')); ?></span>
                                                                                <?php endif; ?>
                                                                            </td>
                                                                            <td><?php echo e(\Carbon\Carbon::parse($todo->expires_at)->format('d M Y')); ?></td>
                                                                            <td>
                                                                                <?php if($todo->is_completed): ?>
                                                                                    <span class="badge bg-success"><?php echo e(__('Completed')); ?></span>
                                                                                <?php else: ?>
                                                                                    <span class="badge bg-danger"><?php echo e(__('Pending')); ?></span>
                                                                                <?php endif; ?>
                                                                            </td>
                                                                        </tr>
                                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-12">
                                        <div class="card">
                                            <div class="card-header card-body table-border-style" style="">
                                                <h5 style="font-size:20px;color:black"><?php echo e(__('Project Details')); ?></h5>
                                            </div>

                                            <div class="card-body" style="height: 300px; overflow:auto">
                                                        <div class="table-responsive">
                                                            <table class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th><?php echo e(__('Project Name')); ?></th>
                                                                        <th><?php echo e(__('Project Type')); ?></th>
                                                                        <th><?php echo e(__('Status')); ?></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="list">
                                                                    <?php $__currentLoopData = $projects; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $project): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                        <tr>
                                                                            <td><?php echo e($project->project_name); ?></td>
                                                                            <td><?php echo e(ucfirst($project->project_type)); ?></td>
                                                                            <td>
                                                                                <?php if($project->status == 'on_boarding'): ?>
                                                                                    <span class="badge bg-warning"><?php echo e(__('On-Boarding')); ?></span>
                                                                                <?php elseif($project->status == 'on_hold'): ?>
                                                                                    <span class="badge bg-secondary"><?php echo e(__('On Hold')); ?></span>
                                                                                <?php elseif($project->status == 'assigned'): ?>
                                                                                    <span class="badge bg-info"><?php echo e(__('Assigned')); ?></span>
                                                                                <?php elseif($project->status == 'in_progress'): ?>
                                                                                    <span class="badge bg-primary"><?php echo e(__('In Progress')); ?></span>
                                                                                <?php elseif($project->status == 'completed'): ?>
                                                                                    <span class="badge bg-success"><?php echo e(__('Completed')); ?></span>
                                                                                <?php endif; ?>
                                                                            </td>
                                                                        </tr>
                                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-12">
                                        <div class="card">
                                            <div class="card-header card-body table-border-style" style="">
                                                <h5 style="font-size:20px;color:black"><?php echo e(__('TO-DO Lists')); ?></h5>
                                            </div>
                                            <div class="card-body" style="height: 324px; overflow:auto;">
                                                <div class="table-responsive"> 
                                                    <table class="table">
                                                        <thead>
                                                            <tr >
                                                            <th><?php echo e(__('Task Title')); ?></th>
                                                            <th><?php echo e(__('Priority')); ?></th>
                                                            <th><?php echo e(__('Due Date')); ?></th>
                                                            <th><?php echo e(__('Status')); ?></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody class="list">
                                                            <?php $__currentLoopData = $todos; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $todo): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                <tr>
                                                                    <td><?php echo e($todo->task); ?></td>
                                                                    <td>
                                                                        <?php if($todo->priority == 1): ?>
                                                                            <span class="badge bg-danger"><?php echo e(__('High')); ?></span>
                                                                        <?php elseif($todo->priority == 2): ?>
                                                                            <span class="badge bg-warning"><?php echo e(__('Medium')); ?></span>
                                                                        <?php else: ?>
                                                                            <span class="badge bg-success"><?php echo e(__('Low')); ?></span>
                                                                        <?php endif; ?>
                                                                    </td>
                                                                    <td><?php echo e(\Carbon\Carbon::parse($todo->expires_at)->format('d M Y')); ?></td>
                                                                    <td>
                                                                        <?php if($todo->is_completed): ?>
                                                                            <span class="badge bg-success"><?php echo e(__('Completed')); ?></span>
                                                                        <?php else: ?>
                                                                            <span class="badge bg-danger"><?php echo e(__('Pending')); ?></span>
                                                                        <?php endif; ?>
                                                                    </td>
                                                                </tr>
                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-12">
                                        <div class="card">
                                            <div class="card-header card-body table-border-style">
                                                <h5 style="font-size:20px;color:black"><?php echo e(__('Meeting List')); ?></h5>
                                            </div>
                                            <div class="card-body" style="height: 324px; overflow:auto;">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th><?php echo e(__('Meeting Title')); ?></th>
                                                                <th><?php echo e(__('Date')); ?></th>
                                                                <th><?php echo e(__('Time')); ?></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <?php $__currentLoopData = $meetings; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $meeting): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                <tr>
                                                                    <td><?php echo e($meeting->title); ?></td>
                                                                    <td><?php echo e(\Auth::user()->dateFormat($meeting->date)); ?></td>
                                                                    <td><?php echo e(\Auth::user()->timeFormat($meeting->time)); ?></td>
                                                                </tr>
                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                                            <?php if($meetings->isEmpty()): ?>
                                                                <tr>
                                                                    <td colspan="3" class="text-center"><?php echo e(__('No meetings found')); ?></td>
                                                                </tr>
                                                            <?php endif; ?>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                            </div>
                </div>

              <!-- Right Side Calendar -->

                <div class="col-xxl-3">
                    <div class="d-flex flex-column gap-2 sticky-top" style="top: 10px; height: 100vh; ">
                        <div class="card flex-grow-1">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <h5><?php echo e(__('Calendar')); ?></h5>
                                        <input type="hidden" id="path_admin" value="<?php echo e(url('/')); ?>">
                                    </div>
                                    <div class="col-lg-6">
                                        <?php if(isset($setting['is_enabled']) && $setting['is_enabled'] == 'on'): ?>
                                            <select class="form-control" name="calender_type" id="calender_type"
                                                style="float: right; width: 1px;" onchange="get_data()">
                                                <option value="local_calender" selected="true"><?php echo e(__('Local Calendar')); ?></option>
                                            </select>
                                        <?php endif; ?>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body " style="padding-top:0px;">
                                <div id='calendar'  class='calendar'></div>
                            </div>
                        </div>

                        <div class="card flex-grow-1">
                            <div class="card-header">
                                <h5 style="font-size:20px;color:black"><?php echo e(__("This Month Event's")); ?></h5>
                            </div>
                            <div class="card-body">
                                <div class="card shadow-none mt-3">
                                    <div class="card-body p-2">
                                           
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>







           
           
            
           
        <?php endif; ?>
    </div>
</div>
<?php $__env->stopSection(); ?>



<?php $__env->startPush('script-page'); ?>
    <script src="<?php echo e(asset('assets/js/plugins/main.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/plugins/apexcharts.min.js')); ?>"></script>

    <?php if(Auth::user()->type == 'employee' ): ?>
    <script type="text/javascript">
    $(document).ready(function() {
        get_data();
    });

    function get_data() {
        var calender_type = $('#calender_type :selected').val();

        $('#calendar').removeClass('local_calender google_calender');
        if (!calender_type) {
            calender_type = 'local_calender';
        }
        $('#calendar').addClass(calender_type);

        $.ajax({
            data: {
                "_token": "<?php echo e(csrf_token()); ?>",
                'calender_type': calender_type
            },
            success: function(data) {
                var calendar = new FullCalendar.Calendar(document.getElementById('calendar'), {
                    headerToolbar: {
                        left: 'prev', // Only navigation arrows
                        center: 'title',
                        right: 'next'
                    },
                    themeSystem: 'bootstrap',
                    slotDuration: '00:10:00',
                    allDaySlot: true,
                    navLinks: false,
                    droppable: true,
                    selectable: true,
                    selectMirror: true,
                    editable: true,
                    dayMaxEvents: true,
                    handleWindowResize: true,
                    height: '360px',
                });
                calendar.render();
            }
        });
    }
    </script>

    <?php else: ?>
        <script>
            $(document).ready(function() {
                get_data();
            });

            function get_data() {
                var calender_type = $('#calender_type :selected').val();

                $('#event_calendar').removeClass('local_calender');
                $('#event_calendar').removeClass('google_calender');
                if (calender_type == undefined) {
                    calender_type = 'local_calender';
                }
                $('#event_calendar').addClass(calender_type);

                $.ajax({
                    url: $("#path_admin").val() + "/event/get_event_data",
                    method: "POST",
                    data: {
                        "_token": "<?php echo e(csrf_token()); ?>",
                        'calender_type': calender_type
                    },
                    success: function(data) {
                        var etitle;
                        var etype;
                        var etypeclass;
                        var calendar = new FullCalendar.Calendar(document.getElementById('event_calendar'), {
                            headerToolbar: {
                                left: 'prev,next today',
                                center: 'title',
                                right: 'dayGridMonth,timeGridWeek,timeGridDay'
                            },
                            buttonText: {
                                timeGridDay: "<?php echo e(__('Day')); ?>",
                                timeGridWeek: "<?php echo e(__('Week')); ?>",
                                // dayGridMonth: "<?php echo e(__('Month')); ?>"
                            },
                            // slotLabelFormat: {
                            //     hour: '2-digit',
                            //     minute: '2-digit',
                            //     hour12: false,
                            // },
                            themeSystem: 'tailwind',
                            slotDuration: '00:10:00',
                            allDaySlot: true,
                            navLinks: true,
                            droppable: true,
                            selectable: true,
                            selectMirror: true,
                            editable: true,
                            dayMaxEvents: true,
                            handleWindowResize: true,
                            events: data,
                            height: '400px',
                            // timeFormat: 'H(:mm)',

                        });

                        calendar.render();
                    }
                });
            };
        </script>
    <?php endif; ?>

   
<?php $__env->stopPush(); ?>

<script>
document.addEventListener("DOMContentLoaded", function () {
    let progressCircle = document.getElementById("progressCircle");
    let progressTime = document.getElementById("progressTime");
    let clockInButton = document.getElementById("clock_in");
    let clockOutButton = document.getElementById("clock_out");
    let currentTimeElement = document.getElementById("currentDateTime");

    let clockInTime = localStorage.getItem("clockInTime") ? new Date(localStorage.getItem("clockInTime")) : null;
    let clockOutTime = localStorage.getItem("clockOutTime") ? new Date(localStorage.getItem("clockOutTime")) : null;
    let isPunchedOut = localStorage.getItem("isPunchedOut") === "true";

    // Get Laravel server-side clock-in time if available
    <?php if(isset($employeeAttendance) && $employeeAttendance->clock_in): ?>
        if (!clockInTime) {
            clockInTime = new Date("<?php echo e(\Carbon\Carbon::parse($employeeAttendance->clock_in)->toIso8601String()); ?>");
            localStorage.setItem("clockInTime", clockInTime.toISOString());
        }
    <?php endif; ?>

    <?php if(isset($employeeAttendance) && $employeeAttendance->clock_out && $employeeAttendance->clock_out !== '00:00:00'): ?>
        if (!clockOutTime) {
            clockOutTime = new Date("<?php echo e(\Carbon\Carbon::parse($employeeAttendance->clock_out)->toIso8601String()); ?>");
            localStorage.setItem("clockOutTime", clockOutTime.toISOString());
            localStorage.setItem("isPunchedOut", "true");
            isPunchedOut = true;
        }
    <?php endif; ?>

    function updateTimeDisplay() {
        let now = new Date();
        currentTimeElement.textContent = now.toLocaleString("en-US", {
            hour: "2-digit", minute: "2-digit", second: "2-digit", hour12: true, day: "2-digit", month: "short", year: "numeric"
        });
    }

    function updateProgress() {
    if (!clockInTime) return;

    let elapsedSeconds;
    
    // If punched out, show last recorded time
    if (clockOutTime) {
        elapsedSeconds = Math.floor((clockOutTime - clockInTime) / 1000);
    } else {
        let now = new Date();
        elapsedSeconds = Math.floor((now - clockInTime) / 1000);
    }

    elapsedSeconds = Math.min(elapsedSeconds, 10 * 60 * 60); // Max 8 hours (workday progress)
    let percentage = (elapsedSeconds / (10 * 60 * 60)) * 100;
    progressCircle.style.strokeDashoffset = 288 - (percentage * 288) / 100;

    let hours = Math.floor(elapsedSeconds / 3600);
    let minutes = Math.floor((elapsedSeconds % 3600) / 60);
    let seconds = elapsedSeconds % 60;
    progressTime.textContent = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;

    // If punched out, do not update further
    if (isPunchedOut) return;
}

// Run updateProgress every second unless punched out
if (!isPunchedOut) {
    setInterval(updateProgress, 1000);
} else {
    updateProgress(); // Ensure it updates once on load
}


    function updateUI() {
        if (clockOutButton && isPunchedOut) {
            clockOutButton.disabled = true;
            clockOutButton.classList.add("opacity-50", "cursor-not-allowed");
        }
    }

    updateTimeDisplay();
    updateUI();
    updateProgress();

    if (!isPunchedOut) {
        setInterval(updateProgress, 1000);
    }

    if (clockInButton) {
        clockInButton.addEventListener("click", function (e) {
            let now = new Date();
            localStorage.setItem("clockInTime", now.toISOString());
            localStorage.removeItem("isPunchedOut");
            localStorage.removeItem("clockOutTime");
            clockInTime = now;
            clockOutTime = null;
            isPunchedOut = false;
            updateUI();
        });
    }

    if (clockOutButton) {
        clockOutButton.addEventListener("click", function (e) {
            e.preventDefault();
            let now = new Date();
            localStorage.setItem("clockOutTime", now.toISOString());
            localStorage.setItem("isPunchedOut", "true");
            clockOutTime = now;
            isPunchedOut = true;
            updateUI();
            this.closest("form").submit();
        });
    }
});

</script>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/u704145757/domains/connect360.in/public_html/resources/views/dashboard/dashboard.blade.php ENDPATH**/ ?>