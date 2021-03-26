<?php

namespace App\Http\Controllers;

use App\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Stripe\Charge;
use Stripe\Exception\CardException;
use Stripe\Stripe;

class GatewayController extends Controller
{

    /**
     * @param Request $request
     * @return array
     * @throws \Stripe\Exception\ApiErrorException
     *
     * Stripe Charge
     */ 
    public function stripeCharge(Request $request){
        $stripeToken = $request->stripeToken;
        Stripe::setApiKey(get_stripe_key('secret'));

        // Create the charge on Stripe's servers - this will charge the user's card
        try {
            $cart = cart();
            $amount = $cart->total_amount;
            $user = Auth::user();

            $currency = get_option('currency_sign');

            //Charge from card
            $charge = Charge::create(array(
                "amount"        => get_stripe_amount($amount), // amount in cents, again
                "currency"      => $currency,
                "source"        => $stripeToken,
                "description"   => get_option('site_name')."'s course enrolment"
            ));

            if ($charge->status == 'succeeded'){
                //Save payment into database
                $data = [
                    'name'              => $user->name,
                    'email'             => $user->email,
                    'user_id'           => $user->id,
                    'amount'            => $cart->total_price,
                    'payment_method'        => 'stripe',
                    'total_amount'      => get_stripe_amount($charge->amount, 'to_dollar'),

                    'currency'              => $currency,
                    'charge_id_or_token'    => $charge->id,
                    'description'           => $charge->description,
                    'payment_created'       => $charge->created,

                    //Card Info
                    'card_last4'        => $charge->source->last4,
                    'card_id'           => $charge->source->id,
                    'card_brand'        => $charge->source->brand,
                    'card_country'      => $charge->source->US,
                    'card_exp_month'    => $charge->source->exp_month,
                    'card_exp_year'     => $charge->source->exp_year,

                    'status'                    => 'success',
                ];

                Payment::create_and_sync($data);
                $request->session()->forget('cart');

                return ['success'=> 1, 'message_html' => $this->payment_success_html()];
            }
        } catch(CardException $e) {
            // The card has been declined
            return ['success'=>0, 'msg'=> __t('payment_declined_msg'), 'response' => $e];
        }
    }

    public function payment_success_html(){
        $html = ' <div class="payment-received text-center">
                            <h1> <i class="fa fa-check-circle-o"></i> '.__t('payment_thank_you').'</h1>
                            <p>'.__t('payment_receive_successfully').'</p>
                            <a href="'.route('home').'" class="btn btn-dark">'.__t('home').'</a>
                        </div>';
        return $html;
    }



    public function bankPost(Request $request){
        $cart = cart();
        $amount = $cart->total_amount;

        $user = Auth::user();
        $currency = get_option('currency_sign');

        //Create payment in database
        $transaction_id = 'tran_'.time().str_random(6);
        // get unique recharge transaction id
        while( ( Payment::whereLocalTransactionId($transaction_id)->count() ) > 0) {
            $transaction_id = 'reid'.time().str_random(5);
        }
        $transaction_id = strtoupper($transaction_id);

        $payments_data = [
            'name'                  => $user->name,
            'email'                 => $user->email,
            'user_id'               => $user->id,
            'amount'                => $amount,
            'payment_method'        => 'bank_transfer',
            'status'                => 'pending',
            'currency'              => $currency,
            'local_transaction_id'  => $transaction_id,

            'bank_swift_code'       => clean_html($request->bank_swift_code),
            'account_number'        => clean_html($request->account_number),
            'branch_name'           => clean_html($request->branch_name),
            'branch_address'        => clean_html($request->branch_address),
            'account_name'          => clean_html($request->account_name),
            'iban'                  => clean_html($request->iban),
        ];
        //Create payment and clear it from session
        Payment::create_and_sync($payments_data);

        $request->session()->forget('cart');

        return redirect(route('payment_thank_you_page'));
    }

/**
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     *
     * Redirect to Paytabs for the Payment
     */

