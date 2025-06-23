<?php
    $setting = App\Models\Utility::settings();
?>
<?php echo e(Form::open(['url' => 'project', 'method' => 'post'])); ?>

<div class="modal-body">
    <div class="row">
        <!-- Project Name -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('project_name', __('Project Name'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::text('project_name', null, ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Enter Project Name')])); ?>

                </div>
            </div>
        </div>

        <!-- Client Name -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('client_name', __('Client Name'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::text('client_name', null, ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Enter Client Name')])); ?>

                </div>
            </div>
        </div>

        <!-- Project Description -->
        <div class="col-lg-12">
            <div class="form-group">
                <?php echo e(Form::label('project_description', __('Project Description'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::textarea('project_description', null, ['class' => 'form-control', 'rows' => 3, 'required' => 'required', 'placeholder' => __('Enter Project Description')])); ?>

                </div>
            </div>
        </div>

        <!-- Project Type -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('project_type', __('Project Type'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <select class="form-control" name="project_type" required>
                        <option value="development"><?php echo e(__('Development')); ?></option>
                        <option value="digital"><?php echo e(__('Digital')); ?></option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Start Date -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('start_date', __('Start Date'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::date('start_date', null, ['class' => 'form-control', 'required' => 'required', 'id' => 'startDate'])); ?>

                </div>
            </div>
        </div>

        <!-- End Date -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('end_date', __('End Date'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::date('end_date', null, ['class' => 'form-control', 'required' => 'required', 'id' => 'endDate'])); ?>

                </div>
            </div>
        </div>

        <!-- Status -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('status', __('Status'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <select class="form-control" name="status" required>
                        <option value="on_boarding"><?php echo e(__('On-Boarding')); ?></option>
                        <option value="on_hold"><?php echo e(__('On Hold')); ?></option>
                        <option value="assigned"><?php echo e(__('Assigned')); ?></option>
                        <option value="in_progress"><?php echo e(__('In Progress')); ?></option>
                        <option value="completed"><?php echo e(__('Completed')); ?></option>
                    </select>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal-footer">
    <input type="button" value="Cancel" class="btn btn-light" data-bs-dismiss="modal">
    <input type="submit" value="<?php echo e(__('Create')); ?>" class="btn btn-primary">
</div>
<?php echo e(Form::close()); ?>


<script>
    // Auto-fill today's date for Start Date
    const getTwoDigits = (value) => value < 10 ? `0${value}` : value;

    const formatDate = (date) => {
        const day = getTwoDigits(date.getDate());
        const month = getTwoDigits(date.getMonth() + 1); // getMonth() returns 0-11
        const year = date.getFullYear();
        return `${year}-${month}-${day}`;
    };

    const today = new Date();
    document.getElementById('startDate').value = formatDate(today);

    // Auto-fill End Date to 30 days after Start Date
    const setEndDate = (startDate) => {
        const endDate = new Date(startDate);
        endDate.setDate(endDate.getDate() + 30); // Add 30 days to start date
        document.getElementById('endDate').value = formatDate(endDate);
    };

    document.getElementById('startDate').addEventListener('change', (e) => {
        setEndDate(e.target.value);
    });

    // Set End Date on page load based on today's date
    setEndDate(formatDate(today));
</script>
<?php /**PATH C:\xampp\htdocs\hrm\resources\views/project/create.blade.php ENDPATH**/ ?>