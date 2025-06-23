@extends('layouts.admin')

@section('page-title')
    {{ __('Manage Employee') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item">{{ __('Employee') }}</li>
@endsection

@section('action-button')
    @if(Auth::user()->type != 'hr') {{-- Only show export and create for non-HR users --}}
        <a href="{{ route('employee.export') }}" 
           class="btn btn-sm btn-primary flex items-center space-x-2">
            <i class="ti ti-file-export"></i>
            <span>Export</span> 
        </a>

        @can('Create Employee')
            <a href="{{ route('employee.create') }}" 
            data-title="{{ __('Create New Employee') }}" 
            class="btn btn-sm btn-primary flex items-center space-x-2">
                <i class="ti ti-plus"></i>
                <span>Create</span>
            </a>
        @endcan
    @endif
@endsection

@section('content')
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header card-body table-border-style">
                    <div class="table-responsive">
                        <table class="table" id="pc-dt-simple">
                            <thead>
                                <tr>
                                    <th>{{ __('Employee ID') }}</th>
                                    <th>{{ __('Name') }}</th>
                                    <th>{{ __('Email') }}</th>
                                    <th>{{ __('Branch') }}</th>
                                    <th>{{ __('Department') }}</th>
                                    <th>{{ __('Designation') }}</th>
                                    <th>{{ __('Date Of Joining') }}</th>
                                    @if (Auth::user()->type != 'hr' && (Gate::check('Edit Employee') || Gate::check('Delete Employee')))
                                        <th width="130px">{{ __('Action') }}</th>
                                    @endif
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($employees as $employee)
                                    <tr>
                                        <td>
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
                                        </td>
                                        <td>{{ $employee->name ?? '-' }}</td>
                                        <td>{{ $employee->email ?? '-' }}</td>  
                                        <td>{{ $employee->branch?->name ?? '-' }}</td>
                                        <td>{{ $employee->department?->name ?? '-' }}</td>
                                        <td>{{ $employee->designation?->name ?? '-' }}</td>
                                        <td>{{ \Auth::user()->dateFormat($employee->company_doj) }}</td>
                                        
                                        @if (Auth::user()->type != 'hr' && (Gate::check('Edit Employee') || Gate::check('Delete Employee')))
                                            <td class="Action">
                                                @if (($employee->user?->is_active ?? 0) == 1 && ($employee->user?->is_disable ?? 0) == 1)
                                                    <span>
                                                        @can('Edit Employee')
                                                            <div class="action-btn bg-info ms-2">
                                                                <a href="{{ route('employee.edit', \Illuminate\Support\Facades\Crypt::encrypt($employee->id)) }}"
                                                                    class="mx-3 btn btn-sm align-items-center"
                                                                    data-bs-toggle="tooltip" title=""
                                                                    data-bs-original-title="{{ __('Edit') }}">
                                                                    <i class="ti ti-pencil text-white"></i>
                                                                </a>
                                                            </div>
                                                        @endcan

                                                        @can('Delete Employee')
                                                            <div class="action-btn bg-danger ms-2">
                                                                {!! Form::open([
                                                                    'method' => 'DELETE',
                                                                    'route' => ['employee.destroy', $employee->id],
                                                                    'id' => 'delete-form-' . $employee->id,
                                                                ]) !!}
                                                                <a href="#"
                                                                    class="mx-3 btn btn-sm align-items-center bs-pass-para"
                                                                    data-bs-toggle="tooltip" title=""
                                                                    data-bs-original-title="Delete" aria-label="Delete">
                                                                    <i class="ti ti-trash text-white"></i>
                                                                </a>
                                                                {!! Form::close() !!}
                                                            </div>
                                                        @endcan
                                                    </span>
                                                @else
                                                    <i class="ti ti-lock"></i>
                                                @endif
                                            </td>
                                        @endif
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection