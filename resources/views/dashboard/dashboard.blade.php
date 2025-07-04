@extends('layouts.admin')

@section('page-title')
    {{ __('Dashboard') }}
@endsection

@section('content')
<style>
    .fc-prev-button, .fc-next-button {
        padding: 5px 8px !important;
        font-size: 14px !important;
        background-color: #007bff !important;
        border-radius: 5px !important;
        border: none !important;
        color: white !important;
    }

    .fc-prev-button:hover, .fc-next-button:hover {
        background-color: #0056b3 !important;
    }

    #calendar {
        margin-bottom: 10px;
    }

    .calendar-navigation {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin-top: 10px;
    }
</style>

<div>
    <div class="row">
        @if (session('status'))
            <div class="alert alert-success" role="alert">
                {{ session('status') }}
            </div>
        @endif

        @if (\Auth::user()->type == 'employee')
            <div class="col-xxl-9">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card">  
                                    <div class="card-header d-flex align-items-center">
                                        <img src="{{ asset('storage/uploads/avatar/' . ($emp->user->avatar ?? 'default-avatar.png')) }}" 
                                            alt="Profile Image" 
                                            class="rounded-circle me-4" 
                                            width="60" 
                                            height="60">
                                        <div>
                                            <h4 class="mb-0" style="color:black;">{{ $emp->name }}</h4>
                                            <small style="font-size: 12px; color:black;">{{ $emp->department->name ?? 'No Department' }} Team</small><small style="font-size:16px; color:black;"> &nbsp{{ $emp->designation->name ?? 'No Designation' }}&nbsp</small><br>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <p><strong>Phone Number:<br></strong> {{ $emp->phone ?? 'N/A' }}</p><br>
                                        <p><strong>Email Address:<br></strong> {{ $emp->email ?? 'N/A' }}</p><br>
                                        <p><strong>Joined On:<br></strong> {{ \Carbon\Carbon::parse($emp->company_doj)->format('d M Y') }}</p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card" style="">
                                    <div class="card-header">
                                        <h5 style="font-size:20px;color:black">{{ __('Attendance') }}</h5>
                                        <p id="currentDateTime"></p>
                                    </div>
                                    <div class="card-body text-center p-1">
                                        

                                        <p id="attendanceStatus" class="font-bold">
                                            @if (!isset($employeeAttendance) || !$employeeAttendance->clock_in)
                                                <span class="text-primary"><i class="fas fa-fingerprint"></i> Not Punched In</span>
                                            @elseif ($employeeAttendance->clock_out == '00:00:00' || !$employeeAttendance->clock_out)
                                                <span class="text-success"><i class="fas fa-fingerprint"></i> Punched In at {{ \Carbon\Carbon::parse($employeeAttendance->clock_in)->format('h:i A') }}</span>
                                            @else
                                                <span class="text-danger"><i class="fas fa-sign-out-alt"></i> Punched Out at {{ \Carbon\Carbon::parse($employeeAttendance->clock_out)->format('h:i A') }}</span>
                                            @endif
                                        </p>

                                        {{ Form::open(['url' => 'attendanceemployee/attendance', 'method' => 'post', 'id' => 'attendanceForm']) }}
                                            @if (empty($employeeAttendance) || $employeeAttendance->clock_out != '00:00:00')
                                                <button type="submit" value="0" name="in" id="clock_in" class="btn btn-primary">{{ __('Punch In') }}</button>
                                            @else
                                                <button type="button" value="1" name="out" id="clock_out" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmClockOutModal">
                                                    {{ __('Punch Out') }}
                                                </button>
                                            @endif
                                        {{ Form::close() }}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-12">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header card-body table-border-style d-flex justify-content-between align-items-center">
                                        <h5 style="font-size:20px; color:black; margin: 0;">{{ __('Notices') }}</h5>
                                    </div>
                                    <div class="card-body" style="height: 325px; overflow: auto; padding: 10px; padding-top:25px;">
                                        <div class="table-responsive" style="max-width:452px;">
                                            <table class="table table-bordered text-center">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 60%;">Title</th>
                                                        <th style="width: 40%;">Date</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach($notices as $notice)
                                                    <tr>
                                                        <td style="word-wrap: break-word; white-space: normal;">
                                                            {{ Str::limit($notice->title, 50, '...') }}
                                                        </td>
                                                        <td>
                                                            {{ \Carbon\Carbon::parse($notice->notice_startdate)->format('d M Y') }} - 
                                                            {{ \Carbon\Carbon::parse($notice->notice_enddate)->format('d M Y') }}
                                                        </td>
                                                    </tr>
                                                    @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header card-body table-border-style">
                                        <h5 style="font-size:20px;color:black">{{ __('TO-DO Lists') }}</h5>
                                    </div>
                                    <div class="card-body" style="height: 324px; overflow:auto;">
                                        <div class="table-responsive"> 
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                    <th>{{ __('Task Title') }}</th>
                                                    <th>{{ __('Priority') }}</th>
                                                    <th>{{ __('Due Date') }}</th>
                                                    <th>{{ __('Status') }}</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="list">
                                                    @foreach ($todos as $todo)
                                                        <tr>
                                                            <td>{{ $todo->task }}</td>
                                                            <td>
                                                                @if($todo->priority == 1)
                                                                    <span class="badge bg-danger">{{ __('High') }}</span>
                                                                @elseif($todo->priority == 2)
                                                                    <span class="badge bg-warning">{{ __('Medium') }}</span>
                                                                @else
                                                                    <span class="badge bg-success">{{ __('Low') }}</span>
                                                                @endif
                                                            </td>
                                                            <td>{{ \Carbon\Carbon::parse($todo->expires_at)->format('d M Y') }}</td>
                                                            <td>
                                                                @if($todo->is_completed)
                                                                    <span class="badge bg-success">{{ __('Completed') }}</span>
                                                                @else
                                                                    <span class="badge bg-danger">{{ __('Pending') }}</span>
                                                                @endif
                                                            </td>
                                                        </tr>
                                                    @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-12">
                    <div class="card">
                        <div class="card-header card-body table-border-style">
                            <h5 style="font-size:20px;color:black">{{ __('Project Details') }}</h5>
                        </div>
                       
                    </div>
                </div>
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-header card-body table-border-style">
                                <h5 style="font-size:20px;color:black">{{ __('Meeting List') }}</h5>
                            </div>
                            <div class="card-body" style="height: 324px; overflow:auto;">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>{{ __('Meeting Title') }}</th>
                                                <th>{{ __('Date') }}</th>
                                                <th>{{ __('Time') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($meetings as $meeting)
                                                <tr>
                                                    <td>{{ $meeting->title }}</td>
                                                    <td>{{ \Auth::user()->dateFormat($meeting->date) }}</td>
                                                    <td>{{ \Auth::user()->timeFormat($meeting->time) }}</td>
                                                </tr>
                                            @endforeach

                                            @if ($meetings->isEmpty())
                                                <tr>
                                                    <td colspan="3" class="text-center">{{ __('No meetings found') }}</td>
                                                </tr>
                                            @endif
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Side Calendar -->
            <div class="col-xxl-3">
                <div class="d-flex flex-column gap-2 sticky-top" style="top: 10px; height: 100vh;">
                    <div class="card flex-grow-1">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h5>{{ __('Calendar') }}</h5>
                                    <!-- <input type="hidden" id="path_admin" value="{{ url('/') }}"> -->
                                </div>
                                
                            </div>
                        </div>
                        <div class="card-body" style="padding-top:0px;">
                            <div id='calendar' class='calendar'></div>
                        </div>
                    </div>

                    <div class="card flex-grow-1">
                        <div class="card-header">
                            <h5 style="font-size:20px;color:black">{{ __("This Month Event's") }}</h5>
                        </div>
                        <div class="card-body">
                            <div class="card shadow-none mt-3">
                                <div class="card-body p-2"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endif
    </div>
</div>

<!-- Bootstrap Modal -->
<div class="modal fade" id="confirmClockOutModal" tabindex="-1" aria-labelledby="confirmClockOutModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmClockOutModalLabel">Confirm Clock Out</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to clock out?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No, Cancel</button>
                <button type="button" class="btn btn-danger" id="confirmClockOutBtn">Yes, Clock Out</button>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script-page')
     <script src="{{ asset('assets/js/plugins/main.min.js') }}"></script>
    <script src="{{ asset('assets/js/plugins/apexcharts.min.js') }}"></script>

    @if (Auth::user()->type == 'employee')
    <script type="text/javascript">
    $(document).ready(function() {
        get_data();
    });

    function get_data() {
        var calender_type = $('#calender_type :selected').val();

        $('#calendar').removeClass('local_calender google_calender');
        if (!calender_type) {
            calender_type = 'local_calender';
        }
        $('#calendar').addClass(calender_type);

        $.ajax({
            data: {
                "_token": "{{ csrf_token() }}",
                'calender_type': calender_type
            },
            success: function(data) {
                var calendar = new FullCalendar.Calendar(document.getElementById('calendar'), {
                    headerToolbar: {
                        left: 'prev',
                        center: 'title',
                        right: 'next'
                    },
                    themeSystem: 'bootstrap',
                    slotDuration: '00:10:00',
                    allDaySlot: true,
                    navLinks: false,
                    droppable: true,
                    selectable: true,
                    selectMirror: true,
                    editable: true,
                    dayMaxEvents: true,
                    handleWindowResize: true,
                    height: '360px',
                });
                calendar.render();
            }
        });
    }
    </script>
    @endif

    <script>
        document.addEventListener("DOMContentLoaded", function () {
           
            let clockInButton = document.getElementById("clock_in");
            let clockOutButton = document.getElementById("clock_out");
            let currentTimeElement = document.getElementById("currentDateTime");
            let confirmClockOutBtn = document.getElementById("confirmClockOutBtn");
            let attendanceStatus = document.getElementById("attendanceStatus");

            // Update current time display
            function updateTimeDisplay() {
                let now = new Date();
                currentTimeElement.textContent = now.toLocaleString("en-US", {
                    hour: "2-digit", minute: "2-digit", second: "2-digit", 
                    hour12: true, day: "2-digit", month: "short", year: "numeric"
                });
            }

           

            // Clock In Button - Only shows processing, no actual action
            if (clockInButton) {
                clockInButton.addEventListener("click", function(e) {
                    e.preventDefault();
                    
                    // Disable button and show processing
                    this.disabled = true;
                    this.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Processing...';
                    
                    // No geolocation check, no form submission
                    // Just leave it in processing state
                    
                    // Optional: Revert after 5 seconds
                    setTimeout(() => {
                        this.disabled = false;
                        this.innerHTML = '{{ __("Punch In") }}';
                    }, 5000);
                });
            }

            // Update the confirmClockOutBtn click handler
if (confirmClockOutBtn) {
    confirmClockOutBtn.addEventListener("click", function() {
        // Get current location
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                async (position) => {
                    const lat = position.coords.latitude;
                    const lng = position.coords.longitude;
                    const accuracy = position.coords.accuracy;
                    
                    // Get human-readable address
                    let locationName = "Unknown Location";
                    try {
                        const response = await fetch(
                            `https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=AIzaSyCplCUsDYqDfdu6jzr4ULAusd-hIYyAwWI`
                        );
                        const data = await response.json();
                        
                        if (data.status === "OK" && data.results.length > 0) {
                            locationName = data.results[0].formatted_address;
                        }
                    } catch (error) {
                        console.error("Failed to fetch location name", error);
                    }

                    // Add hidden inputs to form
                    const form = document.getElementById('attendanceForm');
                    
                    const addInput = (name, value) => {
                        const input = document.createElement("input");
                        input.type = "hidden";
                        input.name = name;
                        input.value = value;
                        form.appendChild(input);
                    };
                    
                    addInput("latitude", lat);
                    addInput("longitude", lng);
                    addInput("location", locationName);
                    addInput("accuracy", accuracy);
                    
                    // Submit the form
                    form.submit();
                    
                    // Update UI immediately
                    attendanceStatus.innerHTML = '<span class="text-danger"><i class="fas fa-sign-out-alt"></i> Processing Punch Out...</span>';
                },
                (error) => {
                    // If location fails, still submit the form without location data
                    document.getElementById('attendanceForm').submit();
                },
                { 
                    enableHighAccuracy: true, 
                    timeout: 10000,
                    maximumAge: 0
                }
            );
        } else {
            // If geolocation not supported, submit without location data
            document.getElementById('attendanceForm').submit();
        }
    });
}

            // Initialize time display and update every second
            updateTimeDisplay();
            setInterval(updateTimeDisplay, 1000);
        });
    </script>

    <script>
        document.getElementById("clock_in").addEventListener("click", function(e) {
            this.disabled = true;
            this.classList.add("disabled");
            
            e.preventDefault();
    
    // 1. Request location
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
            async (position) => {
                // 2. Get coordinates
                const lat = position.coords.latitude;
                const lng = position.coords.longitude;
                const accuracy = position.coords.accuracy; // Accuracy in meters
                
                // 3. Validate accuracy (require at least 50m accuracy)
                if (accuracy > 50) {
                    alert(`Your location accuracy is low (${Math.round(accuracy)} meters). Please move to an area with better GPS signal.`);
                    return;
                }
                
                // 4. Get human-readable address using Google Maps API
                let locationName = "Unknown Location";
                try {
                    const response = await fetch(
                        `https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=AIzaSyCplCUsDYqDfdu6jzr4ULAusd-hIYyAwWI`
                    );
                    const data = await response.json();
                    
                    if (data.status === "OK" && data.results.length > 0) {
                        // Get the most specific address (first result is usually the most precise)
                        locationName = data.results[0].formatted_address;
                    }
                } catch (error) {
                    console.error("Failed to fetch location name", error);
                }

                // 5. Submit form with location data
                const form = document.getElementById('attendanceForm');
                
                // Add hidden inputs
                const addInput = (name, value) => {
                    const input = document.createElement("input");
                    input.type = "hidden";
                    input.name = name;
                    input.value = value;
                    form.appendChild(input);
                };
                
                addInput("latitude", lat);
                addInput("longitude", lng);
                addInput("location", locationName);
                addInput("accuracy", accuracy);
                
                form.submit(); // Submit the form
            },
            (error) => {
                switch(error.code) {
                    case error.PERMISSION_DENIED:
                        alert("Error: Location access was denied. Please enable location permissions to clock in.");
                        break;
                    case error.POSITION_UNAVAILABLE:
                        alert("Error: Location information is unavailable. Please check your GPS signal.");
                        break;
                    case error.TIMEOUT:
                        alert("Error: The request to get location timed out. Please try again.");
                        break;
                    default:
                        alert("Error: Please enable GPS to clock in!");
                }
            },
            { 
                enableHighAccuracy: true, 
                timeout: 10000,
                maximumAge: 0 // Don't use cached position
            }
        );
    } else {
        alert("Your browser doesn't support geolocation. Use a smartphone or modern browser.");
    }
});
    </script>
@endpush

<style>
#confirmClockOutModal {
    display: none;
}
</style>