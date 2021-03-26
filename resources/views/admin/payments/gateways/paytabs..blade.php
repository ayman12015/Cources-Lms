<div class="row">
    <div class="col-md-6">
        <h4>{{ 'billing-address' }}</h4>
        <table class="table table-striped">
            <tr>
                <th>{{ 'firstname' }}</th>
                <td>{{ 'ayman osman' }}</td>
            </tr>
            <tr>
                <th>{{ 'lastname' }}</th>
                <td>{{ 'ali'}}</td>
            </tr>
            <tr>
                <th>{{ 'defaultcountry'}}</th>
                <td>
                    @if(\App\Country::find($user->billing_country_id))
                        {{ 'Suadn'}}
                    @endif
                </td>
            </tr>
            <tr>
                <th>{{ 'defaultstate' }}</th>
                <td>{{ 'long' }}</td>
            </tr>
            <tr>
                <th>{{'defaultcity' }}</th>
                <td>{{ 'kkkkk' }}</td>
            </tr>
            <tr>
                <th>{{ 'defaultaddress-1' }}</th>
                <td>{{ 'way' }}</td>
            </tr>
            <tr>
                <th>{{ 'defaultaddress-2' }}</th>
                <td>{{ 'mmmmmmm'}}</td>
            </tr>
            <tr>
                <th>{{ 'default.zip'}}</th>
                <td>{{ 'loooo' }}</td>
            </tr>



        </table>

        {{-- <button onclick="openModal('{{ addslashes(__lang('billing-address')) }}','{{ route('student.student.billing') }}')" class="btn btn-primary"><i class="fa fa-edit"></i> {{ __lang('edit') }}</button> --}}

    </div>
    <div class="col-md-6">
        <table class="table table-striped">
            <tr>
                <th>{{ 'amount' }}</th>
                <td>{{ 'cart' }}</td>
            </tr>
            <tr>
                <th>{{ 'invoice-id'}}</th>
                <td>{{ 'uytuy'}}</td>
            </tr>

        </table>
        <div class="text-center row">
            <div class="col-md-6 offset-md-3">
                <div class="text-center">
                    <form method="post" action="">
                        @csrf
                        <button class="btn btn-lg rounded btn-primary"><i class="fas fa-money-bill"></i> {{ 'pay now' }}</button>
                    </form>
                </div>

            </div>

        </div>

    </div>
</div>