    public function paytabsRedirect(Request $request){

        if ( ! session('cart')){
            return redirect(route('checkout'));
        }

        $cart = cart();
        $amount = $cart->total_amount;

        $user = Auth::user();
        $currency = get_option('currency_sign');
        $serverKey = 'SZJNLKWKKB-JBGZMBKW6L-TW9Z9LZ9LN';
        $headers = array('Authorization'=>$serverKey,'content-type'=>'application/json');
        //Create payment in database
        $transaction_id = 'tran_'.time().str_random(6);
        // get unique recharge transaction id
        while( ( Payment::whereLocalTransactionId($transaction_id)->count() ) > 0) {
            $transaction_id = 'reid'.time().str_random(5);
        }
        $transaction_id = strtoupper($transaction_id);

        $sessionKey = '92ac6a52-256d-434b-bde8-94b1e73d3aa1';
        $userEmail = $user->email;
    
      
   
        $payments_data = [
        "profile_id" => 47360,
        'tran_type'=>'sale',
        'tran_class'=>'ecom',
        'cart_description'=> 'Payment with tok enabled, save card enabled',
        'cart_id'=> $transaction_id,
        'cart_currency'=> $currency,
        'cart_amount'=>$amount,
        //'callback'=>$successUrl,
        "return"=> "https://127.0.0.1:8000/92ac6a52-256d-434b-bde8-94b1e73d3aa1",
        'customer_details'=>[
            'name'=>$user->name,
            'email'=>  $user->email,
            'street1'=>'address street"',
            'stree2'=>'address street"',
            'city'=>'dubai',
            'state'=>'dubai',
            'country'=> 'AE'
            
        ]
        ];
      

        $payments_data = json_encode($payments_data);

        // // Create payment and clear it from session
        // $payment = Payment::create_and_syncpaytabs($payments_data);
        // $request->session()->forget('cart');


        $response = \Unirest\Request::post("https://secure-global.paytabs.com/payment/request",$headers,
        $payments_data
    );
    // check response status

    if ($response->body->payment_result->response_status=='A') {

        return redirect(route('payment_thank_you_page'));
    }else {
        return redirect()->route('checkout');

    }
   
    }
    

    /**
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     *
     * Redirect to PayPal for the Payment
     */
    public function paypalRedirect(Request $request){
        if ( ! session('cart')){
            return redirect(route('checkout'));
        }

        $cart = cart();
        $amount = $cart->total_amount;

        $user = Auth::user();
        $currency = get_option('currency_sign');

        //Create payment in database
        $transaction_id = 'tran_'.time().str_random(6);
        // get unique recharge transaction id
        while( ( Payment::whereLocalTransactionId($transaction_id)->count() ) > 0) {
            $transaction_id = 'reid'.time().str_random(5);
        }
        $transaction_id = strtoupper($transaction_id);

        $payments_data = [
            'name'                  => $user->name,
            'email'                 => $user->email,
            'user_id'               => $user->id,
            'amount'                => $amount,
            'payment_method'        => 'paypal',
            'status'                => 'initial',
            'currency'              => $currency,
            'local_transaction_id'  => $transaction_id,
        ];
        //Create payment and clear it from session
        $payment = Payment::create_and_sync($payments_data);
        $request->session()->forget('cart');

        // PayPal settings
        $paypal_action_url = "https://www.paypal.com/cgi-bin/webscr";
        if (get_option('enable_paypal_sandbox'))
            $paypal_action_url = "https://www.sandbox.paypal.com/cgi-bin/webscr";

        $paypal_email = get_option('paypal_receiver_email');
        $return_url = route('payment_thank_you_page', $transaction_id);
        $cancel_url = route('checkout');
        $notify_url = route('paypal_notify', $transaction_id);

        $item_name = get_option('site_name')."'s course enrolment";

        $querystring = '';
        // Firstly Append paypal account to querystring
        $querystring .= "?cmd=_xclick&business=".urlencode($paypal_email)."&";
        $querystring .= "item_name=".urlencode($item_name)."&";
        $querystring .= "amount=".urlencode($amount)."&";
        $querystring .= "currency_code=".urlencode($currency)."&";
        $querystring .= "item_number=".urlencode($payment->local_transaction_id)."&";
        // Append paypal return addresses
        $querystring .= "return=".urlencode(stripslashes($return_url))."&";
        $querystring .= "cancel_return=".urlencode(stripslashes($cancel_url))."&";
        $querystring .= "notify_url=".urlencode($notify_url);

        // Redirect to paypal IPN
        $URL = $paypal_action_url.$querystring;
        return redirect($URL);
    }

    public function payOffline(Request $request){
        $cart = cart();
        $amount = $cart->total_amount;

        $user = Auth::user();
        $currency = get_option('currency_sign');

        //Create payment in database
        $transaction_id = 'tran_'.time().str_random(6);
        // get unique recharge transaction id
        while( ( Payment::whereLocalTransactionId($transaction_id)->count() ) > 0) {
            $transaction_id = 'reid'.time().str_random(5);
        }
        $transaction_id = strtoupper($transaction_id);

        $payments_data = [
            'name'                  => $user->name,
            'email'                 => $user->email,
            'user_id'               => $user->id,
            'amount'                => $amount,
            'payment_method'        => 'offline',
            'status'                => 'onhold',
            'currency'              => $currency,
            'local_transaction_id'  => $transaction_id,
            'payment_note'          => clean_html($request->payment_note),
        ];
        //Create payment and clear it from session
        Payment::create_and_sync($payments_data);
        $request->session()->forget('cart');

        return redirect(route('payment_thank_you_page'));
    }

}
