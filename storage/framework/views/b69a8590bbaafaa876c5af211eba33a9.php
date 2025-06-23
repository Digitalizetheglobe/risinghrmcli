<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Employee')); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><a href="<?php echo e(url('employee')); ?>"><?php echo e(__('Employee')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Manage Employee')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <div class="float-end">
        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('edit employee')): ?>
            <a href="<?php echo e(route('employee.edit', \Illuminate\Support\Facades\Crypt::encrypt($employee->id))); ?>"
                data-bs-toggle="tooltip" title="<?php echo e(__('Edit')); ?>"class="btn btn-sm btn-primary">
                <i class="ti ti-pencil"></i>
            </a>
        <?php endif; ?>
    </div>
    <div class="text-end mb-3">
        <div class="d-flex justify-content-end drp-languages">
            <ul class="list-unstyled mb-0 m-2">
                <li class="dropdown dash-h-item drp-language">
                    <a class="dash-head-link dropdown-toggle arrow-none me-0" data-bs-toggle="dropdown" href="#"
                        role="button" aria-haspopup="false" aria-expanded="false">
                        <span class="drp-text hide-mob text-primary"> <?php echo e(__('Joining Letter')); ?>

                            <i class="ti ti-chevron-down drp-arrow nocolor hide-mob"></i>
                    </a>
                    <div class="dropdown-menu dash-h-dropdown">
                        <a href="<?php echo e(route('joiningletter.download.pdf', $employee->id)); ?>" class=" btn-icon dropdown-item"
                            data-bs-toggle="tooltip" data-bs-placement="top" target="_blanks"><i
                                class="ti ti-download ">&nbsp;</i><?php echo e(__('PDF')); ?></a>

                        <a href="<?php echo e(route('joininglatter.download.doc', $employee->id)); ?>" class=" btn-icon dropdown-item"
                            data-bs-toggle="tooltip" data-bs-placement="top" target="_blanks"><i
                                class="ti ti-download ">&nbsp;</i><?php echo e(__('DOC')); ?></a>
                    </div>
                </li>
            </ul>
            <ul class="list-unstyled mb-0 m-2">
                <li class="dropdown dash-h-item drp-language">
                    <a class="dash-head-link dropdown-toggle arrow-none me-0" data-bs-toggle="dropdown" href="#"
                        role="button" aria-haspopup="false" aria-expanded="false">
                        <span class="drp-text hide-mob text-primary"> <?php echo e(__('Experience Certificate')); ?>

                            <i class="ti ti-chevron-down drp-arrow nocolor hide-mob"></i>
                    </a>
                    <div class="dropdown-menu dash-h-dropdown">
                        <a href="<?php echo e(route('exp.download.pdf', $employee->id)); ?>" class=" btn-icon dropdown-item"
                            data-bs-toggle="tooltip" data-bs-placement="top" target="_blanks"><i
                                class="ti ti-download ">&nbsp;</i><?php echo e(__('PDF')); ?></a>

                        <a href="<?php echo e(route('exp.download.doc', $employee->id)); ?>" class=" btn-icon dropdown-item"
                            data-bs-toggle="tooltip" data-bs-placement="top" target="_blanks"><i
                                class="ti ti-download ">&nbsp;</i><?php echo e(__('DOC')); ?></a>
                    </div>
                </li>
            </ul>
            <ul class="list-unstyled mb-0 m-2">
                <li class="dropdown dash-h-item drp-language">
                    <a class="dash-head-link dropdown-toggle arrow-none me-0" data-bs-toggle="dropdown" href="#"
                        role="button" aria-haspopup="false" aria-expanded="false">
                        <span class="drp-text hide-mob text-primary"> <?php echo e(__('NOC')); ?>

                            <i class="ti ti-chevron-down drp-arrow nocolor hide-mob"></i>
                    </a>
                    <div class="dropdown-menu dash-h-dropdown">
                        <a href="<?php echo e(route('noc.download.pdf', $employee->id)); ?>" class=" btn-icon dropdown-item"
                            data-bs-toggle="tooltip" data-bs-placement="top" target="_blanks"><i
                                class="ti ti-download ">&nbsp;</i><?php echo e(__('PDF')); ?></a>

                        <a href="<?php echo e(route('noc.download.doc', $employee->id)); ?>" class=" btn-icon dropdown-item"
                            data-bs-toggle="tooltip" data-bs-placement="top" target="_blanks"><i
                                class="ti ti-download ">&nbsp;</i><?php echo e(__('DOC')); ?></a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-xl-12">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <div class="card">
                            <div class="card-header">
                                <h6><?php echo e(__('Personal Details')); ?></h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <p><strong><?php echo e(__('Employee ID')); ?>:</strong> <?php echo e($employeesId); ?></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong><?php echo e(__('Name')); ?>:</strong> <?php echo e($employee->name); ?></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong><?php echo e(__('Email')); ?>:</strong> <?php echo e($employee->email); ?></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong><?php echo e(__('Phone')); ?>:</strong> <?php echo e($employee->phone); ?></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong><?php echo e(__('Office Phone 1')); ?>:</strong> <?php echo e($employee->office_phone_one ?? 'N/A'); ?></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong><?php echo e(__('Office Phone 2')); ?>:</strong> <?php echo e($employee->office_phone_two ?? 'N/A'); ?></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong><?php echo e(__('Emergency Number')); ?>:</strong> <?php echo e($employee->emergency_number ?? 'N/A'); ?></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong><?php echo e(__('Date of Birth')); ?>:</strong> <?php echo e(\Auth::user()->dateFormat($employee->dob)); ?></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong><?php echo e(__('Gender')); ?>:</strong> <?php echo e($employee->gender); ?></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong><?php echo e(__('Week Off Day')); ?>:</strong> <?php echo e($employee->week_off_day ?? 'N/A'); ?></p>
                                    </div>
                                    <div class="col-12">
                                        <p><strong><?php echo e(__('Address')); ?>:</strong> <?php echo e($employee->address ?? 'N/A'); ?></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="col-sm-12 col-md-6">
                   <div class="card">
                            <div class="card-header">
                                <h6><?php echo e(__('Company Details')); ?></h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <p><strong><?php echo e(__('Branch')); ?>:</strong> <?php echo e($employee->branch->name ?? 'N/A'); ?></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong><?php echo e(__('Department')); ?>:</strong> <?php echo e($employee->department->name ?? 'N/A'); ?></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong><?php echo e(__('Designation')); ?>:</strong> <?php echo e($employee->designation->name ?? 'N/A'); ?></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><strong><?php echo e(__('Date of Joining')); ?>:</strong> <?php echo e(\Auth::user()->dateFormat($employee->company_doj)); ?></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <div class="card ">
                        <div class="card-body employee-detail-body fulls-card emp-card">
                            <h5><?php echo e(__('Document Detail')); ?></h5>
                            <hr>
                            <div class="row">
                                <?php
                                    $employeedoc = $employee->documents()->pluck('document_value', 'document_id');
                                    $logo = \App\Models\Utility::get_file('uploads/document');
                                ?>
                                <?php if(!$documents->isEmpty()): ?>
                                    <?php $__currentLoopData = $documents; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $document): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="col-md-6">
                                            <div class="info text-sm">
                                                <strong class="font-bold"><?php echo e($document->name); ?> : </strong>
                                                <span><a href="<?php echo e(!empty($employeedoc[$document->id]) ? $logo . '/' . $employeedoc[$document->id] : ''); ?>"
                                                        target="_blank"><?php echo e(!empty($employeedoc[$document->id]) ? $employeedoc[$document->id] : ''); ?></a></span>
                                            </div>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php else: ?>
                                    <div class="text-center">
                                        No Document Type Added.!
                                    </div>
                                <?php endif; ?>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6">
                    <div class="card">
                        <div class="card-body employee-detail-body fulls-card emp-card">
                            <h5><?php echo e(__('Experience Detail')); ?></h5>
                            <hr>
                            <div class="row">
                                <?php if(!empty($experienceDetails)): ?>
                                    <?php $__currentLoopData = $experienceDetails; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $exp): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="col-md-12 mb-3">
                                            <strong>Company Name:</strong> <?php echo e($exp['previous_company_name'] ?? '-'); ?><br>
                                            <strong>Designation:</strong> <?php echo e($exp['previous_designation'] ?? '-'); ?><br>
                                            <strong>Start Date:</strong> <?php echo e($exp['start_date'] ?? '-'); ?><br>
                                            <strong>End Date:</strong> <?php echo e($exp['end_date'] ?? '-'); ?><br>
                                            <strong>Previous Salary:</strong> <?php echo e($exp['previous_salary'] ?? '-'); ?>

                                            <hr>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php else: ?>
                                    <div class="col-md-12">
                                        <p>No experience detail available.</p>
                                    </div>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-12">
           <div class="card">
                <div class="card-header">
                    <h6><?php echo e(__('Education Details')); ?></h6>
                </div>
                <div class="card-body">
                    <div class="row">
                        <?php if(!empty($educationDetails)): ?>
                            <?php $__currentLoopData = $educationDetails; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $edu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="col-md-12 mb-3">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <strong>Degree:</strong><br>
                                            <?php echo e($edu['degree'] ?? '-'); ?>

                                        </div>
                                        <div class="col-md-3">
                                            <strong>College Name:</strong><br>
                                            <?php echo e($edu['college_name'] ?? '-'); ?>

                                        </div>
                                        <div class="col-md-3">
                                            <strong>Passing Year:</strong><br>
                                            <?php echo e($edu['passing_year'] ?? '-'); ?>

                                        </div>
                                        <div class="col-md-3">
                                            <strong>Grade:</strong><br>
                                            <?php echo e($edu['grade'] ?? '-'); ?>

                                        </div>
                                    </div>
                                    <hr>
                                </div>

                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php else: ?>
                            <div class="col-md-12">
                                <p>No education details available.</p>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\hrm\resources\views/employee/show.blade.php ENDPATH**/ ?>