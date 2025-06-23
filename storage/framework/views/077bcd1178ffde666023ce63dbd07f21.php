

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Unit List')); ?> 
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Unit List')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <?php if(Auth::user()->type != 'hr'): ?> 
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Create Employee')): ?> 
            <?php if (! (auth()->user()->hasRole('HR'))): ?> 
                <a href="#" data-url="<?php echo e(route('units.create')); ?>" data-ajax-popup="true"
                    data-title="<?php echo e(__('Add New Unit')); ?>" data-size="lg" data-bs-toggle="tooltip" title="Create"
                    class="btn btn-sm btn-primary">
                    <i class="ti ti-plus"></i>
                </a>
            <?php endif; ?>
        <?php endif; ?>
    <?php endif; ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-header card-body table-border-style">

                <form method="GET" action="<?php echo e(route('units.index')); ?>" class="mb-4">
                    <div class="row">
                        <div class="col-md-4">
                            <select class="form-select" id="project_id" name="project_id" onchange="this.form.submit()">
                                <option value=""><?php echo e(__('All Projects')); ?></option>
                                <?php $__currentLoopData = $projects; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $project): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($project->id); ?>" <?php echo e(request('project_id') == $project->id ? 'selected' : ''); ?>>
                                        <?php echo e($project->project_name); ?>

                                    </option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table" id="pc-dt-simple">
                        <thead>
                            <tr>
                                <th><?php echo e(__('Project Name')); ?></th>
                                <th><?php echo e(__('Unit Name')); ?></th>
                                <th><?php echo e(__('Unit Size')); ?></th>
                                <?php if(Auth::user()->type != 'hr' &&Gate::check('Delete Employee')): ?>
                                <th width="200px"><?php echo e(__('Action')); ?></th>
                                <?php endif; ?>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $__empty_1 = true; $__currentLoopData = $units; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $unit): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                <tr>
                                    <td><?php echo e($unit->project ? $unit->project->project_name : __('N/A')); ?></td>
                                    <td><?php echo e($unit->unit_name); ?></td>
                                    <td><?php echo e($unit->unit_size); ?></td>
                                    <?php if(Auth::user()->type != 'hr' &&Gate::check('Delete Employee')): ?>
                                        <td class="Action">
                                            <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Delete Employee')): ?> 
                                                <div class="action-btn bg-danger ms-2">
                                                    <?php echo Form::open(['method' => 'DELETE', 'route' => ['units.destroy', $unit->id], 'id' => 'delete-form-' . $unit->id]); ?>

                                                        <a href="#" class="mx-3 btn btn-sm  align-items-center bs-pass-para" data-bs-toggle="tooltip" title="<?php echo e(__('Delete')); ?>"
                                                        data-original-title="<?php echo e(__('Delete')); ?>"
                                                        data-confirm="<?php echo e(__('Are You Sure?') . '|' . __('This action can not be undone. Do you want to continue?')); ?>"
                                                        data-confirm-yes="document.getElementById('delete-form-<?php echo e($unit->id); ?>').submit();">
                                                            <i class="ti ti-trash text-white"></i>
                                                        </a>
                                                    <?php echo Form::close(); ?>

                                                </div>
                                            <?php endif; ?>
                                        </td>
                                    <?php endif; ?>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                <tr>
                                    <td colspan="4" class="text-center"><?php echo e(__('No units found')); ?></td>
                                </tr>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\hrm\resources\views/units/index.blade.php ENDPATH**/ ?>