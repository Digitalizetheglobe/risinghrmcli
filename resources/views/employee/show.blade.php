@extends('layouts.admin')

@section('page-title')
    {{ __('Employee') }}
@endsection
@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item"><a href="{{ url('employee') }}">{{ __('Employee') }}</a></li>
    <li class="breadcrumb-item">{{ __('Manage Employee') }}</li>
@endsection

@section('action-button')
    <div class="float-end">
        @can('edit employee')
            <a href="{{ route('employee.edit', \Illuminate\Support\Facades\Crypt::encrypt($employee->id)) }}"
                data-bs-toggle="tooltip" title="{{ __('Edit') }}"class="btn btn-sm btn-primary">
                <i class="ti ti-pencil"></i>
            </a>
        @endcan
    </div>
    <div class="text-end mb-3">
        <div class="d-flex justify-content-end drp-languages">
            <ul class="list-unstyled mb-0 m-2">
                <li class="dropdown dash-h-item drp-language">
                    <a class="dash-head-link dropdown-toggle arrow-none me-0" data-bs-toggle="dropdown" href="#"
                        role="button" aria-haspopup="false" aria-expanded="false">
                        <span class="drp-text hide-mob text-primary"> {{ __('Joining Letter') }}
                            <i class="ti ti-chevron-down drp-arrow nocolor hide-mob"></i>
                    </a>
                    <div class="dropdown-menu dash-h-dropdown">
                        <a href="{{ route('joiningletter.download.pdf', $employee->id) }}" class=" btn-icon dropdown-item"
                            data-bs-toggle="tooltip" data-bs-placement="top" target="_blanks"><i
                                class="ti ti-download ">&nbsp;</i>{{ __('PDF') }}</a>

                        <a href="{{ route('joininglatter.download.doc', $employee->id) }}" class=" btn-icon dropdown-item"
                            data-bs-toggle="tooltip" data-bs-placement="top" target="_blanks"><i
                                class="ti ti-download ">&nbsp;</i>{{ __('DOC') }}</a>
                    </div>
                </li>
            </ul>
            <ul class="list-unstyled mb-0 m-2">
                <li class="dropdown dash-h-item drp-language">
                    <a class="dash-head-link dropdown-toggle arrow-none me-0" data-bs-toggle="dropdown" href="#"
                        role="button" aria-haspopup="false" aria-expanded="false">
                        <span class="drp-text hide-mob text-primary"> {{ __('Experience Certificate') }}
                            <i class="ti ti-chevron-down drp-arrow nocolor hide-mob"></i>
                    </a>
                    <div class="dropdown-menu dash-h-dropdown">
                        <a href="{{ route('exp.download.pdf', $employee->id) }}" class=" btn-icon dropdown-item"
                            data-bs-toggle="tooltip" data-bs-placement="top" target="_blanks"><i
                                class="ti ti-download ">&nbsp;</i>{{ __('PDF') }}</a>

                        <a href="{{ route('exp.download.doc', $employee->id) }}" class=" btn-icon dropdown-item"
                            data-bs-toggle="tooltip" data-bs-placement="top" target="_blanks"><i
                                class="ti ti-download ">&nbsp;</i>{{ __('DOC') }}</a>
                    </div>
                </li>
            </ul>
            <ul class="list-unstyled mb-0 m-2">
                <li class="dropdown dash-h-item drp-language">
                    <a class="dash-head-link dropdown-toggle arrow-none me-0" data-bs-toggle="dropdown" href="#"
                        role="button" aria-haspopup="false" aria-expanded="false">
                        <span class="drp-text hide-mob text-primary"> {{ __('NOC') }}
                            <i class="ti ti-chevron-down drp-arrow nocolor hide-mob"></i>
                    </a>
                    <div class="dropdown-menu dash-h-dropdown">
                        <a href="{{ route('noc.download.pdf', $employee->id) }}" class=" btn-icon dropdown-item"
                            data-bs-toggle="tooltip" data-bs-placement="top" target="_blanks"><i
                                class="ti ti-download ">&nbsp;</i>{{ __('PDF') }}</a>

                        <a href="{{ route('noc.download.doc', $employee->id) }}" class=" btn-icon dropdown-item"
                            data-bs-toggle="tooltip" data-bs-placement="top" target="_blanks"><i
                                class="ti ti-download ">&nbsp;</i>{{ __('DOC') }}</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
@endsection

