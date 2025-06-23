<?php echo e(Form::open(['url' => 'leavetype', 'method' => 'post'])); ?>

<div class="modal-body">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="form-group">
                <?php echo e(Form::label('title', __('Name'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::text('title', null, ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Enter Leave Type Name')])); ?>

                </div>
                <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                    <span class="invalid-name" role="alert">
                        <strong class="text-danger"><?php echo e($message); ?></strong>
                    </span>
                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
            </div>
        </div>

        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="form-group">
                <div class="form-check">
                    <input type="checkbox" name="unlimited" value="1" class="form-check-input" id="unlimited-check">
                    <label class="form-check-label" for="unlimited-check"><?php echo e(__('Unlimited Days (e.g. Casual Leave)')); ?></label>
                </div>
            </div>
        </div>

        <div class="col-lg-12 col-md-12 col-sm-12" id="days-container">
            <div class="form-group">
                <?php echo e(Form::label('days', __('Days Per Month'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <input type="number" name="days" class="form-control" step="0.5" min="0" placeholder="<?php echo e(__('Enter Days Per Month (e.g. 1.5)')); ?>" id="days-input">
                </div>
                <?php $__errorArgs = ['days'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                    <span class="invalid-name" role="alert">
                        <strong class="text-danger"><?php echo e($message); ?></strong>
                    </span>
                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
            </div>
        </div>
    </div>
</div>
<div class="modal-footer">
    <input type="button" value="Cancel" class="btn btn-light" data-bs-dismiss="modal">
    <input type="submit" value="<?php echo e(__('Create')); ?>" class="btn btn-primary">
</div>
<?php echo e(Form::close()); ?>


<?php $__env->startPush('scripts'); ?>
<script>
    $(document).ready(function() {
        $('#unlimited-check').change(function() {
            if($(this).is(':checked')) {
                $('#days-container').hide();
                $('input[name="days"]').val('').prop('disabled', true);
            } else {
                $('#days-container').show();
                $('input[name="days"]').prop('disabled', false);
            }
        });
        
        // Initialize based on current state
        if($('#unlimited-check').is(':checked')) {
            $('#days-container').hide();
            $('input[name="days"]').prop('disabled', true);
        }
    });
    </script>
<?php $__env->stopPush(); ?><?php /**PATH C:\xampp\htdocs\hrm\resources\views/leavetype/create.blade.php ENDPATH**/ ?>