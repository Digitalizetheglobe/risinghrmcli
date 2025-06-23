<?php
    $plan = Utility::getChatGPTSettings();
?>

<?php echo e(Form::model($meeting, ['route' => ['meeting.update', $meeting->id], 'method' => 'PUT'])); ?>

<div class="modal-body">

    <?php if($plan->enable_chatgpt == 'on'): ?>
    <div class="text-end">
        <a href="#" class="btn btn-sm btn-primary" data-size="medium" data-ajax-popup-over="true" data-url="<?php echo e(route('generate', ['meeting'])); ?>"
            data-bs-toggle="tooltip" data-bs-placement="top" title="<?php echo e(__('Generate')); ?>"
            data-title="<?php echo e(__('Generate Content With AI')); ?>">
            <i class="fas fa-robot"></i><?php echo e(__(' Generate With AI')); ?>

        </a>
    </div>
    <?php endif; ?>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="form-group">
                <?php echo e(Form::label('title', __('Meeting Title'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::text('title', null, ['class' => 'form-control ', 'required' => 'required', 'placeholder' => __('Enter Meeting Title')])); ?>

                </div>
            </div>
        </div>


        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('date', __('Meeting Date'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::date('date', null, ['class' => 'form-control', 'required' => 'required'])); ?>

                </div>
            </div>
        </div>

        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('time', __('Meeting Time'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::time('time', null, ['class' => 'form-control', 'required' => 'required'])); ?>

                </div>
            </div>
        </div>


        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="form-group">
                <?php echo e(Form::label('note', __('Meeting Note'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::textarea('note', null, ['class' => 'form-control', 'rows' => '3'])); ?>

                </div>
            </div>
        </div>


    </div>
</div>
<div class="modal-footer">
    <input type="button" value="Cancel" class="btn btn-light" data-bs-dismiss="modal">
    <input type="submit" value="<?php echo e(__('Update')); ?>" class="btn btn-primary">
</div>
<?php echo e(Form::close()); ?>

<?php /**PATH C:\xampp\htdocs\hrm\resources\views/meeting/edit.blade.php ENDPATH**/ ?>