@section('content')
    <div class="row">
        <div class="col-xl-12">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <div class="card">
                            <div class="card-header">
                                <h6>{{ __('Personal Details') }}</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <p><strong>{{ __('Employee ID') }}:</strong> {{ $employeesId }}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>{{ __('Name') }}:</strong> {{ $employee->name }}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>{{ __('Email') }}:</strong> {{ $employee->email }}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>{{ __('Phone') }}:</strong> {{ $employee->phone }}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>{{ __('Office Phone 1') }}:</strong> {{ $employee->office_phone_one ?? 'N/A' }}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>{{ __('Office Phone 2') }}:</strong> {{ $employee->office_phone_two ?? 'N/A' }}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>{{ __('Emergency Number') }}:</strong> {{ $employee->emergency_number ?? 'N/A' }}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>{{ __('Date of Birth') }}:</strong> {{ \Auth::user()->dateFormat($employee->dob) }}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>{{ __('Gender') }}:</strong> {{ $employee->gender }}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>{{ __('Week Off Day') }}:</strong> {{ $employee->week_off_day ?? 'N/A' }}</p>
                                    </div>
                                    <div class="col-12">
                                        <p><strong>{{ __('Address') }}:</strong> {{ $employee->address ?? 'N/A' }}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="col-sm-12 col-md-6">
                   <div class="card">
                            <div class="card-header">
                                <h6>{{ __('Company Details') }}</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <p><strong>{{ __('Branch') }}:</strong> {{ $employee->branch->name ?? 'N/A' }}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>{{ __('Department') }}:</strong> {{ $employee->department->name ?? 'N/A' }}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>{{ __('Designation') }}:</strong> {{ $employee->designation->name ?? 'N/A' }}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong>{{ __('Date of Joining') }}:</strong> {{ \Auth::user()->dateFormat($employee->company_doj) }}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <div class="card ">
                        <div class="card-body employee-detail-body fulls-card emp-card">
                            <h5>{{ __('Document Detail') }}</h5>
                            <hr>
                            <div class="row">
                                @php
                                    $employeedoc = $employee->documents()->pluck('document_value', 'document_id');
                                    $logo = \App\Models\Utility::get_file('uploads/document');
                                @endphp
                                @if (!$documents->isEmpty())
                                    @foreach ($documents as $key => $document)
                                        <div class="col-md-6">
                                            <div class="info text-sm">
                                                <strong class="font-bold">{{ $document->name }} : </strong>
                                                <span><a href="{{ !empty($employeedoc[$document->id]) ? $logo . '/' . $employeedoc[$document->id] : '' }}"
                                                        target="_blank">{{ !empty($employeedoc[$document->id]) ? $employeedoc[$document->id] : '' }}</a></span>
                                            </div>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="text-center">
                                        No Document Type Added.!
                                    </div>
                                @endif

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6">
                    <div class="card">
                        <div class="card-body employee-detail-body fulls-card emp-card">
                            <h5>{{ __('Experience Detail') }}</h5>
                            <hr>
                            <div class="row">
                                @if(!empty($experienceDetails))
                                    @foreach($experienceDetails as $exp)
                                        <div class="col-md-12 mb-3">
                                            <strong>Company Name:</strong> {{ $exp['previous_company_name'] ?? '-' }}<br>
                                            <strong>Designation:</strong> {{ $exp['previous_designation'] ?? '-' }}<br>
                                            <strong>Start Date:</strong> {{ $exp['start_date'] ?? '-' }}<br>
                                            <strong>End Date:</strong> {{ $exp['end_date'] ?? '-' }}<br>
                                            <strong>Previous Salary:</strong> {{ $exp['previous_salary'] ?? '-' }}
                                            <hr>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="col-md-12">
                                        <p>No experience detail available.</p>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-12">
           <div class="card">
                <div class="card-header">
                    <h6>{{ __('Education Details') }}</h6>
                </div>
                <div class="card-body">
                    <div class="row">
                        @if(!empty($educationDetails))
                            @foreach($educationDetails as $edu)
                                <div class="col-md-12 mb-3">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <strong>Degree:</strong><br>
                                            {{ $edu['degree'] ?? '-' }}
                                    d    </div>
                                        <div class="col-md-3">
                                            <strong>College Name:</strong><br>
                                            {{ $edu['college_name'] ?? '-' }}
                                        </div>
                                        <div class="col-md-3">
                                            <strong>Passing Year:</strong><br>
                                            {{ $edu['passing_year'] ?? '-' }}
                                        </div>
                                        <div class="col-md-3">
                                            <strong>Grade:</strong><br>
                                            {{ $edu['grade'] ?? '-' }}
                                        </div>
                                        <div class="col-md-3">
                                            <strong>Document:</strong><br>
                                            @if(isset($edu['document_path']))
                                                <a href="{{ asset($edu['document_path']) }}" target="_blank" class="btn btn-sm btn-primary">
                                                    <i class="ti ti-download"></i> View
                                                </a>
                                            @else
                                                -
                                            @endif
                                        </div>
                                    </div>
                                    <hr>
                                </div>

                            @endforeach
                        @else
                            <div class="col-md-12">
                                <p>No education details available.</p>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
@endsection
