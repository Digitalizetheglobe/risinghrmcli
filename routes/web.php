<?php

use App\Http\Controllers\AamarpayController;
use App\Models\Employee;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AwardController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\SettingsController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\MeetingController;
use App\Http\Controllers\IncomeTypeController;
use App\Http\Controllers\ExpenseController;
use App\Http\Controllers\ExpenseTypeController;
use App\Http\Controllers\AttendanceEmployeeController;
use App\Http\Controllers\LeaveController;
use App\Http\Controllers\LeaveTypeController;
use App\Http\Controllers\AccountListController;
use App\Http\Controllers\AiTemplateController;
use App\Http\Controllers\TimeSheetController;
use App\Http\Controllers\BookingFormController;
use App\Http\Controllers\SetSalaryController;
use App\Http\Controllers\EmailTemplateController;
use App\Http\Controllers\StripePaymentController;
use App\Http\Controllers\DepartmentController;
use App\Http\Controllers\DesignationController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\BranchController;
use App\Http\Controllers\SiteController;
use App\Http\Controllers\AwardTypeController;
use App\Http\Controllers\TerminationController;
use App\Http\Controllers\TerminationTypeController;
use App\Http\Controllers\AnnouncementController;
use App\Http\Controllers\HolidayController;
use App\Http\Controllers\AllowanceController;
use App\Http\Controllers\PaySlipController;
use App\Http\Controllers\ResignationController;
use App\Http\Controllers\TravelController;
use App\Http\Controllers\PromotionController;
use App\Http\Controllers\TransferController;
use App\Http\Controllers\ComplaintController;
use App\Http\Controllers\WarningController;
use App\Http\Controllers\TicketController;
use App\Http\Controllers\PayeesController;
use App\Http\Controllers\PayerController;
use App\Http\Controllers\DepositController;
use App\Http\Controllers\TransferBalanceController;
use App\Http\Controllers\LanguageController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\PlanController;
use App\Http\Controllers\PlanRequestController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\AssetController;
use App\Http\Controllers\DucumentUploadController;
use App\Http\Controllers\IndicatorController;
use App\Http\Controllers\AppraisalController;
use App\Http\Controllers\GoalTypeController;
use App\Http\Controllers\GoalTrackingController;
use App\Http\Controllers\CompanyPolicyController;
use App\Http\Controllers\TrainingTypeController;
use App\Http\Controllers\TrainerController;
use App\Http\Controllers\TrainingController;
use App\Http\Controllers\PaypalController;
use App\Http\Controllers\JobCategoryController;
use App\Http\Controllers\JobStageController;
use App\Http\Controllers\JobController;
use App\Http\Controllers\JobApplicationController;
use App\Http\Controllers\CustomQuestionController;
use App\Http\Controllers\InterviewScheduleController;
use App\Http\Controllers\LandingPageSectionController;
use App\Http\Controllers\PaystackPaymentController;
use App\Http\Controllers\FlutterwavePaymentController;
use App\Http\Controllers\RazorpayPaymentController;
use App\Http\Controllers\PaytmPaymentController;
use App\Http\Controllers\MercadoPaymentController;
use App\Http\Controllers\MolliePaymentController;
use App\Http\Controllers\SkrillPaymentController;
use App\Http\Controllers\CoingatePaymentController;
use App\Http\Controllers\PaymentWallPaymentController;
use App\Http\Controllers\CompetenciesController;
use App\Http\Controllers\PerformanceTypeController;
use App\Http\Controllers\ZoomMeetingController;
use App\Http\Controllers\ContractTypeController;
use App\Http\Controllers\ContractController;
use App\Http\Controllers\PaymentTypeController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\OvertimeController;
use App\Http\Controllers\OtherPaymentController;
use App\Http\Controllers\SaturationDeductionController;
use App\Http\Controllers\LoanController;
use App\Http\Controllers\DeductionOptionController;
use App\Http\Controllers\LoanOptionController;
use App\Http\Controllers\AllowanceOptionController;
use App\Http\Controllers\BankTransferController;
use App\Http\Controllers\BenefitPaymentController;
use App\Http\Controllers\BiometricAttendanceController;
use App\Http\Controllers\CashfreeController;
use App\Http\Controllers\CinetPayController;
use App\Http\Controllers\CommissionController;
use App\Http\Controllers\FedapayController;
use App\Http\Controllers\IyziPayController;
use App\Http\Controllers\MidtransController;
use App\Http\Controllers\NepalstePaymnetController;
use App\Http\Controllers\NotificationTemplatesController;
use App\Http\Controllers\PaiementProController;
use App\Http\Controllers\PayfastController;
use App\Http\Controllers\PayHereController;
use App\Http\Controllers\PayslipTypeController;
use App\Http\Controllers\PaytabController;
use App\Http\Controllers\PaytrController;
use App\Http\Controllers\ReferralProgramController;
use App\Http\Controllers\SspayController;
use App\Http\Controllers\TemplateController;
use App\Http\Controllers\ToyyibpayPaymentController;
use App\Http\Controllers\XenditPaymentController;
use App\Http\Controllers\YooKassaController;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\ToDoListController;
use App\Http\Controllers\QuoteController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\TaskAssignController;
use App\Http\Controllers\NoticeController;  
use App\Http\Controllers\UnitController;
use Illuminate\Support\Facades\File;










// use App\Http\Controllers\PlanRequestController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// routes/web.php
// Route::get('/units/by-project/{project}', [UnitController::class, 'getUnitsByProject']);
Route::get('/', function () {
    return view('welcome');
});

// web.php

require __DIR__ . '/auth.php';


Route::get('/check-compoff/{employee_id}', function($employeeId) {
    $result = \App\Models\CompOffLeave::where('employees_id', $employeeId)
        ->select('comp_off_date', 'comp_off_data')
        ->get();
    
    return $result;
});


Route::get('/backfill-comp-offs', [\App\Http\Controllers\BackfillController::class, 'run']);


Route::group(['middleware' => ['auth', 'verified']], function() {
    // Loan Management Routes
    Route::group(['prefix' => 'loan', 'as' => 'loan.'], function() {
        Route::get('/', [LoanController::class, 'index'])->name('index');
        Route::get('/create', [LoanController::class, 'create'])->name('create');
        Route::post('/store', [LoanController::class, 'store'])->name('store');
        Route::get('/show/{loan}', [LoanController::class, 'show'])->name('show');
        Route::get('/deduction/{deduction}/edit', [LoanController::class, 'editDeduction'])->name('deduction.edit');
Route::put('/deduction/{deduction}/update', [LoanController::class, 'updateDeduction'])
    ->name('deduction.update');    });
});

Route::any('/hrm/loan/deduction/{id}/update', function($id) {
    \Log::info('Request received', [
        'method' => request()->method(),
        'id' => $id,
        'input' => request()->all()
    ]);
    return response()->json(['message' => 'Debug endpoint']);
});




Route::get('/get-latest-attendance', function() {
    $employeeId = !empty(\Auth::user()->employee) ? \Auth::user()->employee->id : 0;
    $date = date("Y-m-d");
    
    $attendance = \App\Models\AttendanceEmployee::where('employee_id', $employeeId)
        ->where('date', $date)
        ->orderBy('created_at', 'desc')
        ->first();
    
    return response()->json([
        'clock_in' => $attendance ? $attendance->clock_in : null,
        'clock_out' => $attendance ? $attendance->clock_out : null,
        'date' => $date
    ]);
})->middleware('auth:api');

Route::get('education_images/{filename}', function($filename) {
    $path = storage_path('education_images/'.$filename);
    
    if (!File::exists($path)) {
        abort(404);
    }

    $file = File::get($path);
    $type = File::mimeType($path);

    return response($file, 200)
           ->header('Content-Type', $type);
})->where('filename', '.*');



 Route::group(['middleware' => ['auth']], function() {
        // Units Routes
        Route::resource('units', UnitController::class);

        Route::post('/units/import', [UnitController::class, 'import'])
        ->name('units.import')
        ->middleware('auth'); // Make sure this matches your auth requirements



      
            });



