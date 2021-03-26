<div class="container my-5">
    <div class="row">
        <div class="col-md-8 mx-auto">

            <h2 class="mb-5 text-center">
				إنشاء حساب جديد
			</h2>

            <div class="auth-form-wrap">

                @if(session('error'))
                    <div class="alert alert-danger">
                        {{session('error')}}
                    </div>
                @endif

                <form class="form-horizontal" role="form" method="POST" action="{{ route('register') }}">
                    {{ csrf_field() }}

                    <div class="form-group row {{ $errors->has('name') ? ' has-error' : '' }}">

                        <div class="col-md-12">
                            <input id="name" placeholder="{{__t('name')}}" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus>
                            @if ($errors->has('name'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('name') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>

                    <div class="form-group row {{ $errors->has('email') ? ' has-error' : '' }}">
                        <div class="col-md-12">
                            <input id="email" type="email" class="form-control" name="email" placeholder="{{__t('email_address')}}" value="{{ old('email') }}" required>

                            @if ($errors->has('email'))
                                <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                            @endif
                        </div>
                    </div>

                    <div class="form-group row {{ $errors->has('password') ? ' has-error' : '' }}">
                        <div class="col-md-12">
                            <input placeholder="{{__t('password')}}" id="password" type="password" class="form-control" name="password" required>

                            @if ($errors->has('password'))
                                <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                            @endif
                        </div>
                    </div>

                    <div class="form-group row ">

                        <div class="col-md-12">
                            <input placeholder="تأكيد كلمة المرور" id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                        </div>
                    </div>

                    <div class="form-group row ">
                        <label for="password-confirm" class="col-md-2 control-label">النوع</label>

                        <div class="col-md-12">
                            <label class="mr-3"><input type="radio" name="user_as" value="student" {{old('user_as') ? (old('user_as') == 'student') ? 'checked' : '' : 'checked' }}>طالب </label>
                            <label><input type="radio" name="user_as" value="instructor" {{old('user_as') == 'instructor' ? 'checked' : ''}} > مدرب </label>
                        </div>
                    </div>

                    <div class="form-group row ">
                        <div class="col-md-6">
                            <button type="submit" class="btn btn-primary login-reg-btn"> تسجيل </button>
                        </div>
						<div class="col-md-6" style="text-align:left;">
							<a class="reg-login-btn" href="{{route('login')}}">لدي حساب</a>
						</div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
