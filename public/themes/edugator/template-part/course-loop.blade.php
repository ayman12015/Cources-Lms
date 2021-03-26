<?php
$gridClass = $grid_class ? $grid_class : 'col-md-3';
?>

<div class="{{$gridClass}} course-card-grid-wrap ">
    <div class="course-card mb-5">

        <div class="course-card-img-wrap">
            <a href="{{route('course', $course->slug)}}">
                <img src="{{$course->thumbnail_url}}" class="img-fluid" />
            </a>

            <button class="course-card-add-wish btn btn-link btn-sm p-0" data-course-id="{{$course->id}}">
                @if($auth_user && in_array($course->id, $auth_user->get_option('wishlists', []) ))
                    <i class="la la-heart"></i>
                @else
                    <i class="la la-heart-o"></i>
                @endif
            </button>
        </div>

        <div class="course-card-contents no-padding">
		  <div class="course-title-sec">
		   @if($course->category)
                <span>
                    <a href="{{route('category_view', $course->category->slug)}}">{{$course->category->category_name}}</a>
                </span>
            @endif
            <a href="{{route('course', $course->slug)}}">
                <h4 class="course-card-title mb-3 mt-2">{{$course->title}}</h4>
            </a>
			</div>
            <div class="course-card-info-wrap p-15">
                <p class="course-card-short-info mb-0 d-flex justify-content-between">
                    <span><i class="la la-play-circle"></i> {{$course->total_lectures}} {{__t('course_lectures')}}</span>
					<span>
					   {!! $course->price_html(false, false) !!}
					</span>
                </p>
            </div>
        </div>

    </div>
</div>
