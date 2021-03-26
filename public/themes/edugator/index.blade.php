@extends('layouts.theme')


@section('content')

    <div class="hero-banner py-3" style="background:#d1d1d1 url({{$info->thumbnail_url6->image_md}}) no-repeat scroll center center / cover;" >

        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-6">

                    <div class="hero-left-wrap">
                        <h1 class="hero-title mb-4 slider-main-title">{{ $info->slider_title }}</h1>
                        <p class="hero-subtitle mb-4 slider-sub-title">
                            {{ $info->slider_sub_title }}
                        </p>
                        <a href="{{ $info->slider_link? $info->slider_link:'#' }}" class="btn btn-theme-primary btn-lg nav-lessons-btn">{{ $info->slider_btn_title }}</a>
                    </div>

                </div>


                <div class="col-md-12 col-lg-6 hero-right-col">
				@if ($info->slider_image) 
					<div class="hero-right-wrap">
                        <img src="{{$info->thumbnail_url5->image_md}}" class="img-fluid" />
                    </div>
				@endif
                </div>
            </div>
        </div>


    </div>
    <div class="home-section-wrap home-info-box-wrapper py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="home-info-box">
                        <img src="{{$info->thumbnail_url1->full}}">
                        <h3 class="info-box-title">{{$info->feature1_title}}</h3>
                        <p class="info-box-desc">{{$info->feature1_text}}</p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="home-info-box">
                        <img src="{{$info->thumbnail_url2->full}}">
                        <h3 class="info-box-title">{{$info->feature2_title}}</h3>
                        <p class="info-box-desc">{{$info->feature2_text}}</p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="home-info-box">
                        <img src="{{$info->thumbnail_url3->full}}">
                        <h3 class="info-box-title">{{$info->feature3_title}}</h3>
                        <p class="info-box-desc">{{$info->feature3_text}}</p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="home-info-box">
                        <img src="{{$info->thumbnail_url4->full}}">
                        <h3 class="info-box-title">{{$info->feature4_title}}</h3>
                        <p class="info-box-desc">{{$info->feature4_text}}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>




    @if($new_courses->count())
        <div style="background:#fff;" class="home-section-wrap home-new-courses-wrapper py-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-header-wrap">
                            <h3 class="section-title">{{__t('new_arrival')}}
                            </h3>
                        </div>
                    </div>
                </div>

                <div class="popular-courses-cards-wrap mt-3">
                    <div class="row">
                        @foreach($new_courses as $course)
                            {!! course_card($course) !!}
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    @endif

    <div class="mid-callto-action-wrap text-white text-center py-5">
        <div class="container py-3">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="mb-3 slogan-main-title">احصلى على افضل الدورات التي تناسبك</h2>
                    <h4 class="mb-3 mid-callto-action-subtitle slogan-sub-title">
						اختر من بين أكثر من 100 دورة فيديو عبر الإنترنت
مع إضافات جديدة تنشر كل يوم
					</h4>

                    <a href="{{route('courses')}}" class="btn btn-warning btn-lg slog-btn" >تصفح الدورات</a>
                </div>
            </div>
        </div>
    </div>
	

    <div style="background:#fff;" class="home-section-wrap home-cta-wrapper py-5 ">

        <div class="home-partners-logo-section pb-5 mb-5 text-center">
            <div class="container">

                <h5 class="home-partners-title mb-5">
				تستخدم الشركات منصتنا لإثراء علامتها التجارية وأعمالها.</h5>

                <div class="home-partners-logo-wrap">
				@foreach ($partners as $partner)
				   <div class="logo-item">
                        <a href=""><img src="{{$partner->thumbnail_url->full}}" alt="{{ $partner->title }}" /></a>
                    </div>
				@endforeach
                </div>

            </div>
        </div>

        <div style="display:none;" class="home-course-stats-wrap pb-5 mb-5 text-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-3"><h3>{{$info->numbers1_value}}</h3> <h5>{{$info->numbers1_title}}</h5></div>
                    <div class="col-md-3"> <h3>{{$info->numbers2_value}}</h3> <h5>{{$info->numbers2_title}}</h5></div>
                    <div class="col-md-3"><h3>{{$info->numbers3_value}}</h3> <h5>{{$info->numbers3_title}}</h5></div>
                    <div class="col-md-3"><h3>{{$info->numbers4_value}}</h3> <h5> {{$info->numbers4_title}}</h5></div>
                </div>
            </div>
        </div>

        <div style="display:none;" class="container">
            <div class="row">
			
                <div class="col-sm-6 home-cta-left-col">
                    <div class="home-cta-text-wrapper px-5 text-center">
                        <h4>{{$info->bottom_title1}}</h4>
                        <p>{{$info->bottom_text1}}
                        </p>
                        <a href="{{$info->bottom_btn_link1}}" class="btn btn-theme-primary">{{$info->bottom_button1}}</a>
                    </div>
                </div>

                <div class="col-sm-6 home-cta-left-col">
                    <div class="home-cta-text-wrapper px-5 text-center">
                        <h4>{{$info->bottom_title2}}</h4>
                        <p>{{$info->bottom_text2}}
                        </p>
                        <a href="{{$info->bottom_btn_link2}}" class="btn btn-theme-primary">{{$info->bottom_button2}}</a>
                    </div>
                </div>

            </div>
        </div>

    </div>

@endsection
