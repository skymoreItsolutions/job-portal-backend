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
use Illuminate\Support\Facades\Auth;
class JobPostController extends Controller
{
    

     public function store(Request $request): JsonResponse
    {
        // Define validation rules
        $rules = [
            'employer_id' => 'required|exists:employers,id',
            'company_id' => 'nullable|exists:companies,id',
            'company_name' => 'nullable|string|max:255',
            'pan_card' => 'nullable|file|mimes:pdf,jpg,jpeg,png|max:2048',
            'gst_certificate' => 'nullable|file|mimes:pdf,jpg,jpeg,png|max:2048',
            'job_title' => 'required|string|max:255',
            'job_type' => 'required|in:Full-Time,Part-Time,Freelance',
            'location' => 'required|string|max:255',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
            'work_location_type' => 'required|in:Work from Home,Work from Office,Hybrid',
            'compensation' => 'nullable|string|max:255', 
            'min_salary' => 'required|numeric|min:0',
            'max_salary' => 'nullable|numeric|min:0|gte:min_salary',
            'incentive' => 'nullable|numeric|min:0',
            'pay_type' => 'required|in:Salary,Salary + Incentive,Hourly,Per Project',
            'basic_requirements' => 'nullable|string',
            'additional_requirements' => 'nullable|json',
            'is_walkin_interview' => 'boolean',
            'joining_fee' => 'required|boolean',
            'communication_preference' => 'required|in:Whatsapp,Call,No Preference',
            'total_experience_required' => 'nullable|integer|min:0',
            'total_experience_max' => 'nullable|integer|min:0|gte:total_experience_required',
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
            'industry' => 'required|string',
            'department' => 'required|string',
            'job_role' => 'required|string|max:255',
        ];

        // Custom validation messages
        $messages = [
            'gst_certificate.mimes' => 'The GST certificate must be a PDF, JPG, JPEG, or PNG file.',
            'pan_card.mimes' => 'The PAN card must be a PDF, JPG, JPEG, or PNG file.',
            'industry.required' => 'The industry field is required.',
            'department.required' => 'The department field is required.',
            'job_role.required' => 'The job role field is required.',
            'min_salary.required' => 'The minimum salary is required.',
            'max_salary.gte' => 'The maximum salary must be greater than or equal to the minimum salary.',
            'incentive.numeric' => 'The incentive must be a valid number.',
        ];

        // Validate the request
        $validator = Validator::make($request->all(), $rules, $messages);

        // Custom validation for company_id or company_name
        if (!$request->company_id && !$request->company_name) {
            $validator->errors()->add('company_id', 'Either company_id or company_name is required.');
        }

        if ($request->company_name && (!$request->hasFile('pan_card') || !$request->hasFile('gst_certificate'))) {
            $validator->errors()->add('company_name', 'PAN card and GST certificate are required when adding a new company.');
        }

        if ($request->pay_type === 'Salary + Incentive' && !$request->incentive) {
            $validator->errors()->add('incentive', 'Incentive is required when pay type is Salary + Incentive.');
        }

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Validation failed',
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            $employer = Auth::guard('employer-api')->user();

            if (!$employer) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Unauthorized access.',
                ], 401);
            }

            // Handle company creation
            $company_id = $request->company_id;
            if ($request->company_name) {
        
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
                    'name' => $request->company_name,
                    'company_location' => $request->location,
                    'contact_person' => null,
                    'contact_phone' => $request->contact_phone,
                    'gst_certificate' => $gstCertificatePath,
                    'other_certificate' => $otherCertificatePath,
                    'is_approved' => false,
                ]);


                $company_id = $company->id;
            } else {
                // Validate company_id belongs to the employer
                $company = Company::where('id', $request->company_id)->where('employer_id', $employer->id)->first();
                if (!$company) {
                    return response()->json([
                        'status' => 'error',
                        'message' => 'Invalid or unauthorized company.',
                        'check' => $request->company_id,
                    ], 422);
                }
                $company_id = $company->id;
            }

            // Create the job post
            $jobPosting = JobPosting::create([
                'employer_id' => $request->employer_id,
                'company_id' => $company_id,
                'job_title' => $request->job_title,
                'job_type' => $request->job_type,
                'location' => $request->location,
                'latitude' => $request->latitude,
                'longitude' => $request->longitude,
                'work_location_type' => $request->work_location_type,
                'compensation' => $request->compensation, // Optional: Keep for backward compatibility
                'min_salary' => $request->min_salary,
                'max_salary' => $request->max_salary,
                'incentive' => $request->incentive,
                'pay_type' => $request->pay_type,
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
                'is_verified' => false,
                'industry' => $request->industry,
                'department' => $request->department,
                'job_role' => $request->job_role,
            ]);

           
            return response()->json([
                'status' => 'success',
                'message' => 'Job post created successfully',
                'data' => $jobPosting,
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Failed to create job post',
                'error' => $e->getMessage(),
            ], 500);
        }
    }}