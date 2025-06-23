@extends('layouts.admin')

@section('page-title')
    {{ __('Edit Employee') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item"><a href="{{ url('employee') }}">{{ __('Employee') }}</a></li>
    <li class="breadcrumb-item">{{ __('Edit Employee') }}</li>
@endsection

@push('css')
    <style>
        .cursor-pointer {
            cursor: pointer;
        }
        .document-preview {
            max-width: 200px;
            max-height: 200px;
            margin-top: 10px;
        }
    </style>
@endpush

@section('content')
    <div class="row">
        <div class="">
            <div class="">
                {{ Form::model($employee, ['route' => ['employee.update', $employee->id], 'method' => 'put', 'enctype' => 'multipart/form-data']) }}
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
                                            {{ Form::date('dob', $employee->dob, ['class' => 'form-control', 'autocomplete' => 'off', 'placeholder' => 'Select Date of Birth']) }}
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            {!! Form::label('gender', __('Gender'), ['class' => 'form-label']) !!}<span class="text-danger pl-1">*</span>
                                            <div class="d-flex radio-check">
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio" id="g_male" value="Male" name="gender"
                                                        class="form-check-input" {{ $employee->gender == 'Male' ? 'checked' : '' }} >
                                                    <label class="form-check-label"
                                                        for="g_male">{{ __('Male') }}</label>
                                                </div>
                                                <div class="custom-control custom-radio ms-1 custom-control-inline">
                                                    <input type="radio" id="g_female" value="Female" name="gender"
                                                        class="form-check-input" {{ $employee->gender == 'Female' ? 'checked' : '' }}>
                                                    <label class="form-check-label"
                                                        for="g_female">{{ __('Female') }}</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        {!! Form::label('email', __('Email'), ['class' => 'form-label']) !!}<span class="text-danger pl-1">*</span>
                                        {!! Form::email('email', old('email'), [
                                            'class' => 'form-control',
                                            'placeholder' => 'Enter employee email',
                                        ]) !!}
                                    </div>
                                    <div class="form-group col-md-6">
                                        {!! Form::label('password', __('Password'), ['class' => 'form-label']) !!}
                                        {!! Form::password('password', [
                                            'class' => 'form-control',
                                            'placeholder' => 'Enter new password (leave blank to keep current)',
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
                                        <option value="Sunday" {{ $employee->week_off_day == 'Sunday' ? 'selected' : '' }}>{{ __('Sunday') }}</option>
                                        <option value="Monday" {{ $employee->week_off_day == 'Monday' ? 'selected' : '' }}>{{ __('Monday') }}</option>
                                        <option value="Tuesday" {{ $employee->week_off_day == 'Tuesday' ? 'selected' : '' }}>{{ __('Tuesday') }}</option>
                                        <option value="Wednesday" {{ $employee->week_off_day == 'Wednesday' ? 'selected' : '' }}>{{ __('Wednesday') }}</option>
                                        <option value="Thursday" {{ $employee->week_off_day == 'Thursday' ? 'selected' : '' }}>{{ __('Thursday') }}</option>
                                        <option value="Friday" {{ $employee->week_off_day == 'Friday' ? 'selected' : '' }}>{{ __('Friday') }}</option>
                                        <option value="Saturday" {{ $employee->week_off_day == 'Saturday' ? 'selected' : '' }}>{{ __('Saturday') }}</option>
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
                                        {!! Form::text('employee_id', \Auth::user()->employeeIdFormat($employee->employee_id), ['class' => 'form-control', 'disabled' => 'disabled']) !!}
                                    </div>

                                    <div class="form-group col-md-6">
                                        {{ Form::label('branch_id', __('Select Branch*'), ['class' => 'form-label']) }}
                                        <div class="form-icon-user">
                                            {{ Form::select('branch_id', $branches, $employee->branch_id, ['class' => 'form-control branch_id', 'id' => 'branch_id']) }}
                                        </div>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <div class="form-icon-user" id="department_id">
                                            {{ Form::label('department_id', __('Department'), ['class' => 'form-label']) }}
                                            <select class="form-control select department_id" name="department_id"
                                                id="department_id" placeholder="Select Department" >
                                                @foreach($departments as $id => $department)
                                                    <option value="{{ $id }}" {{ $employee->department_id == $id ? 'selected' : '' }}>{{ $department }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-6">
                                        {{ Form::label('designation_id', __('Select Designation'), ['class' => 'form-label']) }}
                                        <div class="form-icon-user designation_div">
                                            {{ Form::select('designation_id', $designations, $employee->designation_id, ['class' => 'form-control', 'id' => 'designation_id', 'placeholder' => 'Select Designation']) }}
                                        </div>
                                    </div>
                                    
                                    <div class="form-group col-md-6">
                                  
                                    <div class="form-group">
                                        {!! Form::label('company_doj', __('Company Date Of Joining'), ['class' => 'form-label']) !!}
                                        {{ Form::date('company_doj', $employee->company_doj, ['class' => 'form-control', 'autocomplete' => 'off', 'placeholder' => 'Select company date of joining']) }}
                                    </div>
                                </div>
                            </div>
                        </div>
                   
                        <!-- Experience Section -->
                        <div class="col-md-12">
                            <div class="card md-12">
                                <div class="card-header">
                                    <h5>{{ __('Total Experience') }}</h5>
                                   
                                </div>
                                <div class="card-body employee-detail-create-body">
                                    <div id="experience-details-container">
                                        @if(!empty($experiences))
                                            @foreach($experiences as $key => $experience)
                                                <div class="row experience-detail-row mb-3">
                                                    <div class="form-group col-md-6">
                                                        {!! Form::label("experience[$key][previous_company_name]", __('Previous Company Name'), ['class' => 'form-label']) !!}
                                                        {!! Form::text("experience[$key][previous_company_name]", $experience['previous_company_name'] ?? null, [
                                                            'class' => 'form-control',
                                                            'placeholder' => 'Enter previous company name',
                                                        ]) !!}
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        {!! Form::label("experience[$key][previous_designation]", __('Designation'), ['class' => 'form-label']) !!}
                                                        {!! Form::text("experience[$key][previous_designation]", $experience['previous_designation'] ?? null, [
                                                            'class' => 'form-control',
                                                            'placeholder' => 'Enter designation',
                                                        ]) !!}
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        {!! Form::label("experience[$key][start_date]", __('Start Date'), ['class' => 'form-label']) !!}
                                                        {!! Form::date("experience[$key][start_date]", $experience['start_date'] ?? null, [
                                                            'class' => 'form-control',
                                                            'placeholder' => 'Select start date',
                                                        ]) !!}
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        {!! Form::label("experience[$key][end_date]", __('End Date'), ['class' => 'form-label']) !!}
                                                        {!! Form::date("experience[$key][end_date]", $experience['end_date'] ?? null, [
                                                            'class' => 'form-control',
                                                            'placeholder' => 'Select end date',
                                                        ]) !!}
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        {!! Form::label("experience[$key][previous_salary]", __('Previous Salary'), ['class' => 'form-label']) !!}
                                                        {!! Form::number("experience[$key][previous_salary]", $experience['previous_salary'] ?? null, [
                                                            'class' => 'form-control',
                                                            'placeholder' => 'Enter previous salary',
                                                        ]) !!}
                                                    </div>
                                                 
                                                </div>
                                            @endforeach
                                        @else
                                            <div class="row experience-detail-row mb-3">
                                                <div class="form-group col-md-6">
                                                    {!! Form::label('experience[0][previous_company_name]', __('Previous Company Name'), ['class' => 'form-label']) !!}
                                                    {!! Form::text('experience[0][previous_company_name]', null, [
                                                        'class' => 'form-control',
                                                        'placeholder' => 'Enter previous company name',
                                                    ]) !!}
                                                </div>
                                                <div class="form-group col-md-6">
                                                    {!! Form::label("experience[0][previous_designation]", __('Designation'), ['class' => 'form-label']) !!}
                                                    {!! Form::text("experience[0][previous_designation]", $experience['previous_designation'] ?? null, [
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
                                                <div class="form-group col-md-12 text-end">
                                                    <button type="button" class="btn btn-danger remove-experience-row">
                                                        <i class="fa fa-trash"></i> Remove
                                                    </button>
                                                </div>
                                            </div>
                                        @endif
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
                                                    @php
                                                        $employeeDoc = $employee->documents()->where('document_id', $document->id)->first();
                                                    @endphp
                                                    @if($employeeDoc && $employeeDoc->document_value)
                                                        <div class="mt-2">
                                                            <a href="{{ asset(Storage::url('document/' . $employeeDoc->document_value)) }}" target="_blank" class="btn btn-sm btn-primary">
                                                                <i class="ti ti-download"></i> Download
                                                            </a>
                                                            <img id="{{ 'blah' . $key }}" src="{{ asset(Storage::url('document/' . $employeeDoc->document_value)) }}" class="document-preview" />
                                                        </div>
                                                    @else
                                                        <img id="{{ 'blah' . $key }}" src="" class="document-preview" style="display:none;" />
                                                    @endif
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
                                    @if(!empty($educations))
                                        @foreach($educations as $key => $education)
                                            <div class="row education-detail-row mb-3">
                                                <div class="form-group col-md-6">
                                                    {!! Form::label("education[$key][college_name]", __('College Name'), ['class' => 'form-label']) !!}
                                                    {!! Form::text("education[$key][college_name]", $education['college_name'] ?? null, [
                                                        'class' => 'form-control college-name',
                                                        'placeholder' => 'Enter college name',
                                                    ]) !!}
                                                </div>
                                                <div class="form-group col-md-6">
                                                    {!! Form::label("education[$key][passing_year]", __('Passing Year'), ['class' => 'form-label']) !!}
                                                    <select name="education[{{ $key }}][passing_year]" class="form-control passing-year">
                                                        <option value="" disabled selected>{{ __('Select Year') }}</option>
                                                        @for ($year = 1997; $year <= 2040; $year++)
                                                            <option value="{{ $year }}" {{ (isset($education['passing_year']) && $education['passing_year'] == $year) ? 'selected' : '' }}>{{ $year }}</option>
                                                        @endfor
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    {!! Form::label("education[$key][grade]", __('Grade'), ['class' => 'form-label']) !!}
                                                    {!! Form::number("education[$key][grade]", $education['grade'] ?? null, [
                                                        'class' => 'form-control grade',
                                                        'placeholder' => 'Enter grade (e.g., 4.0)',
                                                        'step' => '0.1',
                                                        'min' => '0',
                                                        'max' => '10',
                                                    ]) !!}
                                                </div>
                                                <div class="form-group col-md-6">
                                                    {!! Form::label("education[$key][degree]", __('Degree'), ['class' => 'form-label']) !!}
                                                    <select name="education[{{ $key }}][degree]" class="form-control degree">
                                                        <option value="10th" {{ (isset($education['degree']) && $education['degree'] == '10th' ? 'selected' : '') }}>{{ __('10th') }}</option>
                                                        <option value="12th" {{ (isset($education['degree']) && $education['degree'] == '12th' ? 'selected' : '') }}>{{ __('12th') }}</option>
                                                        <option value="Bachelor" {{ (isset($education['degree']) && $education['degree'] == 'Bachelor' ? 'selected' : '') }}>{{ __('Bachelor') }}</option>
                                                        <option value="Master" {{ (isset($education['degree']) && $education['degree'] == 'Master' ? 'selected' : '') }}>{{ __('Master') }}</option>
                                                        <option value="PhD" {{ (isset($education['degree']) && $education['degree'] == 'PhD' ? 'selected' : '') }}>{{ __('PhD') }}</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-12 text-end">
                                                    <button type="button" class="btn btn-danger remove-education-row">
                                                        <i class="fa fa-trash"></i> Remove
                                                    </button>
                                                </div>
                                            </div>
                                        @endforeach
                                    @else
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
                                    @endif
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
                    <button type="submit" class="btn btn-primary">{{ 'Update' }}</button>
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
            if(d_id) {
                getDesignation(d_id);
            }
            
            // Set the initial selected designation
            var initialDesignation = '{{ $employee->designation_id }}';
            if(initialDesignation) {
                $('#designation_id').val(initialDesignation);
            }
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
                    $('.designation_id').append('<option value=""> {{ __('Select Designation') }} </option>');
                    $.each(data, function(key, value) {
                        $('.designation_id').append('<option value="' + key + '">' + value + '</option>');
                    });
                    
                    // Set the selected value after populating the dropdown
                    var selectedDesignation = '{{ $employee->designation_id }}';
                    if (selectedDesignation) {
                        $('.designation_id').val(selectedDesignation);
                    }
                }
            });
        }
    </script>

    <script>
        // Education Details Dynamic Rows
        $(document).ready(function() {
            let educationRowCount = {{ !empty($educations) ? count($educations) : 1 }};
            
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
            let experienceRowCount = {{ !empty($experiences) ? count($experiences) : 1 }};

            
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