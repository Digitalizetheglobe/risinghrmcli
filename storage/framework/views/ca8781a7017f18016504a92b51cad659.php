<?php
    use App\Models\Utility;
    use Illuminate\Support\Facades\Auth;
    use Illuminate\Support\Facades\DB;

    $users = Auth::user();
    $currantLang = $users->currentLanguage();
    $profile = asset('storage/uploads/avatar/'); // Updated path to public storage
    $unseenCounter = App\Models\ChMessage::where('to_id', Auth::user()->id)
        ->where('seen', 0)
        ->count();
    $unseen_count = DB::select('SELECT from_id, COUNT(*) AS totalmasseges FROM ch_messages WHERE seen = 0 GROUP BY from_id');

    $unseenCounter = App\Models\ChMessage::where('to_id', Auth::id())
        ->where('seen', 0)
        ->count();

    $leaveNotifications = \App\Models\Leave::where('status', 'pending')
        ->with(['employees.user', 'leaveType'])
        ->orderBy('created_at', 'desc')
        ->get();
    $unseenLeaveCount = $leaveNotifications->where('seen_by_manager', 0)->count();
?>

<?php if(isset($setting['cust_theme_bg']) && $setting['cust_theme_bg'] == 'on'): ?>
    <header class="dash-header transprent-bg" style="background: linear-gradient(to right, #fff, #fff); box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
<?php else: ?>
    <header class="dash-header" style="background: linear-gradient(to right, #0a3772, #008ecc);">
<?php endif; ?>

<div class="header-wrapper" style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
    <div class="me-auto dash-mob-drp">
        <ul class="list-unstyled" style="display: flex; align-items: center;">
            <li class="dash-h-item mob-hamburger">
                <a href="#!" class="dash-head-link" id="mobile-collapse">
                    <div class="hamburger hamburger--arrowturn">
                        <div class="hamburger-box">
                            <div class="hamburger-inner"></div>
                        </div>
                    </div>
                </a>
            </li>
            <li class="dropdown dash-h-item drp-company">
                <a class="dash-head-link dropdown-toggle arrow-none me-0" data-bs-toggle="dropdown" href="#"
                   role="button" aria-haspopup="false" aria-expanded="false" style="background-color: white;">
                    <span class="theme-avtar" style="background-color: white;">
                        <img alt="User Avatar"
                             src="<?php echo e($users->avatar ? asset('storage/uploads/avatar/' . $users->avatar) : asset('storage/uploads/avatar/avatar.png')); ?>"
                             class="header-avtar" style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover; background-color: white;">
                    </span>
                    <span class="hide-mob ms-2" style="background-color: white;"><?php echo e('Hi, ' . Auth::user()->name . '!'); ?>

                        <i class="ti ti-chevron-down drp-arrow nocolor hide-mob" style="background-color: white;"></i>
                    </span>
                </a>
                <div class="dropdown-menu dash-h-dropdown" style="background-color: white;">
                    <a href="<?php echo e(route('profile')); ?>" class="dropdown-item" style="background-color: white;">
                        <i class="ti ti-user"></i>
                        <span><?php echo e(__('My Profile')); ?></span>
                    </a>
                    <a href="<?php echo e(route('logout')); ?>" class="dropdown-item"
                       onclick="event.preventDefault();document.getElementById('logout-form').submit();"
                       style="background-color: white;">
                        <i class="ti ti-power"></i>
                        <span><?php echo e(__('Logout')); ?></span>
                    </a>
                    <form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST" style="display: none;">
                        <?php echo csrf_field(); ?>
                    </form>
                </div>
            </li>
        </ul>
    </div>
    
    <!-- Marquee Section for Daily Quote -->
    <div class="quote-container" style="display: flex; justify-content: center; align-items: center; flex-grow: 1;">
        <marquee behavior="scroll" direction="left" scrollamount="6" style="color: #0a3c77; font-size: 18px; font-weight: bold; width: 100%;margin: left 11px;">
            " <?php echo e($quote->quote ?? 'No quote for today!!'); ?> "
        </marquee>
    </div>

    <div class="ms-auto" style="display: flex; justify-content: flex-end; align-items: center;">
        <ul class="list-unstyled" style="display: flex; align-items: center;">
            <?php if(\Auth::user()->type != 'super admin'): ?>
                <li class="dropdown dash-h-item drp-notification">
                    <a class="dash-head-link dropdown-toggle arrow-none me-0 position-relative" 
                        data-bs-toggle="dropdown" href="#"
                        role="button" aria-haspopup="false" aria-expanded="false" id="leave-notification-btn">
                        <i class="ti ti-calendar-time fs-5"></i>

                        <?php if($unseenLeaveCount > 0): ?>
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger leave-counter">
                                <?php echo e($unseenLeaveCount); ?>

                            </span>
                        <?php endif; ?>
                    </a>
                    <div class="dropdown-menu dash-h-dropdown dropdown-menu-end">
                        <div class="noti-body">
                            <?php $__empty_1 = true; $__currentLoopData = $leaveNotifications; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $leave): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                <div class="d-flex align-items-center p-2 border-bottom leave-notification-item" 
                                     data-leave-id="<?php echo e($leave->id); ?>"
                                     style="background-color: <?php echo e($leave->seen_by_manager ? '#fff' : '#f8f9fa'); ?>;">
                                     <div class="flex-grow-1 ms-2">
                                         <h6 class="mb-0" style="font-size: 14px;">
                                             <?php if($leave->employees && $leave->employees->user): ?>
                                                 <?php echo e($leave->employees->user->name); ?>

                                             <?php elseif($leave->employee_name): ?>
                                                 <?php echo e($leave->employee_name); ?>

                                             <?php else: ?>
                                                 Unknown Employee
                                             <?php endif; ?>
                                             <span class="text-muted" style="font-size: 12px;">
                                                 (<?php echo e($leave->leaveType->title ?? 'N/A'); ?>)
                                             </span>
                                         </h6>
                                         <p class="mb-0 text-muted" style="font-size: 12px;">
                                             <?php echo e($leave->start_date); ?> to <?php echo e($leave->end_date); ?><br>
                                             Reason: <?php echo e(Str::limit($leave->leave_reason, 30)); ?>

                                         </p>
                                     </div>
                                     
                                     <div class="text-end">
                                         <small class="text-muted"><?php echo e($leave->created_at->diffForHumans()); ?></small>
                                         <br>
                                     </div>
                                       <td class="Action">
                                            <span>
                                                <?php if(\Auth::user()->type != 'employee'): ?>
                                                    <div class="action-btn bg-success ms-2">
                                                        <a href="#" class="mx-3 btn btn-sm  align-items-center"
                                                            data-size="lg"
                                                            data-url="<?php echo e(URL::to('leave/' . $leave->id . '/action')); ?>"
                                                            data-ajax-popup="true" data-size="md" data-bs-toggle="tooltip"
                                                            title="" data-title="<?php echo e(__('Leave Action')); ?>"
                                                            data-bs-original-title="<?php echo e(__('Manage Leave')); ?>">
                                                            <i class="ti ti-caret-right text-white"></i>
                                                        </a>
                                                    </div>
                                                    <?php else: ?>
                                                    <div class="action-btn bg-success ms-2">
                                                        <a href="#" class="mx-3 btn btn-sm  align-items-center"
                                                            data-size="lg"
                                                            data-url="<?php echo e(URL::to('leave/' . $leave->id . '/action')); ?>"
                                                            data-ajax-popup="true" data-size="md" data-bs-toggle="tooltip"
                                                            title="" data-title="<?php echo e(__('Leave Action')); ?>"
                                                            data-bs-original-title="<?php echo e(__('Manage Leave')); ?>">
                                                            <i class="ti ti-caret-right text-white"></i>
                                                        </a>
                                                    </div>
                                                <?php endif; ?>
                            </div>
                            
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                            <div class="text-center p-3">
                                <p class="mb-0"><?php echo e(__('No pending leave requests')); ?></p>
                            </div>
                        <?php endif; ?>
                        </div>
                        <div class="noti-footer">
                            <div class="d-grid">
                                <a href="<?php echo e(route('leave.index')); ?>"
                                   class="btn dash-head-link justify-content-center text-primary mx-0">
                                   View All Leaves
                                </a>
                            </div>
                        </div>
                    </div>
                </li>
            <?php endif; ?>
        </ul>
    </div>
