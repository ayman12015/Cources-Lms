@php
    use App\HomePage;
	$info = HomePage::where('id', 1)->first();
@endphp

<footer>
    <div class="footer-top py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <div class="footer-widget-wrap">
                        <h4>من نحن</h4>
                        <p class="footer-about-us-desc">
							{{$info->footer_about}}
                        </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="footer-widget-wrap link-widget-wrap">

                        <ul style="display:initial;" class="footer-links">
                            <li><a href="{{route('courses')}}">{{__t('courses')}}</a> </li>
                            <li><a href="{{route('post_proxy')}}">حول المنصة</a> </li>
                            <li><a href="#">اتصل بنا</a> </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="footer-widget-wrap contact-us-widget-wrap">
                        <h4>اتصل بنا</h4>
                        <p class="footer-address">
                            المملكة العربية السعودية، الخبر
                        </p>
                        <p class="mb-0"> Tel.: +1 234 452 341 55 </p>
                        <p class="mb-0"> Fax: +1 979 132 225 675 </p>
                        <p class="mb-0"> info@demo.com </p>
						<p class="footer-social-icon-wrap mt-2">
                            <a href="#"><i class="la la-facebook"></i> </a>
                            <a href="#"><i class="la la-twitter"></i> </a>
                            <a href="#"><i class="la la-youtube"></i> </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-bottom py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="footer-bottom-contents-wrap d-flex">
                        <div class="footer-bottom-left">
                            <b class="text-warning"> LMS </b> 
                            <span class="ml-4 mr-1"> جميع الحقوق محفوظة © 2020 </span>
							<ul class="footer-bottom-right-links">
                                <li>
                                    <a href="{{route('post_proxy', get_option('terms_of_use_page'))}}">
                                        {{__t('terms_of_use')}}
                                    </a>
                                </li>
                                <li>
                                    <a href="{{route('post_proxy', get_option('privacy_policy_page'))}}">
                                        {{__t('privacy_policy')}} و {{__t('cookie_policy')}}
                                    </a>
                                </li>
                            </ul>
						</div>
                        <div class="footer-bottom-right flex-grow-1 text-left">
							<span>تطوير و تشغيل</span>
							<br/>
							<a href="https://kamel.tech" target="_blank" class="text-warning">
								<img style="width:96px;margin-top:2px;" src="{{theme_asset('img/kamel-white.png')}}"/>
							</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
    {{ csrf_field() }}
</form>

@if( ! auth()->check() && request()->path() != 'login')
    @include(theme('template-part.login-modal-form'))
@endif

<!-- jquery latest version -->
<script src="{{asset('assets/js/vendor/jquery-1.12.0.min.js')}}"></script>
<!-- bootstrap js -->
<script src="{{asset('assets/js/bootstrap.bundle.min.js')}}"></script>

@yield('page-js')

<!-- main js -->
<script src="{{theme_asset('js/main.js')}}"></script>
</body>
</html>
