<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookingFormsTable extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('booking_forms', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedBigInteger('employee_id');
            $table->timestamp('created_at')->nullable()->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('updated_at')->nullable()->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'));

            // Primary Applicant
            $table->string('primary_applicant_name')->nullable();
            $table->string('primary_applicant_contact_no', 20)->nullable();
            $table->string('primary_applicant_email')->nullable();
            $table->string('primary_applicant_occupation')->nullable();
            $table->string('primary_applicant_company')->nullable();
            $table->string('primary_applicant_designation')->nullable();
            $table->string('primary_applicant_birth_date', 100)->nullable();
            $table->string('primary_applicant_nationality', 100)->nullable();
            $table->string('primary_applicant_pan_no', 20)->nullable();
            $table->string('primary_applicant_aadhar_no', 20)->nullable();

            // Secondary Applicant
            $table->string('secondary_applicant_name')->nullable();
            $table->string('secondary_applicant_contact_no', 20)->nullable();
            $table->string('secondary_applicant_email')->nullable();
            $table->string('secondary_applicant_occupation')->nullable();
            $table->string('secondary_applicant_company')->nullable();
            $table->string('secondary_applicant_designation')->nullable();
            $table->string('secondary_applicant_birth_date', 100)->nullable();
            $table->string('secondary_applicant_nationality', 100)->nullable();
            $table->string('secondary_applicant_pan_no', 20)->nullable();
            $table->string('secondary_applicant_aadhar_no', 20)->nullable();

            // Project & Unit
            $table->unsignedBigInteger('project_id')->nullable();
            $table->integer('unit_id')->nullable();
            $table->string('unit_size')->nullable();
            $table->date('booking_date')->nullable();

            // Cost details
            $table->decimal('plot_area', 10, 2)->nullable();
            $table->decimal('carpet_area', 10, 2)->nullable();
            $table->decimal('rate_per_sq_ft', 10, 2)->nullable();
            $table->decimal('basic_cost', 15, 2)->nullable();
            $table->decimal('cost_infrastructure', 15, 2)->nullable();
            $table->decimal('gst', 15, 2)->nullable();
            $table->decimal('stamp_duty', 15, 2)->nullable();
            $table->decimal('registration', 15, 2)->nullable();
            $table->string('maintenance_cost')->nullable();
            $table->decimal('other', 15, 2)->nullable();
            $table->decimal('total_cost', 20, 2)->nullable();

            // Payment details
            $table->longText('payment_data')->nullable();
            $table->decimal('remaining', 15, 2)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('booking_forms');
    }
}
