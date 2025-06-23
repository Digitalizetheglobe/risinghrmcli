@php
    $setting = App\Models\Utility::settings();
    $plan = Utility::getChatGPTSettings();
    $compOffBalance = $compOffBalance ?? 0; // Default value if not defined
@endphp
{{ Form::open(['url' => 'leave', 'method' => 'post']) }}
<div class="modal-body">

    @if ($plan->enable_chatgpt == 'on')
        <div class="card-footer text-end">
            <a href="#" class="btn btn-sm btn-primary" data-size="medium" data-ajax-popup-over="true"
                data-url="{{ route('generate', ['leave']) }}" data-bs-toggle="tooltip" data-bs-placement="top"
                title="{{ __('Generate') }}" data-title="{{ __('Generate Content With AI') }}">
                <i class="fas fa-robot"></i>{{ __(' Generate With AI') }}
            </a>
        </div>
    @endif

    @if (\Auth::user()->type != 'employee')
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    {{ Form::label('employee_id', __('Employee'), ['class' => 'col-form-label']) }}
                    {{ Form::select('employee_id', $employees, null, ['class' => 'form-control select2', 'id' => 'employee_id', 'placeholder' => __('Select Employee')]) }}
                </div>
            </div>
        </div>
    @else
        {!! Form::hidden('employee_id', !empty($employees) ? $employees->id : 0, ['id' => 'employee_id']) !!}
    @endif

    <p id="comp-off-balance-display">Comp-Off Balance: {{ $compOffBalance }}</p>
    <div id="comp-off-error" class="text-danger" style="display: none;"></div>
    
    {{-- Leave Type Selection --}}
    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                {{ Form::label('leave_type_id', __('Leave Type'), ['class' => 'col-form-label']) }}<span class="text-danger pl-1">*</span>
                <select name="leave_type_id" id="leave_type_id" class="form-control select">
                    <option value="">{{ __('Select Leave Type') }}</option>
                    @foreach ($leavetypes as $leave)
                        @if ($leave->title === 'Comp-Off')
                            @if($compOffBalance > 0 || \Auth::user()->type != 'employee')
                                <option value="{{ $leave->id }}" 
                                        data-is-comp-off="1"
                                        data-balance="{{ $compOffBalance }}">
                                    {{ $leave->title }} (0/{{ $compOffBalance }})
                                </option>
                            @endif
                        @else
                            <option value="{{ $leave->id }}">
                                {{ $leave->title }}
                                @if($leave->days > 0)
                                    ({{ $leave->getUsedLeaves(Auth::user()->type == 'employee' ? $employeeId : null) }}/{{ $leave->days }})
                                @endif
                            </option>
                        @endif
                    @endforeach
                </select>
            </div>
        </div>
    </div>
    {{-- Start and End Date --}}
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                {{ Form::label('start_date', __('Start Date'), ['class' => 'col-form-label']) }}
                {{ Form::text('start_date', null, ['class' => 'form-control d_week current_date', 'autocomplete' => 'off', 'id' => 'start_date']) }}
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                {{ Form::label('end_date', __('End Date'), ['class' => 'col-form-label']) }}
                {{ Form::text('end_date', null, ['class' => 'form-control d_week current_date', 'autocomplete' => 'off', 'id' => 'end_date']) }}
            </div>
        </div>
    </div>

    {{-- Leave Reason --}}
    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                {{ Form::label('leave_reason', __('Leave Reason'), ['class' => 'col-form-label']) }}
                {{ Form::textarea('leave_reason', null, ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Leave Reason'), 'rows' => '3']) }}
            </div>
        </div>
    </div>

    {{-- Remarks and AI Grammar Check --}}
    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                {{ Form::label('remark', __('Remark'), ['class' => 'col-form-label']) }}
                @if ($plan->enable_chatgpt == 'on')
                    <a href="#" data-size="md" class="btn btn-primary btn-icon btn-sm" data-ajax-popup-over="true"
                        id="grammarCheck" data-url="{{ route('grammar', ['grammar']) }}" data-bs-placement="top"
                        data-title="{{ __('Grammar check with AI') }}">
                        <i class="ti ti-rotate"></i> <span>{{ __('Grammar check with AI') }}</span>
                    </a>
                @endif
                {{ Form::textarea('remark', null, ['class' => 'form-control grammer_textarea', 'required' => 'required', 'placeholder' => __('Leave Remark'), 'rows' => '3']) }}
            </div>
        </div>
    </div>

    {{-- Google Calendar Sync --}}
    @if (isset($setting['is_enabled']) && $setting['is_enabled'] == 'on')
        <div class="form-group col-md-6">
            {{ Form::label('synchronize_type', __('Synchronize in Google Calendar?'), ['class' => 'form-label']) }}
            <div class="form-switch">
                <input type="checkbox" class="form-check-input mt-2" name="synchronize_type" id="switch-shadow" value="google_calendar">
                <label class="form-check-label" for="switch-shadow"></label>
            </div>
        </div>
    @endif
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-light" data-bs-dismiss="modal">{{ __('Close') }}</button>
    <input type="submit" value="{{ __('Create') }}" class="btn btn-primary" id="submit-btn">
</div>
{{ Form::close() }}

<script>
    $(document).ready(function() {
        // Set current date
        var now = new Date();
        var month = (now.getMonth() + 1).toString().padStart(2, '0');
        var day = now.getDate().toString().padStart(2, '0');
        var today = now.getFullYear() + '-' + month + '-' + day;
        $('.current_date').val(today);

        // Function to calculate business days between two dates (excluding weekends)
        function getBusinessDays(startDate, endDate) {
            var count = 0;
            var current = new Date(startDate);
            var end = new Date(endDate);
            
            while (current <= end) {
                var day = current.getDay();
                if (day !== 0 && day !== 6) { // Skip Sunday (0) and Saturday (6)
                    count++;
                }
                current.setDate(current.getDate() + 1);
            }
            return count;
        }

        // Function to validate comp-off days
        function validateCompOffDays() {
            var isCompOff = $('#leave_type_id option:selected').data('is-comp-off') === 1;
            if (!isCompOff) {
                $('#comp-off-error').hide();
                return true;
            }

            var startDate = $('#start_date').val();
            var endDate = $('#end_date').val();
            
            if (!startDate || !endDate) {
                return false;
            }

            var balance = parseInt($('#leave_type_id option:selected').data('balance'));
            var daysRequested = getBusinessDays(startDate, endDate);

            if (daysRequested > balance) {
                $('#comp-off-error').text('You cannot request more than ' + balance + ' Comp-Off days. You are requesting ' + daysRequested + ' days.');
                $('#comp-off-error').show();
                return false;
            } else {
                $('#comp-off-error').hide();
                return true;
            }
        }

        // Function to update comp-off display
        function updateCompOffDisplay(balance) {
            // Update the balance display
            $('#comp-off-balance-display').text('Comp-Off Balance: ' + balance);
            
            // Update the select option
            var $compOffOption = $('#leave_type_id option[data-is-comp-off="1"]');
            
            if ($compOffOption.length) {
                $compOffOption.text('Comp-Off (0/' + balance + ')');
                $compOffOption.attr('data-balance', balance);
                
                // For admin users, always show comp-off option
                if (@json(Auth::user()->type != 'employee')) {
                    $compOffOption.show();
                } else {
                    // For employees, only show if balance > 0
                    $compOffOption.toggle(balance > 0);
                }
            } else if (balance > 0 || @json(Auth::user()->type != 'employee')) {
                // If comp-off option doesn't exist but should be shown
                var compOffLeave = @json($leavetypes->firstWhere('title', 'Comp-Off'));
                if (compOffLeave) {
                    $('#leave_type_id').append(
                        $('<option>', {
                            value: compOffLeave.id,
                            'data-is-comp-off': '1',
                            'data-balance': balance
                        }).text('Comp-Off (0/' + balance + ')')
                    );
                }
            }
            
            // Refresh Select2 if used
            if ($('#leave_type_id').hasClass('select2-hidden-accessible')) {
                $('#leave_type_id').trigger('change.select2');
            }
        }

        // Initialize with default balance
        updateCompOffDisplay({{ $compOffBalance }});

        // Update comp-off balance when employee changes (for admin only)
        @if(\Auth::user()->type != 'employee')
            $('#employee_id').on('change', function() {
                var employeeId = $(this).val();
                if (employeeId) {
                    $.ajax({
                        url: '/hrm/get-comp-off-balance/' + employeeId,
                        type: 'GET',
                        success: function(data) {
                            if (data.status === 'success') {
                                updateCompOffDisplay(data.balance);
                            } else {
                                console.error('Unexpected response format');
                                updateCompOffDisplay(0);
                            }
                        },
                        error: function(xhr) {
                            console.error('Error fetching comp-off balance');
                            updateCompOffDisplay(0);
                        }
                    });
                } else {
                    updateCompOffDisplay(0);
                }
            });
        @endif

        // Validate when dates change
        $('#start_date, #end_date').on('change', function() {
            validateCompOffDays();
        });

        // Validate when leave type changes
        $('#leave_type_id').on('change', function() {
            validateCompOffDays();
        });

        // Prevent form submission if validation fails
        $('form').on('submit', function(e) {
            if (!validateCompOffDays()) {
                e.preventDefault();
                return false;
            }
            return true;
        });
    });


    // Add this to your @push('script-page') section
$(document).on('change', '#start_date, #end_date', function() {
    var startDate = new Date($('#start_date').val());
    var endDate = new Date($('#end_date').val());
    
    if (startDate && endDate) {
        // Calculate difference in days
        var diffTime = Math.abs(endDate - startDate);
        var diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;
        
        $('#total_leave_days').val(diffDays);
        
        // Get selected leave type
        var leaveTypeId = $('#leave_type_id').val();
        if (leaveTypeId) {
            // You might need to load leave type limits via AJAX or store them in data attributes
            $.ajax({
                url: '{{ route('get.leave.type.details') }}',
                type: 'POST',
                data: {
                    "leave_type_id": leaveTypeId,
                    "_token": "{{ csrf_token() }}",
                },
                success: function(data) {
                    if (diffDays > data.days) {
                        alert('You cannot take more than ' + data.days + ' days for this leave type');
                        $('#end_date').val('');
                        $('#total_leave_days').val('');
                    }
                }
            });
        }
    }
});
</script>