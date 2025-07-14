<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('employee_loans', function (Blueprint $table) {
            $table->unsignedInteger('extended_months')->default(0)->after('remaining_amount');
        });
    }

    public function down()
    {
        Schema::table('employee_loans', function (Blueprint $table) {
            $table->dropColumn('extended_months');
        });
    }
};