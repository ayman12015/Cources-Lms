@extends('layouts.admin')

@section('content')

    <div class="row">
        <div class="col-sm-12">

            <form action="" method="post" id="createPostForm" enctype="multipart/form-data">
                @csrf

                <div class="form-group row">
                    <div class="col-sm-12">
                        <input type="text" value="{{ isset($info->slider_title)?$info->slider_title: ''}}" class="form-control" name="slider_title" placeholder="العنوان الرئيسي">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-12">
                        <input type="text" class="form-control" name="slider_sub_title" placeholder="العنوان الفرعي" value="{{ isset($info->slider_sub_title)?$info->slider_sub_title: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
                        <input type="text" class="form-control" name="slider_btn_title" placeholder="عنوان الزر" value="{{ isset($info->slider_btn_title)?$info->slider_btn_title: ''}}">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-12">
                        <input type="text" class="form-control" name="slider_link" placeholder="رابط الزر" value="{{ isset($info->slider_link)?$info->slider_link: ''}}">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-4">
						<label>الصورة</label>
					</div>
					<div class="col-sm-8">
                        {!! image_upload_form('slider_image', isset($info->slider_image)?$info->slider_image: '') !!}
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-4">
						<label>صورة الخلفية</label>
					</div>
					<div class="col-sm-8">
                        {!! image_upload_form('slider_bg', isset($info->slider_bg)?$info->slider_bg: '') !!}
                    </div>
                </div>



				
				
				<div class="row">
					<div class="col-md-12">
						<h3>المميزات</h3>
					</div>
				</div>				
				<!-- feature block-->
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>الميزة 1</label>
                        <input type="text" class="form-control" name="feature1_title" value="{{ isset($info->feature1_title)?$info->feature1_title: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>النص 1</label>
                        <input type="text" class="form-control" name="feature1_text" value="{{ isset($info->feature1_text)?$info->feature1_text: ''}}">
                    </div>
                </div>					
                <div class="form-group row">
                    <div class="col-sm-4">
						<label>أيقونة 1</label>
					</div>
					<div class="col-sm-8">
                        {!! image_upload_form('feature1_icon', isset($info->feature1_icon)?$info->feature1_icon: '') !!}
                    </div>
                </div>
				<!-- end feature block -->
				
				
				<!-- feature block-->
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>الميزة 2</label>
                        <input type="text" class="form-control" name="feature2_title" value="{{ isset($info->feature2_title)?$info->feature2_title: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>النص 2</label>
                        <input type="text" class="form-control" name="feature2_text" value="{{ isset($info->feature2_text)?$info->feature2_text: ''}}">
                    </div>
                </div>					
                <div class="form-group row">
                    <div class="col-sm-4">
						<label>أيقونة 2</label>
					</div>
					<div class="col-sm-8">
                        {!! image_upload_form('feature2_icon', isset($info->feature2_icon)?$info->feature2_icon: '') !!}
                    </div>
                </div>
				<!-- end feature block -->				
				
				
				<!-- feature block-->
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>الميزة 3</label>
                        <input type="text" class="form-control" name="feature3_title" value="{{ isset($info->feature3_title)?$info->feature3_title: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>النص 3</label>
                        <input type="text" class="form-control" name="feature3_text" value="{{ isset($info->feature3_text)?$info->feature3_text: ''}}">
                    </div>
                </div>					
                <div class="form-group row">
                    <div class="col-sm-4">
						<label>أيقونة 3</label>
					</div>
					<div class="col-sm-8">
                        {!! image_upload_form('feature3_icon', isset($info->feature3_icon)?$info->feature3_icon: '') !!}
                    </div>
                </div>
				<!-- end feature block -->	
				
				<!-- feature block-->
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>الميزة 4</label>
                        <input type="text" class="form-control" name="feature4_title" value="{{ isset($info->feature4_title)?$info->feature4_title: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>النص4</label>
                        <input type="text" class="form-control" name="feature4_text" value="{{ isset($info->feature4_text)?$info->feature4_text: ''}}">
                    </div>
                </div>					
                <div class="form-group row">
                    <div class="col-sm-4">
						<label>أيقونة 4</label>
					</div>
					<div class="col-sm-8">
                        {!! image_upload_form('feature4_icon', isset($info->feature4_icon)?$info->feature4_icon: '') !!}
                    </div>
                </div>
				<!-- end feature block -->				

				
				<div class="row">
					<div class="col-md-12">
						<h3>أفضل الدورات</h3>
					</div>
				</div>
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>العنوان الرئيسي</label>
                        <input type="text" class="form-control" name="courses_title" value="{{ isset($info->courses_title)?$info->courses_title: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>النص الفرعي</label>
                        <input type="text" class="form-control" name="courses_text" value="{{ isset($info->courses_text)?$info->courses_text: ''}}">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>عنوان الزر</label>
                        <input type="text" class="form-control" name="courses_btn_title" value="{{ isset($info->courses_btn_title)?$info->courses_btn_title: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>رابط الزر</label>
                        <input type="text" class="form-control" name="courses_btn_link" value="{{ isset($info->courses_btn_link)?$info->courses_btn_link: ''}}">
                    </div>
                </div>


				<div class="row">
					<div class="col-md-12">
						<h3>أرقام عن المنصة</h3>
					</div>
				</div>
				
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>عنوان 1</label>
                        <input type="text" class="form-control" name="numbers1_title" value="{{ isset($info->numbers1_title)?$info->numbers1_title: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>رقم 1</label>
                        <input type="text" class="form-control" name="numbers1_value" value="{{ isset($info->numbers1_value)?$info->numbers1_value: ''}}">
                    </div>
                </div>	

                <div class="form-group row">
                    <div class="col-sm-12">
						<label>عنوان 2</label>
                        <input type="text" class="form-control" name="numbers2_title" value="{{ isset($info->numbers2_title)?$info->numbers2_title: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>رقم 2</label>
                        <input type="text" class="form-control" name="numbers2_value" value="{{ isset($info->numbers2_value)?$info->numbers2_value: ''}}">
                    </div>
                </div>
				
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>عنوان 3</label>
                        <input type="text" class="form-control" name="numbers3_title" value="{{ isset($info->numbers3_title)?$info->numbers3_title: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>رقم 3</label>
                        <input type="text" class="form-control" name="numbers3_value" value="{{ isset($info->numbers3_value)?$info->numbers3_value: ''}}">
                    </div>
                </div>				
				
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>عنوان 4</label>
                        <input type="text" class="form-control" name="numbers4_title" value="{{ isset($info->numbers4_title)?$info->numbers4_title: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>رقم 4</label>
                        <input type="text" class="form-control" name="numbers4_value" value="{{ isset($info->numbers4_value)?$info->numbers4_value: ''}}">
                    </div>
                </div>	
				
				<div class="row">
					<div class="col-md-12">
						<h3>المدربين و الدورات</h3>
					</div>
				</div>
				
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>العنوان 1</label>
                        <input type="text" class="form-control" name="bottom_title1" value="{{ isset($info->bottom_title1)?$info->bottom_title1: ''}}">
                    </div>
                </div>		
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>النص 1</label>
                        <input type="text" class="form-control" name="bottom_text1" value="{{ isset($info->bottom_text1)?$info->bottom_text1: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>عنوان الزر 1</label>
                        <input type="text" class="form-control" name="bottom_button1" value="{{ isset($info->bottom_button1)?$info->bottom_button1: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>رابط الزر 1</label>
                        <input type="text" class="form-control" name="bottom_btn_link1" value="{{ isset($info->bottom_btn_link1)?$info->bottom_btn_link1: ''}}">
                    </div>
                </div>	

                <div class="form-group row">
                    <div class="col-sm-12">
						<label>العنوان 2</label>
                        <input type="text" class="form-control" name="bottom_title2" value="{{ isset($info->bottom_title2)?$info->bottom_title2: ''}}">
                    </div>
                </div>		
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>النص 2</label>
                        <input type="text" class="form-control" name="bottom_text2" value="{{ isset($info->bottom_text2)?$info->bottom_text2: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>عنوان الزر 2</label>
                        <input type="text" class="form-control" name="bottom_button2" value="{{ isset($info->bottom_button2)?$info->bottom_button2: ''}}">
                    </div>
                </div>	
                <div class="form-group row">
                    <div class="col-sm-12">
						<label>رابط الزر 2</label>
                        <input type="text" class="form-control" name="bottom_btn_link2" value="{{ isset($info->bottom_btn_link2)?$info->bottom_btn_link2: ''}}">
                    </div>
                </div>
				
				
				<div class="row">
					<div class="col-md-12">
						<h3>الفوتر</h3>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-12">
						<label>نبذة تعريفية</label>
						<textarea class="form-control" name="footer_about">{{ isset($info->footer_about)?$info->footer_about: '' }}</textarea>
					</div>
				</div>
				
				
				

                <div class="form-group row">
                    <div class="col-sm-9">
                        <button type="submit" class="btn btn-primary">{{__a('save')}}</button>
                    </div>
                </div>
            </form>

        </div>

    </div>


@endsection

