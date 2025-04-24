<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
class Employer extends Model
{
    use HasFactory;

    protected $fillable = [
        'company_name',
        'company_location',
        'contact_person',
        'contact_email',
        'contact_phone',
    ];

    public function jobPostings()
    {
        return $this->hasMany(JobPosting::class);
    }
}
