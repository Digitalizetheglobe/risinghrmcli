

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Project List')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Project List')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <a href="#" data-url="<?php echo e(route('projects.create')); ?>" data-ajax-popup="true"
        data-title="<?php echo e(__('Add New Project')); ?>" data-size="lg" data-bs-toggle="tooltip" title="Create"
        class="btn btn-sm btn-primary">
        <i class="ti ti-plus"></i>
    </a>
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
                                <th><?php echo e(__('Project Name')); ?></th>
                                <th><?php echo e(__('Client Name')); ?></th>
                                <th><?php echo e(__('Project Type')); ?></th>
                                <th><?php echo e(__('Status')); ?></th>
                                <th width="130px"><?php echo e(__('Actions')); ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $__currentLoopData = $projects; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $project): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($project->project_name); ?></td>
                                    <td><?php echo e($project->client_name); ?></td>
                                    <td><?php echo e(ucfirst($project->project_type)); ?></td>
                                    <td>
                                        <?php if($project->status == 'on_boarding'): ?>
                                            <span class="badge bg-warning"><?php echo e(__('On-Boarding')); ?></span>
                                        <?php elseif($project->status == 'on_hold'): ?>
                                            <span class="badge bg-secondary"><?php echo e(__('On Hold')); ?></span>
                                        <?php elseif($project->status == 'assigned'): ?>
                                            <span class="badge bg-info"><?php echo e(__('Assigned')); ?></span>
                                        <?php elseif($project->status == 'in_progress'): ?>
                                            <span class="badge bg-primary"><?php echo e(__('In Progress')); ?></span>
                                        <?php elseif($project->status == 'completed'): ?>
                                            <span class="badge bg-success"><?php echo e(__('Completed')); ?></span>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                      <!-- Edit Button -->
                                        <!-- Edit Button -->
                                        <div class="action-btn bg-info ms-2">
                                            <a href="#" 
                                            class="mx-3 btn btn-sm align-items-center" 
                                            data-url="<?php echo e(route('projects.edit', $project->id)); ?>" 
                                            data-ajax-popup="true" 
                                            data-size="lg" 
                                            data-bs-toggle="tooltip" 
                                            data-title="<?php echo e(__('Edit Project')); ?>" 
                                            data-bs-original-title="<?php echo e(__('Edit')); ?>">
                                                <i class="ti ti-pencil text-white"></i>
                                            </a>
                                        </div>


                                        <!-- Delete Button -->
                                        <div class="action-btn bg-danger ms-2">
                                            <?php echo Form::open([
                                                'method' => 'DELETE', 
                                                'route' => ['projects.destroy', $project->id], 
                                                'style' => 'display:inline'
                                            ]); ?>

                                            <a href="#" 
                                            class="mx-3 btn btn-sm align-items-center bs-pass-para" 
                                            data-bs-toggle="tooltip" 
                                            title="<?php echo e(__('Delete Project')); ?>" 
                                            data-bs-original-title="<?php echo e(__('Delete')); ?>" 
                                            aria-label="<?php echo e(__('Delete')); ?>" 
                                            onclick="event.preventDefault(); document.getElementById('delete-form-<?php echo e($project->id); ?>').submit();">
                                                <i class="ti ti-trash text-white"></i>
                                            </a>
                                            <?php echo Form::close(); ?>

                                        </div>

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

<?php $__env->startPush('scripts'); ?>
<script type="text/javascript">
    $(document).ready(function() {
        $('#pc-dt-simple').DataTable({
            "language": {
                "emptyTable": "No projects found"
            },
            "lengthMenu": [10, 25, 50, 100],
        });
    });
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/u704145757/domains/connect360.in/public_html/resources/views/projects/index.blade.php ENDPATH**/ ?>