<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-8">

            <div class="card">
                <div class="card-header">
					الدخول لحسابك
				</div>

                <div class="card-body">

                    <div class="row">
                        <div class="col-md-8">

                            @include('inc.flash_msg')

                            <form method="POST" action="{{ route('login') }}">
                                @csrf

                                <div class="form-group row">
                                    <div class="col-md-10">
                                        <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" placeholder="البريد الإلكتروني" name="email" value="{{ old('email') }}" required autofocus>
                                        @if ($errors->has('email'))
                                            <span class="invalid-feedback">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-10">
                                        <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" placeholder="كلمة المرور" name="password" required>

                                        @if ($errors->has('password'))
                                            <span class="invalid-feedback">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-8 offset-md-5">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> 
												تذكرني
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row mb-0">
                                    <div class="col-md-8 offset-md-5">
                                        <button type="submit" class="btn btn-primary login-reg-btn">
                                            {{ __('دخول') }}
                                        </button>

                                        <a class="btn btn-link" href="{{ route('forgot_password') }}">
                                            {{ __('نسيت كلمة المرور') }}
                                        </a>
                                    </div>
                                </div>
                            </form>

                        </div>

                        <div class="col-md-4">

                            <div class="social-login-wrap mb-4 text-center">
                                @if(get_option('social_login.facebook.enable'))
                                    <a href="{{ route('facebook_redirect') }}" class="social-login-item btn-facebook">
                                        <i class="la la-facebook"></i> Facebook
                                    </a>
                                @endif

                                @if(get_option('social_login.google.enable'))
                                    <a href="{{ route('google_redirect') }}" class="social-login-item btn-google">
                                        <i class="la la-google"></i> Google
                                    </a>
                                @endif

                                @if(get_option('social_login.twitter.enable'))
                                    <a href="{{ route('twitter_redirect') }}" class="social-login-item btn-twitter">
                                        <span class="hidden-xs"><i class="la la-twitter"></i> Twitter</span>
                                    </a>
                                @endif

                                @if(get_option('social_login.linkedin.enable'))

                                    @if(get_option('social_login.twitter.enable'))
                                        <a href="{{ route('linkedin_redirect') }}" class="social-login-item btn-linkedin">
                                            <span class="hidden-xs"><i class="la la-linkedin-square"></i> LinkedIn</span>
                                        </a>
                                    @endif
                                @endif

                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>


    @if(config('app.is_demo'))
        <div class="row">
            <div class="col-md-10 offset-md-1">
                <div class="demo-credential-box-wrapper">
                    <h4 class="my-4">Demo Login Credential:</h4>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    <strong>Admin</strong>
                                </div>
                                <div class="card-body">
                                    <p class="m-0">E-Mail: <code>admin@demo.com</code></p>
                                    <p class="m-0">Password: <code>123456</code></p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    <strong>Instructor</strong>
                                </div>
                                <div class="card-body">
                                    <p class="m-0">E-Mail: <code>instructor@demo.com</code></p>
                                    <p class="m-0">Password: <code>123456</code></p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    <strong>Student</strong>
                                </div>
                                <div class="card-body">
                                    <p class="m-0">E-Mail: <code>student@demo.com</code></p>
                                    <p class="m-0">Password: <code>123456</code></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endif

</div>
