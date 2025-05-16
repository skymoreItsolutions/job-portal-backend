<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ModifyEmployersTable extends Migration
{
    public function up()
    {
        Schema::table('employers', function (Blueprint $table) {
            // Change company_name to allow NULL
            $table->string('')->nullable()->change();
            $table->string('contact_phone')->nullable()->change();



            $table->string('contact_person')->nullable()->change();

            $table->string('company_location')->nullable()->change();


      
        });
    }

    public function down()
    {
        Schema::table('employers', function (Blueprint $table) {
            // Revert to NOT NULL (ensure no NULL values exist before reverting)
            $table->string('company_name')->nullable(false)->change();
        });
    }
}