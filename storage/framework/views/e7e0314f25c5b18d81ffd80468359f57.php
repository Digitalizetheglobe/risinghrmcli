

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Edit Deduction Schedule')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('home')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><a href="<?php echo e(route('loan.index')); ?>"><?php echo e(__('Loan Management')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Edit Deduction')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <form method="post" action="<?php echo e(route('loan.deduction.update', ['deduction' => $deduction->id])); ?>">
                    <?php echo csrf_field(); ?>
                    <?php echo method_field('PUT'); ?>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="form-label"><?php echo e(__('Month')); ?></label>
                            <input type="text" class="form-control" value="<?php echo e(\Auth::user()->dateFormat($deduction->month)); ?>" readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label"><?php echo e(__('EMI Amount')); ?></label>
                            <input type="text" class="form-control" value="<?php echo e(\Auth::user()->priceFormat($deduction->emi_amount)); ?>" readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label"><?php echo e(__('Deduct this month?')); ?></label>
                            <select class="form-control" name="is_deducted" required>
                                <option value="1" <?php echo e($deduction->is_deducted ? 'selected' : ''); ?>><?php echo e(__('Yes, deduct as scheduled')); ?></option>
                                <option value="0" <?php echo e(!$deduction->is_deducted ? 'selected' : ''); ?>><?php echo e(__('No, defer this deduction')); ?></option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label"><?php echo e(__('Remark')); ?></label>
                            <input type="text" class="form-control" name="remark" value="<?php echo e($deduction->remark); ?>" placeholder="<?php echo e(__('Reason for deferral')); ?>">
                        </div>
                        <div class="col-12">
                            <input type="submit" value="<?php echo e(__('Update')); ?>" class="btn btn-primary">
                            <a href="<?php echo e(route('loan.show', $deduction->loan_id)); ?>" class="btn btn-secondary"><?php echo e(__('Cancel')); ?></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\hrm\resources\views/loan/edit_deduction.blade.php ENDPATH**/ ?>