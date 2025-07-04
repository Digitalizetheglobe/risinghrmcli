<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('daily_quotes', function (Blueprint $table) {
            $table->id();
            $table->text('quote');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('daily_quotes');
    }
};
