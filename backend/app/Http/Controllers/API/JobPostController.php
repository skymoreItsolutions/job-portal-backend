<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\JobPosting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Mail;

use App\Mail\JobPostingMail;
use Carbon\Carbon;

class JobPostController extends Controller
{
    /**
     * Create a new job post.
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function store(Request $request): JsonResponse
    {
        // Define validation rules
        $rules = [
            'employer_id' => 'required|exists:employers,id',
            'job_title' => 'required|string|max:255',
            'job_type' => 'required|in:Full-Time,Part-Time,Freelance',
            'location' => 'required|string|max:255',
            'work_location_type' => 'required|in:Work from Home,Work from Office,Hybrid',
            'compensation' => 'required|string|max:255',
            'pay_type' => 'required|in:Hourly,Salary,Per Project',
            'basic_requirements' => 'string',
            'additional_requirements' => 'nullable|json',
            'is_walkin_interview' => 'boolean',
            'joining_fee' => 'required|boolean',
            'communication_preference' => 'required|in:Call,Whatsapp,No Preference',
            'total_experience_required' => 'nullable|integer|min:0',
            'other_job_titles' => 'nullable|json',
            'degree_specialization' => 'nullable|json',
            'job_description' => 'nullable|string',
            'job_expire_time' => 'integer|min:1',
            'number_of_candidates_required' => 'integer|min:1',
        ];

        // Validate the request
        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Validation failed',
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            // Create the job post
            $JobPosting = JobPosting::create([
                'employer_id' => $request->employer_id,
                'job_title' => $request->job_title,
                'job_type' => $request->job_type,
                'location' => $request->location,
                'work_location_type' => $request->work_location_type,
                'compensation' => $request->compensation,
                'pay_type' => $request->pay_type,
                'joining_fee' => $request->joining_fee ?? false,
                'basic_requirements' => $request->basic_requirements,
                'additional_requirements' => $request->additional_requirements,
                'is_walkin_interview' => $request->is_walkin_interview ?? false,
                'communication_preference' => $request->communication_preference,
                'total_experience_required' => $request->total_experience_required,
                'other_job_titles' => $request->other_job_titles,
                'degree_specialization' => $request->degree_specialization,
                'job_description' => $request->job_description,
                'job_expire_time' => $request->job_expire_time ?? 7,
                'number_of_candidates_required' => $request->number_of_candidates_required ?? 1,
            ]);          
            // Mail::to('manshu.developer@gmail.com')->send(new JobPostingMail($JobPosting));



            return response()->json([
                'status' => 'success',
                'message' => 'Job post created successfully',
                'data' => $JobPosting,
            ], 201);

        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Failed to create job post',
                'error' => $e->getMessage(),
            ], 500);
        }
    }


    public function getByEmployer($employerId): JsonResponse
{
    $jobs = JobPosting::where('employer_id', $employerId)->get();

    return response()->json([
        'status' => 'success',
        'data' => $jobs
    ]);
}

 public function index(Request $request): JsonResponse
 {
       
          $query = JobPosting::query();

if ($request->filled('job_title')) {
            $query->where('job_title', 'like', '%' . $request->job_title . '%');
 
}

if ($request->filled('total_experience_required')) {
    $exp = array_map('trim', explode(',', $request->total_experience_required));
    $query->whereIn('total_experience_required', $exp);
}

if ($request->filled('work_location_type')) {
    $locations = array_map('trim', explode(',', $request->work_location_type));
    $query->whereIn('work_location_type', $locations);
}

if ($request->filled('categories')) {
    $categories = array_map('trim', explode(',', $request->categories));
    $query->whereIn('category', $categories);
}

if ($request->filled('job_type')) {
    $types = array_map('trim', explode(',', $request->job_type));
    $query->whereIn('job_type', $types);
}
 if ($request->has('date_posted')) {
    switch ($request->date_posted) {
        case 'last_3_days':
            $query->where('created_at', '>=', Carbon::now()->subDays(3));
            break;
        case 'last_10_days':
            $query->where('created_at', '>=', Carbon::now()->subDays(10));
            break;
        case 'last_30_days':
            $query->where('created_at', '>=', Carbon::now()->subDays(30));
            break;
    }
}

        
    //     // Paginate results
        $jobs = $query->latest()->paginate(10);

        return response()->json([
            'status' => 'success',
            'data' => $jobs
        ]);
    }

    
private function applyFilters($query, Request $request): void
{
    if ($request->has('job_type')) {
        $query->where('job_type', $request->job_type);
    }

    if ($request->has('location')) {
        $query->where('location', 'like', '%' . $request->location . '%');
    }

    if ($request->has('work_location_type')) {
        $query->where('work_location_type', $request->work_location_type);
    }

    if ($request->has('pay_type')) {
        $query->where('pay_type', $request->pay_type);
    }

    if ($request->has('is_walkin_interview')) {
        $query->where('is_walkin_interview', $request->is_walkin_interview);
    }

    if ($request->has('total_experience_required')) {
        $query->where('total_experience_required', '<=', $request->total_experience_required);
    }

    if ($request->has('date_posted')) {
        switch ($request->date_posted) {
            case 'last_3_days':
                $query->where('created_at', '>=', now()->subDays(3));
                break;
            case 'last_10_days':
                $query->where('created_at', '>=', now()->subDays(10));
                break;
            case 'last_30_days':
                $query->where('created_at', '>=', now()->subDays(30));
                break;
        }
    }

  
}



}