
<div id="course-discussion-wrap">

    <div class="discusion-calltoaction-wrap text-center py-4 my-4">
        <h3 class="discussion-label"><i class="la la-question-circle-o"></i>
			ساحة النقاش
		</h3>
    </div>

    <div class="discussion-ask-question-form bg-light my-4 p-4">

        <form action="{{route('ask_question')}}" method="post">
            @csrf
            <input type="hidden" name="content_id" value="{{$content->id}}">
            <div class="form-group {!! form_error($errors, 'title')->class !!}">
                <label class="">العنوان</label>
                <input type="text" class="form-control" name="title" value="">
                {!! form_error($errors, 'title')->message !!}
            </div>

            <div class="form-group {!! form_error($errors, 'message')->class !!}">
                <label>التفاصيل</label>
                <textarea class="form-control" name="message" rows="5"></textarea>
                {!! form_error($errors, 'message')->message !!}
            </div>

            <button type="submit" class="btn btn-purple discussion-sec-btn"><i class="la la-question-circle-o"></i> موافق </button>
        </form>

    </div>


    <div id="content-discussions-list-wrap">


        @foreach($content->discussions as $discussion)

            <div class="discussion-single-wrap border p-3 mb-4">

                <div class="discussion-user d-flex mb-4">
                    <div class="reviewed-user-photo">
                        <a href="{{route('profile', $discussion->user->id)}}">
                            {!! $discussion->user->get_photo !!}
                        </a>
                    </div>
                    <div class="discussion-user-name flex-grow-1">

                        <a href="{{route('profile', $discussion->user->id)}}">{!! $discussion->user->name !!}</a>
                        <p class="mb-0">
                            <a href="{{route('review', $discussion->id)}}" class="text-muted " >{{$discussion->created_at->diffForHumans()}}</a>
                        </p>
                    </div>
                </div>

                <h4 class="mb-4"> {{$discussion->title}}</h4>

                <div class="discusison-details-wrap mb-4">
                    {!! nl2br(clean_html($discussion->message)) !!}
                </div>

                @if($discussion->replies->count())
                    @foreach($discussion->replies as $reply)
                        <div class="discussion-reply-wrap border p-3 bg-white">
                            <div class="discussion-user d-flex mb-4">
                                <div class="reviewed-user-photo">
                                    <a href="{{route('profile', $reply->user->id)}}">
                                        {!! $reply->user->get_photo !!}
                                    </a>
                                </div>
                                <div class="discussion-user-name flex-grow-1">
                                    <a href="{{route('profile', $reply->user->id)}}">{!! $reply->user->name !!}</a>
                                    <p class="">
                                        <a href="{{route('review', $reply->id)}}" class="text-muted " >{{$reply->created_at->diffForHumans()}}</a>
                                    </p>

                                    <a href="{{route('discussion_reply', $reply->id)}}">
                                        <h4>{{$reply->title}}</h4>
                                    </a>

                                    <div class="discusison-details-wrap">
                                        {!! nl2br(clean_html($reply->message)) !!}
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif


                <div class="discussion-reply-form bg-white my-4">
                    <form action="{{route('discussion_reply_student', $discussion->id)}}" method="post">
                        @csrf

                        <div class="form-group {!! form_error($errors, 'message')->class !!}">
                            <textarea class="form-control" name="message" rows="5"></textarea>
                            {!! form_error($errors, 'message')->message !!}
                        </div>
                        <button type="submit" class="btn btn-purple discussion-sec-btn"><i class="la la-question-circle-o"></i> نشر </button>
                    </form>
                </div>

            </div>

        @endforeach


    </div>

</div>
