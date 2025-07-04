<div class="card sticky-top" style="top:30px">
    <div class="list-group list-group-flush" id="useradd-sidenav">

        @can('Manage Branch')
            <a href="{{ route('branch.index') }}"
                class="list-group-item list-group-item-action border-0 {{ request()->is('branch*') ? 'active' : '' }}">{{ __('Branch') }}
                <div class="float-end"><i class="ti ti-chevron-right"></i></div>
            </a>
        @endcan

        @can('Manage Branch')
            <a href="{{ route('site.index') }}"
                class="list-group-item list-group-item-action border-0 {{ request()->is('site*') ? 'active' : '' }}">{{ __('Site') }}
                <div class="float-end"><i class="ti ti-chevron-right"></i></div>
            </a>
        @endcan
        
        @can('Manage Department')
            <a href="{{ route('department.index') }}"
                class="list-group-item list-group-item-action border-0 {{ request()->is('department*') ? 'active' : '' }}">{{ __('Department') }}
                <div class="float-end"><i class="ti ti-chevron-right"></i></div>
            </a>
        @endcan

        @can('Manage Designation')
        <a href="{{ route('designation.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('designation*') ? 'active' : '' }}">{{ __('Designation') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan        

        @can('Manage Leave Type')
        <a href="{{ route('leavetype.index') }}"
            class="list-group-item list-group-item-action border-0 {{ Request::route()->getName() == 'leavetype.index' ? 'active' : '' }}">{{ __('Leave Type') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Document Type')
        <a href="{{ route('document.index') }}"
            class="list-group-item list-group-item-action border-0 {{ Request::route()->getName() == 'document.index' ? 'active' : '' }}">{{ __('Document Type') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Payslip Type')
        <a href="{{ route('paysliptype.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('paysliptype*') ? 'active' : '' }}">{{ __('Payslip Type') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Allowance Option')
        <a href="{{ route('allowanceoption.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('allowanceoption*') ? 'active' : '' }}">{{ __('Allowance Option') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Loan Option')
        <a href="{{ route('loanoption.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('loanoption*') ? 'active' : '' }}">{{ __('Loan Option') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Deduction Option')
        <a href="{{ route('deductionoption.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('deductionoption*') ? 'active' : '' }}">{{ __('Deduction Option') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Goal Type')
        <a href="{{ route('goaltype.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('goaltype*') ? 'active' : '' }}">{{ __('Goal Type') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Training Type')
        <a href="{{ route('trainingtype.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('trainingtype*') ? 'active' : '' }}">{{ __('Training Type') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Award Type')
        <a href="{{ route('awardtype.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('awardtype*') ? 'active' : '' }}">{{ __('Award Type') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Termination Type')
        <a href="{{ route('terminationtype.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('terminationtype*') ? 'active' : '' }}">{{ __('Termination Type') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Job Category')
        <a href="{{ route('job-category.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('job-category*') ? 'active' : '' }}">{{ __('Job Category') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Job Stage')
        <a href="{{ route('job-stage.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('job-stage*') ? 'active' : '' }}">{{ __('Job Stage') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Performance Type')
        <a href="{{ route('performanceType.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('performanceType*') ? 'active' : '' }}">{{ __('Performance Type') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Competencies')
        <a href="{{ route('competencies.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('competencies*') ? 'active' : '' }}">{{ __('Competencies') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Expense Type')
        <a href="{{ route('expensetype.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('expensetype*') ? 'active' : '' }}">{{ __('Expense Type') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Income Type')
        <a href="{{ route('incometype.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('incometype*') ? 'active' : '' }}">{{ __('Income Type') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Payment Type')
        <a href="{{ route('paymenttype.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('paymenttype*') ? 'active' : '' }}">{{ __('Payment Type') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

        @can('Manage Contract Type')
        <a href="{{ route('contract_type.index') }}"
            class="list-group-item list-group-item-action border-0 {{ request()->is('contract_type*') ? 'active' : '' }}">{{ __('Contract Type') }}
            <div class="float-end"><i class="ti ti-chevron-right"></i></div>
        </a>
        @endcan

    </div>
</div>
