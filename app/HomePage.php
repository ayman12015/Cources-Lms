<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HomePage extends Model
{
    protected $guarded = [];

	public function save_data($data) {
		// updateOrInsert
	/*DB::table('home_page')->insert([
		[
			'slider_title' => $data->slider_title,
			'slider_sub_title' => $data->slider_sub_title
		],
	]);
	*/
	//DB::table('home_page')->updateOrInsert($data);

	}
	
    public function media1(){
        return $this->belongsTo(Media::class, 'feature1_icon');
    }
    public function getThumbnailUrl1Attribute(){
        return media_image_uri($this->media1);
    }	
	
    public function media2(){
        return $this->belongsTo(Media::class, 'feature2_icon');
    }
    public function getThumbnailUrl2Attribute(){
        return media_image_uri($this->media2);
    }	
	
    public function media3(){
        return $this->belongsTo(Media::class, 'feature3_icon');
    }
    public function getThumbnailUrl3Attribute(){
        return media_image_uri($this->media3);
    }		
	
    public function media4(){
        return $this->belongsTo(Media::class, 'feature4_icon');
    }
    public function getThumbnailUrl4Attribute(){
        return media_image_uri($this->media4);
    }

    public function media5(){
        return $this->belongsTo(Media::class, 'slider_image');
    }
    public function getThumbnailUrl5Attribute(){
        return media_image_uri($this->media5);
    }	

    public function media6(){
        return $this->belongsTo(Media::class, 'slider_bg');
    }
    public function getThumbnailUrl6Attribute(){
        return media_image_uri($this->media6);
    }		
	
}