<nav class="navbar navbar-inverse sidebar new-side-nav" role="navigation">
  <div class="container-fluid">
	<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class="{{request()->is('dashboard') ? 'active' : ''}}"><a href="{{route('dashboard')}}"> <i class="la la-dashboard"></i> الرئيسية </a></li>

			@php
				$menus = dashboard_menu();
			@endphp

			@if(is_array($menus) && count($menus))
				@foreach($menus as $key => $instructor_menu)
					<li class="{{array_get($instructor_menu, 'is_active') ? 'active' : ''}}">
						<a href="{{route($key)}}"> {!! array_get($instructor_menu, 'icon') !!} {!! array_get($instructor_menu, 'name') !!} </a>
					</li>
				@endforeach
			@endif

			<li>
				<a href="{{ route('logout') }}"
					onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
					<i class="la la-sign-out"></i> {{__t('logout')}}
				</a>
			</li>
		</ul>
	</div>
  </div>
</nav>
