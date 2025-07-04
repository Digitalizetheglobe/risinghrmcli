@extends('layouts.admin')

@section('page-title')
    {{ __('Employee Profile') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item">{{ __('Employee Profile') }}</li>
@endsection

@section('action-button')
    <a class="btn btn-sm btn-primary collapsed" data-bs-toggle="collapse" href="#multiCollapseExample1" role="button"
        aria-expanded="false" aria-controls="multiCollapseExample1" data-bs-toggle="tooltip" title="{{ __('Filter') }}">
        <i class="ti ti-filter"></i>
    </a>
@endsection


@php
    // $profile = asset(Storage::url('uploads/avatar/'));
    $profile = \App\Models\Utility::get_file('uploads/avatar/');

@endphp
@section('content')
    <div class="row">
        <div class="col-sm-12">
            <div class="multi-collapse mt-2 collapse" id="multiCollapseExample1">
                <div class="card">
                    <div class="card-body">
                        {{ Form::open(['route' => ['employee.profile'], 'method' => 'get', 'id' => 'employee_profile_filter']) }}
                        <div class="row align-items-center justify-content-end">
                            <div class="col-xl-10">
                                <div class="row">
                                    <div class="col-xl-4 col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="btn-box">
                                            {{ Form::label('branch', __('Select Branch*'), ['class' => 'form-label']) }}
                                            {{ Form::select('branch', $brances, isset($_GET['branch']) ? $_GET['branch'] : '', ['class' => ' select-width form-control', 'id' => 'branch_id']) }}
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="btn-box">
                                            <div class="btn-box" id="department_id">
                                                {{ Form::label('department', __('Department'), ['class' => 'form-label']) }}
                                                <select class="form-control select department_id" name="department"
                                                    id="department_id" placeholder="Select Department">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-3 col-md-6 col-sm-12 col-12">
                                        <div class="btn-box">
                                            {{ Form::label('designation', __('Designation'), ['class' => 'form-label']) }}
                                            <select class="  select-width select2-multiple form-control" id="designation_id"
                                                name="designation" data-placeholder="{{ __('Select Designation ...') }}">
                                                <option value="">{{ __('Designation') }}</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <div class="row">
                                    <div class="col-auto mt-4">
                                        <a href="#" class="btn btn-sm btn-primary"
                                            onclick="document.getElementById('employee_profile_filter').submit(); return false;"
                                            data-bs-toggle="tooltip" title="" data-bs-original-title="Apply">
                                            <span class="btn-inner--icon"><i class="ti ti-search"></i></span>
                                        </a>
                                        <a href="{{ route('employee.profile') }}" class="btn btn-sm btn-danger"
                                            data-bs-toggle="tooltip" title="" data-bs-original-title="Reset">
                                            <span class="btn-inner--icon"><i
                                                    class="ti ti-trash-off text-white-off "></i></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {{ Form::close() }}
                </div>
            </div>
        </div>

        @forelse($employees as $employee)
            <div class="col-xl-3">
                <div class="card  text-center">
                    <div class="card-header border-0 pb-0">
                        <div class="d-flex justify-content-between align-items-center">
                            <h6 class="mb-0">

                            </h6>
                        </div>
                        <div class="card-header-right">
                            <div class="btn-group card-option">
                                @if ($employee->user->is_active == 1)
                                    <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        <i class="feather icon-more-vertical"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-end">
                                        @can('Edit Employee')
                                            <a href="{{ route('employee.edit', \Illuminate\Support\Facades\Crypt::encrypt($employee->id)) }}"
                                                class="dropdown-item" data-url="" data-size="md" data-ajax-popup="true"
                                                data-title="{{ __('Edit employee') }}"><i class="ti ti-edit "></i><span
                                                    class="ms-2">{{ __('Edit') }}</span></a>
                                        @endcan

                                        @can('Delete Employee')
                                            {!! Form::open([
                                                'method' => 'DELETE',
                                                'route' => ['employee.destroy', $employee->id],
                                                'id' => 'delete-form-' . $employee->id,
                                            ]) !!}
                                            <a href="#" class="bs-pass-para dropdown-item"
                                                data-confirm="{{ __('Are You Sure?') }}"
                                                data-text="{{ __('This action can not be undone. Do you want to continue?') }}"
                                                data-confirm-yes="delete-form-{{ $employee->id }}"
                                                title="{{ __('Delete') }}"><i class="ti ti-trash"></i><span
                                                    class="ms-2">{{ __('Delete') }}</span></a>
                                            {!! Form::close() !!}
                                        @endcan
                                    </div>
                                @else
                                    <i class="ti ti-lock"></i>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="avatar">
                            <a href="{{ !empty($employee->user->avatar) ? asset(Storage::url('uploads/avatar')) . '/' . $employee->user->avatar : asset(Storage::url('uploads/avatar')) . '/avatar.png' }}"
                                target="_blank">
                                <img src="{{ !empty($employee->user->avatar) ? asset(Storage::url('uploads/avatar')) . '/' . $employee->user->avatar : asset(Storage::url('uploads/avatar')) . '/avatar.png' }}"
                                    class="rounded-circle" style="width: 25%">
                            </a>
                        </div>
                        <h4 class="mt-2 text-primary">{{ $employee->name }}</h4>
                        <small
                            class="">{{ ucfirst(!empty($employee->designation) ? $employee->designation->name : '') }}</small>

                        <div class="row mt-2">
                            <div class="col-12 col-sm-12">
                                <div class="d-grid">
                                    @can('Show Employee')
                                        <a class="btn btn-outline-primary"
                                            href="{{ route('employee.show', \Illuminate\Support\Facades\Crypt::encrypt($employee->id)) }}">
                                            {{ $employee->formatted_id }}
                                        </a>
                                    @else
                                        <a href="#" class="btn btn-outline-primary">
                                            {{ $employee->formatted_id }}
                                        </a>
                                    @endcan 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
@endsection
@push('script-page')
    <script>
        $(document).ready(function() {
            var b_id = $('#branch_id').val();
            // getDepartment(b_id);
        });
        $(document).on('change', 'select[name=branch]', function() {
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
                    var emp_selct = `<select class="department_id form-control multi-select" id="choices-multiple" multiple="" required="required" name="department_id[]">
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
            var d_id = $('#department').val();
            getDesignation(d_id);
        });

        $(document).on('change', 'select[name=department]', function() {
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
                    $('#designation_id').empty();
                    $('#designation_id').append('<option value="">{{ __('Select Designation') }}</option>');
                    $.each(data, function(key, value) {
                        $('#designation_id').append('<option value="' + key + '">' + value +
                            '</option>');
                    });
                }
            });
        }
    </script>
@endpush
