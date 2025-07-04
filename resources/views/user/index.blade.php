@extends('layouts.admin')

@section('page-title')
    @if (\Auth::user()->type == 'super admin')
        {{ __('Manage Companies') }}
    @else
        {{ __('Manage Users') }}
    @endif
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Home') }}</a></li>
    @if (\Auth::user()->type == 'super admin')
        <li class="breadcrumb-item">{{ __('Companies') }}</li>
    @else
        <li class="breadcrumb-item">{{ __('Users') }}</li>
    @endif
@endsection

@section('action-button')
    @if (Gate::check('Manage Employee Last Login'))
        @can('Manage Employee Last Login')
            <a href="{{ route('lastlogin') }}" class="btn btn-primary btn-sm" data-bs-toggle="tooltip" data-bs-placement="top"
                title="{{ __('User Logs History') }}"><i class="ti ti-user-check"></i>
            </a>
        @endcan
    @endif

    @can('Create User')
        @if (\Auth::user()->type == 'super admin')
            <a href="#" data-url="{{ route('user.create') }}" data-ajax-popup="true"
                data-title="{{ __('Create New Company') }}" data-size="md" data-bs-toggle="tooltip" title=""
                class="btn btn-sm btn-primary" data-bs-original-title="{{ __('Create') }}">
                <i class="ti ti-plus"></i>
            </a>
        @else
            <a href="#" data-url="{{ route('user.create') }}" data-ajax-popup="true"
                data-title="{{ __('Create New User') }}" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-primary"
                data-bs-original-title="{{ __('Create') }}">
                <i class="ti ti-plus"></i>
            </a>
        @endif
    @endcan


@endsection


@php
    $logo = \App\Models\Utility::get_file('uploads/avatar/');
    $profile = \App\Models\Utility::get_file('uploads/avatar/');
@endphp
@section('content')
<style>



.blinking a {
    animation: pop-animation 1.5s infinite; /* Continuous pop effect */
}

@keyframes pop-animation {
    0%, 100% {
        transform: scale(1); /* Original size */
    }
    50% {
        transform: scale(1.1); /* Scale up slightly */
    }
}

.blinking button {
    animation: pop-animation 1.5s infinite; /* Continuous pop effect */
    background-color: transparent; /* Make background transparent */
    border: 1px solid transparent; /* Ensure border is transparent */
    color: inherit; /* Inherit text color */
}

@keyframes pop-animation {
    0%, 100% {
        transform: scale(1); /* Original size */
    }
    50% {
        transform: scale(1.1); /* Scale up slightly */
    }
}

.blinking button:hover {
    color: inherit; /* Keep text color same on hover */
    background-color: transparent; /* Keep background transparent */
    border: 1px solid transparent; /* Keep border transparent */
    cursor: default; /* Change cursor to default */
}

.custom-card {
    border: px solid black; /* Set border color and thickness */
    border-radius: 0.5rem; /* Optional: Adjust border radius */
}

