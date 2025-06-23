



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

    .loading {
    position: relative;
    pointer-events: none;
    opacity: 0.7;
}

.loading:after {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(255, 255, 255, 0.7) url('<?php echo e(asset("assets/img/loading.gif")); ?>') no-repeat center;
    background-size: 50px 50px;
    z-index: 1000;
}

</style>
<div>
    <div class="row">
        <?php if(session('status')): ?>
            <div class="alert alert-success" role="alert">
                <?php echo e(session('status')); ?>

            </div>
        <?php endif; ?>

        <?php if(\Auth::user()->type == 'company' || \Auth::user()->type == 'hr'): ?>

        <div class="d-flex justify-content-between align-items-center w-100" style="margin-bottom: 30px;">
            <div>
                <h3 class="mb-0"><?php echo e(__('Dashboard')); ?></h3>
            </div>

            <div class="d-flex align-items-center">
                <div class="btn-group me-2 z-1">
                    <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" id="dateFilterButton">
                        Today
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#" data-value="today">Today</a></li>
                        <li><a class="dropdown-item" href="#" data-value="yesterday">Yesterday</a></li>
                        <li><a class="dropdown-item" href="#" data-value="custom">Select Date</a></li>
                    </ul>
                </div>
                <input type="date" class="form-control" id="customDatePicker" style="display: none; width: 150px;">
            </div>
        </div>
            <!-- Employee specific content -->
        


            <div class="col-xxl-9">
                <div class="row">
                    <!-- Left Side Cards -->
                    <div class="col-xl-12">

            
                       <div class="row">
                            <div class="col-xxl-12">
                                <div class="col-xl-12">
                                    <div class="row">
                                        <!-- first Card - Employees -->
                                        <div class="col-lg-4 col-md-6">
                                            <div class="card" style="border-radius: 10px; background-color: #fff; cursor: pointer;" onclick="window.location.href='employee'">
                                                <div class="card-body" style="padding: 20px;">
                                                    <div class="align-items-center">
                                                        <div class="col-auto">
                                                            <div style="background-color: #B55CC4; width: 50px; height: 50px; border-radius: 50%; display: flex; justify-content: center; align-items: center;">
                                                                <i class="fa-solid fa-user-tie" style="font-size: 25px; color: #fff;"></i>
                                                            </div>
                                                        </div><br>
                                                        <div class="col-auto" style="display: flex; align-items: center; gap: 5px;">
                                                            <h6 style="font-size: 14px; color: #515356; margin: 0;">Total,</h6>
                                                            <h4 class="m-0 text-primary" style="font-size: 15px; color:#555657 !important; font-weight: 800; margin: 0;">Employees</h4>
                                                        </div>
                                                        <div class="col-auto">
                                                            <h6 style="font-size: 14px; color: #0569a6;"> </h6>
                                                            <h4 class="m-0 text-primary" style="font-size: 30px; color : #000 !important; "> <?php echo e($countUser + $countEmployee); ?>  </h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- second Card - Enquiries -->
                                        <div class="col-lg-4 col-md-6">
                                            <div class="card" style="border-radius: 10px; background-color: #fff; cursor: pointer;" onclick="window.location.href='timesheet'">
                                                <div class="card-body" style="padding: 20px;">
                                                    <div class="align-items-center">
                                                        <div class="col-auto">
                                                            <div style="background-color: #299dc6; width: 50px; height: 50px; border-radius: 50%; display: flex; justify-content: center; align-items: center;">
                                                                <i class="fa-solid fa-clipboard-question" style="font-size: 25px; color: #fff;"></i>
                                                            </div>
                                                        </div><br>
                                                        <div class="col-auto" style="display: flex; align-items: center; gap: 5px;">
                                                            <h6 style="font-size: 14px; color: #515356; margin: 0;">Today,</h6>
                                                            <h4 class="m-0 text-primary" style="font-size: 15px; color: #555657 !important; font-weight: 800; margin: 0;">Enquiry Form</h4>
                                                        </div>
                                                        <div class="col-auto">
                                                            <h6 style="font-size: 14px; color: #0569a6;"></h6>
                                                            <h4 class="m-0 text-primary" style="font-size: 30px; color : #000 !important;" id="todayEnquiryCount"><?php echo e($todayEnquiryCount); ?></h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Third Card - Bookings -->
                                        <div class="col-lg-4 col-md-6">
                                            <div class="card" style="border-radius: 10px; background-color: #fff; cursor: pointer;" onclick="window.location.href='booking'">
                                                <div class="card-body" style="padding: 20px;">
                                                    <div class="align-items-center">
                                                        <div class="col-auto">
                                                            <div style="background-color: #3B7080; width: 50px; height: 50px; border-radius: 50%; display: flex; justify-content: center; align-items: center;">
                                                                <i class="fa-solid fa-calendar-check" style="font-size: 25px; color: #fff;"></i>
                                                            </div>
                                                        </div><br>
                                                        <div class="col-auto" style="display: flex; align-items: center; gap: 5px;">
                                                            <h6 style="font-size: 14px; color: #515356; margin: 0;">Today,</h6>
                                                            <h4 class="m-0 text-primary" style="font-size: 15px; color: #555657 !important; font-weight: 800; margin: 0;">Booking Forms</h4>
                                                        </div>
                                                        <div class="col-auto">
                                                            <h6 style="font-size: 14px; color: #6c757d;"></h6>
                                                            <h4 class="m-0 text-primary" style="font-size: 30px; color:#000 !important;" id="todayBookingCount"><?php echo e($todayBookingCount); ?></h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <!-- Fourth Card - Department -->
                                        <div class="col-lg-4 col-md-6">
                                            <div class="card" style="border-radius: 10px; background-color: #fff; cursor: pointer;" >
                                                <div class="card-body" style="padding: 20px;">
                                                    <div class="align-items-center">
                                                        <div class="col-auto">
                                                            <div style="background-color: #299dc6; width: 50px; height: 50px; border-radius: 50%; display: flex; justify-content: center; align-items: center;">
                                                                <i class="fa-solid fa-sitemap"  style="font-size: 25px; color: #fff;"></i>
                                                            </div>
                                                        </div><br>
                                                        <div class="col-auto" style="display: flex; align-items: center; gap: 5px;">
                                                            <h6 style="font-size: 14px; color: #515356; margin: 0;">Total,</h6>
                                                            <h4 class="m-0 text-primary" style="font-size: 15px; color: #555657 !important; font-weight: 800; margin: 0;">Department</h4>
                                                        </div>
                                                        <div class="col-auto">
                                                            <h6 style="font-size: 14px; color: #0569a6;"> </h6>
                                                            <h4 class="m-0 text-primary" style="font-size: 30px; color : #000 !important; "> <?php echo e($totalDepartment); ?>  </h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    
                                        <!-- fifth Card - Projects -->
                                        <div class="col-lg-4 col-md-6">
                                            <div class="card" style="border-radius: 10px; background-color: #fff; cursor: pointer;" onclick="window.location.href='projects'">
                                                <div class="card-body" style="padding: 20px;">
                                                    <div class="align-items-center">
                                                        <div class="col-auto">
                                                            <div style="background-color: #F26522; width: 50px; height: 50px; border-radius: 50%; display: flex; justify-content: center; align-items: center;">
                                                                <i class="fa-solid fa-diagram-project" style="font-size: 25px; color: #fff;"></i>
                                                            </div>
                                                        </div><br>
                                                        <div class="col-auto" style="display: flex; align-items: center; gap: 5px;">
                                                            <h6 style="font-size: 14px; color: #515356; margin: 0;">Total,</h6>
                                                            <h4 class="m-0 text-primary" style="font-size: 15px; color: #555657 !important; font-weight: 800; margin: 0;">Projects</h4>
                                                        </div>
                                                        <div class="col-auto">
                                                            <h6 style="font-size: 14px; color: #6c757d;"> </h6>
                                                            <h4 class="m-0 text-primary" style="font-size: 30px; color:#000 !important; "> <?php echo e($totalProjects); ?>  </h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- Six Card - Ticket -->
                                        <div class="col-lg-4 col-md-6">
                                            <div class="card" style="border-radius: 10px; background-color: #fff; cursor: pointer;" onclick="window.location.href='ticket'">
                                                <div class="card-body" style="padding: 20px;">
                                                    <div class="align-items-center">
                                                        <div class="col-auto">
                                                            <div style="background-color: #FD3995; width: 50px; height: 50px; border-radius: 50%; display: flex; justify-content: center; align-items: center;">
                                                                <i class="fa-solid fa-ticket" style="font-size: 25px; color: #fff;"></i>
                                                            </div>
                                                        </div><br>
                                                        <div class="col-auto" style="display: flex; align-items: center; gap: 5px;">
                                                            <h6 style="font-size: 14px; color: #515356; margin: 0;">Total,</h6>
                                                            <h4 class="m-0 text-primary" style="font-size: 15px; color: #555657 !important; font-weight: 800; margin: 0;">Ticket</h4>
                                                        </div>
                                                        <div class="col-auto">
                                                            <h6 style="font-size: 14px; color: #6c757d;"> </h6>
                                                            <h4 class="m-0 text-primary" style="font-size: 30px; color:#000 !important; "> <?php echo e($countTicket); ?>  </h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    

                        <!-- Additional Data Below Cards -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header card-body table-border-style d-flex flex-wrap justify-content-between align-items-center">
                                        <h5 class="mb-2 mb-md-0" style="font-size: 20px; color: black;">
                                            <?php echo e(__("Today's Attendance")); ?>

                                        </h5>
                                        
                                    </div>

                                    <div class="card-body" style="height: 300px; overflow: auto; padding: px; padding-top: 25px;">
                                        <div class="table-responsive">
                                            <table class="table table-bordered text-center" id="attendanceTable">
                                                <thead>
                                                    <tr>
                                                        <th><?php echo e(__('Employee Name')); ?></th>
                                                        <th><?php echo e(__('Clock-In Time')); ?></th>
                                                        <th><?php echo e(__('Clock-In Location')); ?></th>
                                                        <th><?php echo e(__('Clock-Out Time')); ?></th>
                                                        <th><?php echo e(__('Clock-Out Location')); ?></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php $__empty_1 = true; $__currentLoopData = $presentEmployeesWithClockIn; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                                        <tr>
                                                            <td><?php echo e($data['employee']->name ?? 'N/A'); ?></td>
                                                            <td><?php echo e($data['clock_in'] ?? '--:--'); ?></td>
                                                            <td>
                                                                <?php if($data['clock_in_location'] && $data['clock_in_location'] != 'Location not available'): ?>
                                                                    <a href="https://www.google.com/maps?q=<?php echo e($data['clock_in_latitude']); ?>,<?php echo e($data['clock_in_longitude']); ?>" 
                                                                    target="_blank" title="View on map">
                                                                        <?php echo e($data['clock_in_location']); ?>

                                                                    </a>
                                                                <?php else: ?>
                                                                    <?php echo e($data['clock_in_location'] ?? '--'); ?>

                                                                <?php endif; ?>
                                                            </td>
                                                            <td><?php echo e($data['clock_out'] ?? '--:--'); ?></td>
                                                            <td>
                                                                <?php if($data['clock_out_location'] && $data['clock_out_location'] != 'Location not available'): ?>
                                                                    <a href="https://www.google.com/maps?q=<?php echo e($data['clock_out_latitude']); ?>,<?php echo e($data['clock_out_longitude']); ?>" 
                                                                    target="_blank" title="View on map">
                                                                        <?php echo e($data['clock_out_location']); ?>

                                                                    </a>
                                                                <?php else: ?>
                                                                    <?php echo e($data['clock_out_location'] ?? '--'); ?>

                                                                <?php endif; ?>
                                                            </td>
                                                        </tr>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                                        <tr>
                                                            <td colspan="5"><?php echo e(__('No attendance records found for today.')); ?></td>
                                                        </tr>
                                                    <?php endif; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <!-- Not Clock In Employees Card -->
                            <div class="col-12 col-md-6 mb-4">
                                <div class="card">
                                    <div class="card-header card-body table-border-style d-flex flex-wrap justify-content-between align-items-center">
                                        <h5 class="mb-2 mb-md-0" style="font-size:20px; color:black; margin: 0;">
                                            <?php echo e(__('Not Clock In employees')); ?>

                                        </h5>
                                       
                                    </div>
                                    <div class="card-body" style="height: 300px; overflow: auto; padding: ; padding-top:25px;">
                                        <div class="table-responsive">
                                            <table class="table table-bordered text-center" id="notClockInTable">
                                                <thead>
                                                    <tr>
                                                        <th><?php echo e(__('Employee Name')); ?></th>
                                                        <th><?php echo e(__('Status')); ?></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php $__currentLoopData = $notClockIns; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $employee): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <tr>
                                                            <td><?php echo e($employee->name ?? 'N/A'); ?></td>
                                                            <td style="color: red;">Absent</td>
                                                        </tr>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    <?php if($notClockIns->isEmpty()): ?>
                                                        <tr>
                                                            <td colspan="2">All employees are present</td>
                                                        </tr>
                                                    <?php endif; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Leaves Employees Card -->
                            <div class="col-12 col-md-6 mb-4">
                                <div class="card">
                                    <div class="card-header card-body table-border-style d-flex flex-wrap justify-content-between align-items-center">
                                        <h5 class="mb-2 mb-md-0" style="font-size:20px; color:black; margin: 0;">
                                            <?php echo e(__('Employees On Leave / WeekOff')); ?>

                                        </h5>
                                    </div>
                                    <div class="card-body" style="height: 300px; overflow: auto; padding-top:25px;">
                                        <div class="table-responsive">
                                            <table class="table table-bordered text-center" id="onLeaveTable">
                                                <thead>
                                                    <tr>
                                                        <th><?php echo e(__('Employee Name')); ?></th>
                                                        <th><?php echo e(__('Status')); ?></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php $__empty_1 = true; $__currentLoopData = $employeesNotWorkingToday; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $employee): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                                        <tr>
                                                            <td><?php echo e($employee['employee_name']); ?></td>
                                                            <td><?php echo e($employee['status']); ?></td>
                                                        </tr>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                                        <tr>
                                                            <td colspan="2">All employees are working today</td>
                                                        </tr>
                                                    <?php endif; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-xl-12">
                            <div class="card">
                                    <div class="card-header card-body table-border-style d-flex flex-wrap justify-content-between align-items-center">
                                        <h5 class="mb-2 mb-md-0" style="font-size:20px; color:black; margin: 0;">
                                            <?php echo e(__('Notices')); ?>

                                        </h5>
                                        
                                    </div>
                                    <div class="card-body" style="height: 300px; overflow: auto; padding: ; padding-top:25px;">
                                        <div class="table-responsive">
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


                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-header card-body table-border-style">
                                    <h5 style="font-size:20px;color:black"><?php echo e(__('Project Details')); ?></h5>
                                </div>
                                <div class="card-body" style="height: 300px; overflow:auto">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th><?php echo e(__('Project Name')); ?></th>
                                                    <th><?php echo e(__('Start Date')); ?></th>
                                                    <th><?php echo e(__('End Date')); ?></th>
                                                    <?php if(Auth::user()->type != 'employee'): ?>
                                                        <th><?php echo e(__('Assigned Employees')); ?></th>
                                                    <?php endif; ?>
                                                </tr>
                                            </thead>
                                            <tbody class="list">
                                                <?php $__empty_1 = true; $__currentLoopData = $projects; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $project): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                                    <tr>
                                                        <td><?php echo e($project->project_name); ?></td>
                                                        <td><?php echo e(\Carbon\Carbon::parse($project->project_startdate)->format('d M Y')); ?></td>
                                                        <td><?php echo e(\Carbon\Carbon::parse($project->project_enddate)->format('d M Y')); ?></td>
                                                        <?php if(Auth::user()->type != 'employee'): ?>
                                                            <td>
                                                                <?php if(is_array($project->assigned_data)): ?>
                                                                    <?php $empCount = 0; ?>
                                                                    <?php $__currentLoopData = $project->assigned_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $assignment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                        <?php $__currentLoopData = $assignment['employee_ids'] ?? []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $employeeId): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                            <?php if(isset($employees[$employeeId])): ?>
                                                                                <span class="badge bg-success me-1 mb-1">
                                                                                    <?php echo e($employees[$employeeId]->user->name ?? __('Unknown')); ?>

                                                                                </span>
                                                                                <?php $empCount++; ?>
                                                                                <?php if($empCount % 5 == 0): ?>
                                                                                    <br>
                                                                                <?php endif; ?>
                                                                            <?php endif; ?>
                                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                <?php endif; ?>
                                                            </td>
                                                        <?php endif; ?>
                                    
                                                    </tr>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                                    <tr>
                                                        <td colspan="4" class="text-center"><?php echo e(__('No projects assigned')); ?></td>
                                                    </tr>
                                                <?php endif; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                                <div class="col-xl-12">
                                    <div class="card">
                                        <div class="card-header card-body table-border-style" style="">
                                            <h5 style="font-size:20px;color:black"><?php echo e(__('Meeting List')); ?></h5>
                                        </div>
                                        <div class="card-body" style="height: 324px; overflow:auto;">
                                            <div class="table-responsive"> 
                                                <table class="table">
                                                    <thead>
                                                        <tr >
                                                        <th><?php echo e(__('Meeting title')); ?></th>
                                                        <th><?php echo e(__('Meeting Date')); ?></th>
                                                        <th><?php echo e(__('Meeting Time')); ?></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="list">
                                                        <?php $__currentLoopData = $meetings; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $meeting): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                            <tr>
                                                            <td><?php echo e($meeting->title); ?></td>
                                                            <td><?php echo e(\Auth::user()->dateFormat($meeting->date)); ?></td>
                                                            <td><?php echo e(\Auth::user()->timeFormat($meeting->time)); ?></td>
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
            </div>

              <!-- Right Side Calendar -->

                <div class="col-xxl-3" style="z-index: 0;">
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
                                            <div class="table-responsive" style="max-width:px;">
                                                <table class="table ">          
                                                    <tbody>
                                                            <?php $__currentLoopData = $arrEvents; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $event): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                <tr>
                                                                    <td><?php echo e($event['title']); ?></td>
                                                                    <td><?php echo e($event['start']); ?></td>
                                                                    <!-- <td><?php echo e($event['employee']); ?></td> -->
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
                </div>


        <?php endif; ?>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script-page'); ?>
    <script src="<?php echo e(asset('assets/js/plugins/main.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/plugins/apexcharts.min.js')); ?>"></script>

    <?php if(Auth::user()->type == 'company' || Auth::user()->type == 'hr'): ?>
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

    <?php if(\Auth::user()->type == 'company'): ?>
        <script>
            (function() {
                var totalEmployees = <?php echo e($totalEmployees); ?>;
                var presentEmployees = <?php echo e(count($presentEmployeesWithClockIn)); ?>;
                var attendancePercentage = <?php echo e(round($attendancePercentage, 2)); ?>;
                
                var options = {
                    series: [attendancePercentage],
                    chart: {
                        height: 380,
                        type: 'radialBar',
                        offsetY: -20,
                        sparkline: {
                            enabled: true
                        }
                    },
                    plotOptions: {
                        radialBar: {
                            startAngle: -90,
                            endAngle: 90,
                            track: {
                                background: "#eef5ff",
                                strokeWidth: '98%',
                                margin: 5,
                            
                            },
                            dataLabels: {
                                name: {
                                    show: true
                                },
                                value: {
                                    offsetY: -50,
                                    fontSize: '20px'
                                }
                            }
                        }
                    },
                    grid: {
                        padding: {
                            top: -10
                        }
                    },
                    colors: ["#68A288"],
                    labels: [''],
                    tooltip: {
                        enabled: true,
                        y: {
                            formatter: function(val) {
                                return `Out of ${totalEmployees} employees, ${presentEmployees} are present.`;
                            }
                        }
                    }
                };

                var chart = new ApexCharts(document.querySelector("#attendance-chart"), options);
                chart.render();
            })();
        </script>

        <style>
            .apexcharts-tooltip {
                background: #000 !important;
                color: #fff !important;
                border-radius: 8px;
                font-size: 14px;
            }
        </style>
    <?php endif; ?>
