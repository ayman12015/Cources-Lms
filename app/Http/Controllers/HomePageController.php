<?php

namespace App\Http\Controllers;
use App\HomePage;

use Illuminate\Http\Request;

class HomePageController extends Controller
{

	public function index(){
		$title = __a('home_page');
        $info = HomePage::find('1');
        return view('admin.cms.home_page', compact('title','info'));
	}
	//***********************************************************
	public function update(Request $request){
		$title = __a('home_page');
		
		$data = [
			'id'					=> '1',
            'slider_title'          => $request->slider_title,
            'slider_sub_title'          => $request->slider_sub_title,
            'slider_btn_title'          => $request->slider_btn_title,
            'slider_link'          => $request->slider_link,
            'slider_image'          => $request->slider_image,
            'slider_bg'          => $request->slider_bg,
            
			'feature1_title'          => $request->feature1_title,
            'feature1_text'          => $request->feature1_text,
            'feature1_icon'          => $request->feature1_icon,            'feature2_title'          => $request->feature2_title,
            'feature2_text'          => $request->feature2_text,
            'feature2_icon'          => $request->feature2_icon,            'feature3_title'          => $request->feature3_title,
            'feature3_text'          => $request->feature3_text,
            'feature3_icon'          => $request->feature3_icon,            'feature4_title'          => $request->feature4_title,
            'feature4_text'          => $request->feature4_text,
            'feature4_icon'          => $request->feature4_icon,
			
            'courses_title'          => $request->courses_title,
            'courses_text'          => $request->courses_text,
            'courses_btn_title'          => $request->courses_btn_title,
            'courses_btn_link'          => $request->courses_btn_link,
			
            'numbers1_title'          => $request->numbers1_title,
            'numbers1_value'          => $request->numbers1_value,            'numbers2_title'          => $request->numbers2_title,
            'numbers2_value'          => $request->numbers2_value,            'numbers3_title'          => $request->numbers3_title,
            'numbers3_value'          => $request->numbers3_value,            'numbers4_title'          => $request->numbers4_title,
            'numbers4_value'          => $request->numbers4_value,
			
            'bottom_title1'          => $request->bottom_title1,
            'bottom_text1'          => $request->bottom_text1,
            'bottom_button1'          => $request->bottom_button1,
            'bottom_btn_link1'          => $request->bottom_btn_link1,
			
            'bottom_title2'          => $request->bottom_title2,
            'bottom_text2'          => $request->bottom_text2,
            'bottom_button2'          => $request->bottom_button2,
            'bottom_btn_link2'          => $request->bottom_btn_link2,
            'footer_about'          => $request->footer_about
        ];
		
        HomePage::updateOrCreate(['id'=>'1'],$data);	
        $info = HomePage::find('1');
        return view('admin.cms.home_page', compact('title','info'));
	}	
		
}