Route::middleware(['auth'])->group(function () {


    // Show all notices
    Route::get('/notices', [NoticeController::class, 'index'])->name('notices.index');

    // Show form to create a new notice
    Route::get('/notices/create', [NoticeController::class, 'create'])->name('notices.create');

    // Store new notice
    Route::post('/notices', [NoticeController::class, 'store'])->name('notices.store');

    // Show form to edit a notice
    Route::get('/notices/{notice}/edit', [NoticeController::class, 'edit'])->name('notices.edit');

    // Update notice
    Route::put('/notices/{notice}', [NoticeController::class, 'update'])->name('notices.update');

    // Delete notice
    Route::delete('/notices/{notice}', [NoticeController::class, 'destroy'])->name('notices.destroy');
    
});






Route::middleware(['auth'])->group(function () {
    Route::get('/todo', [ToDoListController::class, 'index'])->name('todo.index');
    Route::get('todo/create', [ToDoListController::class, 'create'])->name('todo.create');
    
    Route::post('/todo', [ToDoListController::class, 'store'])->name('todo.store');
    Route::get('todo/{id}/edit', [ToDoListController::class, 'edit'])->name('todo.edit');
    Route::put('todo/{id}', [ToDoListController::class, 'update'])->name('todo.update');

    Route::delete('/todo/{todo}', [ToDoListController::class, 'destroy'])->name('todo.destroy');

    Route::resource('todolist', ToDoListController::class);

});

Route::middleware(['auth'])->group(function () {

    // Route::resource('projects', ProjectController::class)->middleware(['auth', 'XSS']);

    Route::get('/get-units-by-project/{projectId}', [BookingFormController::class, 'getUnitsByProject']);
    // Show all projects
    Route::get('/projects', [ProjectController::class, 'index'])->name('projects.index');

    
    // Show form to create a new project
    Route::get('/projects/create', [ProjectController::class, 'create'])->name('projects.create');
    // Store new project
    Route::post('/projects', [ProjectController::class, 'store'])->name('projects.store');

    Route::get('/projects/{project}/units', [ProjectController::class, 'getUnits']);
    // Show form to edit a project
    Route::get('/projects/{project}/edit', [ProjectController::class, 'edit'])->name('projects.edit');
    Route::put('/projects/{project}', [ProjectController::class, 'update'])->name('projects.update');
    Route::get('/get-employees-by-department/{id}', [ProjectController::class, 'getEmployeesByDepartment'])->name('get-employees-by-department');
    Route::post('/get-employees-by-departments', [ProjectController::class, 'getEmployeesByDepartments'])->name('get-employees-by-departments');

    // Delete project
    Route::delete('/projects/{project}', [ProjectController::class, 'destroy'])->name('projects.destroy');


    
    Route::get('/get-project-by-project/{projectId}', [EmployeeController::class, 'getProjectByProject']);
});


Route::middleware(['auth'])->group(function () {
    // Show all assigned tasks
    Route::get('/taskassign', [TaskAssignController::class, 'index'])->name('taskassign.index');

    // Show form to create a new task assignment
    Route::get('/taskassign/create', [TaskAssignController::class, 'create'])->name('taskassign.create');

    // Store new task assignment
    Route::post('/taskassign', [TaskAssignController::class, 'store'])->name('taskassign.store');

    // Show form to edit a task assignment
    Route::get('/taskassign/{task}/edit', [TaskAssignController::class, 'edit'])->name('taskassign.edit');

    // Update task assignment
    Route::put('/taskassign/{task}', [TaskAssignController::class, 'update'])->name('taskassign.update');

    // Delete task assignment
    Route::delete('/taskassign/{task}', [TaskAssignController::class, 'destroy'])->name('taskassign.destroy');
});



