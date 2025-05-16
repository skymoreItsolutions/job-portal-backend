<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Laravel\Sanctum\HasApiTokens;

class Employer extends Model
{
    use HasFactory,HasApiTokens;

    protected $fillable = [
        'name',
       'gst_number',
        'company_name',
        'company_location',
        'contact_person',
        'contact_email',
        'contact_phone',
               'password',
        'email_verified_at',
        'otp',
        'is_verified',
        'session_token',
         'is_blocked',
    ];


    protected $hidden = ['password', 'otp'];
    protected $casts = ['email_verified_at' => 'datetime'];
    public function jobPostings()
    {
        return $this->hasMany(JobPosting::class);
    }
    public function companies()
{
    return $this->hasMany(Company::class);
}
}
