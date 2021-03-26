<?php

namespace App\Http\Controllers;
use App\Partner;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class PartnerController extends Controller
{

	public function index(){
		$title = __a('partners');
        $partners = Partner::get();
        return view('admin.partner.index', compact('title','partners'));
	}
	
    public function create(){
        $title = __a('partner_info');
        return view('admin.partner.create', compact('title'));
    }
	
    public function store(Request $request)
    {
        $user_id = Auth::user()->id;
        /*$rules = [
            'name' => 'required'
        ];
        $this->validate($request, $rules);*/

        $data = [
            'title'         => $request->name,
            'logo'           => $request->logo,
        ];

        $is_create = Partner::create($data);
		$title = __a('partners');
        $partners = Partner::get();
        return view('admin.partner.index', compact('title','partners'));
    }
	
	
    public function destroy($id)
    {
        Partner::where('id', $id)->delete();
        
		$title = __a('partners');
        $partners = Partner::get();
        return view('admin.partner.index', compact('title','partners'));
    }
	
    public function edit($id){
        $partner = Partner::find($id);

        $data['title'] = __a('partner_edit');
        $data['partner'] = $partner;

        if ( ! $partner){
            abort(404);
        }

        return view('admin.partner.edit', $data);
    }	
	
    public function update(Request $request, $id){

        $data = [
            'title'         => clean_html($request->name),
            'logo'           => $request->logo,
        ];

        $partner = Partner::find($id);
        $partner->update($data);

        return back()->with('success', trans('admin.data_updates_success'));
    }	
	
	
}
