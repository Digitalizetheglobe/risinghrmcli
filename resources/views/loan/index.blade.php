@extends('layouts.admin')

@section('page-title')
    {{ __('Loan Management') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item">{{ __('Loan Management') }}</li>
@endsection

@section('action-button')
    @can('Create Employee')
        <a href="{{ route('loan.create') }}" class="btn btn-sm btn-primary" data-bs-toggle="tooltip" title="{{ __('Create') }}">
            <i class="ti ti-plus"></i>
        </a>
    @endcan
@endsection

@section('content')
    <div class="col-xl-12">
        <div class="card">
            <div class="card-header card-body table-border-style">
                <div class="table-responsive">
                    <table class="table datatable">
                        <thead>
                            <tr>
                                <th>{{ __('Employee') }}</th>
                                <th>{{ __('Loan Amount') }}</th>
                                <th>{{ __('Monthly EMI') }}</th>
                                <th>{{ __('Months') }}</th>
                                <th>{{ __('Remaining') }}</th>
                                <th>{{ __('Start Month') }}</th>
                                <th width="200px">{{ __('Action') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($loans as $loan)
                                <tr>
                                    <td>{{ $loan->employee->name }}</td>
                                    <td>{{ \Auth::user()->priceFormat($loan->total_amount) }}</td>
                                    <td>{{ \Auth::user()->priceFormat($loan->monthly_emi) }}</td>
                                    <td>{{ $loan->number_of_months }}</td>
                                    <td>{{ \Auth::user()->priceFormat($loan->remaining_amount) }}</td>
                                    <td>{{ \Auth::user()->dateFormat($loan->start_month) }}</td>
                                    <td class="Action">
                                                <span>
                                                    @can('Show Employee')
                                                        <a href="{{ route('loan.show', $loan->id) }}" class="btn btn-sm btn-warning">
                                                            <i class="ti ti-eye"></i>
                                                        </a>
                                                    @endcan
                                                    
                                                   @can('Edit Employee')
                                                        @if ($loan->deductions->isNotEmpty())
                                                            <div class="action-btn bg-info ms-2">
                                                                <a href="{{ route('loan.deduction.edit', $loan->deductions->first()->id) }}" 
                                                                    class="mx-3 btn btn-sm align-items-center" 
                                                                    data-bs-toggle="tooltip" 
                                                                    title="{{ __('Edit') }}">
                                                                    <i class="ti ti-pencil text-white"></i>
                                                                </a>
                                                            </div>
                                                        @endif
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
@endsection