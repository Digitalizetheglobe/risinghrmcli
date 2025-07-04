@php
    $plan = Utility::getChatGPTSettings();
@endphp

{{ Form::open(['url' => 'appraisal', 'method' => 'post']) }}
<div class="modal-body">

    @if ($plan->enable_chatgpt == 'on')
        <div class="card-footer text-end">
            <a href="#" class="btn btn-sm btn-primary" data-size="medium" data-ajax-popup-over="true"
                data-url="{{ route('generate', ['appraisal']) }}" data-bs-toggle="tooltip" data-bs-placement="top"
                title="{{ __('Generate') }}" data-title="{{ __('Generate Content With AI') }}">
                <i class="fas fa-robot"></i>{{ __(' Generate With AI') }}
            </a>
        </div>
    @endif

    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                {{ Form::label('branch', __('Branch'), ['class' => 'col-form-label']) }}<span class="text-danger pl-1">*</span>
                <select name="brances" id="brances" required class="form-control ">
                    <option selected disabled value="0">{{ __('Select Category') }}</option>
                    @foreach ($brances as $value)
                        <option value="{{ $value->id }}">{{ $value->name }}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <div class="col-md-6 mt-2">
            <div class="form-group">
                {{ Form::label('employee', __('Employee'), ['class' => 'form-label']) }}<span class="text-danger pl-1">*</span>
                <div class="employee_div">
                    <select name="employee" id="employee" class="form-control " required>
                    </select>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                {{ Form::label('appraisal_date', __('Select Month'), ['class' => 'col-form-label']) }}<span class="text-danger pl-1">*</span>
                {{ Form::month('appraisal_date', '', ['class' => 'form-control current_date', 'autocomplete' => 'off', 'required' => 'required', 'id' => 'current_month']) }}
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                {{ Form::label('remark', __('Remarks'), ['class' => 'col-form-label']) }}
                {{ Form::textarea('remark', null, ['class' => 'form-control', 'rows' => '3', 'placeholder' => 'Enter remark']) }}
            </div>
        </div>
    </div>
    <div class="row" id="stares">
    </div>
</div>

<div class="modal-footer">
    <input type="button" value="Cancel" class="btn btn-light" data-bs-dismiss="modal">
    <input type="submit" value="{{ __('Create') }}" class="btn btn-primary">
</div>
{{ Form::close() }}



<script>
    $('#employee').change(function() {

        var emp_id = $('#employee').val();
        $.ajax({
            url: "{{ route('empByStar') }}",
            type: "post",
            data: {
                "employee": emp_id,
                "_token": "{{ csrf_token() }}",
            },

            cache: false,
            success: function(data) {
                $('#stares').html(data.html);
            }
        })
    });
</script>

<script>
    $('#brances').on('change', function() {
        var branch_id = this.value;

        $.ajax({
            url: "{{ route('getemployee') }}",
            type: "post",
            data: {
                "branch_id": branch_id,
                "_token": "{{ csrf_token() }}",
            },

            cache: false,
            success: function(data) {

                $('#employee').html('<option value="">{{ __('Select Employee') }}</option>');
                $.each(data.employee, function(key, value) {
                    $("#employee").append('<option value="' + value.id + '">' + value.name +
                        '</option>');
                });

            }
        })
    });
</script>

<script>
    document.getElementById('current_month').valueAsDate = new Date();
</script>
