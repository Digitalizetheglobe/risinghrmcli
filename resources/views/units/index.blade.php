@extends('layouts.admin')

@section('page-title')
    {{ __('Unit List') }} 
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item">{{ __('Unit List') }}</li>
@endsection

@section('action-button')
    @if(Auth::user()->type != 'hr') {{-- Only show export and create for non-HR users --}}
        @can('Create Employee') {{-- Changed from 'Create Employee' --}}
            @unless(auth()->user()->hasRole('HR')) {{-- Using Spatie roles --}}
                <a href="#" data-url="{{ route('units.create') }}" data-ajax-popup="true"
                    data-title="{{ __('Add New Unit') }}" data-size="lg" data-bs-toggle="tooltip" title="Create"
                    class="btn btn-sm btn-primary">
                    <i class="ti ti-plus"></i>
                </a>
            @endunless
        @endcan
    @endif
@endsection

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-header card-body table-border-style">

                <form method="GET" action="{{ route('units.index') }}" class="mb-4">
                    <div class="row">
                        <div class="col-md-4">
                            <select class="form-select" id="project_id" name="project_id" onchange="this.form.submit()">
                                <option value="">{{ __('All Projects') }}</option>
                                @foreach($projects as $project)
                                    <option value="{{ $project->id }}" {{ request('project_id') == $project->id ? 'selected' : '' }}>
                                        {{ $project->project_name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table" id="pc-dt-simple">
                        <thead>
                            <tr>
                                <th>{{ __('Project Name') }}</th>
                                <th>{{ __('Unit Name') }}</th>
                                <th>{{ __('Unit Size') }}</th>
                                @if (Auth::user()->type != 'hr' &&Gate::check('Delete Employee'))
                                <th width="200px">{{ __('Action') }}</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($units as $unit)
                                <tr>
                                    <td>{{ $unit->project ? $unit->project->project_name : __('N/A') }}</td>
                                    <td>{{ $unit->unit_name }}</td>
                                    <td>{{ $unit->unit_size }}</td>
                                    @if (Auth::user()->type != 'hr' &&Gate::check('Delete Employee'))
                                        <td class="Action">
                                            @can('Delete Employee') {{-- Changed from 'Delete Employee' --}}
                                                <div class="action-btn bg-danger ms-2">
                                                    {!! Form::open(['method' => 'DELETE', 'route' => ['units.destroy', $unit->id], 'id' => 'delete-form-' . $unit->id]) !!}
                                                        <a href="#" class="mx-3 btn btn-sm  align-items-center bs-pass-para" data-bs-toggle="tooltip" title="{{ __('Delete') }}"
                                                        data-original-title="{{ __('Delete') }}"
                                                        data-confirm="{{ __('Are You Sure?') . '|' . __('This action can not be undone. Do you want to continue?') }}"
                                                        data-confirm-yes="document.getElementById('delete-form-{{ $unit->id }}').submit();">
                                                            <i class="ti ti-trash text-white"></i>
                                                        </a>
                                                    {!! Form::close() !!}
                                                </div>
                                            @endcan
                                        </td>
                                    @endif
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="text-center">{{ __('No units found') }}</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection