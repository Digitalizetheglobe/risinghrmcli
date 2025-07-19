

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Increment Letter')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="row">
    <div class="col-lg-10">
        <div class="container">
            <div class="card mt-5" id="printTable" style="margin-left: 180px;margin-right: -57px; padding: 20px;">
                <div class="card-body" id="boxes">
                    <div style="padding: 50px;">
                        <h2 class="text-center">Increment Letter</h2>

                        <div style="display: flex; justify-content: space-between; width: 100%;">
                            <div>
                                <p>To,<br>
                                <?php echo e($employee->name); ?><br>
                                <?php echo e($employee->designation->name ?? ''); ?><br>
                                <?php echo e($employee->department->name ?? ''); ?></p>
                            </div>
                            <div style="text-align: right;">
                                <p>Date: <?php echo e(\Carbon\Carbon::parse($increment->created_at)->format('d/m/Y')); ?></p>
                            </div>
                        </div>


                        <p>Dear <?php echo e($employee->name); ?>,</p>

                        <p>
                            We are pleased to inform you that in recognition of your continued dedication and performance, 
                            your salary has been revised effective from <strong><?php echo e($increment->month_of_effective_date); ?></strong>.
                        </p>

                        <p>
                            Your new compensation will be 
                            <strong><?php echo e(\Auth::user()->priceFormat($increment->new_salary)); ?></strong> per annum, 
                            an increment of <strong><?php echo e(\Auth::user()->priceFormat($increment->increment_amount)); ?></strong> 
                            from your previous salary of <strong><?php echo e(\Auth::user()->priceFormat($increment->old_salary)); ?></strong>. 
                            This increment reflects our appreciation of your contributions and our confidence in your continued success with us.
                        </p>

                        <p>
                            Please note that this change will be reflected in your salary from 
                            <strong><?php echo e($increment->month_of_effective_date); ?></strong> onwards.
                        </p>

                        <p>
                            We value your commitment to the organization and look forward to your continued contributions.
                        </p>

                        <br><br>

                        <p>Best regards,</p>

                        <p>
                            <strong><?php echo e(\Auth::user()->name); ?></strong><br>
                            <strong><?php echo e(\Auth::user()->designation->name ?? 'HR'); ?></strong><br>
                            <strong><?php echo e($app_name); ?></strong>
                        </p>
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
        setTimeout(function () {
            window.open(window.location, '_self').close();
        }, 1000);
    }

    $(window).on('load', function () {
        var element = document.getElementById('boxes');
        var opt = {
            filename: 'Increment_Letter_<?php echo e($employee->name); ?>',
            image: { type: 'jpeg', quality: 1 },
            html2canvas: { scale: 4, dpi: 72, letterRendering: true },
            jsPDF: { unit: 'in', format: 'A4' }
        };

        html2pdf().set(opt).from(element).save().then(closeScript);
    });
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.contractheader', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\risinghrmcli\resources\views/setsalary/increment_letter_pdf.blade.php ENDPATH**/ ?>