

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Create Loan')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('home')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><a href="<?php echo e(route('loan.index')); ?>"><?php echo e(__('Loan Management')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Create Loan')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <form method="post" action="<?php echo e(route('loan.store')); ?>">
                    <?php echo csrf_field(); ?>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label class="form-label"><?php echo e(__('Employee')); ?></label>
                            <select class="form-control select" required="required" name="employee_id">
                                <option value=""><?php echo e(__('Select Employee')); ?></option>
                                <?php $__currentLoopData = $employees; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $id => $name): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($id); ?>"><?php echo e($name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label"><?php echo e(__('Loan Amount')); ?></label>
                            <div class="input-group">
                                <span class="input-group-text"><?php echo e(\Auth::user()->currencySymbol()); ?></span>
                                <input type="number" class="form-control" name="total_amount" required placeholder="<?php echo e(__('Loan Amount')); ?>">
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label"><?php echo e(__('Number of Months')); ?></label>
                            <input type="number" class="form-control" name="number_of_months" required placeholder="<?php echo e(__('Number of Months')); ?>">
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label"><?php echo e(__('Start Month')); ?></label>
                            <input type="month" class="form-control" name="start_month" required>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="form-label"><?php echo e(__('Reason (Optional)')); ?></label>
                            <textarea class="form-control" name="reason" rows="3" placeholder="<?php echo e(__('Reason for loan')); ?>"></textarea>
                        </div>
                        <div class="col-12">
                            <input type="submit" value="<?php echo e(__('Create')); ?>" class="btn btn-primary">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\risinghrmcli\resources\views/loan/create.blade.php ENDPATH**/ ?>