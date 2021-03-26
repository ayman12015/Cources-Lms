<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateHomePages extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('home_pages', function (Blueprint $table) {
            $table->string('slider_image', 255)->nullable();
            $table->string('slider_bg', 255)->nullable();
            $table->string('numbers1_title', 255)->nullable();
            $table->string('numbers1_value', 5)->nullable();
            $table->string('numbers2_title', 255)->nullable();
            $table->string('numbers2_value', 5)->nullable();
            $table->string('numbers3_title', 255)->nullable();
            $table->string('numbers3_value', 5)->nullable();
            $table->string('numbers4_title', 255)->nullable();
            $table->string('numbers4_value', 5)->nullable();
			
            $table->string('bottom_title1', 255)->nullable();
            $table->string('bottom_text1', 255)->nullable();
            $table->string('bottom_button1', 255)->nullable();
            $table->string('bottom_btn_link1', 255)->nullable();
			
            $table->string('bottom_title2', 255)->nullable();
            $table->string('bottom_text2', 255)->nullable();
            $table->string('bottom_button2', 255)->nullable();
            $table->string('bottom_btn_link2', 255)->nullable();			
		});
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('home_pages', function (Blueprint $table) {
            //
        });
    }
}
