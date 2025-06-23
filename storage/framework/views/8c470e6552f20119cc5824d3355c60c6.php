<?php
    $setting = App\Models\Utility::settings();
?>

<?php echo e(Form::model($project, ['route' => ['projects.update', $project->id], 'method' => 'PUT', 'id' => 'projectForm', 'class' => 'needs-validation', 'novalidate' => 'novalidate', 'enctype' => 'multipart/form-data'])); ?>

<?php echo csrf_field(); ?>

<div class="modal-body">
    <div class="row">
        <!-- Project Name Field -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('project_name', __('Project Name'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::text('project_name', null, ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Enter Project Name')])); ?>

                </div>
            </div>
        </div>

        <!-- Location Field -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('location', __('Location'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::text('location', null, ['class' => 'form-control', 'placeholder' => __('Enter Location')])); ?>

                </div>
            </div>
        </div>

        <!-- Project Start Date Field -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('project_startdate', __('Project Start Date'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::date('project_startdate', $project->project_startdate ? \Carbon\Carbon::parse($project->project_startdate)->format('Y-m-d') : null, ['class' => 'form-control', 'required' => 'required', 'autocomplete' => 'off'])); ?>

                </div>
            </div>
        </div>

        <!-- Project End Date Field -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('project_enddate', __('Project End Date'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <?php echo e(Form::date('project_enddate', $project->project_enddate ? \Carbon\Carbon::parse($project->project_enddate)->format('Y-m-d') : null, ['class' => 'form-control', 'required' => 'required', 'autocomplete' => 'off'])); ?>

                </div>
            </div>
        </div>

        <!-- Departments Multi-Select Field -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('department_id', __('Department'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <select class="form-control" name="department_id" id="department_id" required>
                        <option value=""><?php echo e(__('Select Department')); ?></option>
                        <?php $__currentLoopData = $departments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $department): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($department->id); ?>" <?php if($project->department_id == $department->id): ?> selected <?php endif; ?>>
                                <?php echo e($department->name); ?>

                            </option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>
            </div>
        </div>

        <!-- Employee Selection -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                <?php echo e(Form::label('employee_id', __('Employee'), ['class' => 'form-label'])); ?>

                <div class="form-icon-user">
                    <select class="form-control" id="employee_id">
                        <option value=""><?php echo e(__('Select Employee')); ?></option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Hidden field for assigned_data -->
        <input type="hidden" name="assigned_data" id="assignedData" value="<?php echo e(json_encode($project->assigned_data)); ?>">

        <!-- Selected Assignments Box -->
        <div class="col-md-12 mt-3">
            <div class="form-group">
                <label class="form-label"><?php echo e(__('Selected Assignments')); ?></label>
                <div id="selectedAssignmentsBox" class="p-2 border rounded bg-light" style="min-height: 100px;">
                <?php if(is_array($project->assigned_data) && count($project->assigned_data) > 0): ?>
    <?php $__currentLoopData = $project->assigned_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $assignment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <?php    
            $department = \App\Models\Department::find($assignment['department_id']);
            $employees = \App\Models\Employee::whereIn('id', $assignment['employee_ids'] ?? [])->get();
        ?>
        <div class="mb-3 assignment-group" data-dept-id="<?php echo e($assignment['department_id']); ?>">
            <h6 class="mb-1"><?php echo e($department ? $department->name : 'Unknown Department'); ?></h6>
            <div class="d-flex flex-wrap employees-container">
                <?php $__currentLoopData = $employees; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $employee): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <span class="badge bg-primary me-1 mb-1 employee-badge" 
                          data-dept-id="<?php echo e($assignment['department_id']); ?>" 
                          data-emp-id="<?php echo e($employee->id); ?>">
                        <?php echo e($employee->name); ?>

                        <i class="fas fa-times ms-1 remove-employee" style="cursor: pointer;"></i>
                    </span>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php else: ?>
    <div class="text-muted"><?php echo e(__('No assignments selected.')); ?></div>
<?php endif; ?>
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


<script>
$(document).ready(function() {
    // Initialize data structure
    let assignments = [];
    let allEmployees = {};

    // Initialize assignments from the hidden field
    const initialAssignments = JSON.parse($('#assignedData').val());
    
    // First, build our assignments array from the initial data
    if (initialAssignments && initialAssignments.length > 0) {
        initialAssignments.forEach(assignment => {
            // Find the department name
            const department = $('#department_id option[value="' + assignment.department_id + '"]');
            const departmentName = department.length ? department.text() : 'Unknown Department';
            
            // Get employee names from the rendered badges
            const employees = [];
            $('.employee-badge[data-dept-id="' + assignment.department_id + '"]').each(function() {
                employees.push({
                    id: $(this).data('emp-id'),
                    name: $(this).text().trim().replace('×', '').trim()
                });
            });

            assignments.push({
                department_id: assignment.department_id,
                department_name: departmentName,
                employees: employees
            });
        });

        // Set the first department as selected in dropdown
        if (assignments.length > 0) {
            $('#department_id').val(assignments[0].department_id);
        }
    }

    // Load employees when department changes
    $('#department_id').change(function() {
        const departmentId = $(this).val();
        if (!departmentId) {
            $('#employee_id').html('<option value=""><?php echo e(__("Select Employee")); ?></option>');
            return;
        }

        // Check if we already have this department's employees cached
        if (allEmployees[departmentId]) {
            updateEmployeeDropdown(departmentId);
            return;
        }

        $.ajax({
            url: '<?php echo e(route("get-employees-by-department", "")); ?>/' + departmentId,
            type: 'GET',
            success: function(data) {
                // Cache the employees for this department
                allEmployees[departmentId] = data;
                updateEmployeeDropdown(departmentId);
            },
            error: function(xhr) {
                console.error('Error loading employees:', xhr);
                $('#employee_id').html('<option value=""><?php echo e(__("Error loading employees")); ?></option>');
            }
        });
    });

    // Update employee dropdown based on current department and selected employees
    function updateEmployeeDropdown(departmentId) {
        const currentEmployees = allEmployees[departmentId] || [];
        const selectedInDepartment = [];
        
        // Get all selected employee IDs for this department
        assignments.forEach(assignment => {
            if (assignment.department_id == departmentId) {
                assignment.employees.forEach(emp => {
                    selectedInDepartment.push(emp.id.toString());
                });
            }
        });

        let options = '<option value=""><?php echo e(__("Select Employee")); ?></option>';
        
        currentEmployees.forEach(employee => {
            // Only show employees not already selected in this department
            if (!selectedInDepartment.includes(employee.id.toString())) {
                options += `<option value="${employee.id}">${employee.name}</option>`;
            }
        });

        $('#employee_id').html(options);
    }

    // Add employee to assignment
    $('#employee_id').change(function() {
        const employeeId = $(this).val();
        if (!employeeId) return;
        
        const employeeName = $(this).find('option:selected').text();
        const departmentId = $('#department_id').val();
        const departmentName = $('#department_id option:selected').text();

        if (!departmentId) return;

        // Find or create department assignment
        let assignment = assignments.find(a => a.department_id == departmentId);
        if (!assignment) {
            assignment = {
                department_id: departmentId,
                department_name: departmentName,
                employees: []
            };
            assignments.push(assignment);
        }

        // Add employee if not already exists
        if (!assignment.employees.some(e => e.id == employeeId)) {
            assignment.employees.push({
                id: employeeId,
                name: employeeName
            });
            updateAssignmentsUI();
            updateEmployeeDropdown(departmentId); // Refresh dropdown
        }

        $(this).val('');
    });

    // Update the assignments UI and hidden field
    function updateAssignmentsUI() {
        const container = $('#selectedAssignmentsBox');
        container.empty();

        if (assignments.length === 0) {
            container.html('<div class="text-muted"><?php echo e(__("No assignments selected.")); ?></div>');
            $('#assignedData').val(JSON.stringify([]));
            return;
        }

        assignments.forEach(assignment => {
            const deptDiv = $(`
                <div class="mb-3 assignment-group" data-dept-id="${assignment.department_id}">
                    <h6 class="mb-1">${assignment.department_name}</h6>
                    <div class="d-flex flex-wrap employees-container"></div>
                </div>
            `);

            const employeesContainer = deptDiv.find('.employees-container');
            
            if (assignment.employees.length === 0) {
                employeesContainer.append('<span class="text-muted small"><?php echo e(__("No employees selected")); ?></span>');
            } else {
                assignment.employees.forEach(employee => {
                    employeesContainer.append(`
                        <span class="badge bg-primary me-1 mb-1 employee-badge" 
                              data-dept-id="${assignment.department_id}" 
                              data-emp-id="${employee.id}">
                            ${employee.name}
                            <i class="fas fa-times ms-1 remove-employee" style="cursor: pointer;"></i>
                        </span>
                    `);
                });
            }

            container.append(deptDiv);
        });

        // Update hidden field with the current assignments
        const formattedData = assignments.map(assignment => ({
            department_id: assignment.department_id,
            employee_ids: assignment.employees.map(emp => emp.id)
        }));
        
        $('#assignedData').val(JSON.stringify(formattedData));
    }

    // Remove employee from assignment
    $(document).on('click', '.remove-employee', function() {
        const badge = $(this).closest('.employee-badge');
        const departmentId = badge.data('dept-id');
        const employeeId = badge.data('emp-id');

        // Find the assignment
        const assignment = assignments.find(a => a.department_id == departmentId);
        if (assignment) {
            // Remove the employee
            assignment.employees = assignment.employees.filter(e => e.id != employeeId);
            
            // If no more employees, remove the entire assignment
            if (assignment.employees.length === 0) {
                assignments = assignments.filter(a => a.department_id != departmentId);
            }
            
            updateAssignmentsUI();
            updateEmployeeDropdown(departmentId); // Refresh dropdown
        }
    });

    // Trigger initial department load if we have assignments
    if (assignments.length > 0) {
        $('#department_id').trigger('change');
    }

    // Form submission handler to ensure data is properly sent
    $('#projectForm').on('submit', function(e) {
        e.preventDefault();

        // Final update of assigned_data before submission
        const formattedData = assignments.map(assignment => ({
            department_id: assignment.department_id,
            employee_ids: assignment.employees.map(emp => emp.id)
        }));
        $('#assignedData').val(JSON.stringify(formattedData));

        // Remove current handler and submit
        $(this).off('submit').submit();
    });

});
</script><?php /**PATH C:\xampp\htdocs\hrm\resources\views/projects/edit.blade.php ENDPATH**/ ?>