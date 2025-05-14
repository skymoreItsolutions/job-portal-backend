<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
class JobPosting extends Model
{
    use HasFactory;

    protected $fillable = [
        'employer_id',
        'job_title',
        'job_type',
        'location',
        'work_location_type',
        'compensation',
        'pay_type',
        'joining_fee',
        'basic_requirements',
        'additional_requirements',
        'job_description',
        'is_walkin_interview',
        'communication_preference',
        'total_experience_required',
        'other_job_titles',
        'degree_specialization',
        'job_expire_time',
        'number_of_candidates_required',
    ];

   protected $casts = [
        'additional_requirements' => 'array',
        'other_job_titles' => 'array',
        'degree_specialization' => 'array',
        'joining_fee' => 'boolean',
        'is_walkin_interview' => 'boolean',
    ];

    public function employer()
    {
        return $this->belongsTo(Employer::class);
    }

    public function applications()
    {
        return $this->hasMany(JobPostingApplication::class);
    }

    // Method to get active applications count
    public function activeApplicationsCount()
    {
        return $this->applications()->where('status', 'active')->count();
    }

    // Method to get inactive applications count
    public function inactiveApplicationsCount()
    {
        return $this->applications()->where('status', 'inactive')->count();
    }
}
