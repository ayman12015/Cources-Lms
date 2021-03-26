<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHomePages extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('home_pages', function (Blueprint $table) {
            $table->id();
            $table->string('slider_title', 255)->nullable();
            $table->string('slider_sub_title', 255)->nullable();
            $table->string('slider_btn_title', 255)->nullable();
            $table->string('slider_link', 255)->nullable();
            $table->string('feature1_title', 255)->nullable();
            $table->string('feature1_text', 255)->nullable();
            $table->string('feature1_icon', 255)->nullable();
            $table->string('feature2_title', 255)->nullable();
            $table->string('feature2_text', 255)->nullable();
            $table->string('feature2_icon', 255)->nullable();
            $table->string('feature3_title', 255)->nullable();
            $table->string('feature3_text', 255)->nullable();
            $table->string('feature3_icon', 255)->nullable();
            $table->string('feature4_title', 255)->nullable();
            $table->string('feature4_text', 255)->nullable();
            $table->string('feature4_icon', 255)->nullable();
            $table->string('courses_title', 255)->nullable();
            $table->string('courses_text', 255)->nullable();
            $table->string('courses_btn_title', 255)->nullable();
            $table->string('courses_btn_link', 255)->nullable();
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
        Schema::dropIfExists('home_pages');
    }
}
