<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Contract View')); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class="col-lg-10">
        <div class="container">
            <div>
                <div class="card mt-5" id="printTable" style="margin-left: 180px;margin-right: -57px;">
                    <div class="card-body" id="boxes" style="padding: 50px;">
                        <div class="row invoice-title mt-2">
                            <div class="col-xs-12 col-sm-12 col-nd-6 col-lg-6 col-12 ">
                                <img src="<?php echo e($img .'?'.time()); ?>" style="max-width: 150px;" />
                            </div>
                            <div class="col-xs-12 col-sm-12 col-nd-6 col-lg-6 col-12 text-end">
                                <h3 class="invoice-number"><?php echo e(\Auth::user()->contractNumberFormat($contract->id)); ?></h3>
                            </div>
                        </div>
                        <div class="row align-items-center mb-4">

                            <div class="col-sm-6 mb-3 mb-sm-0 mt-3">
                                <div class="col-lg-6 col-md-8 mb-3">
                                    <h6 class="d-inline-block m-0 d-print-none"><?php echo e(__('Contract Type  :')); ?></h6>
                                    <span class="col-md-8"><span
                                            class="text-md"><?php echo e($contract->contract_type->name); ?></span></span>
                                </div>
                                <div class="col-lg-6 col-md-8">
                                    <h6 class="d-inline-block m-0 d-print-none"><?php echo e(__('Contract Value   :')); ?></h6>
                                    <span class="col-md-8"><span
                                            class="text-md"><?php echo e(Auth::user()->priceFormat($contract->value)); ?></span></span>
                                </div>

                            </div>
                            <div class="col-sm-6 text-sm-end">
                                <div>
                                    <div class="float-end">
                                        <div class="">
                                            <h6 class="d-inline-block m-0 d-print-none"><?php echo e(__('Start Date   :')); ?></h6>
                                            <span class="col-md-8"><span
                                                    class="text-md"><?php echo e(Auth::user()->dateFormat($contract->start_date)); ?></span></span>
                                        </div>
                                        <div class="mt-3">
                                            <h6 class="d-inline-block m-0 d-print-none"><?php echo e(__('End Date   :')); ?></h6>
                                            <span class="col-md-8"><span
                                                    class="text-md"><?php echo e(Auth::user()->dateFormat($contract->end_date)); ?></span></span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <p data-v-f2a183a6="">

                        <div><?php echo $contract->description; ?></div>
                        <br>
                        <div><?php echo $contract->contract_description; ?></div>
                        </p>

                        <div class="row">
                            <div class="col-6">
                                <div style="margin-top: 20px;">
                                    <img width="200px" src="<?php echo e($contract->company_signature); ?>">
                                </div>
                                <div>
                                    <h5 class="mt-4"><?php echo e(__('Company Signature')); ?></h5>
                                </div>
                            </div>
                            <div class="col-6 text-end">
                                <div style="margin-bottom: 20px;">
                                    <img width="200px" src="<?php echo e($contract->employee_signature); ?>">
                                </div>
                                <div>
                                    <h5 style="margin-top: 45px;"><?php echo e(__('Employee Signature')); ?></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('script-page'); ?>
    <script type="text/javascript" src="<?php echo e(asset('js/html2pdf.bundle.min.js')); ?>"></script>
    <script>
        function closeScript() {
            setTimeout(function() {
                window.open(window.location, '_self').close();
            }, 1000);
        }

        $(window).on('load', function() {
            var element = document.getElementById('boxes');
            var opt = {
                filename: '<?php echo e($usr->contractNumberFormat($contract->id)); ?>',
                image: {
                    type: 'jpeg',
                    quality: 1
                },
                html2canvas: {
                    scale: 4,
                    dpi: 72,
                    letterRendering: true
                },
                jsPDF: {
                    unit: 'in',
                    format: 'A4'
                }
            };

            html2pdf().set(opt).from(element).save().then(closeScript);
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.contractheader', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\hrm\resources\views/contracts/template.blade.php ENDPATH**/ ?>