.btn-primary:hover {
    background-color: #ffffff !important; /* Change background color on hover */
    color: #068bbf; /* Optional: Change text color if needed */
}
.btn-primary1{
    background-color: #2B3571 !important;
}
    </style>

    <div class="row">

        <div class="row">
            @if (\Auth::user()->type == 'super admin')
                @foreach ($users as $user)
                <div class="col-xl-4" style="margin-top:20px;">
                        <div class="card  text-center custom-card">
                            <div class="card-header border-0 pb-0">
                            <div class="col-md-4 text-end blinking">
                                <a href="#" data-url="{{ route('plan.upgrade', $user->id) }}"
                                    class="btn btn-sm btn-primary btn-icon" data-size="lg" data-ajax-popup="true"
                                    data-title="{{ __('Upgrade Plan') }}">{{ __('Upgrade Plan') }}
                                </a>
                            </div>
                                <div class="card-header-right">
                                    <div class="btn-group card-option">
                                        <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false">
                                            <i class="feather icon-more-vertical"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-end">
                                            <a href="#" class="dropdown-item"
                                                data-url="{{ route('user.edit', $user->id) }}" data-size="md"
                                                data-ajax-popup="true" data-title="{{ __('Update User') }}"><i
                                                    class="ti ti-edit "></i><span
                                                    class="ms-2">{{ __('Edit') }}</span></a>

                                            <a href="{{ route('login.with.company', $user->id) }}" class="dropdown-item"
                                                data-bs-original-title="{{ __('Login As Company') }}">
                                                <i class="ti ti-replace"></i>
                                                <span> {{ __('Login As Company') }}</span>
                                            </a>

                                            <a href="#" class="dropdown-item" data-ajax-popup="true" data-size="md"
                                                data-title="{{ __('Change Password') }}"
                                                data-url="{{ route('user.reset', \Crypt::encrypt($user->id)) }}"><i
                                                    class="ti ti-key"></i>
                                                <span class="ms-1">{{ __('Reset Password') }}</span>
                                            </a>

                                            @if ($user->is_login_enable == 1)
                                                <a href="{{ route('user.login', \Crypt::encrypt($user->id)) }}"
                                                    class="dropdown-item">
                                                    <i class="ti ti-road-sign"></i>
                                                    <span class="text-danger"> {{ __('Login Disable') }}</span>
                                                </a>
                                            @elseif ($user->is_login_enable == 0 && $user->password == null)
                                                <a href="#"
                                                    data-url="{{ route('user.reset', \Crypt::encrypt($user->id)) }}"
                                                    data-ajax-popup="true" data-size="md" class="dropdown-item login_enable"
                                                    data-title="{{ __('New Password') }}" class="dropdown-item">
                                                    <i class="ti ti-road-sign"></i>
                                                    <span class="text-success"> {{ __('Login Enable') }}</span>
                                                </a>
                                            @else
                                                <a href="{{ route('user.login', \Crypt::encrypt($user->id)) }}"
                                                    class="dropdown-item">
                                                    <i class="ti ti-road-sign"></i>
                                                    <span class="text-success"> {{ __('Login Enable') }}</span>
                                                </a>
                                            @endif

                                            {!! Form::open([
                                                'method' => 'DELETE',
                                                'route' => ['user.destroy', $user->id],
                                                'id' => 'delete-form-' . $user->id,
                                            ]) !!}
                                            <a href="#!" class="dropdown-item bs-pass-para">
                                                <i class="ti ti-trash"></i><span class="ms-1">
                                                    @if ($user->delete_status == 0)
                                                        {{ __('Delete') }}
                                                    @else
                                                        {{ __('Restore') }}
                                                    @endif
                                                </span>
                                            </a>
                                            {!! Form::close() !!}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="avatar">
                                    <a href="{{ !empty($user->avatar) ? $profile . $user->avatar : $logo . 'avatar.png' }}"
                                        target="_blank">
                                        <img src="{{ !empty($user->avatar) ? $profile . $user->avatar : $logo . 'avatar.png' }}"
                                            class="rounded-circle" style="width: 100px">
                                    </a>
                                </div>
                                <h4 class="mt-2">{{ $user->name }}</h4>
                                <small>{{ $user->email }}</small>
                                @if (\Auth::user()->type == 'super admin')
                                    <div class=" mb-0 mt-3">
                                        <div class=" p-3">
                                            <div class="row">
                                                <div class="col-7 text-start">
                                                    <a class="btn btn-outline-primary">
                                                        <h4 class="mb-0 px-1 mt-">
                                                        {{ !empty($user->currentPlan) ? $user->currentPlan->name : '' }}
                                                    </h4></a>
                                                </div>
                                                <div class="col-2 text-center Id">
                                                    <a href="#" data-url="{{ route('company.info', $user->id) }}"
                                                    data-size="lg" data-ajax-popup="true"
                                                    class="btn btn-primary " style="background-color:#2B3571;"
                                                    data-title="{{ __('Company Info') }}">{{ __('User') }}</a>
                                                </div>

                                                <div class="row mt-4 g-0"> <!-- Use g-0 to remove gaps between columns -->
                                                <div class="col-6 text-middel">
                                                    <h6 class="mb-0 px-4">{{ $user->countUsers() }}</h6>
                                                    <p class="text-muted text-sm mb-0">{{ __('Users') }}</p>
                                                </div>
                                                <div class="col-6 text-middel"> <!-- Change to col-6 for equal distribution -->
                                                    <h6 class="mb-0 px-4">{{ $user->countEmployees() }}</h6>
                                                    <p class="text-muted text-sm mb-0">{{ __('Employees') }}</p>
                                                </div>
                                            </div>

                                            </div>
                                        </div>
                                    </div>
                                    
                                        <div class="mt-2 mb-0 blinking">
                                            <button class="btn btn-outline-primary mt-3 font-weight-500 ">
                                                <a>{{ __('Plan Expire: ') }}
                                                    {{ !empty($user->plan_expire_date) ? \Auth::user()->dateFormat($user->plan_expire_date) : 'Lifetime' }}
                                                </a>
                                            </button>
                                        </div>
                                    
                                @endif
                            </div>
                        </div>
                    </div>
                @endforeach
                <div class="col-xl-3 col-lg-4 col-sm-6">
                    <a href="#" class="btn-addnew-project " data-ajax-popup="true"
                        data-url="{{ route('user.create') }}" data-title="{{ __('Create New Company') }}"
                        data-bs-toggle="tooltip" title="" class="btn btn-sm btn-primary"
                        data-bs-original-title="{{ __('Create') }}">
                        <div class="bg-primary proj-add-icon my-4">
                            <i class="ti ti-plus"></i>
                        </div>
                        <h6 class="mt-4 mb-2">{{ __('New Company') }}</h6>
                        <p class="text-muted text-center">{{ __('Click here to add new company') }}</p>
                    </a>
                </div>
            @else
                @foreach ($users as $user)
                    <div class="col-xl-3">
                        <div class="card  text-center">
                            <div class="card-header border-0 pb-0">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="mb-0">
                                        <div class="badge p-2 px-3 rounded bg-primary">{{ ucfirst($user->type) }}</div>
                                    </h6>
                                </div>

                                @if (Gate::check('Edit User') || Gate::check('Delete User'))
                                    <div class="card-header-right">
                                        <div class="btn-group card-option">
                                            @if ($user->is_active == 1 && $user->is_disable == 1)
                                                <button type="button" class="btn dropdown-toggle"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="feather icon-more-vertical"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-end">
                                                    @can('Edit User')
                                                        <a href="#" class="dropdown-item"
                                                            data-url="{{ route('user.edit', $user->id) }}" data-size="md"
                                                            data-ajax-popup="true" data-title="{{ __('Update User') }}"><i
                                                                class="ti ti-edit "></i><span
                                                                class="ms-2">{{ __('Edit') }}</span></a>
                                                    @endcan

                                                    <a href="#" class="dropdown-item" data-ajax-popup="true"
                                                        data-size="md" data-title="{{ __('Change Password') }}"
                                                        data-url="{{ route('user.reset', \Crypt::encrypt($user->id)) }}"><i
                                                            class="ti ti-key"></i>
                                                        <span class="ms-1">{{ __('Reset Password') }}</span></a>

                                                    @if ($user->is_login_enable == 1)
                                                        <a href="{{ route('user.login', \Crypt::encrypt($user->id)) }}"
                                                            class="dropdown-item">
                                                            <i class="ti ti-road-sign"></i>
                                                            <span class="text-danger"> {{ __('Login Disable') }}</span>
                                                        </a>
                                                    @elseif ($user->is_login_enable == 0 && $user->password == null)
                                                        <a href="#"
                                                            data-url="{{ route('user.reset', \Crypt::encrypt($user->id)) }}"
                                                            data-ajax-popup="true" data-size="md"
                                                            class="dropdown-item login_enable"
                                                            data-title="{{ __('New Password') }}" class="dropdown-item">
                                                            <i class="ti ti-road-sign"></i>
                                                            <span class="text-success"> {{ __('Login Enable') }}</span>
                                                        </a>
                                                    @else
                                                        <a href="{{ route('user.login', \Crypt::encrypt($user->id)) }}"
                                                            class="dropdown-item">
                                                            <i class="ti ti-road-sign"></i>
                                                            <span class="text-success"> {{ __('Login Enable') }}</span>
                                                        </a>
                                                    @endif

                                                    @can('Delete User')
                                                        {!! Form::open([
                                                            'method' => 'DELETE',
                                                            'route' => ['user.destroy', $user->id],
                                                            'id' => 'delete-form-' . $user->id,
                                                        ]) !!}
                                                        <a href="#" class="bs-pass-para dropdown-item"
                                                            data-confirm="{{ __('Are You Sure?') }}"
                                                            data-text="{{ __('This action can not be undone. Do you want to continue?') }}"
                                                            data-confirm-yes="delete-form-{{ $user->id }}"
                                                            title="{{ __('Delete') }}" data-bs-toggle="tooltip"
                                                            data-bs-placement="top"><i class="ti ti-trash"></i><span
                                                                class="ms-2">{{ __('Delete') }}</span></a>
                                                        {!! Form::close() !!}
                                                    @endcan
                                                </div>
                                            @else
                                                <i class="ti ti-lock"></i>
                                            @endif
                                        </div>
                                    </div>
                                @endif

                            </div>
                            <div class="card-body">
                                <div class="avatar">
                                    <a href="{{ !empty($user->avatar) ? $profile . $user->avatar : $logo . 'avatar.png' }}"
                                        target="_blank">
                                        <img src="{{ !empty($user->avatar) ? $profile . $user->avatar : $logo . 'avatar.png' }}"
                                            class="rounded-circle" style="width: 30%">
                                    </a>

                                </div>
                                <h4 class="mt-2 text-primary">{{ $user->name }}</h4>
                                <small class="">{{ $user->email }}</small>

                            </div>
                        </div>
                    </div>
                @endforeach
                <div class="col-xl-3 col-lg-4 col-sm-6">
                    <a href="#" class="btn-addnew-project " data-ajax-popup="true"
                        data-url="{{ route('user.create') }}" data-title="{{ __('Create New User') }}"
                        data-bs-toggle="tooltip" title="" class="btn btn-sm btn-primary"
                        data-bs-original-title="{{ __('Create') }}">
                        <div class="bg-primary proj-add-icon">
                            <i class="ti ti-plus"></i>
                        </div>
                        <h6 class="mt-4 mb-2">{{ __('New User') }}</h6>
                        <p class="text-muted text-center">{{ __('Click here to add new user') }}</p>
                    </a>
                </div>
            @endif
        </div>
    </div>
@endsection

@push('scripts')
    {{-- Password  --}}
    <script>
        $(document).on('change', '#password_switch', function() {
            if ($(this).is(':checked')) {
                $('.ps_div').removeClass('d-none');
                $('#password').attr("required", true);

            } else {
                $('.ps_div').addClass('d-none');
                $('#password').val(null);
                $('#password').removeAttr("required");
            }
        });
        $(document).on('click', '.login_enable', function() {
            setTimeout(function() {
                $('.modal-body').append($('<input>', {
                    type: 'hidden',
                    val: 'true',
                    name: 'login_enable'
                }));
            }, 2000);
        });
    </script>
@endpush
