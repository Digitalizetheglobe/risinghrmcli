<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
public function up()
{
    Schema::create('employee_leave_balances', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('employee_id');
        $table->unsignedBigInteger('leave_type_id');
        $table->year('year');
        $table->tinyInteger('month');  // 1-12
        $table->integer('available_days')->default(0);
        $table->timestamps();

        $table->foreign('employee_id')->references('id')->on('users')->onDelete('cascade');
        $table->foreign('leave_type_id')->references('id')->on('leave_types')->onDelete('cascade');
    });
}

public function down()
{
    Schema::dropIfExists('employee_leave_balances');
}

};
