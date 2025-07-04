

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Loan Management')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('home')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Loan Management')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Create Employee')): ?>
        <a href="<?php echo e(route('loan.create')); ?>" class="btn btn-sm btn-primary" data-bs-toggle="tooltip" title="<?php echo e(__('Create')); ?>">
            <i class="ti ti-plus"></i>
        </a>
    <?php endif; ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="col-xl-12">
        <div class="card">
            <div class="card-header card-body table-border-style">
                <div class="table-responsive">
                    <table class="table datatable">
                        <thead>
                            <tr>
                                <th><?php echo e(__('Employee')); ?></th>
                                <th><?php echo e(__('Loan Amount')); ?></th>
                                <th><?php echo e(__('Monthly EMI')); ?></th>
                                <th><?php echo e(__('Months')); ?></th>
                                <th><?php echo e(__('Remaining')); ?></th>
                                <th><?php echo e(__('Start Month')); ?></th>
                                <th width="200px"><?php echo e(__('Action')); ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $__currentLoopData = $loans; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $loan): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($loan->employee->name); ?></td>
                                    <td><?php echo e(\Auth::user()->priceFormat($loan->total_amount)); ?></td>
                                    <td><?php echo e(\Auth::user()->priceFormat($loan->monthly_emi)); ?></td>
                                    <td><?php echo e($loan->number_of_months); ?></td>
                                    <td><?php echo e(\Auth::user()->priceFormat($loan->remaining_amount)); ?></td>
                                    <td><?php echo e(\Auth::user()->dateFormat($loan->start_month)); ?></td>
                                    <td class="Action">
                                                <span>
                                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Show Employee')): ?>
                                                        <a href="<?php echo e(route('loan.show', $loan->id)); ?>" class="btn btn-sm btn-warning">
                                                            <i class="ti ti-eye"></i>
                                                        </a>
                                                    <?php endif; ?>
                                                    
                                                   <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Edit Employee')): ?>
                                                        <?php if($loan->deductions->isNotEmpty()): ?>
                                                            <div class="action-btn bg-info ms-2">
                                                                <a href="<?php echo e(route('loan.deduction.edit', $loan->deductions->first()->id)); ?>" 
                                                                    class="mx-3 btn btn-sm align-items-center" 
                                                                    data-bs-toggle="tooltip" 
                                                                    title="<?php echo e(__('Edit')); ?>">
                                                                    <i class="ti ti-pencil text-white"></i>
                                                                </a>
                                                            </div>
                                                        <?php endif; ?>
                                                    <?php endif; ?>
                                                </span>
                                            </td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\risinghrmcli\resources\views/loan/index.blade.php ENDPATH**/ ?>