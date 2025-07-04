<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('employees', function (Blueprint $table) {
            // Add missing columns
            if (!Schema::hasColumn('employees', 'custom_id')) {
                $table->string('custom_id')->nullable()->after('user_id');
            }
            if (!Schema::hasColumn('employees', 'office_phone_one')) {
                $table->string('office_phone_one')->nullable()->after('phone');
            }
            if (!Schema::hasColumn('employees', 'office_phone_two')) {
                $table->string('office_phone_two')->nullable()->after('office_phone_one');
            }
            if (!Schema::hasColumn('employees', 'emergency_number')) {
                $table->string('emergency_number')->nullable()->after('office_phone_two');
            }
            if (!Schema::hasColumn('employees', 'site_id')) {
                $table->unsignedBigInteger('site_id')->nullable()->after('branch_id');
            }
            if (!Schema::hasColumn('employees', 'education_details')) {
                $table->json('education_details')->nullable()->after('designation_id');
            }
            if (!Schema::hasColumn('employees', 'experience_details')) {
                $table->json('experience_details')->nullable()->after('education_details');
            }
            if (!Schema::hasColumn('employees', 'project_id')) {
                $table->unsignedBigInteger('project_id')->nullable()->after('created_by');
            }
            if (!Schema::hasColumn('employees', 'week_off_day')) {
                $table->string('week_off_day')->nullable()->after('project_id');
            }
            if (!Schema::hasColumn('employees', 'education_images')) {
                $table->json('education_images')->nullable()->after('week_off_day');
            }

            // Drop unwanted column
            if (Schema::hasColumn('employees', 'is_active')) {
                $table->dropColumn('is_active');
            }
        });
    }

    public function down(): void
    {
        Schema::table('employees', function (Blueprint $table) {
            $table->dropColumn([
                'custom_id',
                'office_phone_one',
                'office_phone_two',
                'emergency_number',
                'site_id',
                'education_details',
                'experience_details',
                'project_id',
                'week_off_day',
                'education_images',
            ]);

            $table->boolean('is_active')->default(1)->after('salary'); // rollback added column
        });
    }
};
