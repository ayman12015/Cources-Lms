<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Partner extends Model
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
	
    public function media(){
        return $this->belongsTo(Media::class, 'logo');
    }
    public function getThumbnailUrlAttribute(){
        return media_image_uri($this->media);
    }	
}