Route::middleware(['auth'])->group(function () {
    // Show all timesheets
    Route::get('/timesheet', [TimeSheetController::class, 'index'])->name('timesheet.index');

    // Show form to create a new timesheet
    Route::get('/timesheet/create', [TimeSheetController::class, 'create'])->name('timesheet.create');

    // Store new timesheet
    Route::post('/timesheet', [TimeSheetController::class, 'store'])->name('timesheet.store');

    // Show form to edit a timesheet
    Route::get('/timesheet/{timeSheet}/edit', [TimeSheetController::class, 'edit'])->name('timesheet.edit');

    // Update timesheet
    Route::put('/timesheets/{id}', [TimeSheetController::class, 'update'])->name('timesheet.update');

    // Delete timesheet
    Route::delete('/timesheet/{timeSheet}', [TimeSheetController::class, 'destroy'])->name('timesheet.destroy');

    // show timesheet
    // If you want this accessible to all authenticated users
    Route::get('timesheet/{timeSheet}', [TimeSheetController::class, 'show'])
        ->middleware('auth')
        ->name('timesheet.show');
    // In your routes file
    Route::get('/get-projects-by-employee/{employeeId}', [TimeSheetController::class, 'getProjectsByEmployee']);











Route::get('/quote', [QuoteController::class, 'getTodaysQuote'])->name('quote');



Route::get('/check', [HomeController::class, 'check'])->middleware(
    [
        'auth',
        'XSS',
    ]
);
// Route::get('/password/resets/{lang?}', 'Auth\LoginController@showLinkRequestForm')->name('change.langPass');

Route::get('/', [HomeController::class, 'index'])->name('home')->middleware(['XSS']);

Route::get('career/{id}/{lang}', [JobController::class, 'career'])->name('career');
Route::get('job/requirement/{code}/{lang}', [JobController::class, 'jobRequirement'])->name('job.requirement');
Route::get('job/apply/{code}/{lang}', [JobController::class, 'jobApply'])->name('job.apply');
Route::post('job/apply/data/{code}', [JobController::class, 'jobApplyData'])->name('job.apply.data');
Route::get('terms_and_condition/{id}', [JobController::class, 'TermsAndCondition'])->name('terms-and-conditions');

// cookie consent
Route::any('/cookie-consent', [SettingsController::class, 'CookieConsent'])->name('cookie-consent');

Route::group(['middleware' => ['verified']], function () {



    Route::get('/dashboard', [HomeController::class, 'index'])->middleware(['auth', 'XSS'])->name('dashboard');
    // Route::get('/home', [HomeController::class, 'index'])->name('home')->middleware(
    //     [
    //         'auth',
    //         'XSS',
    //     ]
    // );
    Route::get('/home/getlanguvage', [HomeController::class, 'getlanguvage'])->name('home.getlanguvage');


    Route::group(
        [
            'middleware' => [
                'auth',
                'XSS',
            ],
        ],
        function () {

            Route::resource('settings', SettingsController::class);
            Route::post('email-settings', [SettingsController::class, 'saveEmailSettings'])->name('email.settings');
            Route::post('company-settings', [SettingsController::class, 'saveCompanySettings'])->name('company.settings');
            Route::post('payment-settings', [SettingsController::class, 'savePaymentSettings'])->name('payment.settings');
            Route::post('system-settings', [SettingsController::class, 'saveSystemSettings'])->name('system.settings');

            // Google Calendar
            Route::post('setting/google-calender', [SettingsController::class, 'saveGoogleCalenderSettings'])->name('google.calender.settings')->middleware(['auth', 'XSS']);
            Route::any('event/get_event_data', [EventController::class, 'get_event_data'])->name('event.get_event_data')->middleware(['auth', 'XSS']);
            Route::any('event/export-event', [EventController::class, 'export_event'])->name('event.export-event')->middleware(['auth', 'XSS']);

            // SEO Settings
            Route::post('setting/seo-setting', [SettingsController::class, 'SeoSettings'])->name('seo.settings')->middleware(['auth', 'XSS']);

            // cache Settings
            Route::post('setting/cache-setting', [SettingsController::class, 'CacheSettings'])->name('clear.cache')->middleware(['auth', 'XSS']);

            // cookie consent
            Route::post('cookie-setting', [SettingsController::class, 'saveCookieSettings'])->name('cookie.setting')->middleware(['auth', 'XSS']);


            Route::get('company-setting', [SettingsController::class, 'companyIndex'])->name('company.setting');
            Route::post('company-email-setting/{name?}', [EmailTemplateController::class, 'updateStatus'])->name('company.email.setting');
            // Route::post('company-email-setting/{name}', 'EmailTemplateController@updateStatus')->name('status.email.language')->middleware(['auth']);

            Route::post('pusher-settings', [SettingsController::class, 'savePusherSettings'])->name('pusher.settings');
            Route::post('business-setting', [SettingsController::class, 'saveBusinessSettings'])->name('business.setting');

            Route::post('zoom-settings', [SettingsController::class, 'zoomSetting'])->name('zoom.settings');

            // Route::get('test-mail', [SettingsController::class, 'testMail'])->name('test.mail');
            Route::any('test-mail', [SettingsController::class, 'testMail'])->name('test.mail');
            Route::post('test-mail/send', [SettingsController::class, 'testSendMail'])->name('test.send.mail');

            Route::get('create/ip', [SettingsController::class, 'createIp'])->name('create.ip');
            Route::post('create/ip', [SettingsController::class, 'storeIp'])->name('store.ip');
            Route::get('edit/ip/{id}', [SettingsController::class, 'editIp'])->name('edit.ip');
            Route::post('edit/ip/{id}', [SettingsController::class, 'updateIp'])->name('update.ip');
            Route::delete('destroy/ip/{id}', [SettingsController::class, 'destroyIp'])->name('destroy.ip');

            Route::get('create/webhook', [SettingsController::class, 'createWebhook'])->name('create.webhook');
            Route::post('create/webhook', [SettingsController::class, 'storeWebhook'])->name('store.webhook');
            Route::get('edit/webhook/{id}', [SettingsController::class, 'editWebhook'])->name('edit.webhook');
            Route::post('edit/webhook/{id}', [SettingsController::class, 'updateWebhook'])->name('update.webhook');
            Route::delete('destroy/webhook/{id}', [SettingsController::class, 'destroyWebhook'])->name('destroy.webhook');
        }
    );





    

    Route::group(
        [
            'middleware' => [
                'auth',
                'XSS',
            ],
        ],
        function () {

            Route::get('/orders', [StripePaymentController::class, 'index'])->name('order.index');
            Route::get('/refund/{id}/{user_id}', [StripePaymentController::class, 'refund'])->name('order.refund');
            Route::get('/stripe/{code}', [StripePaymentController::class, 'stripe'])->name('stripe');
            Route::get('/stripe_request/{code}', [StripePaymentController::class, 'stripe_request'])->name('stripe_request');
            Route::post('/stripe', [StripePaymentController::class, 'stripePost'])->name('stripe.post');
        }
    );

    Route::group(
        [
            'middleware' => [
                'auth',
                'XSS',
            ],
        ],
        function () {
            Route::get('/banktransfer/{code}', [BankTransferController::class, 'BankTransfer'])->name('banktransfer');
            Route::post('/banktransfer', [BankTransferController::class, 'banktransferstore'])->name('banktransfer.post');
        }
    );

    Route::get('order/{id}/action', [BankTransferController::class, 'action'])->name('order.action')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::post('order/approve/{id}', [BankTransferController::class, 'changeaction'])->name('order.changeaction')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::delete('OrderDestroy/{id}', [PlanController::class, 'OrderDestroy'])->name('order.destroy')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    // Email Templates
    Route::get('email_template_lang/{id}/{lang?}', [EmailTemplateController::class, 'manageEmailLang'])->name('manage.email.language')->middleware(['auth', 'XSS']);
    Route::post('email_template_store/{pid}', [EmailTemplateController::class, 'storeEmailLang'])->name('store.email.language')->middleware(['auth']);
    Route::post('email_template_status/{id}', [EmailTemplateController::class, 'updateStatus'])->name('status.email.language')->middleware(['auth']);

    Route::resource('email_template', EmailTemplateController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('email_template_lang', EmailTemplateLangController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get(
        '/test',

        [SettingsController::class, 'testEmail']
    )->name('test.email')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post(
        '/test/send',
        [SettingsController::class, 'testEmailSend']

    )->name('test.email.send')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    // End

    Route::resource('user', UserController::class)
        ->middleware(
            [
                'auth',
                'XSS',
            ]
        );
    // user log
    Route::get('userlogsView/{id}', [EmployeeController::class, 'view'])->name('userlog.view')->middleware(['auth', 'XSS']);

    Route::post('employee/json', [EmployeeController::class, 'json'])->name('employee.json')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::post('employee/getdepartment', [EmployeeController::class, 'getdepartment'])->name('employee.getdepartment')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::post('branch/employee/json', [EmployeeController::class, 'employeeJson'])->name('branch.employee.json')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('employee-profile', [EmployeeController::class, 'profile'])->name('employee.profile')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('show-employee-profile/{id}', [EmployeeController::class, 'profileShow'])->name('show.employee.profile')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('lastlogin', [EmployeeController::class, 'lastLogin'])->name('lastlogin')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('employee/{id}/edit', [EmployeeController::class, 'edit'])->name('employee.edit');

    Route::resource('employee', EmployeeController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::put('employee/{employee}', [EmployeeController::class, 'update'])->name('employee.update');


    Route::delete('lastlogin/{id}', [EmployeeController::class, 'logindestroy'])->name('employee.logindestroy')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::resource('department', DepartmentController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('designation', DesignationController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('document', DocumentController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('branch', BranchController::class)->middleware(
        [
             'auth',
            'XSS',
        ]
    );

    Route::resource('site', SiteController::class)->middleware(['auth', 'XSS']);

    
    Route::resource('awardtype', AwardTypeController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('award', AwardController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('termination/{id}/description', [TerminationController::class, 'description'])->name('termination.description');

    Route::resource('termination', TerminationController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('terminationtype', TerminationTypeController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('announcement/getdepartment', [AnnouncementController::class, 'getdepartment'])->name('announcement.getdepartment')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('announcement/getemployee', [AnnouncementController::class, 'getemployee'])->name('announcement.getemployee')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('announcement', AnnouncementController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('task', TaskController::class);
    Route::post('task/getdepartment', [TaskController::class, 'getDepartment'])->name('task.getdepartment');
    Route::post('task/getemployee', [TaskController::class, 'getEmployee'])->name('task.getemployee');
    




    Route::get('holiday/calender', [HolidayController::class, 'calender'])->name('holiday.calender')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('holiday', HolidayController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    // Google Calendar
    Route::any('holiday/get_holiday_data', [HolidayController::class, 'get_holiday_data'])->name('holiday.get_holiday_data')->middleware(['auth', 'XSS']);
    // Route::any('holiday/export-event', [HolidayController::class, 'export_event'])->name('holiday.export-holiday')->middleware(['auth', 'XSS']);

    Route::get('employee/salary/{eid}', [SetSalaryController::class, 'employeeBasicSalary'])->name('employee.basic.salary')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('allowances/create/{eid}', [AllowanceController::class, 'allowanceCreate'])->name('allowances.create')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('commissions/create/{eid}', [CommissionController::class, 'commissionCreate'])->name('commissions.create')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
 
    Route::get('saturationdeductions/create/{eid}', [SaturationDeductionController::class, 'saturationdeductionCreate'])->name('saturationdeductions.create')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('otherpayments/create/{eid}', [OtherPaymentController::class, 'otherpaymentCreate'])->name('otherpayments.create')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('overtimes/create/{eid}', [OvertimeController::class, 'overtimeCreate'])->name('overtimes.create')->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    //payslip

    Route::resource('paysliptype', PayslipTypeController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    Route::resource('allowance', AllowanceController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    Route::resource('commission', CommissionController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::resource('allowanceoption', AllowanceOptionController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::resource('loanoption', LoanOptionController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::resource('deductionoption', DeductionOptionController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );


  

    Route::resource('saturationdeduction', SaturationDeductionController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    Route::resource('otherpayment', OtherPaymentController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::resource('overtime', OvertimeController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::post('event/getdepartment', [EventController::class, 'getdepartment'])->name('event.getdepartment')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('event/getemployee', [EventController::class, 'getemployee'])->name('event.getemployee')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::get('event/data/{id}', [EventController::class, 'showData'])->name('eventsshow');
    Route::resource('event', EventController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::resource('event', EventController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );



    Route::get('import/event/file', [EventController::class, 'importFile'])->name('event.file.import');
    Route::post('import/event', [EventController::class, 'import'])->name('event.import');
    Route::get('export/event', [EventController::class, 'export'])->name('event.export');

    Route::post('meeting/getdepartment', [MeetingController::class, 'getdepartment'])->name('meeting.getdepartment')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('meeting/getemployee', [MeetingController::class, 'getemployee'])->name('meeting.getemployee')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('meeting', MeetingController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    



    Route::get('calender/meeting', [MeetingController::class, 'calender'])->name('meeting.calender')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::any('/meeting/get_meeting_data', [MeetingController::class, 'get_meeting_data'])->name('meeting.get_meeting_data')->middleware(['auth', 'XSS']);

    Route::post('employee/update/sallary/{id}', [SetSalaryController::class, 'employeeUpdateSalary'])->name('employee.salary.update')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('salary/employeeSalary', [SetSalaryController::class, 'employeeSalary'])->name('employeesalary')->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    Route::resource('setsalary', SetSalaryController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::get('payslip/paysalary/{id}/{date}', [PaySlipController::class, 'paysalary'])->name('payslip.paysalary')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('payslip/bulk_pay_create/{date}', [PaySlipController::class, 'bulk_pay_create'])->name('payslip.bulk_pay_create')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('payslip/bulkpayment/{date}', [PaySlipController::class, 'bulkpayment'])->name('payslip.bulkpayment')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('payslip/search_json', [PaySlipController::class, 'search_json'])->name('payslip.search_json')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('payslip/employeepayslip', [PaySlipController::class, 'employeepayslip'])->name('payslip.employeepayslip')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('payslip/showemployee/{id}', [PaySlipController::class, 'showemployee'])->name('payslip.showemployee')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('payslip/editemployee/{id}', [PaySlipController::class, 'editemployee'])->name('payslip.editemployee')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::post('payslip/editemployee/{id}/{month}', [PaySlipController::class, 'updateEmployee'])->name('payslip.updateemployee')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('payslip/pdf/{id}/{m}', [PaySlipController::class, 'pdf'])->name('payslip.pdf')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('payslip/payslipPdf/{id}', [PaySlipController::class, 'payslipPdf'])->name('payslip.payslipPdf')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('payslip/send/{id}/{m}', [PaySlipController::class, 'send'])->name('payslip.send')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::get('payslip/delete/{id}', [PaySlipController::class, 'destroy'])->name('payslip.delete')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::resource('payslip', PaySlipController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    Route::resource('resignation', ResignationController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('travel', TravelController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('promotion', PromotionController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('transfer', TransferController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('complaint', ComplaintController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('warning', WarningController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::get('profile', [UserController::class, 'profile'])->name('profile')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::post('edit-profile', [UserController::class, 'editprofile'])->name('update.account')->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    Route::resource('accountlist', AccountListController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('accountbalance', [AccountListController::class, 'account_balance'])->name('accountbalance')->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    Route::get('leave/{id}/action', [LeaveController::class, 'action'])->name('leave.action')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::post('leave/changeaction', [LeaveController::class, 'changeaction'])->name('leave.changeaction')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('leave/jsoncount', [LeaveController::class, 'jsoncount'])->name('leave.jsoncount')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('leave', LeaveController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::get('hrm/leave/calendar', [LeaveController::class, 'calendar'])->name('leave.calendar')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    

    Route::any('leave/get_leave_data', [LeaveController::class, 'get_leave_data'])->name('leave.get_leave_data')->middleware(['auth', 'XSS']);

    Route::get('ticket/{id}/reply', [TicketController::class, 'reply'])->name('ticket.reply')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('ticket/changereply', [TicketController::class, 'changereply'])->name('ticket.changereply')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('ticket', TicketController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::get('attendanceemployee/bulkattendance', [AttendanceEmployeeController::class, 'bulkAttendance'])->name('attendanceemployee.bulkattendance')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('attendanceemployee/bulkattendance', [AttendanceEmployeeController::class, 'bulkAttendanceData'])->name('attendanceemployee.bulkattendances')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::post('attendanceemployee/attendance', [AttendanceEmployeeController::class, 'attendance'])->name('attendanceemployee.attendance')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::resource('attendanceemployee', AttendanceEmployeeController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('attendance-calendar', [AttendanceEmployeeController::class, 'calendar'])->name('attendance.calendar')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    //import attendance
    Route::get('import/attendance/file', [AttendanceEmployeeController::class, 'importFile'])->name('attendance.file.import');
    Route::post('import/attendance', [AttendanceEmployeeController::class, 'import'])->name('attendance.import');

    Route::get('attendance/export', [AttendanceEmployeeController::class, 'export'])->name('attendance.export');
    

        // Route::resource('timesheet', TimeSheetController::class)->middleware(
        //     [
        //         'auth',
        //         'XSS',
        //     ]
        // );
        Route::get('/projects/{project}/units', function ($projectId) {
            return Unit::where('project_id', $projectId)
                      ->get(['id', 'unit_name']);
        });
        

        Route::resource('booking', BookingFormController::class, [
            'parameters' => [
                'booking' => 'bookingForm'  // This tells Laravel to use $bookingForm in methods
            ]])->middleware(['auth', 'XSS']);    


            // For create
        Route::get('/booking/create', [BookingFormController::class, 'create'])->name('booking.create');

        // For edit
        Route::get('/booking/{booking}/edit', [BookingFormController::class, 'edit'])->name('booking.edit');

        // For create/store
        Route::post('/booking', [BookingFormController::class, 'store'])->name('booking.store');

        // For edit/update
        Route::put('/booking/{bookingForm}', [BookingFormController::class, 'update'])->name('booking.update');



                    
        Route::get('booking/pdf/{id}', [BookingFormController::class, 'pdf'])->name('booking.pdf');
        Route::get('booking/payslip/{id}', [BookingFormController::class, 'payslip'])->name('booking.payslip');    


        Route::get('/booking/export', [BookingFormController::class, 'export'])->name('booking.export');

        Route::get('/get-units-by-project/{projectId}', [BookingFormController::class, 'getUnitsByProject'])
        ->name('get.units.by.project');
        Route::get('/get-employee-projects/{userId}', [BookingFormController::class, 'getEmployeeProjects']);});

        Route::get('get-unit-details/{unit_id}', [BookingFormController::class, 'getUnitDetails'])->name('get.unit.details');
        Route::get('booking/{id}/view', [BookingFormController::class, 'payslip'])->name('booking.view');
      

        Route::resource('enquiry', EnquiryFormController::class)->middleware(
            [
                'auth',
                'XSS',
            ]
        );
        
    
       
        

    

    


    Route::resource('expensetype', ExpenseTypeController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('incometype', IncomeTypeController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('paymenttype', PaymentTypeController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('leavetype', LeaveTypeController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::resource('payees', PayeesController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('payer', PayerController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('deposit', DepositController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('expense', ExpenseController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('transferbalance', TransferBalanceController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    Route::group(
        [
            'middleware' => [
                'auth',
                'XSS',
            ],
        ],
        function () {
            Route::get('change-language/{lang}', [LanguageController::class, 'changeLanquage'])->name('change.language');
            Route::get('manage-language/{lang}', [LanguageController::class, 'manageLanguage'])->name('manage.language');
            Route::post('store-language-data/{lang}', [LanguageController::class, 'storeLanguageData'])->name('store.language.data');
            Route::get('create-language', [LanguageController::class, 'createLanguage'])->name('create.language');
            Route::post('store-language', [LanguageController::class, 'storeLanguage'])->name('store.language');
            Route::delete('/lang/{id}', [LanguageController::class, 'destroyLang'])->name('lang.destroy');
            Route::post('disable-language', [LanguageController::class, 'disableLang'])->name('disablelanguage');
        }
    );

    Route::resource('roles', RoleController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('permissions', PermissionController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::get('user/{id}/plan', [UserController::class, 'upgradePlan'])->name('plan.upgrade')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('user/{id}/plan/{pid}', [UserController::class, 'activePlan'])->name('plan.active')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::resource('plans', PlanController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::get('plans/plans-trial/{id}', [PlanController::class, 'PlanTrial'])->name('plans.trial');
    Route::post('plan-disable', [PlanController::class, 'planDisable'])->name('plan.disable')->middleware(['auth', 'XSS']);
    // Route::get('/plan_request/{code}', 'PlanController@plan_request')->name('plan_request')->middleware(
    //     [
    //         'auth',
    //         'XSS',
    //     ]
    // );


    // Route::resource('plan_requests', 'PlanRequestController');

    // Route::get('/plan_requests/update/{id}', 'PlanRequestController@update')->name('plan_request.update')->middleware(
    //     [
    //         'auth',
    //         'XSS',
    //     ]
    // );

    Route::group(
        [
            'middleware' => [
                'auth',
                'XSS',

            ],
        ],
        function () {
            Route::resource('plan_request', PlanRequestController::class);
        }
    );



    // Plan Request Module
    Route::get('plan_request', [PlanRequestController::class, 'index'])->name('plan_request.index')->middleware(['auth', 'XSS',]);
    Route::get('request_frequency/{id}', [PlanRequestController::class, 'requestView'])->name('request.view')->middleware(['auth', 'XSS',]);
    Route::get('request_send/{id}', [PlanRequestController::class, 'userRequest'])->name('send.request')->middleware(['auth', 'XSS',]);
    Route::get('request_response/{id}/{response}', [PlanRequestController::class, 'acceptRequest'])->name('response.request')->middleware(['auth', 'XSS',]);
    Route::get('request_cancel/{id}', [PlanRequestController::class, 'cancelRequest'])->name('request.cancel')->middleware(['auth', 'XSS',]);
    // End Plan Request Module



    Route::post('change-password', [UserController::class, 'updatePassword'])->name('update.password');

    Route::resource('coupons', CouponController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('account-assets', AssetController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('document-upload', DucumentUploadController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('indicator', IndicatorController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('appraisal', AppraisalController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('goaltype', GoalTypeController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('goaltracking', GoalTrackingController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('company-policy', CompanyPolicyController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::resource('notification-templates', NotificationTemplatesController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('notification-templates/{id?}/{lang?}/', [NotificationTemplatesController::class, 'index'])->name('notification-templates.index')->middleware(['auth', 'XSS']);

    Route::get('/leave/notifications', [LeaveController::class, 'notifications'])
    ->name('leave.notifications');

    Route::resource('trainingtype', TrainingTypeController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('trainer', TrainerController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );



    Route::post('training/status', [TrainingController::class, 'updateStatus'])->name('training.status')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::resource('training', TrainingController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::post('training/getemployee', [TrainingController::class, 'getemployee'])->name('training.getemployee')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::post('plan-pay-with-paypal', [PaypalController::class, 'planPayWithPaypal'])->name('plan.pay.with.paypal')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('{id}/plan-get-payment-status', [PaypalController::class, 'planGetPaymentStatus'])->name('plan.get.payment.status')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('/apply-coupon', [CouponController::class, 'applyCoupon'])
    ->name('apply.coupon')
    ->middleware(['auth', 'XSS']);


    Route::get('report/income-expense', [ReportController::class, 'incomeVsExpense'])->name('report.income-expense')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::get('dashboard/dashboard', [HomeController::class, 'incomeVsExpense'])->name('dashboard.company')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('report/leave', [ReportController::class, 'leave'])->name('report.leave')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('employee/{id}/leave/{status}/{type}/{month}/{year}', [ReportController::class, 'employeeLeave'])->name('report.employee.leave')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('report/account-statement', [ReportController::class, 'accountStatement'])->name('report.account.statement')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('report/payroll', [ReportController::class, 'payroll'])->name('report.payroll')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('report/monthly/attendance', [ReportController::class, 'monthlyAttendance'])->name('report.monthly.attendance')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::post('monthly/getdepartment', [ReportController::class, 'getdepartment'])->name('monthly.getdepartment')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('monthly/getemployee', [ReportController::class, 'getemployee'])->name('monthly.getemployee')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::get('report/attendance/{month}/{branch}/{department}/{employee}', [ReportController::class, 'exportCsv'])->name('report.attendance')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::get('report/timesheet', [ReportController::class, 'timesheet'])->name('report.timesheet')->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    //------------------------------------  Recurtment --------------------------------

    Route::resource('job-category', JobCategoryController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    Route::resource('job-stage', JobStageController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('job-stage/order', [JobStageController::class, 'order'])->name('job.stage.order')->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    Route::resource('job', JobController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    // Route::get('career/{id}/{lang}', [JobController::class, 'career'])->name('career');
    // Route::get('job/requirement/{code}/{lang}', [JobController::class, 'jobRequirement'])->name('job.requirement');
    // Route::get('job/apply/{code}/{lang}', [JobController::class, 'jobApply'])->name('job.apply');
    // Route::post('job/apply/data/{code}', [JobController::class, 'jobApplyData'])->name('job.apply.data');


    Route::get('candidates-job-applications', [JobApplicationController::class, 'candidate'])->name('job.application.candidate')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::resource('job-application', JobApplicationController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::post('job-application/order', [JobApplicationController::class, 'order'])->name('job.application.order')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('job-application/{id}/rating', [JobApplicationController::class, 'rating'])->name('job.application.rating')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::delete('job-application/{id}/archive', [JobApplicationController::class, 'archive'])->name('job.application.archive')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::post('job-application/{id}/skill/store', [JobApplicationController::class, 'addSkill'])->name('job.application.skill.store')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('job-application/{id}/note/store', [JobApplicationController::class, 'addNote'])->name('job.application.note.store')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::delete('job-application/{id}/note/destroy', [JobApplicationController::class, 'destroyNote'])->name('job.application.note.destroy')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('job-application/getByJob', [JobApplicationController::class, 'getByJob'])->name('get.job.application')->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    Route::get('job-onboard', [JobApplicationController::class, 'jobOnBoard'])->name('job.on.board')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('job-onboard/create/{id}', [JobApplicationController::class, 'jobBoardCreate'])->name('job.on.board.create')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('job-onboard/store/{id}', [JobApplicationController::class, 'jobBoardStore'])->name('job.on.board.store')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::get('job-onboard/edit/{id}', [JobApplicationController::class, 'jobBoardEdit'])->name('job.on.board.edit')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('job-onboard/update/{id}', [JobApplicationController::class, 'jobBoardUpdate'])->name('job.on.board.update')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::delete('job-onboard/delete/{id}', [JobApplicationController::class, 'jobBoardDelete'])->name('job.on.board.delete')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::get('job-onboard/convert/{id}', [JobApplicationController::class, 'jobBoardConvert'])->name('job.on.board.convert')->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('job-onboard/convert/{id}', [JobApplicationController::class, 'jobBoardConvertData'])->name('job.on.board.converts')->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    Route::post('job-application/stage/change', [JobApplicationController::class, 'stageChange'])->name('job.application.stage.change')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::resource('custom-question', CustomQuestionController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );


    Route::resource('interview-schedule', InterviewScheduleController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::get('interview-schedule/create/{id?}', [InterviewScheduleController::class, 'create'])->name('interview-schedule.create')->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::any('/interview-schedule/get_interview-schedule_data', [InterviewScheduleController::class, 'get_interview_schedule_data'])->name('interview-schedule.get_interview-schedule_data')->middleware(['auth', 'XSS']);


    //================================= Custom Landing Page ====================================//

    // Route::get('/landingpage', 'LandingPageSectionController@index')->name('custom_landing_page.index')->middleware(['auth', 'XSS']);
    Route::get('/LandingPage/show/{id}', [LandingPageSectionController::class, 'show']);
    Route::post('/LandingPage/setConetent', [LandingPageSectionController::class, 'setConetent'])->middleware(['auth', 'XSS']);
    Route::get('/get_landing_page_section/{name}', function ($name) {
        $plans = \DB::table('plans')->get();

        return view('custom_landing_page.' . $name, compact('plans'));
    });
    Route::post('/LandingPage/removeSection/{id}', [LandingPageSectionController::class, 'removeSection'])->middleware(['auth', 'XSS']);
    Route::post('/LandingPage/setOrder', [LandingPageSectionController::class, 'setOrder'])->middleware(['auth', 'XSS']);
    Route::post('/LandingPage/copySection', [LandingPageSectionController::class, 'copySection'])->middleware(['auth', 'XSS']);


    //================================= Payment Gateways  ====================================//

    Route::post('/plan-pay-with-paystack', [PaystackPaymentController::class, 'planPayWithPaystack'])->name('plan.pay.with.paystack')->middleware(['auth', 'XSS']);
    Route::get('/plan/paystack/{pay_id}/{plan_id}', [PaystackPaymentController::class, 'getPaymentStatus'])->name('plan.paystack');

    Route::post('/plan-pay-with-flaterwave', [FlutterwavePaymentController::class, 'planPayWithFlutterwave'])->name('plan.pay.with.flaterwave')->middleware(['auth', 'XSS']);
    Route::get('/plan/flaterwave/{txref}/{plan_id}', [FlutterwavePaymentController::class, 'getPaymentStatus'])->name('plan.flaterwave');

    Route::post('/plan-pay-with-razorpay',  [RazorpayPaymentController::class, 'planPayWithRazorpay'])->name('plan.pay.with.razorpay')->middleware(['auth', 'XSS']);
    Route::get('/plan/razorpay/{txref}/{plan_id}', [RazorpayPaymentController::class, 'getPaymentStatus'])->name('plan.razorpay');

    Route::post('/plan-pay-with-paytm',  [PaytmPaymentController::class, 'planPayWithPaytm'])->name('plan.pay.with.paytm')->middleware(['auth', 'XSS']);
    Route::post('/plan/paytm/{plan}', [PaytmPaymentController::class, 'getPaymentStatus'])->name('plan.paytm');

    Route::post('/plan-pay-with-mercado',  [MercadoPaymentController::class, 'planPayWithMercado'])->name('plan.pay.with.mercado')->middleware(['auth', 'XSS']);
    Route::get('/plan/mercado/{plan}',  [MercadoPaymentController::class, 'getPaymentStatus'])->name('plan.mercado');

    Route::post('/plan-pay-with-mollie',  [MolliePaymentController::class, 'planPayWithMollie'])->name('plan.pay.with.mollie')->middleware(['auth', 'XSS']);
    Route::get('/plan/mollie/{plan}', [MolliePaymentController::class, 'getPaymentStatus'])->name('plan.mollie');

    Route::post('/plan-pay-with-skrill', [SkrillPaymentController::class, 'planPayWithSkrill'])->name('plan.pay.with.skrill')->middleware(['auth', 'XSS']);
    Route::get('/plan/skrill/{plan}',  [SkrillPaymentController::class, 'getPaymentStatus'])->name('plan.skrill');

    Route::post('/plan-pay-with-coingate', [CoingatePaymentController::class, 'planPayWithCoingate'])->name('plan.pay.with.coingate')->middleware(['auth', 'XSS']);
    Route::get('/plan/coingate/{plan}', [CoingatePaymentController::class, 'getPaymentStatus'])->name('plan.coingate');

    Route::post('paymentwall', [PaymentWallPaymentController::class, 'paymentwall'])->name('paymentwall');
    Route::post('plan-pay-with-paymentwall/{plan}', [PaymentWallPaymentController::class, 'planPayWithPaymentwall'])->name('plan.pay.with.paymentwall');
    Route::any('/plan/{flag}', [PaymentWallPaymentController::class, 'paymenterror'])->name('callback.error');
    // Route::get('/plans/{flag}', ['as' => 'error.plan.show','uses' => 'PaymentWallPaymentController@planeerror']);

    Route::Post('plan-pay-with-toyyibpay', [ToyyibpayPaymentController::class, 'charge'])->name('plan.pay.with.toyyibpay')->middleware(['auth', 'XSS']);
    Route::get('/plan/toyyibpay/{plan}/{coupon}/{amount}', [ToyyibpayPaymentController::class, 'status'])->name('plan.toyyibpay');

    Route::post('payfast-plan', [PayfastController::class, 'index'])->name('payfast.payment')->middleware(['auth']);
    Route::get('payfast-plan/{success}', [PayfastController::class, 'success'])->name('payfast.payment.success')->middleware(['auth']);

    Route::post('iyzipay/prepare', [IyziPayController::class, 'initiatePayment'])->name('iyzipay.payment.init');
    Route::post('iyzipay/callback/plan/{id}/{amount}/{coupan_code?}', [IyzipayController::class, 'iyzipayCallback'])->name('iyzipay.payment.callback');

    Route::post('/sspay', [SspayController::class, 'SspayPaymentPrepare'])->name('plan.sspaypayment');
    Route::get('sspay-payment-plan/{plan_id}/{amount}/{couponCode}', [SspayController::class, 'SspayPlanGetPayment'])->middleware(['auth'])->name('plan.sspay.callback');

    Route::post('plan-pay-with-paytab', [PaytabController::class, 'planPayWithpaytab'])->middleware(['auth'])->name('plan.pay.with.paytab');
    Route::any('paytab-success/plan', [PaytabController::class, 'PaytabGetPayment'])->middleware(['auth'])->name('plan.paytab.success');

    Route::any('/payment/initiate', [BenefitPaymentController::class, 'initiatePayment'])->name('benefit.initiate');
    Route::any('call_back', [BenefitPaymentController::class, 'call_back'])->name('benefit.call_back');

    Route::post('cashfree/payments/store', [CashfreeController::class, 'cashfreePaymentStore'])->name('cashfree.payment');
    Route::any('cashfree/payments/success', [CashfreeController::class, 'cashfreePaymentSuccess'])->name('cashfreePayment.success');

    Route::post('/aamarpay/payment', [AamarpayController::class, 'pay'])->name('pay.aamarpay.payment');
    Route::any('/aamarpay/success/{data}', [AamarpayController::class, 'aamarpaysuccess'])->name('pay.aamarpay.success');

    Route::post('/paytr/payment/{plan_id}', [PaytrController::class, 'PlanpayWithPaytr'])->name('plan.pay.with.paytr');
    Route::get('/paytr/sussess/', [PaytrController::class, 'paytrsuccess'])->name('pay.paytr.success');

    Route::post('/plan/yookassa/payment', [YooKassaController::class, 'planPayWithYooKassa'])->name('plan.pay.with.yookassa');
    Route::get('/plan/yookassa/{plan}', [YooKassaController::class, 'planGetYooKassaStatus'])->name('plan.get.yookassa.status');

    Route::any('/midtrans', [MidtransController::class, 'planPayWithMidtrans'])->name('plan.get.midtrans');
    Route::any('/midtrans/callback', [MidtransController::class, 'planGetMidtransStatus'])->name('plan.get.midtrans.status');

    Route::any('/xendit/payment', [XenditPaymentController::class, 'planPayWithXendit'])->name('plan.xendit.payment');
    Route::any('/xendit/payment/status', [XenditPaymentController::class, 'planGetXenditStatus'])->name('plan.xendit.status');

    Route::post('/nepalste/payment', [NepalstePaymnetController::class, 'planPayWithnepalste'])->name('plan.pay.with.nepalste');
    Route::get('nepalste/status/', [NepalstePaymnetController::class, 'planGetNepalsteStatus'])->name('nepalste.status');
    Route::get('nepalste/cancel/', [NepalstePaymnetController::class, 'planGetNepalsteCancel'])->name('nepalste.cancel');

    Route::post('paiementpro/payment', [PaiementProController::class, 'planPayWithpaiementpro'])->name('plan.pay.with.paiementpro');
    Route::get('paiementpro/status', [PaiementProController::class, 'planGetpaiementproStatus'])->name('paiementpro.status');

    Route::post('fedapay/payment', [FedapayController::class, 'planPayWithFedapay'])->name('plan.pay.with.fedapay');
    Route::get('fedapay/status', [FedapayController::class, 'planGetFedapayStatus'])->name('fedapay.status');

    Route::post('payhere/payment', [PayHereController::class, 'planPayWithPayHere'])->name('plan.pay.with.payhere');
    Route::any('payhere/status', [PayHereController::class, 'planGetPayHereStatus'])->name('payhere.status');

    Route::post('/plan/company/payment', [CinetPayController::class,'planPayWithCinetPay'])->name('plan.pay.with.cinetpay');
    Route::post('/plan/company/payment/return', [CinetPayController::class,'planCinetPayReturn'])->name('plan.cinetpay.return');
    Route::post('/plan/company/payment/notify/', [CinetPayController::class,'planCinetPayNotify'])->name('plan.cinetpay.notify');

    Route::resource('competencies', CompetenciesController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    Route::resource('performanceType', PerformanceTypeController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );

    //employee Import & Export
    Route::get('import/employee/file', [EmployeeController::class, 'importFile'])->name('employee.file.import');
    Route::post('import/employee', [EmployeeController::class, 'import'])->name('employee.import');
    Route::get('export/employee', [EmployeeController::class, 'export'])->name('employee.export');

    // Timesheet Import & Export
    Route::get('import/timesheet/file', [TimeSheetController::class, 'importFile'])->name('timesheet.file.import');
    Route::post('import/timesheet', [TimeSheetController::class, 'import'])->name('timesheet.import');
    Route::get('hrm/timesheet/export', [TimeSheetController::class, 'export'])->name('timesheet.export');
    Route::get('export/timesheet/export', [ReportController::class, 'exportTimeshhetReport'])->name('timesheet.report.export');

   




    //leave export
    Route::get('export/leave', [LeaveController::class, 'export'])->name('leave.export');
    Route::get('export/leave/report', [ReportController::class, 'LeaveReportExport'])->name('leave.report.export');

    //deposite Export
    Route::get('export/deposite', [DepositController::class, 'export'])->name('deposite.export');

    //expense Export
    Route::get('export/expense', [ExpenseController::class, 'export'])->name('expense.export');

    //Transfer Balance Export
    Route::get('export/transfer-balance', [TransferBalanceController::class, 'export'])->name('transfer_balance.export');

    //Training Import & Export
    Route::get('export/training', [TrainingController::class, 'export'])->name('training.export');

    //Payroll Export
    Route::get('export/payroll/{month}/{branch}/{department}', [ReportController::class, 'PayrollReportExport'])->name('payroll.report.export');

    // payslip export
    Route::post('export/payslip', [PaySlipController::class, 'PayslipExport'])->name('payslip.export');

    //Account Statement Export
    Route::get('export/accountstatement/report', [ReportController::class, 'AccountStatementReportExport'])->name('accountstatement.report.export');

    //Trainer Export
    Route::get('export/trainer', [TrainerController::class, 'export'])->name('trainer.export');
    Route::get('import/training/file', [TrainerController::class, 'importFile'])->name('trainer.file.import');
    Route::post('import/training', [TrainerController::class, 'import'])->name('trainer.import');

    //Holiday Export & Import
    Route::get('export/holidays', [HolidayController::class, 'export'])->name('holidays.export');
    Route::get('import/holidays/file', [HolidayController::class, 'importFile'])->name('holidays.file.import');
    Route::post('import/holidays', [HolidayController::class, 'import'])->name('holidays.import');

    //Asset Import & Export
    Route::get('export/assets', [AssetController::class, 'export'])->name('assets.export');
    Route::get('import/assets/file', [AssetController::class, 'importFile'])->name('assets.file.import');
    Route::post('import/assets', [AssetController::class, 'import'])->name('assets.import');

    //zoom meeting
    Route::any('zoommeeting/calendar', [ZoomMeetingController::class, 'calender'])->name('zoom_meeting.calender')->middleware(['auth', 'XSS']);
    Route::resource('zoom-meeting', ZoomMeetingController::class)->middleware(['auth', 'XSS']);
    Route::any('zoom-meeting/get_zoom_meeting_data', [ZoomMeetingController::class, 'get_zoom_meeting_data'])->name('zoommeeting.get_zoom_meeting_data')->middleware(['auth', 'XSS']);
    // Route::any('zoom-meeting/export-zoom_meeting', [ZoomMeetingController::class, 'export_zoom_meeting'])->name('zoommeeting.export-zoom_meeting')->middleware(['auth', 'XSS']);

    //slack
    Route::post('setting/slack', [SettingsController::class, 'slack'])->name('slack.setting');

    //telegram
    Route::post('setting/telegram', [SettingsController::class, 'telegram'])->name('telegram.setting');

    //twilio
    Route::post('setting/twilio', [SettingsController::class, 'twilio'])->name('twilio.setting');

    // recaptcha
    Route::post('/recaptcha-settings', [SettingsController::class, 'recaptchaSettingStore'])->name('recaptcha.settings.store')->middleware(['auth', 'XSS']);

    // user reset password
    Route::get('user-login/{id}', [UserController::class, 'LoginManage'])->name('user.login');
    Route::any('user-reset-password/{id}', [UserController::class, 'userPassword'])->name('user.reset');
    Route::post('user-reset-password/{id}', [UserController::class, 'userPasswordReset'])->name('user.password.update');

    //contract
    Route::resource('contract_type', ContractTypeController::class)->middleware(['auth', 'XSS']);
    Route::resource('contract', ContractController::class)->middleware(['auth', 'XSS']);
    Route::post('/contract_status_edit/{id}', [ContractController::class, 'contract_status_edit'])->name('contract.status')->middleware(['auth', 'XSS']);
    Route::post('/contract/{id}/file', [ContractController::class, 'fileUpload'])->name('contracts.file.upload')->middleware(['auth', 'XSS']);
    Route::get('/contract/{id}/file/{fid}',  [ContractController::class, 'fileDownload'])->name('contracts.file.download')->middleware(['auth', 'XSS']);
    Route::get('/contract/{id}/file/delete/{fid}', [ContractController::class, 'fileDelete'])->name('contracts.file.delete')->middleware(['auth', 'XSS']);
    Route::post('/contract/{id}/notestore', [ContractController::class, 'noteStore'])->name('contracts.note.store')->middleware(['auth']);
    Route::get('/contract/{id}/note', [ContractController::class, 'noteDestroy'])->name('contracts.note.destroy')->middleware(['auth']);

    Route::post('contract/{id}/description', [ContractController::class, 'descriptionStore'])->name('contracts.description.store')->middleware(['auth']);


    Route::post('/contract/{id}/commentstore', [ContractController::class, 'commentStore'])->name('comment.store');
    Route::get('/contract/{id}/comment', [ContractController::class, 'commentDestroy'])->name('comment.destroy');


    Route::get('/contract/copy/{id}', [ContractController::class, 'copycontract'])->name('contracts.copy')->middleware(['auth', 'XSS']);
    Route::post('/contract/copy/store/{id}', [ContractController::class, 'copycontractstore'])->name('contracts.copystore')->middleware(['auth', 'XSS']);

    Route::get('contract/{id}/get_contract', [ContractController::class, 'printContract'])->name('get.contract');
    Route::get('contract/pdf/{id}', [ContractController::class, 'pdffromcontract'])->name('contract.download.pdf');

    // Route::get('/signature/{id}', 'ContractController@signature')->name('signature')->middleware(['auth','XSS']);
    // Route::post('/signaturestore', 'ContractController@signatureStore')->name('signaturestore')->middleware(['auth','XSS']);

    Route::get('/contract/{id}/mail', [ContractController::class, 'sendmailContract'])->name('send.mail.contract');
    Route::get('/signature/{id}', [ContractController::class, 'signature'])->name('signature')->middleware(['auth', 'XSS']);
    Route::post('/signaturestore', [ContractController::class, 'signatureStore'])->name('signaturestore')->middleware(['auth', 'XSS']);

    //offer Letter
    Route::post('setting/offerlatter/{lang?}', [SettingsController::class, 'offerletterupdate'])->name('offerlatter.update');
    Route::get('setting/offerlatter', [SettingsController::class, 'index'])->name('get.offerlatter.language');
    Route::get('job-onboard/pdf/{id}', [JobApplicationController::class, 'offerletterPdf'])->name('offerlatter.download.pdf');
    Route::get('job-onboard/doc/{id}', [JobApplicationController::class, 'offerletterDoc'])->name('offerlatter.download.doc');

    //appointment Letter
    Route::get('setting/appointmentletter/{appointmentlang?}', [SettingsController::class, 'appointmentletterIndex'])->name('get.appointmentletter.language');
    Route::post('setting/appointmentletter/{appointmentlang?}', [SettingsController::class, 'appointmentletterUpdate'])->name('appointmentletter.update');
    Route::get('job-onboard/pdf/{id}', [JobApplicationController::class, 'offerletterPdf'])->name('offerlatter.download.pdf');
    Route::get('job-onboard/doc/{id}', [JobApplicationController::class, 'offerletterDoc'])->name('offerlatter.download.doc');



    //joining Letter
    Route::post('setting/joiningletter/{lang?}', [SettingsController::class, 'joiningletterupdate'])->name('joiningletter.update');
    Route::get('setting/joiningletter/', [SettingsController::class, 'index'])->name('get.joiningletter.language');
    Route::get('employee/pdf/{id}', [EmployeeController::class, 'joiningletterPdf'])->name('joiningletter.download.pdf');
    Route::get('employee/doc/{id}', [EmployeeController::class, 'joiningletterDoc'])->name('joininglatter.download.doc');

    //Experience Certificate
    Route::post('setting/exp/{lang?}', [SettingsController::class, 'experienceCertificateupdate'])->name('experiencecertificate.update');
    Route::get('setting/exp', [SettingsController::class, 'index'])->name('get.experiencecertificate.language');
    Route::get('employee/exppdf/{id}', [EmployeeController::class, 'ExpCertificatePdf'])->name('exp.download.pdf');
    Route::get('employee/expdoc/{id}', [EmployeeController::class, 'ExpCertificateDoc'])->name('exp.download.doc');

    //NOC
    Route::post('setting/noc/{lang?}', [SettingsController::class, 'NOCupdate'])->name('noc.update');
    Route::get('setting/noc', [SettingsController::class, 'index'])->name('get.noc.language');
    Route::get('employee/nocpdf/{id}', [EmployeeController::class, 'NocPdf'])->name('noc.download.pdf');
    Route::get('employee/nocdoc/{id}', [EmployeeController::class, 'NocDoc'])->name('noc.download.doc');

    //appricalStar
    Route::post('/appraisals', [AppraisalController::class, 'empByStar'])->name('empByStar')->middleware(['auth', 'XSS']);
    Route::post('/appraisals1', [AppraisalController::class, 'empByStar1'])->name('empByStar1')->middleware(['auth', 'XSS']);
    Route::post('/getemployee', [AppraisalController::class, 'getemployee'])->name('getemployee');

    //storage Setting
    Route::post('storage-settings', [SettingsController::class, 'storageSettingStore'])->name('storage.setting.store')->middleware(['auth', 'XSS']);

    // ChatGT Settings
    Route::post('chatgptkey', [SettingsController::class, 'chatgptkey'])->name('settings.chatgptkey')->middleware(['auth', 'XSS']);
    Route::get('generate/{template_name}', [AiTemplateController::class, 'create'])->name('generate')->middleware(['auth', 'XSS']);
    Route::post('generate/keywords/{id}', [AiTemplateController::class, 'getKeywords'])->name('generate.keywords')->middleware(['auth', 'XSS']);
    Route::post('generate/response', [AiTemplateController::class, 'AiGenerate'])->name('generate.response')->middleware(['auth', 'XSS']);

    // Grammer Check With AI
    Route::get('grammar/{template}', [AiTemplateController::class, 'grammar'])->name('grammar')->middleware(['auth', 'XSS']);
    Route::post('grammar/response', [AiTemplateController::class, 'grammarProcess'])->name('grammar.response')->middleware(['auth', 'XSS']);

    // Login As Company
    Route::get('users/{id}/login-with-company', [UserController::class, 'LoginWithCompany'])->name('login.with.company');
    Route::get('login-with-company/exit', [UserController::class, 'ExitCompany'])->name('exit.company');

    // Adminhub
    Route::get('company-info/{id}', [UserController::class, 'CompnayInfo'])->name('company.info');
    Route::post('user-unable', [UserController::class, 'UserUnable'])->name('user.unable');

    Route::get('referral-program/company', [ReferralProgramController::class, 'companyIndex'])->name('referral-program.company');
    Route::resource('referral-program', ReferralProgramController::class);
    Route::get('request-amount-sent/{id}', [ReferralProgramController::class, 'requestedAmountSent'])->name('request.amount.sent');
    Route::get('request-amount-cancel/{id}', [ReferralProgramController::class, 'requestCancel'])->name('request.amount.cancel');
    Route::post('request-amount-store/{id}', [ReferralProgramController::class, 'requestedAmountStore'])->name('request.amount.store');
    Route::get('request-amount/{id}/{status}', [ReferralProgramController::class, 'requestedAmount'])->name('amount.request');

    // BiometricAttendance
    Route::post('biometric-setting', [SettingsController::class, 'BiometricSetting'])->name('biometric-settings.store')->middleware(['auth', 'XSS']);
    Route::resource('/biometric-attendance', BiometricAttendanceController::class)->middleware(
        [
            'auth',
            'XSS',
        ]
    );
    Route::post('/biometric-attendance/sync/{start_date?}/{end_date?}', [BiometricAttendanceController::class, 'AllSync'])->middleware(['auth'])->name('biometric-attendance.allsync');

    Route::post('/leave/markAsRead', [LeaveController::class, 'markAsRead'])->name('leave.markAsRead');
    Route::post('/leave/markAllAsRead', [LeaveController::class, 'markAllAsRead'])->name('leave.markAllAsRead');
    Route::get('/leave/action/{id}/{status}', [LeaveController::class, 'action'])->name('leave.action');
    Route::get('/leave', [LeaveController::class, 'index'])->name('leave.index');
    Route::get('/leave-notifications', [LeaveController::class, 'getLeaveNotifications'])->name('leave.notifications');

    Route::get('/get-comp-off-balance/{employeeId}', [LeaveController::class, 'getCompOffBalance'])->name('get.comp.off.balance');  

    Route::post('get-leave-type-details', [LeaveController::class, 'getLeaveTypeDetails'])->name('get.leave.type.details');


    Route::post('/dashboard/filter', [HomeController::class, 'filterDashboardData'])->name('dashboard.filter');



    Route::get('/debug-manifest', function() {
    return response()->json([
        'exists' => file_exists(public_path('manifest.json')),
        'path' => public_path('manifest.json'),
        'content' => json_decode(file_get_contents(public_path('manifest.json')))
    ]);
});

});
