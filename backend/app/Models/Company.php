<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
     protected $fillable = [
        'employer_id',
        'company_name',
        'gst_number',
        'company_location',
        'contact_person',
        'contact_email',
        'contact_phone',
    ];

    public function employer()
    {
        return $this->belongsTo(Employer::class);
    }
}
