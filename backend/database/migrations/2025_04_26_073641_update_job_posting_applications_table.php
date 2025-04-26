<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('job_posting_applications', function (Blueprint $table) {
            // Drop the old foreign key and user_id column
            $table->foreign('candidate_id')->references('id')->on('candidates')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('job_posting_applications', function (Blueprint $table) {
            // Drop the candidate_id foreign key and column
            $table->dropForeign(['candidate_id']);
        });
    }
};
