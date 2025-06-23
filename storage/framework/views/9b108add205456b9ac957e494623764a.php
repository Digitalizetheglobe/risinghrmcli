<div class="card shadow-sm">
    <div class="card-body">
        <form action="<?php echo e(route('units.import')); ?>" method="POST" enctype="multipart/form-data">
            <?php echo csrf_field(); ?>   
            <div class="row align-items-center">
                <!-- Project Name Dropdown -->
                <div class="form-group col-md-6">
                    <label for="project_id" class="form-label"><?php echo e(__('Project Name')); ?></label>
                    <select name="project_id" id="project_id" class="form-control" required>
                        <option value="" disabled selected><?php echo e(__('Select Project')); ?></option>
                        <?php $__currentLoopData = $projects; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $project): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($project->id); ?>"><?php echo e($project->project_name); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>

                <!-- Import File Input -->
                <div class="form-group col-md-6">
                    <label for="import_file" class="form-label"><?php echo e(__('Import File')); ?></label>
                    <input type="file" name="import_file" id="import_file" class="form-control" accept=".csv, .xlsx" required>
                </div>
            </div>

            <?php if(isset($import_errors)): ?>
    <div class="alert alert-danger">
        <h5>Import Errors:</h5>
        <ul>
            <?php $__currentLoopData = $import_errors; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $failure): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <li>
                    Row <?php echo e($failure->row()); ?>: <?php echo e($failure->errors()[0]); ?>

                    <br>Values: <?php echo e(json_encode($failure->values())); ?>

                </li>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </ul>
    </div>
<?php endif; ?>

            <!-- Submit Button -->
            <div class="d-flex justify-content-end mt-4">
                <button type="submit" class="btn btn-primary"><?php echo e(__('Import Units')); ?></button>
            </div>
        </form>
    </div>
</div>

<?php /**PATH C:\xampp\htdocs\hrm\resources\views/units/create.blade.php ENDPATH**/ ?>