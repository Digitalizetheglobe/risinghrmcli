<?php
    $setting = App\Models\Utility::settings();
?>

<?php echo Form::open(['route' => ['salary-increment.store', $employee->id], 'method' => 'POST']); ?>

<div class="modal-body">
    <div class="row">

        <!-- Old Salary (Display only) -->
        <div class="col-md-6">
            <div class="form-group">
                <?php echo e(Form::label('old_salary', __('Old Salary'), ['class' => 'form-label'])); ?>

                <input type="text" class="form-control" value="<?php echo e($employee->salary); ?>" readonly>
            </div>
        </div>

        <!-- New Salary -->
        <div class="col-md-6">
            <div class="form-group">
                <?php echo e(Form::label('new_salary', __('New Salary'), ['class' => 'form-label'])); ?>

                <?php echo e(Form::number('new_salary', null, ['class' => 'form-control', 'required' => true, 'placeholder' => __('Enter New Salary')])); ?>

            </div>
        </div>

        <!-- Month of Effective Date -->
        <div class="col-md-6">
            <div class="form-group">
                <?php echo e(Form::label('month_of_effective_date', __('Month of Effective Date'), ['class' => 'form-label'])); ?>

                <?php echo e(Form::month('month_of_effective_date', null, ['class' => 'form-control', 'required' => true])); ?>

            </div>
        </div>

    </div>
</div>

<div class="modal-footer">
    <a href="<?php echo e(route('setsalary.index')); ?>" class="btn btn-light"><?php echo e(__('Cancel')); ?></a>
    <?php echo e(Form::submit(__('Save Increment'), ['class' => 'btn btn-primary'])); ?>

</div>
<?php echo Form::close(); ?>

<?php /**PATH D:\risinghrmcli\resources\views/setsalary/increment_form.blade.php ENDPATH**/ ?>