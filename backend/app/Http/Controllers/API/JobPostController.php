<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\JobPosting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Mail;
use App\Models\Company;
use App\Mail\JobPostingMail;
use Carbon\Carbon;

class JobPostController extends Controller
{
    

 public function store(Request $request): JsonResponse
    {
        // Define validation rules
        $rules = [
            'employer_id' => 'required|exists:employers,id',
            'company_id' => 'nullable|exists:companies,id',
            'newCompanyName' => 'nullable|string|max:255',
            'pan_card' => 'nullable|file|mimes:pdf,jpg,jpeg,png|max:2048',
            'gst_certificate' => 'nullable|file|mimes:pdf,jpg,jpeg,png|max:2048',
            'job_title' => 'required|string|max:255',
            'job_type' => 'required|in:Full-Time,Part-Time,Freelance',
            'location' => 'required|string|max:255',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
            'work_location_type' => 'required|in:Work from Home,Work from Office,Hybrid',
            'compensation' => 'required|string|max:255',
            'pay_type' => 'required|in:Salary,Hourly,Per Project',
            'basic_requirements' => 'nullable|string',
            'additional_requirements' => 'nullable|json',
            'is_walkin_interview' => 'boolean',
            'joining_fee' => 'required|boolean',
            'communication_preference' => 'required|in:Call,Whatsapp,No Preference',
            'total_experience_required' => 'nullable|integer|min:0',
            'total_experience_max' => 'nullable|integer|min:0',
            'other_job_titles' => 'nullable|json',
            'degree_specialization' => 'nullable|json',
            'job_description' => 'nullable|string',
            'job_expire_time' => 'integer|min:1',
            'number_of_candidates_required' => 'integer|min:1',
            'english_level' => 'nullable|in:Beginner,Intermediate,Advanced,Fluent',
            'gender_preference' => 'nullable|in:No Preference,Male,Female,Other',
            'perks' => 'nullable|json',
            'interview_location' => 'nullable|string|max:255',
            'contact_email' => 'nullable|email|max:255',
            'contact_phone' => 'nullable|string|max:20',
            'interview_date' => 'nullable|date',
            'interview_time' => 'nullable|string',
            'not_email' => 'boolean',
            'viewed_number' => 'boolean',
        ];

        // Custom validation messages
        $messages = [
            'gst_certificate.mimes' => 'The GST certificate must be a PDF, JPG, JPEG, or PNG file.',
            'pan_card.mimes' => 'The PAN card must be a PDF, JPG, JPEG, or PNG file.',
        ];

        // Validate the request
        $validator = Validator::make($request->all(), $rules, $messages);

        // Custom validation for company_id or newCompanyName
        if (!$request->company_id && !$request->newCompanyName) {
            $validator->errors()->add('company_id', 'Either company_id or newCompanyName is required.');
        }

        if ($request->newCompanyName && (!$request->hasFile('pan_card') || !$request->hasFile('gst_certificate'))) {
            $validator->errors()->add('newCompanyName', 'PAN card and GST certificate are required when adding a new company.');
        }

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Validation failed',
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            // Get the authenticated employer
            $employer = Auth::guard('employer-api')->user();
            if (!$employer) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Unauthorized',
                ], 401);
            }

            // Handle company creation
            $company_id = $request->company_id;
            if ($request->newCompanyName) {
                // Handle file uploads with unique filenames
                $gstCertificatePath = null;
                $otherCertificatePath = null;

                if ($request->hasFile('gst_certificate') && $request->file('gst_certificate')->isValid()) {
                    $filename = 'gst_' . time() . '_' . $request->file('gst_certificate')->getClientOriginalName();
                    $gstCertificatePath = $request->file('gst_certificate')->storeAs('documents', $filename, 'public');
                }

                if ($request->hasFile('pan_card') && $request->file('pan_card')->isValid()) {
                    $filename = 'pan_' . time() . '_' . $request->file('pan_card')->getClientOriginalName();
                    $otherCertificatePath = $request->file('pan_card')->storeAs('documents', $filename, 'public');
                }

                // Create the company
                $company = Company::create([
                    'employer_id' => $employer->id,
                    'name' => $request->newCompanyName,
                    'company_location' => $request->location,
                    'contact_person' => null,
                    'contact_phone' => $request->contact_phone,
                    'gst_certificate' => $gstCertificatePath,
                    'other_certificate' => $otherCertificatePath,
                    'is_approved' => false,
                ]);

                // Notify admin about new company registration
                try {
                    Mail::to('manshu.developer@gmail.com')->send(new NewCompanyRegistered($employer, $company));
                } catch (\Exception $e) {
                    Log::error('Failed to send company registration email: ' . $e->getMessage());
                }

                $company_id = $company->id;
            } else {
                // Validate company_id belongs to the employer
                $company = Company::where('id', $request->company_id)->where('employer_id', $employer->id)->first();
                if (!$company) {
                    return response()->json([
                        'status' => 'error',
                        'message' => 'Invalid or unauthorized company.',
                    ], 422);
                }
                $company_id = $company->id;
            }

            // Create the job post
            $JobPosting = JobPosting::create([
                'employer_id' => $request->employer_id,
                'company_id' => $company_id,
                'job_title' => $request->job_title,
                'job_type' => $request->job_type,
                'location' => $request->location,
                'latitude' => $request->latitude,
                'longitude' => $request->longitude,
                'work_location_type' => $request->work_location_type,
                'compensation' => $request->compensation,
                'pay_type' => $request->pay_type,
                'joining_fee' => $request->joining_fee ?? false,
                'basic_requirements' => $request->basic_requirements,
                'additional_requirements' => $request->additional_requirements,
                'is_walkin_interview' => $request->is_walkin_interview ?? false,
                'communication_preference' => $request->communication_preference,
                'total_experience_required' => $request->total_experience_required,
                'total_experience_max' => $request->total_experience_max,
                'other_job_titles' => $request->other_job_titles,
                'degree_specialization' => $request->degree_specialization,
                'job_description' => $request->job_description,
                'job_expire_time' => $request->job_expire_time ?? 7,
                'number_of_candidates_required' => $request->number_of_candidates_required ?? 1,
                'english_level' => $request->english_level,
                'gender_preference' => $request->gender_preference,
                'perks' => $request->perks,
                'interview_location' => $request->interview_location,
                'contact_email' => $request->contact_email,
                'contact_phone' => $request->contact_phone,
                'interview_date' => $request->interview_date,
                'interview_time' => $request->interview_time,
                'not_email' => $request->not_email ?? false,
                'viewed_number' => $request->viewed_number ?? false,
                'is_verified' => false, // Default value
            ]);

            // Send job posting email
            try {
                Mail::to('manshu.developer@gmail.com')->send(new JobPostingMail($JobPosting));
            } catch (\Exception $e) {
                Log::error('Failed to send job posting email: ' . $e->getMessage());
            }

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