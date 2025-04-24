<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JobPostingApplication extends Model
{
    protected $fillable = [
        'user_id',
        'job_posting_id',
        'status',
    ];

    public function jobPosting()
    {
        return $this->belongsTo(JobPosting::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
