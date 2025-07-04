<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('comp_off_leaves', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('employees_id');
            $table->date('comp_off_date');
            $table->tinyInteger('comp_off_data')->nullable();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('comp_off_leaves');
    }
};
