<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        // Drop the check constraint before renaming
        DB::statement("ALTER TABLE comp_off_leaves DROP CHECK comp_off_leaves_chk_1");

        Schema::table('comp_off_leaves', function (Blueprint $table) {
            $table->renameColumn('comp_off_data', 'comp_off_date');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::table('comp_off_leaves', function (Blueprint $table) {
            $table->renameColumn('comp_off_date', 'comp_off_data');
        });

        // Optional: Re-add the check constraint here if needed
        // DB::statement("ALTER TABLE comp_off_leaves ADD CONSTRAINT comp_off_leaves_chk_1 CHECK (...)");
    }
};
