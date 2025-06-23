<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Manage Enquiry')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Enquiry')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <a href="<?php echo e(route('timesheet.export')); ?>" class="btn btn-sm btn-primary" data-bs-toggle="tooltip"
        data-bs-original-title="<?php echo e(__('Export')); ?>">
        <i class="ti ti-file-export"></i>
    </a>

    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Create TimeSheet')): ?>
        <a href="#" data-url="<?php echo e(route('timesheet.create')); ?>" data-ajax-popup="true" data-size="xl"
            data-title="<?php echo e(__('Create New Enquiry')); ?>" data-bs-toggle="tooltip" title=""
            class="btn btn-sm btn-primary" data-bs-original-title="<?php echo e(__('Create')); ?>" id="create-btn">
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
                        <?php echo e(Form::open(['route' => ['timesheet.index'], 'method' => 'get', 'id' => 'timesheet_filter'])); ?>

                        <div class="row align-items-center justify-content-end">
                            <div class="col-xl-10">
                                <div class="row">
                                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="btn-box"></div>
                                    </div>
                                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="btn-box">
                                            <?php echo e(Form::label('start_date', __('Start Date'), ['class' => 'form-label'])); ?>

                                            <?php echo e(Form::date('start_date', isset($_GET['start_date']) ? $_GET['start_date'] : '', ['class' => 'month-btn form-control current_date', 'autocomplete' => 'off', 'id' => 'start_date'])); ?>

                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="btn-box">
                                            <?php echo e(Form::label('end_date', __('End Date'), ['class' => 'form-label'])); ?>

                                            <?php echo e(Form::date('end_date', isset($_GET['end_date']) ? $_GET['end_date'] : '', ['class' => 'month-btn form-control current_date', 'autocomplete' => 'off', 'id' => 'end_date'])); ?>

                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="btn-box">
                                            <?php if(\Auth::user()->type == 'employee'): ?>
                                            <?php echo Form::hidden('employee', optional($employeesList->first())->id ?? 0, ['id' => 'employee_id']); ?>

                                            <?php else: ?>
                                                <?php echo e(Form::label('employee', __('Employee'), ['class' => 'form-label'])); ?>

                                                <?php echo e(Form::select('employee', $employeesList, isset($_GET['employee']) ? $_GET['employee'] : '', ['class' => 'form-control select ', 'id' => 'employee_id'])); ?>

                                            <?php endif; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <div class="row">
                                    <div class="col-auto mt-4">
                                        <a href="#" class="btn btn-sm btn-primary"
                                            onclick="document.getElementById('timesheet_filter').submit(); return false;"
                                            data-bs-toggle="tooltip" title="" data-bs-original-title="apply">
                                            <span class="btn-inner--icon"><i class="ti ti-search"></i></span>
                                        </a>
                                        <a href="<?php echo e(route('timesheet.index')); ?>" class="btn btn-sm btn-danger"
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

    <div class="col-xl-12">
        <div class="card">
            <div class="card-header card-body table-border-style">
                <div class="card-body py-0">
                    <div class="table-responsive">
                        <table class="table" id="pc-dt-simple">
                            <thead>
                                <tr>
                                    <?php if(\Auth::user()->type != 'employee'): ?>
                                        <th><?php echo e(__('Employee Name')); ?></th>
                                    <?php endif; ?>
                                    <th><?php echo e(__('Date')); ?></th>
                                    <th><?php echo e(__('Client Name')); ?></th>
                                    <th><?php echo e(__('Mobile No')); ?></th>
                                    <th width="200px"><?php echo e(__('Action')); ?></th>
                                </tr>
                            </thead>
                            <tbody id="enquiry-table-body">
                                <?php $__currentLoopData = $timeSheets; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $timeSheet): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <?php if(\Auth::user()->type != 'employee'): ?>
                                            <td><?php echo e($timeSheet->employee->name ?? 'N/A'); ?></td>
                                        <?php endif; ?>
                                        <td><?php echo e(\Auth::user()->dateFormat($timeSheet->date)); ?></td>
                                        <td><?php echo e($timeSheet->full_name); ?></td>
                                        <td><?php echo e($timeSheet->mobile_no); ?></td>
                                        <td class="Action">
                                            <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Edit TimeSheet')): ?>
                                                <div class="action-btn bg-info ms-2">
                                                    <a href="#" 
                                                    class="mx-3 btn btn-sm align-items-center edit-btn" 
                                                    data-url="<?php echo e(route('timesheet.edit', $timeSheet->id)); ?>" 
                                                    data-ajax-popup="true" 
                                                    data-size="xl" 
                                                    data-bs-toggle="tooltip" 
                                                    data-title="<?php echo e(__('Edit TimeSheet')); ?>" 
                                                    data-bs-original-title="<?php echo e(__('Edit')); ?>">
                                                        <i class="ti ti-pencil text-white"></i>
                                                    </a>
                                                </div>
                                            <?php endif; ?>
                                            <div class="action-btn bg-danger ms-2">
                                                <form action="<?php echo e(route('timesheet.destroy', $timeSheet->id)); ?>" method="POST" class="d-inline">
                                                    <?php echo csrf_field(); ?>
                                                    <?php echo method_field('DELETE'); ?>
                                                    <button type="submit" class="mx-3 btn btn-sm d-inline-flex align-items-center" data-bs-toggle="tooltip" title="<?php echo e(__('Delete')); ?>">
                                                        <i class="ti ti-trash text-white"></i>
                                                    </button>
                                                </form>
                                            </div>
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
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script-page'); ?>
<script>
    $(document).ready(function() {
        // Initialize current date
        var now = new Date();
        var month = (now.getMonth() + 1).toString().padStart(2, '0');
        var day = now.getDate().toString().padStart(2, '0');
        var today = now.getFullYear() + '-' + month + '-' + day;
        $('.current_date').val(today);

        // Function to refresh the enquiry table
        function refreshEnquiryTable() {
            $.ajax({
                url: "<?php echo e(route('timesheet.index')); ?>",
                type: 'GET',
                data: $('#timesheet_filter').serialize(),
                success: function(response) {
                    // Extract just the table body content from the response
                    var newContent = $(response).find('#enquiry-table-body').html();
                    $('#enquiry-table-body').html(newContent);
                    
                    // Reinitialize any necessary plugins or event handlers
                    initEventHandlers();
                },
                error: function() {
                    show_toastr('Error', 'Failed to refresh enquiry data', 'error');
                }
            });
        }

        // Initialize event handlers
        function initEventHandlers() {
            // Handle form submission for creating new enquiry
            $('#create-btn').on('click', function() {
                $.ajax({
                    url: $(this).data('url'),
                    type: 'GET',
                    success: function(response) {
                        $('#commonModal .modal-body').html(response);
                        $('#commonModal').modal('show');
                        
                        // Handle form submission inside the modal
                        $('#timesheet-form').on('submit', function(e) {
                            e.preventDefault();
                            var form = $(this);
                            var url = form.attr('action');
                            
                            $.ajax({
                                url: url,
                                type: 'POST',
                                data: form.serialize(),
                                success: function(response) {
                                    if(response.success) {
                                        $('#commonModal').modal('hide');
                                        show_toastr('Success', response.message, 'success');
                                        refreshEnquiryTable();
                                    }
                                },
                                error: function(xhr) {
                                    if(xhr.status === 422) {
                                        $('.invalid-feedback').remove();
                                        $('.is-invalid').removeClass('is-invalid');
                                        
                                        var errors = xhr.responseJSON.errors;
                                        $.each(errors, function(field, messages) {
                                            var input = $('[name="' + field + '"]');
                                            input.addClass('is-invalid');
                                            input.after('<div class="invalid-feedback">' + messages[0] + '</div>');
                                        });
                                    } else {
                                        show_toastr('Error', xhr.responseJSON.message || 'An error occurred', 'error');
                                    }
                                }
                            });
                        });
                    }
                });
            });

            // Handle edit button clicks
            $('.edit-btn').on('click', function() {
                var url = $(this).data('url');
                $.ajax({
                    url: url,
                    type: 'GET',
                    success: function(response) {
                        $('#commonModal .modal-body').html(response);
                        $('#commonModal').modal('show');
                        
                        // Handle form submission inside the modal
                        $('#timesheet-form').on('submit', function(e) {
                            e.preventDefault();
                            var form = $(this);
                            var url = form.attr('action');
                            
                            $.ajax({
                                url: url,
                                type: 'POST',
                                data: form.serialize(),
                                success: function(response) {
                                    if(response.success) {
                                        $('#commonModal').modal('hide');
                                        show_toastr('Success', response.message, 'success');
                                        refreshEnquiryTable();
                                    }
                                },
                                error: function(xhr) {
                                    if(xhr.status === 422) {
                                        $('.invalid-feedback').remove();
                                        $('.is-invalid').removeClass('is-invalid');
                                        
                                        var errors = xhr.responseJSON.errors;
                                        $.each(errors, function(field, messages) {
                                            var input = $('[name="' + field + '"]');
                                            input.addClass('is-invalid');
                                            input.after('<div class="invalid-feedback">' + messages[0] + '</div>');
                                        });
                                    } else {
                                        show_toastr('Error', xhr.responseJSON.message || 'An error occurred', 'error');
                                    }
                                }
                            });
                        });
                    }
                });
            });
        }

        // Initialize event handlers on page load
        initEventHandlers();

        // Handle filter form submission
        $('#timesheet_filter').on('submit', function(e) {
            e.preventDefault();
            refreshEnquiryTable();
        });

        // Refresh table when modal is closed (in case changes were made)
        $('#commonModal').on('hidden.bs.modal', function () {
            refreshEnquiryTable();
        });
    });
</script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\hrm\resources\views/timeSheet/index.blade.php ENDPATH**/ ?>