<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('loan_deductions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('loan_id');
            $table->date('month');
            $table->decimal('emi_amount', 10, 2);
            $table->boolean('is_deducted')->default(false);
            $table->text('remark')->nullable();
            $table->timestamps();

            $table->foreign('loan_id')->references('id')->on('employee_loans')->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('loan_deductions');
    }
};
