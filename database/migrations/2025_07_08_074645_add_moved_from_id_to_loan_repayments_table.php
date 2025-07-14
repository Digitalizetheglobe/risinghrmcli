<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddMovedFromIdToLoanRepaymentsTable extends Migration
{
    public function up()
    {
        Schema::table('loan_deductions', function (Blueprint $table) {
            $table->unsignedBigInteger('moved_from_id')->nullable()->after('remark');
        });
    }

    public function down()
    {
        Schema::table('loan_deductions', function (Blueprint $table) {
            $table->dropColumn('moved_from_id');
        });
    }
}
