

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Attendance Calendar')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Attendance Calendar')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6">
                            <h5><?php echo e(__('Attendance Calendar')); ?></h5>
                        </div>
                        <?php if(\Auth::user()->type != 'employee'): ?>
                            <div class="col-md-6">
                                <form method="GET" action="<?php echo e(route('attendance.calendar')); ?>" class="d-flex">
                                    <select name="employee_id" class="form-select me-2" onchange="this.form.submit()">
                                        <option value=""><?php echo e(__('Select Employee')); ?></option>
                                        <?php $__currentLoopData = $allEmployees; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $employee): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($employee->id); ?>" <?php echo e($selectedEmployee && $selectedEmployee->id == $employee->id ? 'selected' : ''); ?>>
                                                <?php echo e($employee->name); ?>

                                            </option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </form>
                            </div>
                        <?php endif; ?>
                    </div>
                    <?php if($selectedEmployee): ?>
                        <div class="d-flex mt-2">
                            <div class="me-3">
                                <span class="badge bg-success me-2">Present</span>
                                <span class="badge bg-danger me-2">Absent</span>
                                <span class="badge bg-warning me-2">Leave</span>
                                <span class="badge bg-primary me-2">Week Off</span>
                            </div>
                        </div>
                    <?php endif; ?>
                </div>
                <div class="card-body">
                    <?php if($selectedEmployee): ?>
                        <div id='calendar'></div>
                    <?php else: ?>
                        <div class="alert alert-info">
                            <?php if(\Auth::user()->type == 'employee'): ?>
                                <?php echo e(__('No employee record found for your account.')); ?>

                            <?php else: ?>
                                <?php echo e(__('Please select an employee to view attendance calendar')); ?>

                            <?php endif; ?>
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('css'); ?>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css">
    <style>
        /* Your existing styles remain the same */
    </style>
<?php $__env->stopPush(); ?>

<?php $__env->startPush('script-page'); ?>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            
            <?php if($selectedEmployee): ?>
                var attendanceData = <?php echo json_encode($attendanceData, 15, 512) ?>;
                
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'dayGridMonth',
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,dayGridWeek,dayGridDay'
                    },
                    timeZone: 'UTC',
                    dayCellDidMount: function(info) {
                        var dateStr = info.date.toISOString().split('T')[0];
                        
                        // Check if we have data for the selected employee
                        if (attendanceData['<?php echo e($selectedEmployee->id); ?>'] && 
                            attendanceData['<?php echo e($selectedEmployee->id); ?>'].data[dateStr]) {
                            
                            var status = attendanceData['<?php echo e($selectedEmployee->id); ?>'].data[dateStr].type;
                            var statusClass = status.replace('_', '-');
                            
                            info.el.classList.add(statusClass);
                            
                            var detailsEl = document.createElement('div');
                            detailsEl.className = 'status-details';
                            
                            if (status === 'present') {
                                detailsEl.innerHTML = `<span style="background-color: #3490dc; color: white; padding: 4px 8px; border-radius: 4px; display: inline-block;">
                                    Present</span><br>` + 
                                    (attendanceData['<?php echo e($selectedEmployee->id); ?>'].data[dateStr].clock_in ? 'In: ' + attendanceData['<?php echo e($selectedEmployee->id); ?>'].data[dateStr].clock_in : '') + 
                                    (attendanceData['<?php echo e($selectedEmployee->id); ?>'].data[dateStr].clock_out ? '<br>Out: ' + attendanceData['<?php echo e($selectedEmployee->id); ?>'].data[dateStr].clock_out : '');
                            } else if (status === 'absent') {
                                detailsEl.innerHTML = `<span style="background-color: #e3342f; color: white; padding: 4px 8px; border-radius: 4px; display: inline-block;">
                                    Absent</span>`;
                            } else if (status === 'leave') {
                                detailsEl.innerHTML = `<span style="background-color: #f6993f; color: white; padding: 4px 8px; border-radius: 4px; display: inline-block;">
                                    Leave</span><br>` + 
                                    (attendanceData['<?php echo e($selectedEmployee->id); ?>'].data[dateStr].reason ? attendanceData['<?php echo e($selectedEmployee->id); ?>'].data[dateStr].reason : '');
                            } else if (status === 'week_off') {
                                detailsEl.innerHTML = `<span style="background-color: #6c757d; color: white; padding: 4px 8px; border-radius: 4px; display: inline-block;">
                                    Week Off</span>`;
                            }
                            
                            info.el.querySelector('.fc-daygrid-day-frame').appendChild(detailsEl);
                        }
                    }
                });
                
                calendar.render();
            <?php endif; ?>
        });
    </script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\hrm\resources\views/attendance/calendar.blade.php ENDPATH**/ ?>