</div>
</header>

<?php $__env->startPush('scripts'); ?>
    <script>
        $('#msg-btn').click(function() {
            let contactsPage = 1;
            let contactsLoading = false;
            let noMoreContacts = false;
            $.ajax({
                url: url + "/getContacts",
                method: "GET",
                data: {
                    _token: "<?php echo e(csrf_token()); ?>",
                    page: contactsPage,
                    type: 'custom',
                },
                dataType: "JSON",
                success: (data) => {
                    if (contactsPage < 2) {
                        $(".count-listOfContacts").html(data.contacts);
                    } else {
                        $(".count-listOfContacts").append(data.contacts);
                    }
                    $('.count-listOfContacts').find('.messenger-list-item').each(function(e) {
                        $('.noti-body .activeStatus').remove()
                        $('.noti-body .avatar').remove()
                        $(this).find('span').remove()
                        $(this).find('p').addClass("d-inline")
                        $(this).find('b').css({
                            "position": "absolute",
                            "right": "50px"
                        });
                        $(this).find('tr').remove('td')
                    })
                },
                error: (error) => {
                    setContactsLoading(false);
                    console.error(error);
                },
            });
        })
        
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.show-employee-info').forEach(button => {
                button.addEventListener('click', function(e) {
                    e.preventDefault();
                    const leaveId = this.getAttribute('data-leave-id');
                    const card = document.getElementById(`employee-card-${leaveId}`);
                    
                    document.querySelectorAll('.employee-info-card').forEach(el => {
                        el.style.display = 'none';
                    });
                    
                    card.style.display = 'block';
                    card.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
                });
            });

            document.querySelectorAll('.cancel-action').forEach(button => {
                button.addEventListener('click', function() {
                    this.closest('.employee-info-card').style.display = 'none';
                });
            });

            document.querySelectorAll('.confirm-action').forEach(button => {
                button.addEventListener('click', function(e) {
                    if(!confirm(`Are you sure you want to ${this.getAttribute('data-status')} this leave request?`)) {
                        e.preventDefault();
                    }
                });
            });
        });
    </script>
<?php $__env->stopPush(); ?><?php /**PATH D:\risinghrmcli\resources\views/partial/Admin/header.blade.php ENDPATH**/ ?>