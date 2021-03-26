
<nav class="navbar navbar-inverse sidebar new-side-nav" role="navigation">
    <div class="container-fluid">
	

		
	<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
		<ul class="nav navbar-nav">
            <li>
                <a href="{{route('admin')}}"><i class="la la-dashboard fa-fw"></i> @lang('admin.admin_home')</a>
            </li>
			
            <li>
                <a href="{{route('category_index')}}"><i class="la la-folder"></i> @lang('admin.categories')</a>
            </li>
						
            <li> <a href="{{route('admin_courses')}}"><i class="la la-chalkboard"></i> {{__a('courses')}}</a>  </li>
			
            <li> <a href="{{route('payments')}}"><i class="la la-file-invoice-dollar"></i> {{__a('payments')}}</a>  </li>
          
		  <li> <a href="{{route('withdraws')}}"><i class="la la-wallet"></i> {{__a('withdraws')}}</a>  </li>
		  
            <li>
                <a href="{{route('media_manager')}}"><i class="la la-photo-video"></i> @lang('admin.media_manager')</a>
            </li>
			
            <li> <a href="{{ route('users') }}"><i class="la la-users"></i> {{__a('users')}}</a>  </li>
			
            @php
                do_action('admin_menu_item_before');
            @endphp

            <li>
                <a href="#"><i class="la la-newspaper-o fa-fw"></i> 
					واجهة الاستخدام
				<span class="la arrow"></span></a>
                <ul class="nav nav-second-level" style="display: none;">
                    <li> <a href="{{ route('posts') }}">@lang('admin.posts')</a> </li>
                    <li> <a href="{{ route('pages') }}">@lang('admin.pages')</a> </li>
                    <li> <a href="{{ route('home_page') }}">@lang('admin.home_page')</a> </li>
                    <li> <a href="{{ route('partner') }}">{{__a('partners')}}</a> </li>
                </ul><!-- /.nav-second-level -->
            </li>

            <li style="display:none;">
                <a href="{{route('plugins')}}" class="{{request()->is('admin/plugins*') ? 'active' : ''}}" >
                    <i class="la la-plug"></i> {{__a('plugins')}}
                </a>
            </li>

            <li style="display:none;">
                <a href="{{route('themes')}}" class="{{request()->is('admin/themes*') ? 'active' : ''}}">
                    <i class="la la-brush"></i> {{__a('themes')}}
                </a>
            </li>

			<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">إعدادات المنصة <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-cog"></span></a>

					<ul class="dropdown-menu forAnimate" role="menu">
                    @php
                        do_action('admin_menu_settings_item_before');
                    @endphp
                    <li> <a href="{{ route('general_settings') }}">@lang('admin.general_settings')</a> </li>
                    <li> <a href="{{ route('lms_settings') }}">@lang('admin.lms_settings')</a> </li>
                    <li> <a href="{{ route('payment_settings') }}">@lang('admin.payment_settings')</a> </li>
                    <li style="display:none;"> <a href="{{ route('payment_gateways') }}">@lang('admin.payment_gateways')</a> </li>
                    <li style="display:none;"> <a href="{{ route('withdraw_settings') }}">@lang('admin.withdraw')</a> </li>
                    <li> <a href="{{ route('theme_settings') }}">@lang('admin.theme_settings')</a> </li>
                    {{--<li> <a href="{{ route('invoice_settings') }}">@lang('admin.invoice_settings')</a> </li>--}}
                    <li style="display:none;"> <a href="{{ route('social_settings') }}"> {{__a('social_login_settings')}} </a> </li>
                    <li> <a href="{{ route('storage_settings') }}"> إعدادات التخزين </a> </li>
                    @php
                        do_action('admin_menu_settings_item_after');
                    @endphp
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li> <a href="{{route('change_password')}}"><i class="la la-lock"></i> @lang('admin.change_password')</a>  </li>

            @php
            do_action('admin_menu_item_after');
            @endphp

            <li>
                <a href="{{ route('logout') }}"
                   onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    <i class="la la-sign-out"></i> {{__a('logout')}}
                </a>
            </li>

        </ul>
    </div>
	</div>
</nav>
