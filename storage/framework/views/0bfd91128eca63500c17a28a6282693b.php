<?php
    $setting = App\Models\Utility::settings();
?>
     <?php echo Form::open(['route' => 'notices.store', 'method' => 'POST']); ?>

     <div class="modal-body">              
                    <div class="row">

                        <!-- Title Field -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <?php echo e(Form::label('title', __('Title'), ['class' => 'form-label'])); ?>

                                <?php echo e(Form::text('title', null, ['class' => 'form-control', 'required' => true, 'placeholder' => __('Enter Notice Title')])); ?>

                            </div>
                        </div>

                        <!-- Description Field -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <?php echo e(Form::label('description', __('Description'), ['class' => 'form-label'])); ?>

                                <?php echo e(Form::text('description', null, ['class' => 'form-control', 'required' => true, 'placeholder' => __('Enter Notice Description')])); ?>

                            </div>
                        </div>

                        <!-- Notice Start Date Field -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <?php echo e(Form::label('notice_startdate', __('Start Date'), ['class' => 'form-label'])); ?>

                                <?php echo e(Form::date('notice_startdate', null, ['class' => 'form-control', 'required' => true])); ?>

                            </div>
                        </div>

                        <!-- Notice End Date Field -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <?php echo e(Form::label('notice_enddate', __('End Date'), ['class' => 'form-label'])); ?>

                                <?php echo e(Form::date('notice_enddate', null, ['class' => 'form-control', 'required' => true])); ?>

                            </div>
                        </div>

                    </div>
</div>

                <div class="modal-footer">
                    <a href="<?php echo e(route('notices.index')); ?>" class="btn btn-light"><?php echo e(__('Cancel')); ?></a>
                    <?php echo e(Form::submit(__('Create Notice'), ['class' => 'btn btn-primary'])); ?>

                </div>
                <?php echo Form::close(); ?>

          <?php /**PATH C:\xampp\htdocs\hrm\resources\views/notice/create.blade.php ENDPATH**/ ?>