<?php $__env->stopPush(); ?>

<?php $__env->startPush('script-page'); ?>
<script src="<?php echo e(asset('assets/js/plugins/apexcharts.min.js')); ?>"></script>
<script>
    (function() {
        var options = {
            chart: {
                height: 265,
                type: 'bar',
                toolbar: {
                    show: false,
                },
            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '50%',
                    endingShape: 'rounded'
                },
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                width: 4,
                curve: 'smooth'
            },
            series: <?php echo json_encode($chartData['data']); ?>,
            xaxis: {
                categories: <?php echo json_encode($chartData['labels']); ?>,
            },
            colors: ['#b4d1c4', '#68a288'],
            fill: {
                type: 'solid',
            },
            grid: {
                strokeDashArray: 4,
            },
            legend: {
                show: true,
                position: 'top',
                horizontalAlign: 'right',
            },
            markers: {
                size: 4,
                colors: ['#000', '#FF3A6E'],
                opacity: 2.5,
                strokeWidth: 4,
                hover: {
                    size: 8,
                }
            }
        };

        var chart = new ApexCharts(document.querySelector("#income-expense-chart"), options);
        chart.render();
    })();
</script>

<script>
    $(document).ready(function() {
        // Handle date filter dropdown selection
        $('.dropdown-item').on('click', function(e) {
            e.preventDefault();
            const filterType = $(this).data('value');
            $('#dateFilterButton').text($(this).text());
            
            if (filterType === 'custom') {
                $('#customDatePicker').show().focus();
            } else {
                $('#customDatePicker').hide();
                loadDashboardData(filterType);
            }
        });
        
        // Handle custom date selection
        $('#customDatePicker').on('change', function() {
            const selectedDate = $(this).val();
            if (selectedDate) {
                loadDashboardData('custom', selectedDate);
            }
        });
        
        function loadDashboardData(filterType, customDate = null) {
            let url = '<?php echo e(route("dashboard.filter")); ?>';
            let data = {
                _token: '<?php echo e(csrf_token()); ?>',
                filter_type: filterType
            };
            
            if (filterType === 'custom' && customDate) {
                data.custom_date = customDate;
            }
            
            // Show loading indicator
            $('.card-body').addClass('loading');
            
            $.ajax({
                url: url,
                type: 'POST',
                data: data,
                success: function(response) {
                    if (response.success) {
                        // Update all the cards with new data
                        $('#todayEnquiryCount').text(response.todayEnquiryCount);
                        $('#todayBookingCount').text(response.todayBookingCount);
                        
                        // Update tables
                        updateTable('#attendanceTable tbody', response.presentEmployeesWithClockIn, 'attendance');
                        updateTable('#notClockInTable tbody', response.notClockIns, 'notClockIn');
                        updateTable('#onLeaveTable tbody', response.onLeaveEmployees, 'onLeave');
                        
                        // Update button text if custom date
                        if (filterType === 'custom' && customDate) {
                            const formattedDate = new Date(customDate).toLocaleDateString('en-US', {
                                weekday: 'short',
                                month: 'short',
                                day: 'numeric'
                            });
                            $('#dateFilterButton').text(formattedDate);
                        }
                    }
                },
                error: function(xhr) {
                    console.error(xhr);
                    alert('Error loading dashboard data');
                },
                complete: function() {
                    // Remove loading indicator
                    $('.card-body').removeClass('loading');
                }
            });
        }
        
        function updateTable(tableSelector, data, tableType) {
            const $table = $(tableSelector);
            $table.empty();
            
            if (data.length === 0) {
                let noDataText = 'No data available';
                if (tableType === 'attendance') {
                    noDataText = 'No attendance records found.';
                } else if (tableType === 'notClockIn') {
                    noDataText = 'All employees are present';
                } else if (tableType === 'onLeave') {
                    noDataText = 'No employees on leave';
                }
                
                $table.append('<tr><td colspan="5">' + noDataText + '</td></tr>');
                return;
            }
            
            data.forEach(function(item) {
                let row = '';
                if (tableType === 'attendance') {
                    row = `<tr>
                        <td>${item.employee ? item.employee.name : 'N/A'}</td>
                        <td>${item.clock_in || '--:--'}</td>
                        <td>${formatLocation(item.clock_in_location, item.clock_in_latitude, item.clock_in_longitude)}</td>
                        <td>${item.clock_out || '--:--'}</td>
                        <td>${formatLocation(item.clock_out_location, item.clock_out_latitude, item.clock_out_longitude)}</td>
                    </tr>`;
                } else if (tableType === 'notClockIn') {
                    row = `<tr>
                        <td>${item.name || 'N/A'}</td>
                        <td style="color: red;">Absent</td>
                    </tr>`;
                } else if (tableType === 'onLeave') {
                    row = `<tr>
                        <td>${item.employees ? item.employees.name : 'N/A'}</td>
                        <td>${formatDateRange(item.leave_start_date, item.leave_end_date)}</td>
                    </tr>`;
                }
                $table.append(row);
            });
        }
        
        function formatLocation(location, lat, lng) {
            if (!location || location === 'Location not available') return '--';
            if (lat && lng) {
                return `<a href="https://www.google.com/maps?q=${lat},${lng}" target="_blank" title="View on map">
                    ${location}
                </a>`;
            }
            return location;
        }
        
        function formatDateRange(start, end) {
            try {
                const startDate = new Date(start);
                const endDate = new Date(end);
                return `${startDate.toLocaleDateString('en-US', { day: 'numeric', month: 'short', year: 'numeric' })} - ${endDate.toLocaleDateString('en-US', { day: 'numeric', month: 'short', year: 'numeric' })}`;
            } catch (e) {
                console.error('Error formatting date:', e);
                return '--';
            }
        }
    });
</script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\hrm\resources\views/dashboard/company.blade.php ENDPATH**/ ?>