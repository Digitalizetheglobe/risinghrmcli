<!-- Updated create timesheet form -->
<?php echo e(Form::open(['route' => ['timesheet.store'], 'id' => 'timesheet-form', 'class' => 'needs-validation', 'novalidate' => 'novalidate'])); ?>

<?php echo csrf_field(); ?>

<div class="modal-body px-50">
    <div class="row">
        <?php if(\Auth::user()->type == 'employee'): ?>
        <input type="hidden" name="employee_id" value="<?php echo e(Auth::id()); ?>">
        <?php else: ?>
            <div class="form-group col-md-12">
                <?php echo e(Form::label('employee_id', __('Employee'), ['class' => 'col-form-label'])); ?>

                <?php echo Form::select('employee_id', $employees, null, [
                    'class' => 'form-control select2',
                    'id' => 'choices-multiple',
                    'required' => 'required',
                ]); ?>

            </div>
        <?php endif; ?>

        <div class="form-group col-md-6">
            <?php echo e(Form::label('project_id', __('Project Name'), ['class' => 'col-form-label'])); ?>

            <select name="project_id" id="projectDropdown" class="form-control select2" required>
                <option value="">Select Project</option>
                <?php $__currentLoopData = $projects; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $id => $name): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    $('#projectDropdown').append('<option value="<?php echo e($id); ?>"><?php echo e($name); ?></option>');
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
        </div>

        <div class="form-group col-md-6">
            <?php echo e(Form::label('date', __('Date'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::text('date', '', ['class' => 'form-control d_week current_date', 'autocomplete' => 'off', 'required' => 'required', 'placeholder' => 'Select date'])); ?>

        </div>

        <!-- Client Information Fields -->
        <div class="form-group col-md-4">
            <?php echo e(Form::label('full_name', __('Client Name'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::text('full_name', '', [
                'class' => 'form-control', 
                'required' => 'required', 
                'placeholder' => 'Enter full name',
            ])); ?>

        </div>

        <div class="form-group col-md-4">
            <?php echo e(Form::label('mobile_no', __('Mobile Number'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::text('mobile_no', '', ['class' => 'form-control', 'required' => 'required', 'placeholder' => 'Enter mobile number'])); ?>

        </div>

        <div class="form-group col-md-4">
            <?php echo e(Form::label('email_id', __('Email ID'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::email('email_id', '', ['class' => 'form-control', 'required' => 'required', 'placeholder' => 'Enter email ID'])); ?>

        </div>

        <div class="form-group col-md-4">
            <?php echo e(Form::label('address', __('Address'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::text('address', '', ['class' => 'form-control', 'placeholder' => 'Enter address'])); ?>

        </div>

        <!-- Client Source with Dynamic Fields -->
        <div class="form-group col-md-4">
            <?php echo e(Form::label('recommended_by', __('Client Source'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::select('recommended_by', [
                '' => 'Select Client Source',
                'CP' => 'CP',
                'Digital' => 'Digital',
                'Hoarding' => 'Hoarding',
                'WayBoard' => 'WayBoard',
                'LeafLet' => 'LeafLet',
                'Expo' => 'Expo',
                'Refrence' => 'Refrence',
                'Others' => 'Others'
            ], '', ['class' => 'form-control select2', 'id' => 'recommended_by'])); ?>

        </div>

        <!-- Dynamic Fields for Client Source -->
        <div id="cpBox" class="form-group col-md-4" style="display: none;">
            <?php echo e(Form::label('cp_data', __('CP Name'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::text('cp_data', '', ['class' => 'form-control', 'placeholder' => 'Enter CP Name'])); ?>

        </div>

        <div id="referenceBox" class="form-group col-md-4" style="display: none;">
            <?php echo e(Form::label('refrence_data', __('Reference Name'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::text('refrence_data', '', ['class' => 'form-control', 'placeholder' => 'Enter Reference Name'])); ?>

        </div>

        <div id="otherBox" class="form-group col-md-4" style="display: none;">
            <?php echo e(Form::label('other_data', __('Other Data'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::text('other_data', '', ['class' => 'form-control', 'placeholder' => 'Enter Other Data'])); ?>

        </div>

        <!-- Other Fields -->
        <div class="form-group col-md-4">
            <?php echo e(Form::label('primary_reason', __('Primary Reason'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::select('primary_reason', ['Investment' => 'Investment', 'Construction' => 'Construction'], '', ['class' => 'form-control select2'])); ?>

        </div>

        <div class="form-group col-md-4">
            <?php echo e(Form::label('square_feet_range', __('Area Requirement'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::text('square_feet_range', '', ['class' => 'form-control', 'placeholder' => 'Enter Area Requirement'])); ?>

        </div>

        <div class="form-group col-md-4">
            <?php echo e(Form::label('price_range', __('Price Range'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::select('price_range', [
                '' => 'Select Price Range',
                '10 To 15 lakh' => '10 To 15 lakh',
                '15 To 20 lakh' => '15 To 20 lakh',
                '20 To 30 lakh' => '20 To 30 lakh',
                '30 To 40 lakh' => '30 To 40 lakh',
                '40 To 50 lakh' => '40 To 50 lakh',
                '50 Lakh Above' => '50 Lakh Above'
            ], '', ['class' => 'form-control select2'])); ?>

        </div>

        <!-- Client Status with Booked Option -->
        <div class="form-group col-md-4">
            <?php echo e(Form::label('client_status', __('Client Status'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::select('client_status', [
                '' => 'Select Client Status',
                'Intrested' => 'Intrested', 
                'Not-Intrested' => 'Not-Intrested', 
                'Call-Back' => 'Call-Back', 
                'Hold' => 'Hold',
                'Booked' => 'Booked'
            ], '', ['class' => 'form-control select2', 'id' => 'client_status'])); ?>

        </div>

        <!-- Unit Selection (only shown when status is Booked) -->
        <div id="unitSelectionBox" class="form-group col-md-4" style="display: none;">
            <?php echo e(Form::label('unit_id', __('Unit Name'), ['class' => 'col-form-label'])); ?>

            <select name="unit_id" id="unitDropdown" class="form-control">
                <option value="">Select Unit</option>
                <!-- Units will be loaded dynamically -->
            </select>
        </div>

        <div class="form-group col-md-12">
            <?php echo e(Form::label('executive_remark', __('Executive Remark'), ['class' => 'col-form-label'])); ?>

            <?php echo e(Form::textarea('executive_remark', '', ['class' => 'form-control', 'placeholder' => 'Enter executive remark', 'rows' => 3])); ?>

        </div>

        <div class="form-group col-md-12">
            <a href="#" id="addFeedback" class="btn btn-sm btn-primary">+ Add Feedback</a>
            <div id="feedbackContainer">
                <!-- Feedback fields will be added here dynamically -->
            </div>
        </div>
    </div>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-light" data-bs-dismiss="modal"><?php echo e(__('Close')); ?></button>
    <input type="submit" value="<?php echo e(__('Create')); ?>" class="btn btn-primary">
</div>
<?php echo e(Form::close()); ?>


<script>
$(document).ready(function() {
    // Initialize date
    var now = new Date();
    var month = (now.getMonth() + 1).toString().padStart(2, '0');
    var day = now.getDate().toString().padStart(2, '0');
    var today = now.getFullYear() + '-' + month + '-' + day;
    $('.current_date').val(today);

    // Prevent default form submission
    $('#timesheet-form').on('submit', function(e) {
        e.preventDefault();
        submitForm($(this));
    });

    // Handle recommended_by changes
    $('#recommended_by').on('change', function() {
        const value = $(this).val();
        
        // Hide all boxes first
        $('#cpBox, #referenceBox, #otherBox').hide();
        
        // Show the appropriate box
        if (value === 'CP') {
            $('#cpBox').show();
        } else if (value === 'Refrence') {
            $('#referenceBox').show();
        } else if (value === 'Others') {
            $('#otherBox').show();
        }
    });

    // Handle client_status changes
    $('#client_status').on('change', function() {
        const status = $(this).val();
        const projectId = $('#projectDropdown').val();
        
        if (status === 'Booked' && projectId) {
            loadUnits(projectId);
            $('#unitSelectionBox').show();
        } else {
            $('#unitSelectionBox').hide();
        }
    });         

    // Handle project changes
    $('#projectDropdown').on('change', function() {
        const projectId = $(this).val();
        const status = $('#client_status').val();
        
        if (status === 'Booked' && projectId) {
            loadUnits(projectId);
        }
    });


     // Handle employee selection change
     $('#employee_id').on('change', function() {
        const employeeId = $(this).val();
        
        if (employeeId) {
            loadProjectsForEmployee(employeeId);
        } else {
            // Reset to all projects if no employee selected
            $('#projectDropdown').html('<option value="">Select Project</option>');
            <?php $__currentLoopData = Project::all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $project): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                $('#projectDropdown').append('<option value="<?php echo e($project->id); ?>"><?php echo e($project->project_name); ?></option>');
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        }
    });

    // Function to load projects for an employee
    function loadProjectsForEmployee(employeeId) {
        $('#projectDropdown').html('<option value="">Loading projects...</option>');
        
        $.ajax({
            url: '/get-projects-by-employee/' + employeeId,
            type: 'GET',
            success: function(response) {
                let options = '<option value="">Select Project</option>';
                
                if (response.projects && response.projects.length > 0) {
                    $.each(response.projects, function(index, project) {
                        options += `<option value="${project.id}">${project.project_name}</option>`;
                    });
                }
                
                $('#projectDropdown').html(options);
            },
            error: function() {
                $('#projectDropdown').html('<option value="">Error loading projects</option>');
            }
        });
    }

    // If user is employee, load only their projects immediately
    <?php if(Auth::user()->type == 'employee'): ?>
        loadProjectsForEmployee('<?php echo e(Auth::id()); ?>');
    <?php endif; ?>

    // Function to load units for a project
    function loadUnits(projectId) {
        $('#unitDropdown').html('<option value="">Loading units...</option>');
        
        $.ajax({
            url: 'get-units-by-project/' + projectId,
            type: 'GET',
            success: function(response) {
                let options = '<option value="">Select Unit</option>';
                
                if (response.units && response.units.length > 0) {
                    $.each(response.units, function(index, unit) {
                        options += `<option value="${unit.id}">${unit.unit_name}</option>`;
                    });
                }
                
                $('#unitDropdown').html(options);
            },
            error: function() {
                $('#unitDropdown').html('<option value="">Error loading units</option>');
            }
        });
    }

    let feedbackCounter = 1;
    
    $('#addFeedback').click(function(e) {
        e.preventDefault();
        
        let feedbackId = 'feedback_' + feedbackCounter;
        
        let feedbackField = `
            <div class="feedback-group mb-3 p-3 border rounded" id="${feedbackId}">
                <h5>Customer Feedback ${feedbackCounter}</h5>
                <div class="row">
                    <div class="form-group col-md-8">
                        <label class="col-form-label">Feedback Details</label>
                        <textarea name="feedback_information[]" class="form-control" placeholder="Enter feedback details" rows="2"></textarea>
                    </div>
                    <div class="form-group col-md-4">
                        <label class="col-form-label">Follow-up Date</label>
                        <input type="date" name="feedback_followup_date[]" class="form-control">
                    </div>
                </div>
                <button type="button" class="btn btn-danger btn-sm removeFeedback" data-target="${feedbackId}">Remove</button>
            </div>
        `;

        $('#feedbackContainer').append(feedbackField);
        feedbackCounter++;
    });

    // Remove feedback field
    $('#feedbackContainer').on('click', '.removeFeedback', function() {
        const targetId = $(this).data('target');
        $('#' + targetId).remove();
        renumberFeedbacks();
    });

    // Function to renumber feedbacks after one is removed
    function renumberFeedbacks() {
        feedbackCounter = 1;
        $('#feedbackContainer .feedback-group').each(function(index) {
            $(this).find('h5').text('Customer Feedback ' + feedbackCounter);
            feedbackCounter++;
        });
        feedbackCounter = $('#feedbackContainer .feedback-group').length + 1;
    }

    // Form submission function
    function submitForm(form) {
        $.ajax({
            url: form.attr('action'),
            type: form.attr('method'),
            data: form.serialize(),
            success: function(response) {
                $('#commonModal').modal('hide');
                show_toastr('Success', response.message || 'Timesheet created successfully', 'success');
                refreshEnquiryTable();
            },
            error: function(xhr) {
                if (xhr.status === 422) {
                    var errors = xhr.responseJSON.errors;
                    $.each(errors, function(field, messages) {
                        var input = form.find('[name="' + field + '"]');
                        input.addClass('is-invalid');
                        input.after('<div class="invalid-feedback">' + messages[0] + '</div>');
                    });
                } else {
                    show_toastr('Error', xhr.responseJSON?.message || 'Error creating timesheet', 'error');
                }
            }
        });
    }
});
</script>
<?php /**PATH C:\xampp\htdocs\hrm\resources\views/timesheet/create.blade.php ENDPATH**/ ?>