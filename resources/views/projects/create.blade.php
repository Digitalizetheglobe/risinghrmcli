@php
    $setting = App\Models\Utility::settings();
@endphp

{{ Form::open(['route' => ['projects.store'], 'id' => 'projectForm', 'class' => 'needs-validation', 'novalidate' => 'novalidate']) }}
@csrf

<div class="modal-body">
    <div class="row">
        <!-- Project Name Field -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                {{ Form::label('project_name', __('Project Name'), ['class' => 'form-label']) }}
                <div class="form-icon-user">
                    {{ Form::text('project_name', null, ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Enter Project Name')]) }}
                </div>
            </div>
        </div>

        <!-- Location Field -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                {{ Form::label('location', __('Location'), ['class' => 'form-label']) }}
                <div class="form-icon-user">
                    {{ Form::text('location', null, ['class' => 'form-control', 'placeholder' => __('Enter Location')]) }}
                </div>
            </div>
        </div>

        <!-- Project Start Date Field -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                {{ Form::label('project_startdate', __('Project Start Date'), ['class' => 'form-label']) }}
                <div class="form-icon-user">
                    {{ Form::date('project_startdate', null, ['class' => 'form-control', 'required' => 'required', 'autocomplete' => 'off']) }}
                </div>
            </div>
        </div>

        <!-- Project End Date Field -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                {{ Form::label('project_enddate', __('Project End Date'), ['class' => 'form-label']) }}
                <div class="form-icon-user">
                    {{ Form::date('project_enddate', null, ['class' => 'form-control','autocomplete' => 'off']) }}
                </div>
            </div>
        </div>

        <!-- Departments Multi-Select Field -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                {{ Form::label('department_id', __('Department'), ['class' => 'form-label']) }}
                <div class="form-icon-user">
                    <select class="form-control" name="department_id" id="department_id" required>
                        <option value="">{{ __('Select Department') }}</option>
                        @foreach ($departments as $department)
                            <option value="{{ $department->id }}">{{ $department->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>

        <!-- Employee Selection -->
        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                {{ Form::label('employee_id', __('Employee'), ['class' => 'form-label']) }}
                <div class="form-icon-user">
                    <select class="form-control" id="employee_id">
                        <option value="">{{ __('Select Employee') }}</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Hidden field for assigned_data -->
        <input type="hidden" name="assigned_data" id="assignedData">

        <!-- Selected Assignments Box -->
        <div class="col-md-12 mt-3">
            <div class="form-group">
                <label class="form-label">{{ __('Selected Assignments') }}</label>
                <div id="selectedAssignmentsBox" class="p-2 border rounded bg-light" style="min-height: 100px;">
                    <div class="text-muted">{{ __('No assignments selected.') }}</div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal-footer">
    <input type="button" value="Cancel" class="btn btn-light" data-bs-dismiss="modal">
    <input type="submit" value="{{ __('Create') }}" class="btn btn-primary">
</div>
{{ Form::close() }}

<script>
$(document).ready(function() {
    // Initialize data structure
    let assignments = []; // Array of { department_id, department_name, employees: [] }
    let allEmployees = {}; // Cache of employees by department: { deptId: [employee1, employee2] }

    // Load employees when department changes
    $('#department_id').change(function() {
        const departmentId = $(this).val();
        if (!departmentId) return;

        // Check if we already have this department's employees cached
        if (allEmployees[departmentId]) {
            updateEmployeeDropdown(departmentId);
            return;
        }

        $.ajax({
            url: '{{ route("get-employees-by-department", "") }}/' + departmentId,
            type: 'GET',
            success: function(data) {
                // Cache the employees for this department
                allEmployees[departmentId] = data;
                updateEmployeeDropdown(departmentId);
            },
            error: function(xhr) {
                console.error('Error loading employees:', xhr);
                $('#employee_id').html('<option value="">{{ __("Error loading employees") }}</option>');
            }
        });
    });

    // Update employee dropdown based on current department and selected employees
    function updateEmployeeDropdown(departmentId) {
        const currentEmployees = allEmployees[departmentId] || [];
        const selectedInDepartment = assignments
            .filter(a => a.department_id == departmentId)
            .flatMap(a => a.employees.map(e => e.id));

        let options = '<option value="">{{ __("Select Employee") }}</option>';
        
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
        const employeeName = $(this).find('option:selected').text();
        const departmentId = $('#department_id').val();
        const departmentName = $('#department_id option:selected').text();

        if (!employeeId || !departmentId) return;

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
            container.html('<div class="text-muted">{{ __("No assignments selected.") }}</div>');
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
                employeesContainer.append('<span class="text-muted small">{{ __("No employees selected") }}</span>');
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

    // For edit view - pre-populate assignments if editing
    @if(isset($project) && $project->assigned_data)
        // First load all departments with their employees
        const departmentIds = {!! json_encode(collect($project->assigned_data)->pluck('department_id')->unique()) !!};
        
        // Fetch all needed employees in one query
        $.ajax({
            url: '{{ route("get-employees-by-departments") }}',
            type: 'POST',
            data: {
                department_ids: departmentIds,
                _token: '{{ csrf_token() }}'
            },
            success: function(data) {
                // Cache all employees by department
                data.forEach(dept => {
                    allEmployees[dept.department_id] = dept.employees;
                });
                
                // Now populate assignments
                assignments = {!! json_encode(
                    collect($project->assigned_data)->map(function($item) {
                        $department = Department::find($item['department_id']);
                        return [
                            'department_id' => $item['department_id'],
                            'department_name' => $department ? $department->name : 'Unknown',
                            'employees' => Employee::whereIn('id', $item['employee_ids'])
                                ->get()
                                ->map(function($emp) {
                                    return ['id' => $emp->id, 'name' => $emp->name];
                                })
                                ->toArray()
                        ];
                    })
                ) !!};
                
                updateAssignmentsUI();
                
                // Set the first department as selected
                if (assignments.length > 0) {
                    $('#department_id').val(assignments[0].department_id).trigger('change');
                }
            },
            error: function(xhr) {
                console.error('Error loading employees for edit:', xhr);
            }
        });
    @endif
});
</script>