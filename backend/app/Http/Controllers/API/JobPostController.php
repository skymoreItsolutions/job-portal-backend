<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\JobPosting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\JsonResponse;

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
            'basic_requirements' => 'required|string',
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
}