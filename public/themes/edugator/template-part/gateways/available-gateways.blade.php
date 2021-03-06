@php($hasGateways = get_option('enable_stripe') || get_option('enable_paypal') || get_option('bank_gateway.enable_bank_transfer') || get_option('enable_paytabs') || get_option('enable_offline_payment'))
{{$hasGateways}}
@if($hasGateways)
    <div class="section-payment-methods-wrap">
        <h4>{{__t('payment_information')}}</h4>

        <p class="text-muted"> <i class="la la-lock"></i> {{__t('payment_secure_text')}}</p>

        <div class="checkout-section checkout-payment-methods-wrap bg-white p-4 mt-3">

            <ul class="nav bg-light nav-pills mb-3 payment-method-nav" role="tablist">

                <?php do_action('checkout_available_gateways_nav_before', $cart); ?>


                @if(get_option('enable_stripe')) 
                    <li class="nav-item">
                        <a class="nav-link active active-payment-method" data-toggle="pill" href="#payment-tab-card">
                            <i class="la la-credit-card"></i> البطاقة الإئتمانية
                        </a>
                    </li>
                @endif

                @if(get_option('enable_paypal'))
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="pill" href="#payment-tab-paypal">
                            <i class="la la-paypal"></i> ادفع بواسطة PayPal
                        </a>
                    </li>
                @endif

                
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="pill" href="#payment-tab-paytabs">
                            <i class="la la-paytabs"></i> ادفع بواسطة Paytabs
                        </a>
                    </li>
               

                @if(get_option('bank_gateway.enable_bank_transfer'))
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="pill" href="#payment-tab-bank">
                            <i class="la la-university"></i>  تحويل بنكي
                        </a>
                    </li>
                @endif


                @if(get_option('enable_offline_payment'))
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="pill" href="#payment-tab-offline">
                            <i class="la la-wallet"></i>  طريقة دفع أخرى
                        </a>
                    </li>
                @endif

                <?php do_action('checkout_available_gateways_nav_after', $cart); ?>

            </ul>



            <div class="tab-content">

                <?php do_action('checkout_available_gateways_tab_content_before', $cart); ?>

                @if(get_option('enable_stripe'))
                    <div class="tab-pane fade show active" id="payment-tab-card">
                        <div class="stripe-credit-card-form-wrap ml-auto mr-auto py-5">
                            <form action="/charge" method="post" id="payment-form">
                                <div class="form-group">
                                    <label for="card-element"> Pay with your Credit or debit card via Stripe</label>
                                    <div id="card-element" class="form-control">
                                        <!-- A Stripe Element will be inserted here. -->
                                    </div>
                                </div>

                                <!-- Used to display form errors. -->
                                <div id="card-errors" class="text-danger mb-3" role="alert"></div>

                                <button type="submit" class="btn btn-purple payment-btn" id="stripe-payment-form-btn">
                                    <span class="enroll-course-btn-text ml-4 border-left pl-4 float-right">دفع</span>
                                    <span class="enroll-course-btn-price text-white">{!! price_format($cart->total_amount) !!}</span>
                                </button>
                            </form>
                        </div>
                    </div> <!-- tab-pane.// -->
                @endif

                @if(get_option('enable_paypal'))
                    <div class="tab-pane fade" id="payment-tab-paypal">

                        <div class="paypal-payment-form-wrap py-5 text-center">

                            <form action="{{route('paypal_redirect')}}" method="post">
                                @csrf
                                <p>
                                    <button type="submit" class="btn btn-purple btn-lg" id="paypal-payment-form-btn">
                                        <span class="enroll-course-btn-text mr-4 border-right pr-4">
                                            <i class="la la-paypal"></i> Pay with PayPal
                                        </span>
                                        <span class="enroll-course-btn-price">
                                            {!! price_format($cart->total_amount) !!}
                                        </span>
                                    </button>
                                </p>
                            </form>

                        </div>

                    </div>
                @endif

             
                <div class="tab-pane fade" id="payment-tab-paytabs">

                    <div class="paypal-payment-form-wrap py-5 text-center">

                        <form action="{{route('paytabs_redirect')}}" method="post">
                            @csrf
                            <p>
                                <button type="submit" class="btn btn-purple btn-lg" id="paytabs-payment-form-btn">
                                    <span class="enroll-course-btn-text mr-4 border-right pr-4">
                                        <i class="la la-paypal"></i> Pay with Paytabs
                                    </span>
                                    <span class="enroll-course-btn-price">
                                        {!! price_format($cart->total_amount) !!}
                                    </span>
                                </button>
                            </p>
                        </form>

                    </div>

                </div>
            

                @if(get_option('bank_gateway.enable_bank_transfer'))
                    <div class="tab-pane fade" id="payment-tab-bank">
                        @include(theme('template-part.gateways.bank-transfer'))
                    </div> <!-- tab-pane.// -->
                @endif

                @if(get_option('enable_offline_payment'))

                    <div class="tab-pane fade" id="payment-tab-offline">
                        <div class="offline-payment-form-wrap pt-2 pb-5">

                            <form action="{{route('pay_offline')}}" method="post">
                                @csrf

                                <div class="form-group">

                                    <label>
										يرجى كتابة طريقة الدفع المناسبة لك، وسنقوم بالتحقق من العملية ونمنحك حق الوصول للدورة التدريبية
									</label>

                                    <textarea class="form-control" name="payment_note"></textarea>

                                </div>


                                <p>
                                    <button type="submit" class="btn btn-purple btn-lg" id="offline-payment-form-btn">
                                        <span class="enroll-course-btn-text mr-4 border-right pr-4">
                                            <i class="la la-wallet"></i>
											دفعت
                                        </span>
                                        <span class="enroll-course-btn-price">
                                            {!! price_format($cart->total_amount) !!}
                                        </span>
                                    </button>
                                </p>
                            </form>

                        </div>

                    </div>
                @endif

                <?php do_action('checkout_available_gateways_tab_content_after', $cart); ?>


            </div> <!-- tab-content .// -->

        </div>
    </div>

@else
    <div class="alert alert-warning">
        <i class="la la-exclamation-circle"></i> There is no payment gateway available to complete purchase.
    </div>
@endif
