<?php

    namespace App\Http\Controllers;

    use App\Models\Branch;
    use App\Models\Site;
    use App\Models\Department;
    use App\Models\Designation;
    use App\Models\Document;
    use App\Models\Employee;
    use App\Models\EmployeeDocument;
    use App\Mail\UserCreate;
    use App\Models\Plan;
    use App\Models\User;
    use App\Models\Utility;
    use File;
    use Illuminate\Http\Request;
    use Illuminate\Support\Facades\Auth;
    use Illuminate\Support\Facades\Crypt;
    use Illuminate\Support\Facades\Hash;
    use Illuminate\Support\Facades\Mail;
    use App\Models\JoiningLetter;
    use App\Imports\EmployeesImport;
    use App\Exports\EmployeesExport;
    use App\Models\Contract;
    use App\Models\ExperienceCertificate;
    use App\Models\LoginDetail;
    use Maatwebsite\Excel\Facades\Excel;
    use App\Models\NOC;
    use App\Models\PaySlip;
    use App\Models\Termination;
    use Illuminate\Support\Facades\DB;
    use Illuminate\Validation\Rule;
    use App\Models\DailyQuote;  

    //use Faker\Provider\File;

    class EmployeeController extends Controller
    {
        /**
         * Display a listing of the resource.
         *
         * @return \Illuminate\Http\Response
         */
        public function index()
        {
            if (\Auth::user()->can('Manage Employee')) {
                // Get all employees (not filtered by created_by)
                $employees = Employee::with(['branch', 'department', 'designation', 'user'])
                    ->get()
                    ->map(function ($employee) {
                        $employee->formatted_id = \Auth::user()->employeeIdFormat($employee->employee_id);
                        return $employee;
                    });

                return view('employee.index', compact('employees'));
            } else {
                return redirect()->back()->with('error', __('Permission denied.'));
            }
        }

        // public function index()
        // {
        //     if (\Auth::user()->can('Manage Employee')) {
        //         if (Auth::user()->type == 'employee') {
        //             $employees = Employee::where('user_id', Auth::user()->id)
        //                 ->with(['branch', 'department', 'designation', 'user'])
        //                 ->get();
        //         } else {
        //             $employees = Employee::where('created_by', Auth::user()->id) // or creatorId()
        //             ->with(['branch', 'department', 'designation', 'user'])
        //             ->get()
        //             ->map(function ($employee) {
        //                 $employee->formatted_id = Auth::user()->employeeIdFormat($employee->employee_id);
        //                 return $employee;
        //             });

        //         }
            
        //         return view('employee.index', compact('employees'));
        //     } else {
        //         return redirect()->back()->with('error', __('Permission denied.'));
        //     }
        // }

        public function create()
        {
            if (\Auth::user()->can('Create Employee')) {
                $company_settings = Utility::settings();
                $documents        = Document::where('created_by', \Auth::user()->creatorId())->get();
                $branches         = Branch::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                $branches->prepend('Select Branch', '');
                $departments      = Department::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                $departments->prepend('Select Department', '');
                $designations     = Designation::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                $designations->prepend('Select Designation', '');
                $employees        = User::where('created_by', \Auth::user()->creatorId())->get();
                $employeesId      = \Auth::user()->employeeIdFormat($this->employeeNumber());


                return view('employee.create', compact('employees', 'employeesId', 'departments', 'designations', 'documents', 'branches', 'company_settings'));
            } else {
                return redirect()->back()->with('error', __('Permission denied.'));
            }
        }

        public function store(Request $request)
        {
            if (\Auth::user()->can('Create Employee')) {
                $rules = [
                    'name' => 'required',
                    'email' => 'required|unique:users',
                    'password' => 'required',
                    'branch_id' => 'required',
                    'department_id' => 'required',
                    'designation_id' => 'required',
                    'document.*' => 'required',
                ];

                $validator = \Validator::make($request->all(), $rules);

                if ($validator->fails()) {
                    return redirect()->back()->withInput()->with('error', $validator->messages()->first());
                }

                // Process education details
                $educationDetails = [];
                if ($request->has('education')) {
                    foreach ($request->education as $education) {
                        if (!empty($education['college_name'])) {
                            $educationDetails[] = [
                                'college_name' => $education['college_name'],
                                'passing_year' => $education['passing_year'] ?? null,
                                'grade' => $education['grade'] ?? null,
                                'degree' => $education['degree'] ?? null,
                            ];
                        }
                    }
                }

                // Process experience details
                $experienceDetails = [];
                if ($request->has('experience')) {
                    foreach ($request->experience as $experience) {
                        if (!empty($experience['previous_company_name'])) {
                            $experienceDetails[] = [
                                'previous_company_name' => $experience['previous_company_name'],
                                'previous_designation' => $experience['previous_designation'] ?? null,
                                'start_date' => $experience['start_date'] ?? null,
                                'end_date' => $experience['end_date'] ?? null,
                                'previous_salary' => $experience['previous_salary'] ?? null,
                            ];
                        }
                    }
                }

                // Create user
                $user = User::create([
                    'name' => $request['name'],
                    'email' => $request['email'],
                    'password' => Hash::make($request['password']),
                    'type' => 'employee',
                    'created_by' => \Auth::user()->creatorId(),
                    'email_verified_at' => now(),
                ]);
                $user->assignRole('Employee');

                // Create employee with all details
                $employee = Employee::create([
                    'user_id' => $user->id,
                    'name' => $request['name'],
                    'dob' => $request['dob'] ?? null,
                    'gender' => $request['gender'] ?? 'Male', // Default value
                    'phone' => $request['phone'] ?? null,
                    'address' => $request['address'] ?? null,
                    'email' => $request['email'],
                    'password' => Hash::make($request['password']),
                    'employee_id' => $this->employeeNumber(),
                    'branch_id' => $request['branch_id'],
                    'department_id' => $request['department_id'],
                    'designation_id' => $request['designation_id'],
                    'company_doj' => $request['company_doj'] ?? now(), // Default to current date
                    'office_phone_one' => $request['office_phone_one'] ?? null,
                    'office_phone_two' => $request['office_phone_two'] ?? null,
                    'emergency_number' => $request['emergency_number'] ?? null,
                    'week_off_day' => $request['week_off_day'] ?? null,
                    'education_details' => json_encode($educationDetails ?? []),
                    'experience_details' => json_encode($experienceDetails ?? []),
                    'created_by' => \Auth::user()->creatorId(),
                ]);

                return redirect()->route('employee.index')->with('success', __('Employee successfully created.'));
            } else {
                return redirect()->back()->with('error', __('Permission denied.'));
            }
        }
   
        public function edit($id)
        {
            try {
                $employeeId = Crypt::decrypt($id);
                $employee = Employee::with(['branch', 'department', 'designation', 'documents.document'])
                ->findOrFail($employeeId);
    
                // Safely decode JSON fields with proper defaults
                $experiences = [];
                $educations = [];
                
                if (!empty($employee->experience_details)) {
                    try {
                        $experiences = is_array($employee->experience_details) 
                            ? $employee->experience_details 
                            : json_decode($employee->experience_details, true);
                        $experiences = $experiences ?: []; // Ensure it's always an array
                    } catch (\Exception $e) {
                        \Log::error("Error decoding experiences: " . $e->getMessage());
                        $experiences = [];
                    }
                }
            
                if (!empty($employee->education_details)) {
                    try {
                        $educations = is_array($employee->education_details) 
                            ? $employee->education_details 
                            : json_decode($employee->education_details, true);
                        $educations = $educations ?: []; // Ensure it's always an array
                    } catch (\Exception $e) {
                        \Log::error("Error decoding educations: " . $e->getMessage());
                        $educations = [];
                    }
                }
    
                // Get all necessary data
                $branches = Branch::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                $departments = Department::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                $designations = Designation::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                $documents = Document::where('created_by', \Auth::user()->creatorId())->get();
                
                return view('employee.edit', compact(
                    'employee',
                    'branches',
                    'departments',
                    'designations',
                    'documents',
                    'experiences',
                    'educations'
                ));
    
            } catch (\Exception $e) {
                \Log::error("Employee edit error: " . $e->getMessage());
                return redirect()->back()->with('error', __('Employee not found'));
            }
        }
    
       
        public function update(Request $request, $id)
        {
            if (\Auth::user()->can('Edit Employee')) {
                $employee = Employee::findOrFail($id);
            
                $rules = [
                    'name' => 'required',
                    'branch_id' => 'required',
                    'department_id' => 'required',
                    'designation_id' => 'required',
                ];
            
                $validator = \Validator::make($request->all(), $rules);
            
                if ($validator->fails()) {
                    return redirect()->back()->withInput()->with('error', $validator->messages()->first());
                }
        
                // Process education details
                $educationDetails = [];
                if ($request->has('education')) {
                    foreach ($request->education as $key => $education) {
                        if (!empty($education['college_name'])) {
                            $educationDetails[] = [
                                'college_name' => $education['college_name'],
                                'passing_year' => $education['passing_year'] ?? null,
                                'grade' => $education['grade'] ?? null,
                                'degree' => $education['degree'] ?? null,
                            ];
                        }
                    }
                }
        
                // Process experience details
                $experienceDetails = [];
                if ($request->has('experience')) {
                    foreach ($request->experience as $key => $experience) {
                        if (!empty($experience['previous_company_name'])) {
                            $experienceDetails[] = [
                                'previous_company_name' => $experience['previous_company_name'],
                                'previous_designation' => $experience['previous_designation'] ?? null,
                                'start_date' => $experience['start_date'] ?? null,
                                'end_date' => $experience['end_date'] ?? null,
                                'previous_salary' => $experience['previous_salary'] ?? null,
                            ];
                        }
                    }
                }
        
                $data = [
                    'name' => $request['name'],
                    'dob' => $request['dob'] ?? null,
                    'gender' => $request['gender'] ?? null,
                    'phone' => $request['phone'] ?? null,
                    'address' => $request['address'] ?? null,
                    'branch_id' => $request['branch_id'],
                    'department_id' => $request['department_id'],
                    'designation_id' => $request['designation_id'],
                    'company_doj' => $request['company_doj'] ?? null,
                    'office_phone_one' => $request['office_phone_one'] ?? null,
                    'office_phone_two' => $request['office_phone_two'] ?? null,
                    'emergency_number' => $request['emergency_number'] ?? null,
                    'education_details' => json_encode($educationDetails),
                    'experience_details' => json_encode($experienceDetails),
                    'week_off_day' => $request['week_off_day'] ?? null,
                    'comp_off_enabled' => $request->has('comp_off_enabled') ? 1 : 0,
                ];
        
                // Update password if provided
                if (!empty($request->password)) {
                    $data['password'] = Hash::make($request['password']);
                    // Also update user password
                    $user = User::find($employee->user_id);
                    $user->password = Hash::make($request['password']);
                    $user->save();
                }
        
                // Handle document uploads
                if ($request->has('document')) {
                    foreach ($request->document as $docId => $document) {
                        $employeeDocument = EmployeeDocument::where('employee_id', $employee->id)
                            ->where('document_id', $docId)
                            ->first();
                        
                        if (!$employeeDocument) {
                            $employeeDocument = new EmployeeDocument();
                            $employeeDocument->employee_id = $employee->id;
                            $employeeDocument->document_id = $docId;
                        }
                        
                        // Upload and save the document
                        $filename = $employee->employee_id . '_' . $docId . '_' . time() . '.' . $document->getClientOriginalExtension();
                        $document->storeAs('document', $filename);
                        $employeeDocument->document_value = $filename;
                        $employeeDocument->save();
                    }
                }
        
                $employee->update($data);
            
                return redirect()->route('employee.index')->with('success', __('Employee successfully updated.'));
            } else {
                return redirect()->back()->with('error', __('Permission denied.'));
            }
        }
        
    

        public function destroy($id)
        {
            if (Auth::user()->can('Delete Employee')) {
                $employee      = Employee::findOrFail($id);
                $user          = User::where('id', '=', $employee->user_id)->first();
                $emp_documents = EmployeeDocument::where('employee_id', $employee->employee_id)->get();
                $ContractEmployee = Contract::where('employee_name', '=', $employee->user_id)->get();
                $payslips = PaySlip::where('employee_id', $id)->get();
                $employee->delete();
                $user->delete();

                foreach ($ContractEmployee as $contractdelete) {
                    $contractdelete->delete();
                }

                foreach ($payslips as $payslip) {
                    $payslip->delete();
                }

                $dir = storage_path('uploads/document/');
                foreach ($emp_documents as $emp_document) {

                    $emp_document->delete();
                    // \File::delete(storage_path('uploads/document/' . $emp_document->document_value));
                    if (!empty($emp_document->document_value)) {

                        $file_path = 'uploads/document/' . $emp_document->document_value;
                        $result = Utility::changeStorageLimit(\Auth::user()->creatorId(), $file_path);

                        // unlink($dir . $emp_document->document_value);
                    }
                }

                return redirect()->route('employee.index')->with('success', 'Employee successfully deleted.');
            } else {
                return redirect()->back()->with('error', __('Permission denied.'));
            }
        }



        public function show($id)
        {
            if (\Auth::user()->can('Show Employee')) {
                try {
                    $empId = Crypt::decrypt($id);
                } catch (\RuntimeException $e) {
                    return redirect()->back()->with('error', __('Employee not available'));
                }

                $employee = Employee::with(['branch', 'department', 'designation', 'user'])->find($empId);
                
                if (!$employee) {
                    $employee = Employee::where('user_id', $empId)->with(['branch', 'department', 'designation', 'user'])->first();
                }

                if (!$employee) {
                    return redirect()->back()->with('error', __('Employee not found'));
                }

                // Safely access relationships
                $documents = Document::where('created_by', \Auth::user()->creatorId())->get();
                $branches = Branch::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                $departments = Department::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                $designations = Designation::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                
                $employeesId = \Auth::user()->employeeIdFormat($employee->employee_id);

                $experienceDetails = [];
                if (!empty($employee->experience_details)) {
                    $experienceDetails = json_decode($employee->experience_details, true);
                }

                $educationDetails = [];
                if (!empty($employee->education_details)) {
                    $educationDetails = json_decode($employee->education_details, true);
                }


                return view('employee.show', compact('employee', 'employeesId', 'branches', 'departments', 'designations', 'documents', 'experienceDetails', 'educationDetails'));
            } else {
                return redirect()->back()->with('error', __('Permission denied.'));
            }
        }



        function employeeNumber()
        {
            $latest = Employee::where('created_by', '=', \Auth::user()->creatorId())->latest('id')->first();
            if (!$latest) {
                return 1;
            }

            return $latest->id + 1;
        }

        public function export()
        {
            $name = 'employee_' . date('Y-m-d i:h:s');
            $data = Excel::download(new EmployeesExport(), $name . '.xlsx');


            return $data;
        }

        public function importFile()
        {
            return view('employee.import');
        }



        public function profile(Request $request)
        {
            if (\Auth::user()->can('Manage Employee Profile')) {
                $employees = Employee::where('created_by', \Auth::user()->creatorId())->with(['designation', 'user']);
                if (!empty($request->branch)) {
                    $employees->where('branch_id', $request->branch);
                }
                if (!empty($request->department)) {
                    $employees->where('department_id', $request->department);
                }
                if (!empty($request->designation)) {
                    $employees->where('designation_id', $request->designation);
                }
                $employees = $employees->get();

                $brances = Branch::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                $brances->prepend('All', '');

                $departments = Department::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                $departments->prepend('All', '');

                $designations = Designation::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                $designations->prepend('All', '');

                return view('employee.profile', compact('employees', 'departments', 'designations', 'brances'));
            } else {
                return redirect()->back()->with('error', __('Permission denied.'));
            }
        }


        public function profileShow($id)
        {
            if (\Auth::user()->can('Show Employee Profile')) {
                $empId        = Crypt::decrypt($id);
                $documents    = Document::where('created_by', \Auth::user()->creatorId())->get();
                $branches     = Branch::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                $departments  = Department::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                $designations = Designation::where('created_by', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                $employee     = Employee::find($empId);
                if ($employee == null) {
                    $employee     = Employee::where('user_id', $empId)->first();
                }

                $employeesId  = \Auth::user()->employeeIdFormat($employee->employee_id);

                return view('employee.show', compact('employee', 'employeesId', 'sites', 'branches', 'departments', 'designations', 'documents'));
            } else {
                return redirect()->back()->with('error', __('Permission denied.'));
            }
        }

        public function lastLogin(Request $request)
        {
            $users = User::where('created_by', \Auth::user()->creatorId())->get();

            $time = date_create($request->month);
            $firstDayofMOnth = (date_format($time, 'Y-m-d'));
            $lastDayofMonth =    \Carbon\Carbon::parse($request->month)->endOfMonth()->toDateString();
            $objUser = \Auth::user();

            $usersList = User::where('created_by', '=', $objUser->creatorId())
                ->whereNotIn('type', ['super admin', 'company'])->get()->pluck('name', 'id');
            $usersList->prepend('All', '');
            if ($request->month == null) {
                $userdetails = DB::table('login_details')
                    ->join('users', 'login_details.user_id', '=', 'users.id')
                    ->select(DB::raw('login_details.*, users.id as user_id , users.name as user_name , users.email as user_email ,users.type as user_type'))
                    ->where(['login_details.created_by' => \Auth::user()->creatorId()])
                    ->whereMonth('date', date('m'))->whereYear('date', date('Y'));
            } else {
                $userdetails = DB::table('login_details')
                    ->join('users', 'login_details.user_id', '=', 'users.id')
                    ->select(DB::raw('login_details.*, users.id as user_id , users.name as user_name , users.email as user_email ,users.type as user_type'))
                    ->where(['login_details.created_by' => \Auth::user()->creatorId()]);
            }
            if (!empty($request->month)) {
                $userdetails->where('date', '>=', $firstDayofMOnth);
                $userdetails->where('date', '<=', $lastDayofMonth);
            }
            if (!empty($request->employee)) {
                $userdetails->where(['user_id'  => $request->employee]);
            }
            $userdetails = $userdetails->get();

            return view('employee.lastLogin', compact('users', 'usersList', 'userdetails'));
        }

        public function employeeJson(Request $request)
        {
            $employees = Employee::where('branch_id', $request->branch)->get()->pluck('name', 'id')->toArray();

            return response()->json($employees);
        }

        public function joiningletterPdf($id)
        {
            $users = \Auth::user();

            $currantLang = $users->currentLanguage();
            $joiningletter = JoiningLetter::where('lang', $currantLang)->where('created_by', \Auth::user()->creatorId())->first();
            $date = date('Y-m-d');
            $employees = Employee::where('id', $id)->where('created_by', \Auth::user()->creatorId())->first();
            $settings = \App\Models\Utility::settings();
            $secs = strtotime($settings['company_start_time']) - strtotime("00:00");
            $result = date("H:i", strtotime($settings['company_end_time']) - $secs);
            $obj = [
                'date' =>  \Auth::user()->dateFormat($date),
                'app_name' => env('APP_NAME'),
                'employee_name' => $employees->name,
                'address' => !empty($employees->address) ? $employees->address : '',
                'designation' => !empty($employees->designation->name) ? $employees->designation->name : '',
                'start_date' => !empty($employees->company_doj) ? $employees->company_doj : '',
                'branch' => !empty($employees->Branch->name) ? $employees->Branch->name : '',
                'start_time' => !empty($settings['company_start_time']) ? $settings['company_start_time'] : '',
                'end_time' => !empty($settings['company_end_time']) ? $settings['company_end_time'] : '',
                'total_hours' => $result,
            ];

            $joiningletter->content = JoiningLetter::replaceVariable($joiningletter->content, $obj);
            return view('employee.template.joiningletterpdf', compact('joiningletter', 'employees'));
        }
        public function joiningletterDoc($id)
        {
            $users = \Auth::user();

            $currantLang = $users->currentLanguage();
            $joiningletter = JoiningLetter::where('lang', $currantLang)->where('created_by', \Auth::user()->creatorId())->first();
            $date = date('Y-m-d');
            $employees = Employee::where('id', $id)->where('created_by', \Auth::user()->creatorId())->first();
            $settings = \App\Models\Utility::settings();
            $secs = strtotime($settings['company_start_time']) - strtotime("00:00");
            $result = date("H:i", strtotime($settings['company_end_time']) - $secs);



            $obj = [
                'date' =>  \Auth::user()->dateFormat($date),

                'app_name' => env('APP_NAME'),
                'employee_name' => $employees->name,
                'address' => !empty($employees->address) ? $employees->address : '',
                'designation' => !empty($employees->designation->name) ? $employees->designation->name : '',
                'start_date' => !empty($employees->company_doj) ? $employees->company_doj : '',
                'branch' => !empty($employees->Branch->name) ? $employees->Branch->name : '',
                'start_time' => !empty($settings['company_start_time']) ? $settings['company_start_time'] : '',
                'end_time' => !empty($settings['company_end_time']) ? $settings['company_end_time'] : '',
                'total_hours' => $result,
                //         

            ];
            $joiningletter->content = JoiningLetter::replaceVariable($joiningletter->content, $obj);
            return view('employee.template.joiningletterdocx', compact('joiningletter', 'employees'));
        }

        public function ExpCertificatePdf($id)
        {
            $currantLang = \Cookie::get('LANGUAGE');
            if (!isset($currantLang)) {
                $currantLang = 'en';
            }
            $termination = Termination::where('employee_id', $id)->where('created_by', \Auth::user()->creatorId())->first();
            $experience_certificate = ExperienceCertificate::where('lang', $currantLang)->where('created_by', \Auth::user()->creatorId())->first();
            $date = date('Y-m-d');
            $employees = Employee::where('id', $id)->where('created_by', \Auth::user()->creatorId())->first();
            $settings = \App\Models\Utility::settings();
            $secs = strtotime($settings['company_start_time']) - strtotime("00:00");
            $result = date("H:i", strtotime($settings['company_end_time']) - $secs);
            $date1 = date_create($employees->company_doj);
            $date2 = date_create($employees->termination_date);
            $diff  = date_diff($date1, $date2);
            $duration = $diff->format("%a days");

            if (!empty($termination->termination_date)) {

                $obj = [
                    'date' =>  \Auth::user()->dateFormat($date),
                    'app_name' => env('APP_NAME'),
                    'employee_name' => $employees->name,
                    'payroll' => !empty($employees->salaryType->name) ? $employees->salaryType->name : '',
                    'duration' => $duration,
                    'designation' => !empty($employees->designation->name) ? $employees->designation->name : '',

                ];
            } else {
                return redirect()->back()->with('error', __('Termination date is required.'));
            }


            $experience_certificate->content = ExperienceCertificate::replaceVariable($experience_certificate->content, $obj);
            return view('employee.template.ExpCertificatepdf', compact('experience_certificate', 'employees'));
        }
        public function ExpCertificateDoc($id)
        {
            $currantLang = \Cookie::get('LANGUAGE');
            if (!isset($currantLang)) {
                $currantLang = 'en';
            }
            $termination = Termination::where('employee_id', $id)->where('created_by', \Auth::user()->creatorId())->first();
            $experience_certificate = ExperienceCertificate::where('lang', $currantLang)->where('created_by', \Auth::user()->creatorId())->first();
            $date = date('Y-m-d');
            $employees = Employee::where('id', $id)->where('created_by', \Auth::user()->creatorId())->first();;
            $settings = \App\Models\Utility::settings();
            $secs = strtotime($settings['company_start_time']) - strtotime("00:00");
            $result = date("H:i", strtotime($settings['company_end_time']) - $secs);
            $date1 = date_create($employees->company_doj);
            $date2 = date_create($employees->termination_date);
            $diff  = date_diff($date1, $date2);
            $duration = $diff->format("%a days");
            if (!empty($termination->termination_date)) {
                $obj = [
                    'date' =>  \Auth::user()->dateFormat($date),
                    'app_name' => env('APP_NAME'),
                    'employee_name' => $employees->name,
                    'payroll' => !empty($employees->salaryType->name) ? $employees->salaryType->name : '',
                    'duration' => $duration,
                    'designation' => !empty($employees->designation->name) ? $employees->designation->name : '',

                ];
            } else {
                return redirect()->back()->with('error', __('Termination date is required.'));
            }

            $experience_certificate->content = ExperienceCertificate::replaceVariable($experience_certificate->content, $obj);
            return view('employee.template.ExpCertificatedocx', compact('experience_certificate', 'employees'));
        }
        public function NocPdf($id)
        {
            $users = \Auth::user();

            $currantLang = $users->currentLanguage();
            $noc_certificate = NOC::where('lang', $currantLang)->where('created_by', \Auth::user()->creatorId())->first();
            $date = date('Y-m-d');
            $employees = Employee::where('id', $id)->where('created_by', \Auth::user()->creatorId())->first();
            $settings = \App\Models\Utility::settings();
            $secs = strtotime($settings['company_start_time']) - strtotime("00:00");
            $result = date("H:i", strtotime($settings['company_end_time']) - $secs);


            $obj = [
                'date' =>  \Auth::user()->dateFormat($date),
                'employee_name' => $employees->name,
                'designation' => !empty($employees->designation->name) ? $employees->designation->name : '',
                'app_name' => env('APP_NAME'),
            ];

            $noc_certificate->content = NOC::replaceVariable($noc_certificate->content, $obj);
            return view('employee.template.Nocpdf', compact('noc_certificate', 'employees'));
        }
        public function NocDoc($id)
        {
            $users = \Auth::user();

            $currantLang = $users->currentLanguage();
            $noc_certificate = NOC::where('lang', $currantLang)->where('created_by', \Auth::user()->creatorId())->first();
            $date = date('Y-m-d');
            $employees = Employee::where('id', $id)->where('created_by', \Auth::user()->creatorId())->first();
            $settings = \App\Models\Utility::settings();
            $secs = strtotime($settings['company_start_time']) - strtotime("00:00");
            $result = date("H:i", strtotime($settings['company_end_time']) - $secs);


            $obj = [
                'date' =>  \Auth::user()->dateFormat($date),
                'employee_name' => $employees->name,
                'designation' => !empty($employees->designation->name) ? $employees->designation->name : '',
                'app_name' => env('APP_NAME'),
            ];

            $noc_certificate->content = NOC::replaceVariable($noc_certificate->content, $obj);
            return view('employee.template.Nocdocx', compact('noc_certificate', 'employees'));
        }

        public function getdepartment(Request $request)
        {
            if ($request->branch_id == 0) {
                $departments = Department::where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('name', 'id')->toArray();
            } else {
                $departments = Department::where('created_by', '=', \Auth::user()->creatorId())->where('branch_id', $request->branch_id)->get()->pluck('name', 'id')->toArray();
            }
            return response()->json($departments);
        }

        public function json(Request $request)
        {
            if ($request->department_id == 0) {
                $designations = Designation::where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('name', 'id')->toArray();
            }
            $designations = Designation::where('department_id', $request->department_id)->get()->pluck('name', 'id')->toArray();

            return response()->json($designations);
        }

        public function view($id)
        {
            $users = LoginDetail::find($id);
            return view('employee.user_log', compact('users'));
        }

        public function logindestroy($id)
        {
            $employee = LoginDetail::where('user_id', $id)->delete();

            return redirect()->back()->with('success', 'Employee successfully deleted.');
        }

        
    public function employeeIdFormat($number)
    {
        $settings = Utility::settings();
        return $settings["employee_prefix"] . sprintf("%06d", $number);
    }
    }
