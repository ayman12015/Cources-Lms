@extends('layouts.admin')

@section('content')

    <form action="" id="form-category" method="post" enctype="multipart/form-data"> @csrf
		<input type="hidden" name="id" value="{{ $partner->id }}" />
        <div class="row">

            <div class="col-md-12">

                <div class="form-group row {{ $errors->has('category_name')? 'has-error':'' }} ">
                    <label class="col-sm-3 control-label" for="category_name">@lang('admin.name')</label>
                    <div class="col-sm-7">
                        <input type="text" value="{{ $partner->title }}" name="name" placeholder="@lang('admin.name')" id="name" class="form-control">
                    </div>
                </div>
				
                <div class="form-group row">
                    <div class="col-sm-3 control-label">
						<label>الشعار</label>
					</div>
					<div class="col-sm-7">
                        {!! image_upload_form('logo', isset($partner->logo)?$partner->logo: '') !!}
                    </div>
                </div>				

                <div class="form-group row">
                    <div class="col-sm-7 offset-3">
                        <button type="submit" form="form-category" class="btn btn-primary btn-xl" data-toggle="tooltip" title="@lang('admin.save')"> <i class="la la-save"></i> {{__a('save')}} </button>
                    </div>
                </div>


            </div>

        </div>

    </form>

@endsection
