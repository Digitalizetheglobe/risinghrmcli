<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddPriorityToToDoListTable extends Migration
{
    public function up()
    {
        Schema::table('to_do_lists', function (Blueprint $table) {
            $table->string('priority')->nullable()->after('task');
        });
    }

    public function down()
    {
        Schema::table('to_do_lists', function (Blueprint $table) {
            $table->dropColumn('priority');
        });
    }
}

