<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnsToLeaveBalancesAndLeavesTables extends Migration
{
    public function up()
    {
        Schema::table('leave_balances', function (Blueprint $table) {
            $table->decimal('reserved', 8, 2)->default(0)->after('balance');
            $table->decimal('carried_forward', 8, 2)->default(0)->after('reserved');
        });

        Schema::table('leaves', function (Blueprint $table) {
            $table->boolean('is_mixed_leave')->default(false)->after('is_half_day');
        });
    }

    public function down()
    {
        Schema::table('leave_balances', function (Blueprint $table) {
            $table->dropColumn('reserved');
            $table->dropColumn('carried_forward');
        });

        Schema::table('leaves', function (Blueprint $table) {
            $table->dropColumn('is_mixed_leave');
        });
    }
}