

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Notice List')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Notice List')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <a href="#" data-url="<?php echo e(route('notices.create')); ?>" data-ajax-popup="true"
        data-title="<?php echo e(__('Add New Notice')); ?>" data-size="lg" data-bs-toggle="tooltip" title="Create"
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
                                <th><?php echo e(__('Title')); ?></th>
                                <th><?php echo e(__('Description')); ?></th>
                                <th><?php echo e(__('Start Date')); ?></th>
                                <th><?php echo e(__('End Date')); ?></th>
                                <th width="130px"><?php echo e(__('Actions')); ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $__currentLoopData = $notices; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $notice): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($notice->title); ?></td>
                                    <td><?php echo e(Str::limit($notice->description, 50)); ?></td>
                                    <td><?php echo e($notice->notice_startdate ? \Carbon\Carbon::parse($notice->notice_startdate)->format('d M Y') : '-'); ?></td>
                                    <td><?php echo e($notice->notice_enddate ? \Carbon\Carbon::parse($notice->notice_enddate)->format('d M Y') : '-'); ?></td>
                                    <td class="d-flex gap-2">
                                        <!-- Edit Button -->
                                        <a href="#" 
                                            class="btn btn-sm btn-info text-white" 
                                            data-url="<?php echo e(route('notices.edit', $notice->id)); ?>" 
                                            data-ajax-popup="true" 
                                            data-size="lg" 
                                            data-bs-toggle="tooltip" 
                                            data-title="<?php echo e(__('Edit Notice')); ?>" 
                                            data-bs-original-title="<?php echo e(__('Edit')); ?>">
                                            <i class="ti ti-pencil"></i>
                                        </a>

                                        <!-- Delete Button with Form -->
                                        <form id="delete-form-<?php echo e($notice->id); ?>" method="POST" action="<?php echo e(route('notices.destroy', $notice->id)); ?>" style="display: inline;">
                                            <?php echo csrf_field(); ?>
                                            <?php echo method_field('DELETE'); ?>
                                        </form>

                                        <!-- <?php echo Form::open(['method' => 'DELETE', 'route' => ['notices.destroy', $notice->id], 'style' => 'display:inline']); ?> -->


                                        <a href="#" class="btn btn-sm btn-danger text-white"
                                            data-bs-toggle="tooltip"
                                            title="<?php echo e(__('Delete Notice')); ?>"
                                            onclick="event.preventDefault();  document.getElementById('delete-form-<?php echo e($notice->id); ?>').submit();">
                                            <i class="ti ti-trash text-white"></i>
                                        </a>
  
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
        $('#notice-table').DataTable({
            "language": {
                "emptyTable": "No notices found"
            },
            "lengthMenu": [10, 25, 50, 100],
        });
    });
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/u704145757/domains/connect360.in/public_html/resources/views/notice/index.blade.php ENDPATH**/ ?>