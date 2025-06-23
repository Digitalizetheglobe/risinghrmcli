<?php
    $plan = Utility::getChatGPTSettings();
?>

<?php echo e(Form::model($announcement, ['route' => ['announcement.update', $announcement->id], 'method' => 'PUT'])); ?>

<div class="modal-body">

    <?php if($plan->enable_chatgpt == 'on'): ?>
        <div class="card-footer text-end">
            <a href="#" class="btn btn-sm btn-primary" data-size="medium" data-ajax-popup-over="true"
                data-url="<?php echo e(route('generate', ['announcement'])); ?>" data-bs-toggle="tooltip" data-bs-placement="top"
                title="<?php echo e(__('Generate')); ?>" data-title="<?php echo e(__('Generate Content With AI')); ?>">
                <i class="fas fa-robot"></i><?php echo e(__(' Generate With AI')); ?>

            </a>
        </div>
    <?php endif; ?>

    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                <?php echo e(Form::label('title', __('Announcement Title'), ['class' => 'col-form-label'])); ?>

                <?php echo e(Form::text('title', null, ['class' => 'form-control', 'placeholder' => __('Enter Announcement Title'), 'required' => 'required'])); ?>

            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <?php echo e(Form::label('branch_id', __('Branch'), ['class' => 'col-form-label'])); ?>

                
                <?php echo e(Form::select('branch_id', $branch, null, ['class' => 'form-control select2'])); ?>

            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <?php echo e(Form::label('department_id', __('Department'), ['class' => 'col-form-label'])); ?>


                <div class="department_div">
                    

                    
                    <?php echo e(Form::select('department_id[]', $departments, !empty($announcement->department_id) ? explode(',', $announcement->department_id) : null, ['class' => 'form-control select2 department_id', 'id' => 'department_id'])); ?>

                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <?php echo e(Form::label('employee_id', __('Employee'), ['class' => 'col-form-label'])); ?>

                    <?php echo e(Form::select('employee_id[]', $employees, !empty($announcement->employee_id) ? explode(',', $announcement->employee_id) : null, ['class' => 'form-control select2 employee_id', 'id' => 'employee_id', 'multiple' => 'multiple'])); ?>

            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <?php echo e(Form::label('start_date', __('Announcement start Date'), ['class' => 'col-form-label'])); ?>

                <?php echo e(Form::text('start_date', null, ['class' => 'form-control d_week', 'autocomplete' => 'off', 'required' => 'required'])); ?>

            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <?php echo e(Form::label('end_date', __('Announcement End Date'), ['class' => 'col-form-label'])); ?>

                <?php echo e(Form::text('end_date', null, ['class' => 'form-control d_week', 'autocomplete' => 'off', 'required' => 'required'])); ?>

            </div>
        </div>
        <div class="form-group">
            <?php echo e(Form::label('description', __('Announcement Description'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::textarea('description', null, ['class' => 'form-control', 'placeholder' => __('Enter Announcement Description'), 'rows' => '3', 'required' => 'required'])); ?>

        </div>
    </div>
    <div class="modal-footer">
        <input type="button" value="Cancel" class="btn btn-light" data-bs-dismiss="modal">
        <input type="submit" value="<?php echo e(__('Update')); ?>" class="btn  btn-primary">

    </div>
</div>
<?php echo e(Form::close()); ?>

<?php /**PATH C:\xampp\htdocs\hrm\resources\views/announcement/edit.blade.php ENDPATH**/ ?>