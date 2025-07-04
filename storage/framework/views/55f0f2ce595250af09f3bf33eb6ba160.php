

<?php $__env->startSection('page-title'); ?>
    <?php if(\Auth::user()->type == 'super admin'): ?>
        <?php echo e(__('Manage Companies')); ?>

    <?php else: ?>
        <?php echo e(__('Manage Users')); ?>

    <?php endif; ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <?php if(\Auth::user()->type == 'super admin'): ?>
        <li class="breadcrumb-item"><?php echo e(__('Companies')); ?></li>
    <?php else: ?>
        <li class="breadcrumb-item"><?php echo e(__('Users')); ?></li>
    <?php endif; ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <?php if(Gate::check('Manage Employee Last Login')): ?>
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Manage Employee Last Login')): ?>
            <a href="<?php echo e(route('lastlogin')); ?>" class="btn btn-primary btn-sm" data-bs-toggle="tooltip" data-bs-placement="top"
                title="<?php echo e(__('User Logs History')); ?>"><i class="ti ti-user-check"></i>
            </a>
        <?php endif; ?>
    <?php endif; ?>

    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Create User')): ?>
        <?php if(\Auth::user()->type == 'super admin'): ?>
            <a href="#" data-url="<?php echo e(route('user.create')); ?>" data-ajax-popup="true"
                data-title="<?php echo e(__('Create New Company')); ?>" data-size="md" data-bs-toggle="tooltip" title=""
                class="btn btn-sm btn-primary" data-bs-original-title="<?php echo e(__('Create')); ?>">
                <i class="ti ti-plus"></i>
            </a>
        <?php else: ?>
            <a href="#" data-url="<?php echo e(route('user.create')); ?>" data-ajax-popup="true"
                data-title="<?php echo e(__('Create New User')); ?>" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-primary"
                data-bs-original-title="<?php echo e(__('Create')); ?>">
                <i class="ti ti-plus"></i>
            </a>
        <?php endif; ?>
    <?php endif; ?>


<?php $__env->stopSection(); ?>


<?php
    $logo = \App\Models\Utility::get_file('uploads/avatar/');
    $profile = \App\Models\Utility::get_file('uploads/avatar/');
