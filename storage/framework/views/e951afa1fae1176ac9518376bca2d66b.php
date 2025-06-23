<?php
    $setting = App\Models\Utility::settings();
?>
<?php echo e(Form::open(['url' => 'todo', 'method' => 'post'])); ?>

<div class="modal-body">

    <div class="row">
        <!-- Today Task Field -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('task', __('Today Task'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::text('task', null, ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Enter Today\'s Task')])); ?>

                </div>
            </div>
        </div>

        <!-- Priority Field -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('priority', __('Priority'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <select class="form-control" name="priority" required>
                        <option value="low"><?php echo e(__('Low')); ?></option>
                        <option value="medium"><?php echo e(__('Medium')); ?></option>
                        <option value="high"><?php echo e(__('High')); ?></option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Due Date Field -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('expires_at', __('Due Date'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::date('expires_at', null, ['class' => 'form-control', 'required' => 'required', 'autocomplete' => 'off', 'id' => 'expiresAt'])); ?>

                </div>
            </div>
        </div>

        <!-- Status Field -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('is_completed', __('Status'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <select class="form-control" name="is_completed" required>
                        <option value="0"><?php echo e(__('Pending')); ?></option>
                        <option value="1"><?php echo e(__('Completed')); ?></option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Optional Google Calendar Sync -->
        <?php if(isset($setting['is_enabled']) && $setting['is_enabled'] == 'on'): ?>
            <div class="form-group col-md-6">
                <?php echo e(Form::label('synchronize_type', __('Synchronize in Google Calendar?'), ['class' => 'form-label'])); ?>

                <div class="form-switch">
                    <input type="checkbox" class="form-check-input mt-2" name="synchronize_type" id="switch-shadow"
                        value="google_calender">
                    <label class="form-check-label" for="switch-shadow"></label>
                </div>
            </div>
        <?php endif; ?>
    </div>
</div>
<div class="modal-footer">
    <input type="button" value="Cancel" class="btn btn-light" data-bs-dismiss="modal">
    <input type="submit" value="<?php echo e(__('Create')); ?>" class="btn btn-primary">
</div>
<?php echo e(Form::close()); ?>


<script>
    // Function to format the current date
    const getTwoDigits = (value) => value < 10 ? `0${value}` : value;

    const formatDate = (date) => {
        const day = getTwoDigits(date.getDate());
        const month = getTwoDigits(date.getMonth() + 1); // getMonth() returns 0-11
        const year = date.getFullYear();
        return `${year}-${month}-${day}`;
    };

    const date = new Date();
    document.getElementById('expiresAt').value = formatDate(date);
</script>
<?php /**PATH /home/u704145757/domains/connect360.in/public_html/resources/views/todo/create.blade.php ENDPATH**/ ?>