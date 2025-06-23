@extends('layouts.admin')
@section('page-title')
    {{ __('Manage Bookings') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item">{{ __('Bookings') }}</li>
@endsection

@section('action-button')
    <!-- <a href="{{ route('booking.export') }}" class="btn btn-sm btn-primary" data-bs-toggle="tooltip" data-bs-original-title="{{ __('Export') }}">
        <i class="ti ti-file-export"></i>
    </a> -->

    @can('Create TimeSheet')
        <a href="#" data-url="{{ route('booking.create') }}" data-ajax-popup="true" data-size="xl"
            data-title="{{ __('Create New Booking') }}" data-bs-toggle="tooltip" class="btn btn-sm btn-primary" data-bs-original-title="{{ __('Create') }}">
            <i class="ti ti-plus"></i>
        </a>
    @endcan
@endsection

@section('content')
    <div class="row">
            <div class="col-sm-12">
                <div class="mt-2" id="multiCollapseExample1">
                    <div class="card">
                        <div class="card-body">
                            {{ Form::open(['route' => ['booking.index'], 'method' => 'get', 'id' => 'booking_filter']) }}
                            <div class="row align-items-center justify-content-end">
                                <div class="col-xl-10">
                                    <div class="row">
                                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                            <div class="btn-box"></div>
                                        </div>
                                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                            <div class="btn-box">
                                                {{ Form::label('start_date', __('Start Date'), ['class' => 'form-label']) }}
                                                {{ Form::date('start_date', isset($_GET['start_date']) ? $_GET['start_date'] : '', ['class' => 'month-btn form-control current_date', 'autocomplete' => 'off', 'id' => 'current_date']) }}
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                            <div class="btn-box">
                                                {{ Form::label('end_date', __('End Date'), ['class' => 'form-label']) }}
                                                {{ Form::date('end_date', isset($_GET['end_date']) ? $_GET['end_date'] : '', ['class' => 'month-btn form-control current_date', 'autocomplete' => 'off', 'id' => 'current_date']) }}
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                            <div class="btn-box">
                                                {{ Form::label('project', __('Project'), ['class' => 'form-label']) }}
                                                {{ Form::select('project', $projects, isset($_GET['project']) ? $_GET['project'] : '', ['class' => 'form-control select', 'id' => 'project_id']) }}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <div class="row">
                                        <div class="col-auto mt-4">
                                            <a href="#" class="btn btn-sm btn-primary"
                                                onclick="document.getElementById('booking_filter').submit(); return false;"
                                                data-bs-toggle="tooltip" title="" data-bs-original-title="apply">
                                                <span class="btn-inner--icon"><i class="ti ti-search"></i></span>
                                            </a>
                                            <a href="{{ route('booking.index') }}" class="btn btn-sm btn-danger"
                                                data-bs-toggle="tooltip" title="" data-bs-original-title="Reset">
                                                <span class="btn-inner--icon"><i
                                                        class="ti ti-trash-off text-white-off "></i></span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {{ Form::close() }}
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header card-body table-border-style">
                    <div class="card-body py-0">
                        <div class="table-responsive">
                            <table class="table" id="pc-dt-simple">
                                <thead>
                                    <tr>
                                        @if (\Auth::user()->type != 'employee')
                                            <th>{{ __('Employee') }}</th>
                                        @endif
                                        <th>{{ __('Project') }}</th> <!-- Add this line -->
                                        <th>{{ __('Name') }}</th>
                                        <th>{{ __('Contact No') }}</th>
                                        <th>{{ __('Email') }}</th>
                                        <th>{{ __('Action') }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($bookings as $booking)
                                        <tr>
                                            @if (\Auth::user()->type != 'employee')
                                            <td>{{ !empty($booking->employee) ? $booking->employee->name : 'N/A' }}</td>
                                            @endif
                                            <td>
                                                @if($booking->project)
                                                    {{ $booking->project->project_name }}
                                                @else
                                                    {{ $booking->project_name ?? 'N/A' }}
                                                @endif
                                            </td>    
                                            <td>{{ $booking->primary_applicant_name }}</td>
                                            <td>{{ $booking->primary_applicant_contact_no }}</td>
                                            <td>{{ $booking->primary_applicant_email }}</td>
                                            <td class="Action">
                                                <span>
                                                    
                                                    <!-- @can('Create TimeSheet')
                                                        <div class="action-btn bg-blue-500 ms-2" >
                                                            <a href="#" class="mx-3 btn btn-sm align-items-center"
                                                                data-url="{{ route('booking.create', $booking->id) }}"
                                                                data-ajax-popup="true" data-size="xl" data-bs-toggle="tooltip"
                                                                title="{{ __('Create Booking') }}">
                                                                <i class="ti ti-plus text-white"></i>
                                                            </a>
                                                        </div>
                                                    @endcan -->

                                                    <div class="action-btn bg-warning ms-2">
                                                        <a href="#" class="mx-3 btn btn-sm align-items-center"
                                                            data-url="{{ route('booking.payslip', $booking->id) }}"
                                                            data-ajax-popup="true" data-size="lg" data-bs-toggle="tooltip"
                                                            title="{{ __('Print Booking') }}">
                                                            <i class="ti ti-printer text-white"></i>
                                                        </a>
                                                    </div>

                                                    @can('Edit TimeSheet')
                                                        <div class="action-btn bg-info ms-2">
                                                            <a href="#" class="mx-3 btn btn-sm align-items-center"
                                                                data-url="{{ route('booking.edit', $booking->id) }}"
                                                                data-ajax-popup="true" data-size="xl" data-bs-toggle="tooltip"
                                                                title="{{ __('View Booking') }}">
                                                                <i class="ti ti-pencil text-white"></i>
                                                            </a>
                                                        </div>
                                                    @endcan
                                                     


                                                
                                                    @can('Delete TimeSheet')
                                                        <div class="action-btn bg-danger ms-2">
                                                            {!! Form::open([
                                                                'method' => 'DELETE',
                                                                'route' => ['booking.destroy', $booking->id],
                                                                'id' => 'delete-form-' . $booking->id,
                                                            ]) !!}
                                                            <a href="#" class="mx-3 btn btn-sm align-items-center bs-pass-para"
                                                                data-bs-toggle="tooltip" title="{{ __('Delete') }}">
                                                                <i class="ti ti-trash text-white"></i>
                                                            </a>
                                                            {!! Form::close() !!}
                                                        </div>
                                                    @endcan

                                                    

                                                </span>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                                
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection


@push('script-page')
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
@endpush
