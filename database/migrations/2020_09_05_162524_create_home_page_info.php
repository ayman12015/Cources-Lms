<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHomePageInfo extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('home_page_info', function (Blueprint $table) {
            $table->id();
            $table->string('slider_title', 255)->nullable();
            $table->string('slider_sub_title', 255)->nullable(); 
            $table->string('slider_btn_title', 255)->nullable(); 
            $table->string('slider_link', 255)->nullable(); 
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('home_page_info');
    }
}
