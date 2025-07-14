<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateTimeSheetsTable extends Migration
{
    public function up()
    {
        Schema::table('time_sheets', function (Blueprint $table) {
            // Drop unwanted columns
            if (Schema::hasColumn('time_sheets', 'hours')) {
                $table->dropColumn('hours');
            }
            if (Schema::hasColumn('time_sheets', 'remark')) {
                $table->dropColumn('remark');
            }
            if (Schema::hasColumn('time_sheets', 'created_by')) {
                $table->dropColumn('created_by');
            }

            // Add new columns (if not already exist)
            if (!Schema::hasColumn('time_sheets', 'presale_employee_id')) {
                $table->unsignedBigInteger('presale_employee_id')->nullable()->after('id');
            }
            if (!Schema::hasColumn('time_sheets', 'employee_id')) {
                $table->unsignedBigInteger('employee_id')->after('presale_employee_id');
            }
            if (!Schema::hasColumn('time_sheets', 'date')) {
                $table->date('date')->after('employee_id');
            }
            if (!Schema::hasColumn('time_sheets', 'full_name')) {
                $table->string('full_name')->after('date');
            }
            if (!Schema::hasColumn('time_sheets', 'mobile_no')) {
                $table->string('mobile_no', 20)->nullable()->after('full_name');
            }
            if (!Schema::hasColumn('time_sheets', 'email_id')) {
                $table->string('email_id')->nullable()->after('mobile_no');
            }
            if (!Schema::hasColumn('time_sheets', 'address')) {
                $table->text('address')->nullable()->after('email_id');
            }
            if (!Schema::hasColumn('time_sheets', 'recommended_by')) {
                $table->string('recommended_by')->nullable()->after('address');
            }
            if (!Schema::hasColumn('time_sheets', 'cp_data')) {
                $table->string('cp_data')->nullable()->after('recommended_by');
            }
            if (!Schema::hasColumn('time_sheets', 'refrence_data')) {
                $table->string('refrence_data')->nullable()->after('cp_data');
            }
            if (!Schema::hasColumn('time_sheets', 'other_data')) {
                $table->string('other_data')->nullable()->after('refrence_data');
            }
            if (!Schema::hasColumn('time_sheets', 'primary_reason')) {
                $table->string('primary_reason')->nullable()->after('other_data');
            }
            if (!Schema::hasColumn('time_sheets', 'square_feet_range')) {
                $table->string('square_feet_range', 50)->nullable()->after('primary_reason');
            }
            if (!Schema::hasColumn('time_sheets', 'price_range')) {
                $table->string('price_range', 50)->nullable()->after('square_feet_range');
            }
            if (!Schema::hasColumn('time_sheets', 'client_status')) {
                $table->string('client_status')->nullable()->after('price_range');
            }
            if (!Schema::hasColumn('time_sheets', 'executive_remark')) {
                $table->text('executive_remark')->nullable()->after('client_status');
            }
            if (!Schema::hasColumn('time_sheets', 'feedback_information')) {
                $table->text('feedback_information')->nullable()->after('updated_at');
            }
            if (!Schema::hasColumn('time_sheets', 'unit_id')) {
                $table->integer('unit_id')->nullable()->after('feedback_information');
            }
            if (!Schema::hasColumn('time_sheets', 'project_id')) {
                $table->unsignedBigInteger('project_id')->nullable()->after('unit_id');
            }
        });
    }

    public function down()
    {
        Schema::table('time_sheets', function (Blueprint $table) {
            // Add back dropped columns
            $table->string('hours')->nullable();
            $table->text('remark')->nullable();
            $table->unsignedBigInteger('created_by')->nullable();

            // Drop newly added columns
            $table->dropColumn([
                'presale_employee_id',
                'employee_id',
                'date',
                'full_name',
                'mobile_no',
                'email_id',
                'address',
                'recommended_by',
                'cp_data',
                'refrence_data',
                'other_data',
                'primary_reason',
                'square_feet_range',
                'price_range',
                'client_status',
                'executive_remark',
                'feedback_information',
                'unit_id',
                'project_id',
            ]);
        });
    }
}

