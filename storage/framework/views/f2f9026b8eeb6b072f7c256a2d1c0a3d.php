
<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Manage Bookings')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Bookings')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <!-- <a href="<?php echo e(route('booking.export')); ?>" class="btn btn-sm btn-primary" data-bs-toggle="tooltip" data-bs-original-title="<?php echo e(__('Export')); ?>">
        <i class="ti ti-file-export"></i>
    </a> -->

    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Create TimeSheet')): ?>
        <a href="#" data-url="<?php echo e(route('booking.create')); ?>" data-ajax-popup="true" data-size="xl"
            data-title="<?php echo e(__('Create New Booking')); ?>" data-bs-toggle="tooltip" class="btn btn-sm btn-primary" data-bs-original-title="<?php echo e(__('Create')); ?>">
            <i class="ti ti-plus"></i>
        </a>
    <?php endif; ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
            <div class="col-sm-12">
                <div class="mt-2" id="multiCollapseExample1">
                    <div class="card">
                        <div class="card-body">
                            <?php echo e(Form::open(['route' => ['booking.index'], 'method' => 'get', 'id' => 'booking_filter'])); ?>

                            <div class="row align-items-center justify-content-end">
                                <div class="col-xl-10">
                                    <div class="row">
                                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                            <div class="btn-box"></div>
                                        </div>
                                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                            <div class="btn-box">
                                                <?php echo e(Form::label('start_date', __('Start Date'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::date('start_date', isset($_GET['start_date']) ? $_GET['start_date'] : '', ['class' => 'month-btn form-control current_date', 'autocomplete' => 'off', 'id' => 'current_date'])); ?>

                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                            <div class="btn-box">
                                                <?php echo e(Form::label('end_date', __('End Date'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::date('end_date', isset($_GET['end_date']) ? $_GET['end_date'] : '', ['class' => 'month-btn form-control current_date', 'autocomplete' => 'off', 'id' => 'current_date'])); ?>

                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                            <div class="btn-box">
                                                <?php echo e(Form::label('project', __('Project'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::select('project', $projects, isset($_GET['project']) ? $_GET['project'] : '', ['class' => 'form-control select', 'id' => 'project_id'])); ?>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <div class="row">
                                        <div class="col-auto mt-4">
                                            <a href="#" class="btn btn-sm btn-primary"
                                                onclick="document.getElementById('booking_filter').submit(); return false;"
                                                data-bs-toggle="tooltip" title="" data-bs-original-title="apply">
                                                <span class="btn-inner--icon"><i class="ti ti-search"></i></span>
                                            </a>
                                            <a href="<?php echo e(route('booking.index')); ?>" class="btn btn-sm btn-danger"
                                                data-bs-toggle="tooltip" title="" data-bs-original-title="Reset">
                                                <span class="btn-inner--icon"><i
                                                        class="ti ti-trash-off text-white-off "></i></span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php echo e(Form::close()); ?>

                        </div>
                    </div>
                </div>
            </div>
    </div>
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header card-body table-border-style">
                    <div class="card-body py-0">
                        <div class="table-responsive">
                            <table class="table" id="pc-dt-simple">
                                <thead>
                                    <tr>
                                        <?php if(\Auth::user()->type != 'employee'): ?>
                                            <th><?php echo e(__('Employee')); ?></th>
                                        <?php endif; ?>
                                        <th><?php echo e(__('Project')); ?></th> <!-- Add this line -->
                                        <th><?php echo e(__('Name')); ?></th>
                                        <th><?php echo e(__('Contact No')); ?></th>
                                        <th><?php echo e(__('Email')); ?></th>
                                        <th><?php echo e(__('Action')); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $__currentLoopData = $bookings; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $booking): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <tr>
                                            <?php if(\Auth::user()->type != 'employee'): ?>
                                            <td><?php echo e(!empty($booking->employee) ? $booking->employee->name : 'N/A'); ?></td>
                                            <?php endif; ?>
                                            <td>
                                                <?php if($booking->project): ?>
                                                    <?php echo e($booking->project->project_name); ?>

                                                <?php else: ?>
                                                    <?php echo e($booking->project_name ?? 'N/A'); ?>

                                                <?php endif; ?>
                                            </td>    
                                            <td><?php echo e($booking->primary_applicant_name); ?></td>
                                            <td><?php echo e($booking->primary_applicant_contact_no); ?></td>
                                            <td><?php echo e($booking->primary_applicant_email); ?></td>
                                            <td class="Action">
                                                <span>
                                                    
                                                    <!-- <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Create TimeSheet')): ?>
                                                        <div class="action-btn bg-blue-500 ms-2" >
                                                            <a href="#" class="mx-3 btn btn-sm align-items-center"
                                                                data-url="<?php echo e(route('booking.create', $booking->id)); ?>"
                                                                data-ajax-popup="true" data-size="xl" data-bs-toggle="tooltip"
                                                                title="<?php echo e(__('Create Booking')); ?>">
                                                                <i class="ti ti-plus text-white"></i>
                                                            </a>
                                                        </div>
                                                    <?php endif; ?> -->

                                                    <div class="action-btn bg-warning ms-2">
                                                        <a href="#" class="mx-3 btn btn-sm align-items-center"
                                                            data-url="<?php echo e(route('booking.payslip', $booking->id)); ?>"
                                                            data-ajax-popup="true" data-size="lg" data-bs-toggle="tooltip"
                                                            title="<?php echo e(__('Print Booking')); ?>">
                                                            <i class="ti ti-printer text-white"></i>
                                                        </a>
                                                    </div>

                                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Edit TimeSheet')): ?>
                                                        <div class="action-btn bg-info ms-2">
                                                            <a href="#" class="mx-3 btn btn-sm align-items-center"
                                                                data-url="<?php echo e(route('booking.edit', $booking->id)); ?>"
                                                                data-ajax-popup="true" data-size="xl" data-bs-toggle="tooltip"
                                                                title="<?php echo e(__('View Booking')); ?>">
                                                                <i class="ti ti-pencil text-white"></i>
                                                            </a>
                                                        </div>
                                                    <?php endif; ?>
                                                     


                                                
                                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Delete TimeSheet')): ?>
                                                        <div class="action-btn bg-danger ms-2">
                                                            <?php echo Form::open([
                                                                'method' => 'DELETE',
                                                                'route' => ['booking.destroy', $booking->id],
                                                                'id' => 'delete-form-' . $booking->id,
                                                            ]); ?>

                                                            <a href="#" class="mx-3 btn btn-sm align-items-center bs-pass-para"
                                                                data-bs-toggle="tooltip" title="<?php echo e(__('Delete')); ?>">
                                                                <i class="ti ti-trash text-white"></i>
                                                            </a>
                                                            <?php echo Form::close(); ?>

                                                        </div>
                                                    <?php endif; ?>

                                                    

                                                </span>
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
<?php $__env->stopSection(); ?>


<?php $__env->startPush('script-page'); ?>
    <script>
        $(document).ready(function() {
            var now = new Date();
            var month = (now.getMonth() + 1);
            var day = now.getDate();
            if (month < 10) month = "0" + month;
            if (day < 10) day = "0" + day;
            var today = now.getFullYear() + '-' + month + '-' + day;
            $('.current_date').val(today);
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\hrm\resources\views/booking/index.blade.php ENDPATH**/ ?>