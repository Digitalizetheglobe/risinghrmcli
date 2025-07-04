

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Project List')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Project List')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <?php if(Auth::user()->type != 'hr'): ?> 
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Create Employee')): ?>
            <a href="#" data-url="<?php echo e(route('projects.create')); ?>" data-ajax-popup="true"
                data-title="<?php echo e(__('Add New Project')); ?>" data-size="lg" data-bs-toggle="tooltip" title="Create"
                class="btn btn-sm btn-primary d-flex align-items-center justify-content-center p-0"
                style="height: 30px; width: 30px;">
                <i class="ti ti-plus"></i>
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
                                <th><?php echo e(__('Project Name')); ?></th>
                                <th><?php echo e(__('Department')); ?></th>
                                <?php if(Auth::user()->type != 'employee'): ?>
                                    <th><?php echo e(__('Assigned Employees')); ?></th>
                                <?php endif; ?>
                                <th><?php echo e(__('Start Date')); ?></th>
                                <th><?php echo e(__('End Date')); ?></th>
                                <?php if(Auth::user()->type != 'hr' && (Gate::check('Edit Meeting') || Gate::check('Delete Meeting'))): ?>
                                <th width="200px"><?php echo e(__('Action')); ?></th>
                                <?php endif; ?>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $__empty_1 = true; $__currentLoopData = $projects; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $project): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                <tr>
                                    <td><?php echo e($project->project_name); ?></td>
                                    <td>
                                        <?php if(is_array($project->assigned_data)): ?>
                                            <?php $deptCount = 0; ?>
                                            <?php $__currentLoopData = $project->assigned_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $assignment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php if(isset($departments[$assignment['department_id']])): ?>
                                                    <span class="badge bg-primary me-1 mb-1">
                                                        <?php echo e($departments[$assignment['department_id']]->name); ?>

                                                    </span>
                                                    <?php $deptCount++; ?>
                                                    <?php if($deptCount % 3 == 0): ?>
                                                        <br>
                                                    <?php endif; ?>
                                                <?php endif; ?>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <?php endif; ?>
                                    </td>
                                    
                                    <?php if(Auth::user()->type != 'employee'): ?>
                                        <td>
                                            <?php if(is_array($project->assigned_data)): ?>
                                                <?php $empCount = 0; ?>
                                                <?php $__currentLoopData = $project->assigned_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $assignment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <?php $__currentLoopData = $assignment['employee_ids'] ?? []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $employeeId): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <?php if(isset($employees[$employeeId])): ?>
                                                            <span class="badge bg-success me-1 mb-1">
                                                                <?php echo e($employees[$employeeId]->user->name ?? __('Unknown')); ?>

                                                            </span>
                                                            <?php $empCount++; ?>
                                                            <?php if($empCount % 3 == 0): ?>
                                                                <br>
                                                            <?php endif; ?>
                                                        <?php endif; ?>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <?php endif; ?>
                                        </td>
                                    <?php endif; ?>
                                    
                                    <td><?php echo e(\Carbon\Carbon::parse($project->project_startdate)->format('d M Y')); ?></td>
                                    <td><?php echo e(\Carbon\Carbon::parse($project->project_enddate)->format('d M Y')); ?></td>
                                    
                                    <?php if(Auth::user()->type != 'hr' && (Gate::check('Edit Meeting') || Gate::check('Delete Meeting'))): ?>
                                        <td class="Action" style="white-space: nowrap;">
                                            <!-- Edit Button -->
                                            <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Edit Meeting')): ?>
                                                <a href="#" 
                                                class="btn btn-sm btn-icon-only bg-info ms-2" 
                                                data-url="<?php echo e(route('projects.edit', $project->id)); ?>" 
                                                data-ajax-popup="true" 
                                                data-size="lg" 
                                                data-bs-toggle="tooltip" 
                                                data-title="<?php echo e(__('Edit Project')); ?>" 
                                                title="<?php echo e(__('Edit')); ?>">
                                                    <i class="ti ti-pencil text-white"></i>
                                                </a>
                                            <?php endif; ?>

                                            <!-- Delete Button -->
                                            <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Delete Meeting')): ?>
                                                <?php echo Form::open([
                                                    'method' => 'DELETE', 
                                                    'route' => ['projects.destroy', $project->id], 
                                                    'style' => 'display:inline'
                                                ]); ?>

                                                <a href="#" 
                                                class="btn btn-sm btn-icon-only bg-danger ms-2 bs-pass-para" 
                                                data-bs-toggle="tooltip" 
                                                title="<?php echo e(__('Delete Project')); ?>" 
                                                onclick="event.preventDefault(); document.getElementById('delete-form-<?php echo e($project->id); ?>').submit();">
                                                    <i class="ti ti-trash text-white"></i>
                                                </a>
                                                <?php echo Form::close(); ?>

                                            <?php endif; ?>
                                        </td>
                                    <?php endif; ?>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                <tr>
                                    <td colspan="<?php echo e(Auth::user()->type != 'employee' ? (Gate::check('Edit Meeting') || Gate::check('Delete Meeting') ? '6' : '5') : (Gate::check('Edit Meeting') || Gate::check('Delete Meeting') ? '5' : '4')); ?>" class="text-center"><?php echo e(__('No projects found')); ?></td>
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

<?php $__env->startSection('scripts'); ?>
<script>
    $(document).ready(function() {
        // Delete functionality with proper error handling
        $(document).on('click', '.bs-pass-para', function(e) {
            e.preventDefault();
            const button = $(this);
            const form = button.closest('form');
            const projectId = form.attr('action').split('/').pop();
            const row = form.closest('tr');

            if (!confirm('Are you sure you want to delete this project?')) {
                return;
            }

            // Show loading state
            button.prop('disabled', true);
            button.html('<i class="fas fa-spinner fa-spin"></i>');

            $.ajax({
                url: form.attr('action'),
                type: 'POST', // Laravel needs POST for DELETE method
                data: {
                    _method: 'DELETE',
                    _token: '<?php echo e(csrf_token()); ?>'
                },
                success: function(response) {
                    if (response.success) {
                        // Remove the row with animation
                        row.fadeOut(400, function() {
                            $(this).remove();
                            
                            // Show success message
                            showToast('success', response.message);
                            
                            // Handle empty table state
                            if ($('#pc-dt-simple tbody tr').length === 0) {
                                $('#pc-dt-simple tbody').append(
                                    '<tr><td colspan="6" class="text-center">No projects found</td></tr>'
                                );
                            }
                        });
                    } else {
                        showToast('error', response.message);
                        button.prop('disabled', false).html('<i class="ti ti-trash"></i>');
                    }
                },
                error: function(xhr) {
                    let errorMsg = 'Server error occurred';
                    if (xhr.responseJSON && xhr.responseJSON.message) {
                        errorMsg = xhr.responseJSON.message;
                    } else if (xhr.status === 403) {
                        errorMsg = 'Unauthorized action';
                    }
                    
                    showToast('error', errorMsg);
                    button.prop('disabled', false).html('<i class="ti ti-trash"></i>');
                    
                    // For debugging
                    console.error('Delete error:', xhr.responseJSON || xhr.statusText);
                }
            });
        });

        // Toast notification function
        function showToast(type, message) {
            const toast = `<div class="alert alert-${type} alert-dismissible fade show" role="alert">
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>`;
            
            $('.toast-container').html(toast);
            
            // Auto-dismiss after 5 seconds
            setTimeout(() => {
                $('.alert').alert('close');
            }, 5000);
        }
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\risinghrmcli\resources\views/projects/index.blade.php ENDPATH**/ ?>