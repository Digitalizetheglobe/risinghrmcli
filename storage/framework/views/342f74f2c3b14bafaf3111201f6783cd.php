

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Manage Employee')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Employee')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <?php if(Auth::user()->type != 'hr'): ?> 
        <a href="<?php echo e(route('employee.export')); ?>" 
           class="btn btn-sm btn-primary flex items-center space-x-2">
            <i class="ti ti-file-export"></i>
            <span>Export</span> 
        </a>

        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Create Employee')): ?>
            <a href="<?php echo e(route('employee.create')); ?>" 
            data-title="<?php echo e(__('Create New Employee')); ?>" 
            class="btn btn-sm btn-primary flex items-center space-x-2">
                <i class="ti ti-plus"></i>
                <span>Create</span>
            </a>
        <?php endif; ?>
    <?php endif; ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header card-body table-border-style">
                    <div class="table-responsive">
                        <table class="table" id="pc-dt-simple">
                            <thead>
                                <tr>
                                    <th><?php echo e(__('Employee ID')); ?></th>
                                    <th><?php echo e(__('Name')); ?></th>
                                    <th><?php echo e(__('Email')); ?></th>
                                    <th><?php echo e(__('Branch')); ?></th>
                                    <th><?php echo e(__('Department')); ?></th>
                                    <th><?php echo e(__('Designation')); ?></th>
                                    <th><?php echo e(__('Date Of Joining')); ?></th>
                                    <?php if(Auth::user()->type != 'hr' && (Gate::check('Edit Employee') || Gate::check('Delete Employee'))): ?>
                                        <th width="130px"><?php echo e(__('Action')); ?></th>
                                    <?php endif; ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__currentLoopData = $employees; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $employee): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td>
                                            <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Show Employee')): ?>
                                                <a class="btn btn-outline-primary"
                                                    href="<?php echo e(route('employee.show', \Illuminate\Support\Facades\Crypt::encrypt($employee->id))); ?>">
                                                    <?php echo e($employee->formatted_id); ?>

                                                </a>
                                            <?php else: ?>
                                                <a href="#" class="btn btn-outline-primary">
                                                    <?php echo e($employee->formatted_id); ?>

                                                </a>
                                            <?php endif; ?>
                                        </td>
                                        <td><?php echo e($employee->name ?? '-'); ?></td>
                                        <td><?php echo e($employee->email ?? '-'); ?></td>  
                                        <td><?php echo e($employee->branch?->name ?? '-'); ?></td>
                                        <td><?php echo e($employee->department?->name ?? '-'); ?></td>
                                        <td><?php echo e($employee->designation?->name ?? '-'); ?></td>
                                        <td><?php echo e(\Auth::user()->dateFormat($employee->company_doj)); ?></td>
                                        
                                        <?php if(Auth::user()->type != 'hr' && (Gate::check('Edit Employee') || Gate::check('Delete Employee'))): ?>
                                            <td class="Action">
                                                <?php if(($employee->user?->is_active ?? 0) == 1 && ($employee->user?->is_disable ?? 0) == 1): ?>
                                                    <span>
                                                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Edit Employee')): ?>
                                                            <div class="action-btn bg-info ms-2">
                                                                <a href="<?php echo e(route('employee.edit', \Illuminate\Support\Facades\Crypt::encrypt($employee->id))); ?>"
                                                                    class="mx-3 btn btn-sm align-items-center"
                                                                    data-bs-toggle="tooltip" title=""
                                                                    data-bs-original-title="<?php echo e(__('Edit')); ?>">
                                                                    <i class="ti ti-pencil text-white"></i>
                                                                </a>
                                                            </div>
                                                        <?php endif; ?>

                                                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Delete Employee')): ?>
                                                            <div class="action-btn bg-danger ms-2">
                                                                <?php echo Form::open([
                                                                    'method' => 'DELETE',
                                                                    'route' => ['employee.destroy', $employee->id],
                                                                    'id' => 'delete-form-' . $employee->id,
                                                                ]); ?>

                                                                <a href="#"
                                                                    class="mx-3 btn btn-sm align-items-center bs-pass-para"
                                                                    data-bs-toggle="tooltip" title=""
                                                                    data-bs-original-title="Delete" aria-label="Delete">
                                                                    <i class="ti ti-trash text-white"></i>
                                                                </a>
                                                                <?php echo Form::close(); ?>

                                                            </div>
                                                        <?php endif; ?>
                                                    </span>
                                                <?php else: ?>
                                                    <i class="ti ti-lock"></i>
                                                <?php endif; ?>
                                            </td>
                                        <?php endif; ?>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\risinghrmcli\resources\views/employee/index.blade.php ENDPATH**/ ?>