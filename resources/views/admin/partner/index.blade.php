@extends('layouts.admin')

@section('page-header-right')

    <a href="{{ route('create_partner') }}" class="ml-4"> <i class="la la-plus-circle"></i> {{__a('add_partner')}}  </a>
	
@endsection

@section('content')

        @if($partners->count() > 0)

            <table class="table table-bordered bg-white">

                <tr>
                    <th>{{__a('name')}}</th>
                    <th>{{ __a('actions') }}</th>
                </tr>

                @foreach($partners as $partner)
                    <tr>
                        <td>
                            <p class="mb-3">
                                <strong>{{$partner->title}}</strong>
                            </p>
                        </td>

                        <td>
							<a href="{{route('edit_partner', $partner->id)}}" class="btn btn-primary btn-sm"><i class="la la-pencil"></i> </a>
							<a href="{{route('remove_partner', $partner->id)}}" class="btn btn-primary btn-sm"><i class="la la-trash"></i> </a>
                        </td>
                    </tr>

                @endforeach

            </table>

        @else
            {!! no_data() !!}
        @endif
		
@endsection