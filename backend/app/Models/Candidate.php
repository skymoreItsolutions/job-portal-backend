<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\CandidateEducation;
use App\Models\CandidateExperience;
use App\Models\CandidateSkill;
use App\Models\CandidateLanguage;



class Candidate extends Model
{
    use HasFactory;

    protected $table = 'candidates';

  protected $fillable = [
        'full_name', 'dob', 'gender', 'email', 'address', 'city', 'state',
        'prefers_night_shift', 'prefers_day_shift', 'work_from_home', 'work_from_office',
        'field_job', 'employment_type', 'resume', 'active_user', 'last_login',
        'total_jobs_applied', 'total_job_views', 'otp', 'otp_expires_at',
        'degree', 'specialization', 'college_name', 'passing_marks', 'pursuing',
        'experience_years', 'experience_months', 'job_title', 'job_roles',
        'company_name', 'current_salary', 'start_date', 'preferred_language', 'number', 'token',
    ];

    protected $casts = [
        'job_roles' => 'array', // Handle JSON array for job_roles
        'active_user' => 'boolean',
        'prefers_night_shift' => 'boolean',
        'prefers_day_shift' => 'boolean',
        'work_from_home' => 'boolean',
        'work_from_office' => 'boolean',
        'field_job' => 'boolean',
        'pursuing' => 'boolean',
    ];

    public function educations()
    {
        return $this->hasMany(CandidateEducation::class);
    }

    public function experiences()
    {
        return $this->hasMany(CandidateExperience::class);
    }

    public function skills()
    {
        return $this->hasMany(CandidateSkill::class);
    }

    public function languages()
    {
        return $this->hasMany(CandidateLanguage::class);
    }
}
