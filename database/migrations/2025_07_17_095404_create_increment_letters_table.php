<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIncrementLettersTable extends Migration
{
    public function up()
    {
        Schema::create('increment_letters', function (Blueprint $table) {
            $table->id();
            $table->string('lang');
            $table->longText('content')->nullable();
            $table->unsignedBigInteger('created_by');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('increment_letters');
    }
}