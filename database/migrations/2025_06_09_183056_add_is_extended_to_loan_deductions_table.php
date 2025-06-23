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
    Schema::table('loan_deductions', function (Blueprint $table) {
        $table->boolean('is_extended')->default(false)->after('is_deducted');
    });
}

public function down()
{
    Schema::table('loan_deductions', function (Blueprint $table) {
        $table->dropColumn('is_extended');
    });
}
};
