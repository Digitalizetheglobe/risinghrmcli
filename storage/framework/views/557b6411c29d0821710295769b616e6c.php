

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Employee Set Salary')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><a href="<?php echo e(url('setsalary')); ?>"><?php echo e(__('Set Salary')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Employee Set Salary')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">

        <div class="col-12">
            <div class="row">
                <div class="col-xl-6">
                    <div class="card set-card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-11">
                                    
                                    <h5><?php echo e(__('Employee Salary')); ?></h5>

                                </div>
                                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Create Set Salary')): ?>
                                    <div class="col-1 text-end">

                                        <a data-url="<?php echo e(route('employee.basic.salary', $employee->id)); ?>" data-ajax-popup="true"
                                            data-title="<?php echo e(__('Set Basic Salary')); ?>" data-bs-toggle="tooltip" title=""
                                            class="btn btn-sm btn-primary" data-bs-original-title="<?php echo e(__('Set Salary')); ?>">
                                            <i class="ti ti-plus"></i>
                                        </a>

                                    </div>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="project-info d-flex text-sm">
                                <div class="project-info-inner mr-3 col-11">
                                    <b class="m-0"> <?php echo e(__('Payslip Type')); ?> </b>
                                    <div class="project-amnt pt-1"><?php echo e($employee->salary_type()); ?></div>
                                </div>
                                <div class="project-info-inner mr-3 col-1">
                                    <b class="m-0"> <?php echo e(__('Salary')); ?> </b>
                                    <div class="project-amnt pt-1"><?php echo e($employee->salary); ?></div>
                                </div>
                            </div>
                            <!--  -->
                        </div>
                    </div>
                </div>

              
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script-page'); ?>
    <script type="text/javascript">
        $(document).on('change', '.amount_type', function() {

            var val = $(this).val();
            var label_text = 'Amount';
            if (val == 'percentage') {
                var label_text = 'Percentage';
            }
            $('.amount_label').html(label_text);
        });


        $(document).on('change', 'select[name=department_id]', function() {
            var department_id = $(this).val();
            getDesignation(department_id);
        });



        function getDesignation(did) {
            $.ajax({
                url: '<?php echo e(route('employee.json')); ?>',
                type: 'POST',
                data: {
                    "department_id": did,
                    "_token": "<?php echo e(csrf_token()); ?>",
                },
                success: function(data) {
                    $('#designation_id').empty();
                    $('#designation_id').append(
                        '<option value=""><?php echo e(__('Select any Designation')); ?></option>');
                    $.each(data, function(key, value) {
                        var select = '';
                        if (key == '<?php echo e($employee->designation_id); ?>') {
                            select = 'selected';
                        }

                        $('#designation_id').append('<option value="' + key + '"  ' + select + '>' +
                            value + '</option>');
                    });
                }
            });
        }
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\risinghrmcli\resources\views/setsalary/employee_salary.blade.php ENDPATH**/ ?>