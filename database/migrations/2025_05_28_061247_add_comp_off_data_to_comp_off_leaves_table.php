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
        Schema::table('comp_off_leaves', function (Blueprint $table) {
            $table->integer('comp_off_data')->default(0)->after('comp_off_date');
        });
    }

    public function down()
    {
        Schema::table('comp_off_leaves', function (Blueprint $table) {
            $table->dropColumn('comp_off_data');
        });
    }
};
