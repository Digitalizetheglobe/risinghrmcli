<?php
    $plan = Utility::getChatGPTSettings();
?>

<?php echo e(Form::model($interviewSchedule, ['route' => ['interview-schedule.update', $interviewSchedule->id],'method' => 'PUT'])); ?>

<div class="modal-body">

    <?php if($plan->enable_chatgpt == 'on'): ?>
    <div class="text-end">
        <a href="#" class="btn btn-sm btn-primary" data-size="medium" data-ajax-popup-over="true" data-url="<?php echo e(route('generate', ['interview-schedule'])); ?>"
            data-bs-toggle="tooltip" data-bs-placement="top" title="<?php echo e(__('Generate')); ?>"
            data-title="<?php echo e(__('Generate Content With AI')); ?>">
            <i class="fas fa-robot"></i><?php echo e(__(' Generate With AI')); ?>

        </a>
    </div>
    <?php endif; ?>

    <div class="row">
        <div class="form-group col-md-6">
            <?php echo e(Form::label('candidate', __('Interview To'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::select('candidate', $candidates, null, ['class' => 'form-control select2', 'required' => 'required'])); ?>

        </div>
        <div class="form-group col-md-6">
            <?php echo e(Form::label('employee', __('Interviewer'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::select('employee', $employees, null, ['class' => 'form-control select2', 'required' => 'required'])); ?>

        </div>
        <div class="form-group col-md-6">
            <?php echo e(Form::label('date', __('Interview Date'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::text('date', null, ['class' => 'form-control d_week'])); ?>

        </div>
        <div class="form-group col-md-6">
            <?php echo e(Form::label('time', __('Interview Time'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::time('time', null, ['class' => 'form-control timepicker'])); ?>

        </div>
        <div class="form-group">
            <?php echo e(Form::label('comment', __('Comment'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::textarea('comment', null, ['class' => 'form-control', 'rows' => '3'])); ?>

        </div>
    </div>
</div>
<div class="modal-footer">
    <button type="button" class="btn  btn-light" data-bs-dismiss="modal"><?php echo e(__('Cancel')); ?></button>
    <input type="submit" value="<?php echo e(__('Update')); ?>" class="btn  btn-primary">

</div>
<?php echo e(Form::close()); ?>

<?php /**PATH D:\HRM_Rising\resources\views/interviewSchedule/edit.blade.php ENDPATH**/ ?>