

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Loan Details')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('home')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><a href="<?php echo e(route('loan.index')); ?>"><?php echo e(__('Loan Management')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Loan Details')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5><?php echo e(__('Loan Information')); ?></h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <p><strong><?php echo e(__('Employee')); ?>:</strong> <?php echo e($loan->employee->name); ?></p>
                            <p><strong><?php echo e(__('Loan Amount')); ?>:</strong> <?php echo e(\Auth::user()->priceFormat($loan->total_amount)); ?></p>
                            <p><strong><?php echo e(__('Monthly EMI')); ?>:</strong> <?php echo e(\Auth::user()->priceFormat($loan->monthly_emi)); ?></p>
                        </div>
                        <div class="col-md-6">
                            <p><strong><?php echo e(__('Number of Months')); ?>:</strong> <?php echo e($loan->number_of_months); ?></p>
                            <p><strong><?php echo e(__('Remaining Amount')); ?>:</strong> <?php echo e(\Auth::user()->priceFormat($loan->remaining_amount)); ?></p>
                            <p><strong><?php echo e(__('Start Month')); ?>:</strong> <?php echo e(\Auth::user()->dateFormat($loan->start_month)); ?></p>
                        </div>
                        <?php if($loan->reason): ?>
                        <div class="col-md-12">
                            <p><strong><?php echo e(__('Reason')); ?>:</strong> <?php echo e($loan->reason); ?></p>
                        </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5><?php echo e(__('EMI Schedule')); ?></h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th><?php echo e(__('Month')); ?></th>
                                    <th><?php echo e(__('EMI Amount')); ?></th>
                                    <th><?php echo e(__('Status')); ?></th>
                                    <th><?php echo e(__('Remark')); ?></th>
                                    <th><?php echo e(__('Action')); ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__currentLoopData = $loan->deductions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $deduction): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td>
                                            <?php echo e(\Auth::user()->dateFormat($deduction->month)); ?>

                                            <?php if($loan->extended_months > 0): ?>
    <div class="alert alert-info">
        <strong>Note:</strong> This loan has been extended by <?php echo e($loan->extended_months); ?> month(s) due to skipped payments.
    </div>
<?php endif; ?>
                                        </td>
                                        <td><?php echo e(\Auth::user()->priceFormat($deduction->emi_amount)); ?></td>
                                        <td>
                                            <?php if($deduction->is_deducted): ?>
                                                <span class="badge bg-success"><?php echo e(__('Deducted')); ?></span>
                                            <?php else: ?>
                                                <span class="badge bg-warning"><?php echo e(__('Pending')); ?></span>
                                            <?php endif; ?>
                                        </td>
                                        <td><?php echo e($deduction->remark ?? '-'); ?></td>
                                        <td>
                                            <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Edit Loan')): ?>
                                                <a href="<?php echo e(route('loan.deduction.edit', $deduction->id)); ?>" class="btn btn-sm btn-primary">
                                                    <i class="ti ti-edit"></i>
                                                </a>
                                            <?php endif; ?>
                                        </td>
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
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\hrm\resources\views/loan/show.blade.php ENDPATH**/ ?>