?>
<?php $__env->startSection('content'); ?>
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
            <?php if(\Auth::user()->type == 'super admin'): ?>
                <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="col-xl-4" style="margin-top:20px;">
                        <div class="card  text-center custom-card">
                            <div class="card-header border-0 pb-0">
                            <div class="col-md-4 text-end blinking">
                                <a href="#" data-url="<?php echo e(route('plan.upgrade', $user->id)); ?>"
                                    class="btn btn-sm btn-primary btn-icon" data-size="lg" data-ajax-popup="true"
                                    data-title="<?php echo e(__('Upgrade Plan')); ?>"><?php echo e(__('Upgrade Plan')); ?>

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
                                                data-url="<?php echo e(route('user.edit', $user->id)); ?>" data-size="md"
                                                data-ajax-popup="true" data-title="<?php echo e(__('Update User')); ?>"><i
                                                    class="ti ti-edit "></i><span
                                                    class="ms-2"><?php echo e(__('Edit')); ?></span></a>

                                            <a href="<?php echo e(route('login.with.company', $user->id)); ?>" class="dropdown-item"
                                                data-bs-original-title="<?php echo e(__('Login As Company')); ?>">
                                                <i class="ti ti-replace"></i>
                                                <span> <?php echo e(__('Login As Company')); ?></span>
                                            </a>

                                            <a href="#" class="dropdown-item" data-ajax-popup="true" data-size="md"
                                                data-title="<?php echo e(__('Change Password')); ?>"
                                                data-url="<?php echo e(route('user.reset', \Crypt::encrypt($user->id))); ?>"><i
                                                    class="ti ti-key"></i>
                                                <span class="ms-1"><?php echo e(__('Reset Password')); ?></span>
                                            </a>

                                            <?php if($user->is_login_enable == 1): ?>
                                                <a href="<?php echo e(route('user.login', \Crypt::encrypt($user->id))); ?>"
                                                    class="dropdown-item">
                                                    <i class="ti ti-road-sign"></i>
                                                    <span class="text-danger"> <?php echo e(__('Login Disable')); ?></span>
                                                </a>
                                            <?php elseif($user->is_login_enable == 0 && $user->password == null): ?>
                                                <a href="#"
                                                    data-url="<?php echo e(route('user.reset', \Crypt::encrypt($user->id))); ?>"
                                                    data-ajax-popup="true" data-size="md" class="dropdown-item login_enable"
                                                    data-title="<?php echo e(__('New Password')); ?>" class="dropdown-item">
                                                    <i class="ti ti-road-sign"></i>
                                                    <span class="text-success"> <?php echo e(__('Login Enable')); ?></span>
                                                </a>
                                            <?php else: ?>
                                                <a href="<?php echo e(route('user.login', \Crypt::encrypt($user->id))); ?>"
                                                    class="dropdown-item">
                                                    <i class="ti ti-road-sign"></i>
                                                    <span class="text-success"> <?php echo e(__('Login Enable')); ?></span>
                                                </a>
                                            <?php endif; ?>

                                            <?php echo Form::open([
                                                'method' => 'DELETE',
                                                'route' => ['user.destroy', $user->id],
                                                'id' => 'delete-form-' . $user->id,
                                            ]); ?>

                                            <a href="#!" class="dropdown-item bs-pass-para">
                                                <i class="ti ti-trash"></i><span class="ms-1">
                                                    <?php if($user->delete_status == 0): ?>
                                                        <?php echo e(__('Delete')); ?>

                                                    <?php else: ?>
                                                        <?php echo e(__('Restore')); ?>

                                                    <?php endif; ?>
                                                </span>
                                            </a>
                                            <?php echo Form::close(); ?>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="avatar">
                                    <a href="<?php echo e(!empty($user->avatar) ? $profile . $user->avatar : $logo . 'avatar.png'); ?>"
                                        target="_blank">
                                        <img src="<?php echo e(!empty($user->avatar) ? $profile . $user->avatar : $logo . 'avatar.png'); ?>"
                                            class="rounded-circle" style="width: 100px">
                                    </a>
                                </div>
                                <h4 class="mt-2"><?php echo e($user->name); ?></h4>
                                <small><?php echo e($user->email); ?></small>
                                <?php if(\Auth::user()->type == 'super admin'): ?>
                                    <div class=" mb-0 mt-3">
                                        <div class=" p-3">
                                            <div class="row">
                                                <div class="col-7 text-start">
                                                    <a class="btn btn-outline-primary">
                                                        <h4 class="mb-0 px-1 mt-">
                                                        <?php echo e(!empty($user->currentPlan) ? $user->currentPlan->name : ''); ?>

                                                    </h4></a>
                                                </div>
                                                <div class="col-2 text-center Id">
                                                    <a href="#" data-url="<?php echo e(route('company.info', $user->id)); ?>"
                                                    data-size="lg" data-ajax-popup="true"
                                                    class="btn btn-primary " style="background-color:#2B3571;"
                                                    data-title="<?php echo e(__('Company Info')); ?>"><?php echo e(__('User')); ?></a>
                                                </div>

                                                <div class="row mt-4 g-0"> <!-- Use g-0 to remove gaps between columns -->
                                                <div class="col-6 text-middel">
                                                    <h6 class="mb-0 px-4"><?php echo e($user->countUsers()); ?></h6>
                                                    <p class="text-muted text-sm mb-0"><?php echo e(__('Users')); ?></p>
                                                </div>
                                                <div class="col-6 text-middel"> <!-- Change to col-6 for equal distribution -->
                                                    <h6 class="mb-0 px-4"><?php echo e($user->countEmployees()); ?></h6>
                                                    <p class="text-muted text-sm mb-0"><?php echo e(__('Employees')); ?></p>
                                                </div>
                                            </div>

                                            </div>
                                        </div>
                                    </div>
                                    
                                        <div class="mt-2 mb-0 blinking">
                                            <button class="btn btn-outline-primary mt-3 font-weight-500 ">
                                                <a><?php echo e(__('Plan Expire: ')); ?>

                                                    <?php echo e(!empty($user->plan_expire_date) ? \Auth::user()->dateFormat($user->plan_expire_date) : 'Lifetime'); ?>

                                                </a>
                                            </button>
                                        </div>
                                    
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <div class="col-xl-3 col-lg-4 col-sm-6">
                    <a href="#" class="btn-addnew-project " data-ajax-popup="true"
                        data-url="<?php echo e(route('user.create')); ?>" data-title="<?php echo e(__('Create New Company')); ?>"
                        data-bs-toggle="tooltip" title="" class="btn btn-sm btn-primary"
                        data-bs-original-title="<?php echo e(__('Create')); ?>">
                        <div class="bg-primary proj-add-icon my-4">
                            <i class="ti ti-plus"></i>
                        </div>
                        <h6 class="mt-4 mb-2"><?php echo e(__('New Company')); ?></h6>
                        <p class="text-muted text-center"><?php echo e(__('Click here to add new company')); ?></p>
                    </a>
                </div>
            <?php else: ?>
                <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-xl-3">
                        <div class="card  text-center">
                            <div class="card-header border-0 pb-0">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="mb-0">
                                        <div class="badge p-2 px-3 rounded bg-primary"><?php echo e(ucfirst($user->type)); ?></div>
                                    </h6>
                                </div>

                                <?php if(Gate::check('Edit User') || Gate::check('Delete User')): ?>
                                    <div class="card-header-right">
                                        <div class="btn-group card-option">
                                            <?php if($user->is_active == 1 && $user->is_disable == 1): ?>
                                                <button type="button" class="btn dropdown-toggle"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="feather icon-more-vertical"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-end">
                                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Edit User')): ?>
                                                        <a href="#" class="dropdown-item"
                                                            data-url="<?php echo e(route('user.edit', $user->id)); ?>" data-size="md"
                                                            data-ajax-popup="true" data-title="<?php echo e(__('Update User')); ?>"><i
                                                                class="ti ti-edit "></i><span
                                                                class="ms-2"><?php echo e(__('Edit')); ?></span></a>
                                                    <?php endif; ?>

                                                    <a href="#" class="dropdown-item" data-ajax-popup="true"
                                                        data-size="md" data-title="<?php echo e(__('Change Password')); ?>"
                                                        data-url="<?php echo e(route('user.reset', \Crypt::encrypt($user->id))); ?>"><i
                                                            class="ti ti-key"></i>
                                                        <span class="ms-1"><?php echo e(__('Reset Password')); ?></span></a>

                                                    <?php if($user->is_login_enable == 1): ?>
                                                        <a href="<?php echo e(route('user.login', \Crypt::encrypt($user->id))); ?>"
                                                            class="dropdown-item">
                                                            <i class="ti ti-road-sign"></i>
                                                            <span class="text-danger"> <?php echo e(__('Login Disable')); ?></span>
                                                        </a>
                                                    <?php elseif($user->is_login_enable == 0 && $user->password == null): ?>
                                                        <a href="#"
                                                            data-url="<?php echo e(route('user.reset', \Crypt::encrypt($user->id))); ?>"
                                                            data-ajax-popup="true" data-size="md"
                                                            class="dropdown-item login_enable"
                                                            data-title="<?php echo e(__('New Password')); ?>" class="dropdown-item">
                                                            <i class="ti ti-road-sign"></i>
                                                            <span class="text-success"> <?php echo e(__('Login Enable')); ?></span>
                                                        </a>
                                                    <?php else: ?>
                                                        <a href="<?php echo e(route('user.login', \Crypt::encrypt($user->id))); ?>"
                                                            class="dropdown-item">
                                                            <i class="ti ti-road-sign"></i>
                                                            <span class="text-success"> <?php echo e(__('Login Enable')); ?></span>
                                                        </a>
                                                    <?php endif; ?>

                                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Delete User')): ?>
                                                        <?php echo Form::open([
                                                            'method' => 'DELETE',
                                                            'route' => ['user.destroy', $user->id],
                                                            'id' => 'delete-form-' . $user->id,
                                                        ]); ?>

                                                        <a href="#" class="bs-pass-para dropdown-item"
                                                            data-confirm="<?php echo e(__('Are You Sure?')); ?>"
                                                            data-text="<?php echo e(__('This action can not be undone. Do you want to continue?')); ?>"
                                                            data-confirm-yes="delete-form-<?php echo e($user->id); ?>"
                                                            title="<?php echo e(__('Delete')); ?>" data-bs-toggle="tooltip"
                                                            data-bs-placement="top"><i class="ti ti-trash"></i><span
                                                                class="ms-2"><?php echo e(__('Delete')); ?></span></a>
                                                        <?php echo Form::close(); ?>

                                                    <?php endif; ?>
                                                </div>
                                            <?php else: ?>
                                                <i class="ti ti-lock"></i>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                <?php endif; ?>

                            </div>
                            <div class="card-body">
                                <div class="avatar">
                                    <a href="<?php echo e(!empty($user->avatar) ? $profile . $user->avatar : $logo . 'avatar.png'); ?>"
                                        target="_blank">
                                        <img src="<?php echo e(!empty($user->avatar) ? $profile . $user->avatar : $logo . 'avatar.png'); ?>"
                                            class="rounded-circle" style="width: 30%">
                                    </a>

                                </div>
                                <h4 class="mt-2 text-primary"><?php echo e($user->name); ?></h4>
                                <small class=""><?php echo e($user->email); ?></small>

                            </div>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <div class="col-xl-3 col-lg-4 col-sm-6">
                    <a href="#" class="btn-addnew-project " data-ajax-popup="true"
                        data-url="<?php echo e(route('user.create')); ?>" data-title="<?php echo e(__('Create New User')); ?>"
                        data-bs-toggle="tooltip" title="" class="btn btn-sm btn-primary"
                        data-bs-original-title="<?php echo e(__('Create')); ?>">
                        <div class="bg-primary proj-add-icon">
                            <i class="ti ti-plus"></i>
                        </div>
                        <h6 class="mt-4 mb-2"><?php echo e(__('New User')); ?></h6>
                        <p class="text-muted text-center"><?php echo e(__('Click here to add new user')); ?></p>
                    </a>
                </div>
            <?php endif; ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
    
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
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\risinghrmcli\resources\views/user/index.blade.php ENDPATH**/ ?>