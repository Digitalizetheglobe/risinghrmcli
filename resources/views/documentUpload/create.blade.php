@php
    $plan = Utility::getChatGPTSettings();
@endphp

{{ Form::open(['url' => 'document-upload', 'method' => 'post', 'enctype' => 'multipart/form-data']) }}
<div class="modal-body">

    @if ($plan->enable_chatgpt == 'on')
    <div class="text-end">
        <a href="#" class="btn btn-sm btn-primary" data-size="medium" data-ajax-popup-over="true" data-url="{{ route('generate', ['document-upload']) }}"
            data-bs-toggle="tooltip" data-bs-placement="top" title="{{ __('Generate') }}"
            data-title="{{ __('Generate Content With AI') }}">
            <i class="fas fa-robot"></i>{{ __(' Generate With AI') }}
        </a>
    </div>
    @endif

    <div class="row">

        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="form-group">
                {{ Form::label('name', __('Name'), ['class' => 'form-label']) }}<span class="text-danger pl-1">*</span>
                <div class="form-icon-user">
                    {{ Form::text('name', null, ['class' => 'form-control', 'required' => 'required', 'placeholder' => __('Enter Company Policy Title')]) }}
                </div>

            </div>
        </div>

        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                {{ Form::label('document', __('Document'), ['class' => 'col-form-label']) }}
                <div class="choose-files ">
                    <label for="document">
                        <div class=" bg-primary document "> <i
                                class="ti ti-upload px-1"></i>{{ __('Choose file here') }}
                        </div>
                        <input type="file" style="margin-top: -50px" class="form-control file" name="documents"  onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])" required>
                        <img id="blah" class="mt-3"  width="100" src="" />
                    </label>
                </div>
            </div>
        </div>


        <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="form-group">
                {{ Form::label('role', __('Role'), ['class' => 'form-label']) }}
                <div class="form-icon-user">
                    {{ Form::select('role', $roles, null, ['class' => 'form-control', 'required' => 'required']) }}
                </div>
            </div>
        </div>

        

        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="form-group">
                {{ Form::label('description', __('Description'), ['class' => 'form-label']) }}
                <div class="form-icon-user">
                    {{ Form::textarea('description', null, ['class' => 'form-control', 'rows' => '3']) }}
                </div>
            </div>
        </div>


    </div>
</div>
<div class="modal-footer">
    <input type="button" value="Cancel" class="btn btn-light" data-bs-dismiss="modal">
    <input type="submit" value="{{ __('Create') }}" class="btn btn-primary">
</div>
{{ Form::close() }}
