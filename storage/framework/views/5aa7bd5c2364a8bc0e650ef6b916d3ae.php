

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Project List')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Employee')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <a href="#" data-url="<?php echo e(route('project.create')); ?>" data-ajax-popup="true"
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
                        <?php $__currentLoopData = $tasks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $task): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <tr>
                                <td><?php echo e($task->project_name); ?></td>
                                <td><?php echo e($task->client_name); ?></td>
                                <td><?php echo e(ucfirst($task->project_type)); ?></td>
                                <td>
                                    <?php if($task->status == 'on_boarding'): ?>
                                        <span class="badge bg-warning"><?php echo e(__('On-Boarding')); ?></span>
                                    <?php elseif($task->status == 'on_hold'): ?>
                                        <span class="badge bg-secondary"><?php echo e(__('On Hold')); ?></span>
                                    <?php elseif($task->status == 'assigned'): ?>
                                        <span class="badge bg-info"><?php echo e(__('Assigned')); ?></span>
                                    <?php elseif($task->status == 'in_progress'): ?>
                                        <span class="badge bg-primary"><?php echo e(__('In Progress')); ?></span>
                                    <?php elseif($task->status == 'completed'): ?>
                                        <span class="badge bg-success"><?php echo e(__('Completed')); ?></span>
                                    <?php endif; ?>
                                </td>
                                <td>
                                    <!-- Edit Button -->
                                    <a href="<?php echo e(route('project.edit', $task->id)); ?>" class="btn btn-sm btn-primary">
                                        <i class="ti ti-pencil"></i> <?php echo e(__('Edit')); ?>

                                    </a>

                                    <!-- Delete Button -->
                                    <?php echo Form::open(['method' => 'DELETE', 'route' => ['project.destroy', $task->id], 'style' => 'display:inline']); ?>

                                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('<?php echo e(__('Are you sure?')); ?>')">
                                            <i class="ti ti-trash"></i> <?php echo e(__('Delete')); ?>

                                        </button>
                                    <?php echo Form::close(); ?>

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
<!-- Include DataTables JS -->
<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>

<!-- <script type="text/javascript">
    $(document).ready(function() {
        $('#pc-dt-simple').DataTable({
            "language": {
                "emptyTable": "No entries found" // This will show when there are no tasks in the table
            },
            "lengthMenu": [10, 25, 50, 100],  // Controls the number of entries per page
        });
    });
</script> -->
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\hrm\resources\views/project/index.blade.php ENDPATH**/ ?>