@extends('layouts.admin')

@section('page-title')
    {{ __('Create Employee') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item"><a href="{{ url('employee') }}">{{ __('Employee') }}</a></li>
    <li class="breadcrumb-item">{{ __('Create Employee') }}</li>
@endsection

@push('css')
    <style>
        .cursor-pointer {
            cursor: pointer;
        }
    </style>
@endpush

@section('content')
    <div class="row">
        <div class="">
            <div class="">
                {{ Form::open(['route' => ['employee.store'], 'method' => 'post', 'enctype' => 'multipart/form-data']) }}
                <div class="row">
                    <!-- Personal Details Section -->
                    <div class="col-md-6">
                        <div class="card em-card">
                            <div class="card-header">
                                <h5>{{ __('Personal Detail') }}</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        {!! Form::label('name', __('Name'), ['class' => 'form-label']) !!}<span class="text-danger pl-1">*</span>
                                        {!! Form::text('name', old('name'), [
                                            'class' => 'form-control',
                                            'required' => 'required',
                                            'placeholder' => 'Enter employee name',
                                        ]) !!}
                                    </div>
                                    <div class="form-group col-md-6">
                                        {!! Form::label('phone', __('Phone'), ['class' => 'form-label']) !!}<span class="text-danger pl-1">*</span>
                                        {!! Form::text('phone', old('phone'), [
                                            'class' => 'form-control',
                                            'placeholder' => 'Enter employee phone',
                                            'oninput' => 'validateNumbers()',
                                        ]) !!}
                                        <span id="phone-error" class="text-danger"></span>
                                    </div>

                                    <div class="form-group col-md-6">
                                        {!! Form::label('office_phone_one', __('Office Phone 1'), ['class' => 'form-label']) !!}
                                        {!! Form::text('office_phone_one', old('office_phone_one'), [
                                            'class' => 'form-control',
                                            'placeholder' => 'Enter office phone 1',
                                            'oninput' => 'validateNumbers()',
                                        ]) !!}
                                        <span id="office_phone_one-error" class="text-danger"></span>
                                    </div>

                                    <div class="form-group col-md-6">
                                        {!! Form::label('office_phone_two', __('Office Phone 2'), ['class' => 'form-label']) !!}
                                        {!! Form::text('office_phone_two', old('office_phone_two'), [
                                            'class' => 'form-control',
                                            'placeholder' => 'Enter office phone 2',
                                            'oninput' => 'validateNumbers()',
                                        ]) !!}
                                        <span id="office_phone_two-error" class="text-danger"></span>
                                    </div>

                                    <div class="form-group col-md-6">
                                        {!! Form::label('emergency_number', __('Emergency Number'), ['class' => 'form-label']) !!}<span class="text-danger pl-1">*</span>
                                        {!! Form::text('emergency_number', old('emergency_number'), [
                                            'class' => 'form-control',
                                            'placeholder' => 'Enter emergency number',
                                            'oninput' => 'validateNumbers()',
                                        ]) !!}
                                        <span id="emergency_number-error" class="text-danger"></span>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            {!! Form::label('dob', __('Date of Birth'), ['class' => 'form-label']) !!}<span class="text-danger pl-1">*</span>
                                            {{ Form::date('dob', null, ['class' => 'form-control current_date', 'autocomplete' => 'off', 'placeholder' => 'Select Date of Birth']) }}
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            {!! Form::label('gender', __('Gender'), ['class' => 'form-label']) !!}<span class="text-danger pl-1">*</span>
                                            <div class="d-flex radio-check">
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio" id="g_male" value="Male" name="gender"
                                                        class="form-check-input" >
                                                    <label class="form-check-label "
                                                        for="g_male">{{ __('Male') }}</label>
                                                </div>
                                                <div class="custom-control custom-radio ms-1 custom-control-inline">
                                                    <input type="radio" id="g_female" value="Female" name="gender"
                                                        class="form-check-input">
                                                    <label class="form-check-label "
                                                        for="g_female">{{ __('Female') }}</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        {!! Form::label('email', __('Email'), ['class' => 'form-label']) !!}<span class="text-danger pl-1">*</span>
                                        {!! Form::email('email', old('email'), [
                                            'class' => 'form-control',
                                            'required' => 'required',
                                            'placeholder' => 'Enter employee email',
                                        ]) !!}
                                    </div>
                                    <div class="form-group col-md-6">
                                        {!! Form::label('password', __('Password'), ['class' => 'form-label']) !!}<span class="text-danger pl-1">*</span>
                                        {!! Form::password('password', [
                                            'class' => 'form-control',
                                            'required' => 'required',
                                            'placeholder' => 'Enter employee password',
                                        ]) !!}
                                    </div>
                                </div>
                                <div class="form-group">
                                    {!! Form::label('address', __('Address'), ['class' => 'form-label']) !!}<span class="text-danger pl-1">*</span>
                                    {!! Form::textarea('address', old('address'), [
                                        'class' => 'form-control',
                                        'rows' => 3,
                                        'placeholder' => 'Enter employee address',
                                    ]) !!}
                                </div>
                                <div class="form-group">
                                    <label for="week_off_day">{{ __('Week Off Day') }}</label>
                                    <select name="week_off_day" id="week_off_day" class="form-control">
                                        <option value="Sunday">{{ __('Sunday') }}</option>
                                        <option value="Monday">{{ __('Monday') }}</option>
                                        <option value="Tuesday">{{ __('Tuesday') }}</option>
                                        <option value="Wednesday">{{ __('Wednesday') }}</option>
                                        <option value="Thursday">{{ __('Thursday') }}</option>
                                        <option value="Friday">{{ __('Friday') }}</option>
                                        <option value="Saturday">{{ __('Saturday') }}</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Company Details Section -->
                    <div class="col-md-6">
                        <div class="card em-card">
                            <div class="card-header">
                                <h5>{{ __('Company Detail') }}</h5>
                            </div>
                            <div class="card-body employee-detail-create-body">
                                <div class="row">
                                    @csrf
                                    <div class="form-group">
                                        {!! Form::label('employee_id', __('Employee ID'), ['class' => 'form-label']) !!}
                                        {!! Form::text('employee_id', $employeesId, ['class' => 'form-control', 'disabled' => 'disabled']) !!}
                                    </div>

                                    <div class="form-group col-md-6">
                                        {{ Form::label('branch_id', __('Select Branch*'), ['class' => 'form-label']) }}
                                        <div class="form-icon-user">
                                            {{ Form::select('branch_id', $branches, null, ['class' => 'form-control branch_id', 'id' => 'branch_id', 'required' => 'required']) }}
                                        </div>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <div class="form-icon-user" id="department_id">
                                            {{ Form::label('department_id', __('Department'), ['class' => 'form-label']) }}
                                            <select class="form-control select department_id" name="department_id"
                                                id="department_id" placeholder="Select Department" required>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-6">
                                        {{ Form::label('designation_id', __('Select Designation'), ['class' => 'form-label']) }}
                                        <div class="form-icon-user designation_div">
                                            {{ Form::select('designation_id', $designations, null, ['class' => 'form-control', 'id' => 'designation_id', 'placeholder' => 'Select Designation', 'required' => 'required']) }}
                                        </div>
                                    </div>
                                    
                                   
                                    <div class="form-group">
                                        {!! Form::label('company_doj', __('Company Date Of Joining'), ['class' => 'form-label']) !!}
                                        {{ Form::date('company_doj', null, ['class' => 'form-control current_date', 'autocomplete' => 'off', 'placeholder' => 'Select company date of joining']) }}
                                    </div>
                                </div>
                            </div>
                        </div>
                   
                        <!-- Experience Section -->
                        <!-- Experience Section -->
                        <div class="col-md-12">
                            <div class="card md-12">
                                <div class="card-header">
                                    <h5>{{ __('Total Experience') }}</h5>
                                   
                                </div>
                                <div class="card-body employee-detail-create-body">
                                    <div id="experience-details-container">
                                        <div class="row experience-detail-row mb-3">
                                            <div class="form-group col-md-6">
                                                {!! Form::label('experience[0][previous_company_name]', __('Previous Company Name'), ['class' => 'form-label']) !!}
                                                {!! Form::text('experience[0][previous_company_name]', null, [
                                                    'class' => 'form-control',
                                                    'placeholder' => 'Enter previous company name',
                                                ]) !!}
                                            </div>
                                            <div class="form-group col-md-6">
                                                {!! Form::label('experience[0][previous_designation]', __('Designation'), ['class' => 'form-label']) !!}
                                                {!! Form::text('experience[0][previous_designation]', null, [
                                                    'class' => 'form-control',
                                                    'placeholder' => 'Enter designation',
                                                ]) !!}
                                            </div>
                                            <div class="form-group col-md-6">
                                                {!! Form::label('experience[0][start_date]', __('Start Date'), ['class' => 'form-label']) !!}
                                                {!! Form::date('experience[0][start_date]', null, [
                                                    'class' => 'form-control',
                                                    'placeholder' => 'Select start date',
                                                ]) !!}
                                            </div>
                                            <div class="form-group col-md-6">
                                                {!! Form::label('experience[0][end_date]', __('End Date'), ['class' => 'form-label']) !!}
                                                {!! Form::date('experience[0][end_date]', null, [
                                                    'class' => 'form-control',
                                                    'placeholder' => 'Select end date',
                                                ]) !!}
                                            </div>
                                            <div class="form-group col-md-12">
                                                {!! Form::label('experience[0][previous_salary]', __('Previous Salary'), ['class' => 'form-label']) !!}
                                                {!! Form::number('experience[0][previous_salary]', null, [
                                                    'class' => 'form-control',
                                                    'placeholder' => 'Enter previous salary',
                                                ]) !!}
                                            </div>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Documents and Education Section -->
                <div class="row">
                    <!-- Documents Section -->
                    <div class="col-md-6">
                        <div class="card em-card">
                            <div class="card-header">
                                <h5>{{ __('Document') }}</h5>
                            </div>
                            <div class="card-body employee-detail-create-body">
                                @foreach ($documents as $key => $document)
                                    <div class="row">
                                        <div class="form-group col-12 d-flex">
                                            <div class="float-left col-4">
                                                <label for="document"
                                                    class="float-left pt-1 form-label">{{ $document->name }} @if ($document->is_required == 1)
                                                        <span class="text-danger">*</span>
                                                    @endif
                                                </label>
                                            </div>
                                            <div class="float-right col-8">
                                                <input type="hidden" name="emp_doc_id[{{ $document->id }}]" id=""
                                                    value="{{ $document->id }}">
                                                <div class="choose-files">
                                                    <label for="document[{{ $document->id }}]">
                                                        <div class=" bg-primary document cursor-pointer"> <i
                                                                class="ti ti-upload "></i>{{ __('Choose file here') }}
                                                        </div>
                                                        <input type="file"
                                                            class="form-control file @error('document') is-invalid @enderror"
                                                            @if ($document->is_required == 1) required @endif
                                                            name="document[{{ $document->id }}]"
                                                            id="document[{{ $document->id }}]"
                                                            data-filename="{{ $document->id . '_filename' }}"
                                                            onchange="document.getElementById('{{ 'blah' . $key }}').src = window.URL.createObjectURL(this.files[0])">
                                                    </label>
                                                    <img id="{{ 'blah' . $key }}" src="" width="50%" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
              
                    <!-- Education Section -->
                    <div class="col-md-6">
                        <div class="card em-card">
                            <div class="card-header">
                                <h5>{{ __('Education Details') }}</h5>
                            </div>
                            <div class="card-body employee-detail-create-body">
                                <div id="education-details-container">
                                    <div class="row education-detail-row">
                                        <div class="form-group col-md-6">
                                            {!! Form::label('education[0][college_name]', __('College Name'), ['class' => 'form-label']) !!}
                                            {!! Form::text('education[0][college_name]', null, [
                                                'class' => 'form-control college-name',
                                                'placeholder' => 'Enter college name',
                                            ]) !!}
                                        </div>
                                        <div class="form-group col-md-6">
                                            {!! Form::label('education[0][passing_year]', __('Passing Year'), ['class' => 'form-label']) !!}
                                            <select name="education[0][passing_year]" class="form-control passing-year">
                                                <option value="" disabled selected>{{ __('Select Year') }}</option>
                                                @for ($year = 1997; $year <= 2040; $year++)
                                                    <option value="{{ $year }}">{{ $year }}</option>
                                                @endfor
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            {!! Form::label('education[0][grade]', __('Grade'), ['class' => 'form-label']) !!}
                                            {!! Form::number('education[0][grade]', null, [
                                                'class' => 'form-control grade',
                                                'placeholder' => 'Enter grade (e.g., 4.0)',
                                                'step' => '0.1',
                                                'min' => '0',
                                                'max' => '10',
                                            ]) !!}
                                        </div>
                                        <div class="form-group col-md-6">
                                            {!! Form::label('education[0][degree]', __('Degree'), ['class' => 'form-label']) !!}
                                            <select name="education[0][degree]" class="form-control degree">
                                                <option value="10th">{{ __('10th') }}</option>
                                                <option value="12th">{{ __('12th') }}</option>
                                                <option value="Bachelor">{{ __('Bachelor') }}</option>
                                                <option value="Master">{{ __('Master') }}</option>
                                                <option value="PhD">{{ __('PhD') }}</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-12 text-end">
                                            <button type="button" class="btn btn-danger remove-education-row">
                                                <i class="fa fa-trash"></i> Remove
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mt-3">
                                    <button type="button" class="btn btn-primary add-education-row">
                                        <i class="fa fa-plus"></i> Add Education
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="float-end">
                    <button type="submit" class="btn btn-primary">{{ 'Create' }}</button>
                </div>
                {{ Form::close() }}
            </div>
        </div>
    </div>
@endsection

@push('script-page')
    <script>
        $('input[type="file"]').change(function(e) {
            var file = e.target.files[0].name;
            var file_name = $(this).attr('data-filename');
            $('.' + file_name).append(file);
        });
    </script>
    <script>
        $(document).ready(function() {
            var b_id = $('#branch_id').val();
            // getDepartment(b_id);
        });
        $(document).on('change', 'select[name=branch_id]', function() {
            var branch_id = $(this).val();

            getDepartment(branch_id);
        });

        function getDepartment(bid) {
            $.ajax({
                url: '{{ route('monthly.getdepartment') }}',
                type: 'POST',
                data: {
                    "branch_id": bid,
                    "_token": "{{ csrf_token() }}",
                },
                success: function(data) {
                    $('.department_id').empty();
                    var emp_selct = `<select class="form-control department_id" name="department_id" id="choices-multiple"
                                            placeholder="Select Department" required>
                                            </select>`;
                    $('.department_div').html(emp_selct);

                    $('.department_id').append('<option value=""> {{ __('Select Department') }} </option>');
                    $.each(data, function(key, value) {
                        $('.department_id').append('<option value="' + key + '">' + value +
                            '</option>');
                    });
                    new Choices('#choices-multiple', {
                        removeItemButton: true,
                    });
                }
            });
        }

        $(document).ready(function() {
            var d_id = $('.department_id').val();
            getDesignation(d_id);
        });

        $(document).on('change', 'select[name=department_id]', function() {
            var department_id = $(this).val();
            getDesignation(department_id);
        });

        function getDesignation(did) {
            $.ajax({
                url: '{{ route('employee.json') }}',
                type: 'POST',
                data: {
                    "department_id": did,
                    "_token": "{{ csrf_token() }}",
                },
                success: function(data) {
                    $('.designation_id').empty();
                    var emp_selct = `<select class="form-control designation_id" name="designation_id"
                                                 placeholder="Select Designation" required>
                                            </select>`;
                    $('.designation_div').html(emp_selct);

                    $('.designation_id').append('<option value=""> {{ __('Select Designation') }} </option>');
                    $.each(data, function(key, value) {
                        $('.designation_id').append('<option value="' + key + '">' + value +
                            '</option>');
                    });
                    new Choices('#choices-multiple', {
                        removeItemButton: true,
                    });
                }
            });
        }
    </script>

    <script>
        $(document).ready(function() {
            var now = new Date();
            var month = (now.getMonth() + 1);
            var day = now.getDate();
            if (month < 10) month = "0" + month;
            if (day < 10) day = "0" + day;
            var today = now.getFullYear() + '-' + month + '-' + day;
            $('.current_date').val(today);
        });
    </script>

    <script>
        // Education Details Dynamic Rows
        $(document).ready(function() {
            let educationRowCount = 1;
            
            // Add new education row
            $('.add-education-row').click(function() {
                const newRow = `
                    <div class="row education-detail-row mb-3">
                        <div class="form-group col-md-6">
                            <label class="form-label">College Name</label>
                            <input type="text" name="education[${educationRowCount}][college_name]" 
                                   class="form-control college-name" placeholder="Enter college name">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">Passing Year</label>
                            <select name="education[${educationRowCount}][passing_year]" class="form-control passing-year">
                                <option value="" disabled selected>Select Year</option>
                                @for ($year = 1997; $year <= 2040; $year++)
                                    <option value="{{ $year }}">{{ $year }}</option>
                                @endfor
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">Grade</label>
                            <input type="number" name="education[${educationRowCount}][grade]" 
                                   class="form-control grade" placeholder="Enter grade" step="0.1" min="0" max="10">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">Degree</label>
                            <select name="education[${educationRowCount}][degree]" class="form-control degree">
                                <option value="10th">10th</option>
                                <option value="12th">12th</option>
                                <option value="Bachelor">Bachelor</option>
                                <option value="Master">Master</option>
                                <option value="PhD">PhD</option>
                            </select>
                        </div>
                        <div class="form-group col-md-12 text-end">
                            <button type="button" class="btn btn-danger remove-education-row">
                                <i class="fa fa-trash"></i> Remove
                            </button>
                        </div>
                    </div>
                `;
                
                $('#education-details-container').append(newRow);
                educationRowCount++;
            });
            
            // Remove education row
            $(document).on('click', '.remove-education-row', function() {
                $(this).closest('.education-detail-row').remove();
            });

            // Experience Details Dynamic Rows
            // Experience Details Dynamic Rows
            let experienceRowCount = 1;

            // Add new experience row
            $(document).on('click', '.add-experience-row', function() {
                const newRow = `
                    <div class="row experience-detail-row mb-3">
                        <div class="form-group col-md-6">
                            <label class="form-label">Previous Company Name</label>
                            <input type="text" name="experience[${experienceRowCount}][previous_company_name]" 
                                class="form-control" placeholder="Enter previous company name">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">Designation</label>
                            <input type="text" name="experience[${experienceRowCount}][designation]" 
                                class="form-control" placeholder="Enter designation">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">Start Date</label>
                            <input type="date" name="experience[${experienceRowCount}][start_date]" 
                                class="form-control" placeholder="Select start date">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">End Date</label>
                            <input type="date" name="experience[${experienceRowCount}][end_date]" 
                                class="form-control" placeholder="Select end date">
                        </div>
                        <div class="form-group col-md-12">
                            <label class="form-label">Previous Salary</label>
                            <input type="number" name="experience[${experienceRowCount}][previous_salary]" 
                                class="form-control" placeholder="Enter previous salary">
                        </div>
                        <div class="form-group col-md-12 text-end">
                            <button type="button" class="btn btn-danger remove-experience-row">
                                <i class="fa fa-trash"></i> Remove
                            </button>
                        </div>
                    </div>
                `;
                
                $('#experience-details-container').append(newRow);
                experienceRowCount++;
            });

            // Remove experience row
            $(document).on('click', '.remove-experience-row', function() {
                $(this).closest('.experience-detail-row').remove();
            });
        });

        // Phone number validation
        function validateNumbers() {
            const phone = document.getElementsByName('phone')[0].value;
            const officePhoneOne = document.getElementsByName('office_phone_one')[0].value;
            const officePhoneTwo = document.getElementsByName('office_phone_two')[0].value;
            const emergencyNumber = document.getElementsByName('emergency_number')[0].value;

            const numbers = [phone, officePhoneOne, officePhoneTwo, emergencyNumber];
            const errorIds = ['phone-error', 'office_phone_one-error', 'office_phone_two-error', 'emergency_number-error'];
            
            // Clear previous errors
            errorIds.forEach(id => document.getElementById(id).innerText = '');
            
            // Check for duplicates
            for (let i = 0; i < numbers.length; i++) {
                if (numbers[i]) {
                    for (let j = 0; j < numbers.length; j++) {
                        if (i !== j && numbers[i] && numbers[i] === numbers[j]) {
                            document.getElementById(errorIds[i]).innerText = 'Do not use the same number in multiple fields.';
                            document.getElementById(errorIds[j]).innerText = 'Do not use the same number in multiple fields.';
                        }
                    }
                }
            }
        }

        // Project dropdown change event
        document.addEventListener('DOMContentLoaded', function () {
            const projectDropdown = document.getElementById('project_id');
            const siteDropdown = document.getElementById('site_id');

            if (projectDropdown && siteDropdown) {
                projectDropdown.addEventListener('change', function () {
                    const projectId = this.value;

                    // Clear the Site dropdown and show a loading message
                    siteDropdown.innerHTML = '<option value="">Loading...</option>';

                    if (projectId) {
                        // Fetch sites for the selected project
                        fetch(`/get-sites-by-project/${projectId}`)
                            .then(response => response.json())
                            .then(data => {
                                siteDropdown.innerHTML = '<option value="">Select Site</option>';
                                data.sites.forEach(site => {
                                    const option = document.createElement('option');
                                    option.value = site.id;
                                    option.textContent = site.name;
                                    siteDropdown.appendChild(option);
                                });
                            })
                            .catch(error => {
                                console.error('Error fetching sites:', error);
                                siteDropdown.innerHTML = '<option value="">Error loading sites</option>';
                            });
                    } else {
                        siteDropdown.innerHTML = '<option value="">Select Project First</option>';
                    }
                });
            }
        });
    </script>
@endpush