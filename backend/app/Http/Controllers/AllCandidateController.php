<?php

namespace App\Http\Controllers;

use App\Models\Candidate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Mockery\Undefined;
use Illuminate\Support\Facades\Auth;
class AllCandidateController extends Controller
{
    //


    public function AddCandidateInfo(Request $request, $token) {
    // Find the candidate by token
     $candidate = Auth::guard('candidate-api')->user();




    // Check if candidate exists
    if (!$candidate) {
        return response()->json([
            "success" => false,
            "message" => $candidate
        ], 404);
    }

    // Update candidate properties
    $candidate->full_name = $request->full_name ?? $candidate->full_name;
    $candidate->number = $request->number ?? $candidate->number;
    $candidate->dob = $request->dob ?? $candidate->dob;
    $candidate->gender = $request->gender ?? $candidate->gender;
    $candidate->email = $request->email ?? $candidate->email;
    $candidate->address = $request->address ?? $candidate->address;
    $candidate->city = $request->city ?? $candidate->city;
    $candidate->state = $request->state ?? $candidate->state;
    $candidate->degree = $request->degree ?? $candidate->degree;
    $candidate->specialization = $request->specialization ?? $candidate->specialization;
    $candidate->college_name = $request->college_name ?? $candidate->college_name;
    $candidate->passing_marks = $request->passing_marks ?? $candidate->passing_marks;
    $candidate->pursuing = $request->pursuing ?? $candidate->pursuing;
    $candidate->experience_years = $request->experience_years ?? $candidate->experience_years;
    $candidate->experience_months = $request->experience_months ?? $candidate->experience_months;
    $candidate->job_title = $request->job_title ?? $candidate->job_title;
    $candidate->job_roles = $request->job_roles ?? $candidate->job_roles;
    $candidate->company_name = $request->company_name ?? $candidate->company_name;
    $candidate->current_salary = $request->current_salary ?? $candidate->current_salary;
    $candidate->start_date = $request->start_date ?? $candidate->start_date;
    $candidate->prefers_night_shift = $request->prefers_night_shift ?? $candidate->prefers_night_shift;
    $candidate->prefers_day_shift = $request->prefers_day_shift ?? $candidate->prefers_day_shift;
    $candidate->work_from_home = $request->work_from_home ?? $candidate->work_from_home;
    $candidate->work_from_office = $request->work_from_office ?? $candidate->work_from_office;
    $candidate->skills = $request->skills ?? $candidate->skills;
    $candidate->preferred_language = $request->preferred_language ?? $candidate->preferred_language;
    $candidate->password = $request->password ? Hash::make($request->password) : $candidate->password;
    $candidate->doneprofile = 1;

    // Handle resume file upload
    $path = null;
    if ($request->hasFile("resume")) {
        // Delete old resume if it exists
        if ($candidate->resume) {
            Storage::disk("public")->delete($candidate->resume);
        }
        // Store new resume
        $path = $request->file('resume')->store('pdf', "public");
    }
    $candidate->resume = $path ?? $candidate->resume; // Keep old resume if no new file uploaded

    // Save the candidate
    $candidate->save();

    return response()->json([
        "success" => true,
        "message" => "Candidate profile updated successfully",
        "path" => $path
    ]);
}


 public function getCandidateinfo($token){
$candidate=Candidate::whereToken($token)->first();
$candidate->password="1234";
if(!$candidate){
return response()->json(["success"=>false]);

}
return response()->json(["success"=>true,"candidate"=>$candidate]);

 }


 public function loginbypasswod(Request $request){
$email=$request->email;
$getuser= Candidate::whereEmail($email)->first();

 if (!$getuser || !Hash::check($request->password, $getuser->password)) {
        return response()->json([
            "success" => false,
            "message" => "Invalid email or password"
        ]);
    }
    
return response()->json(["success"=>true,"message"=>"user Logined","token"=>$getuser->token]);

 }



 public function CreateCandidate(Request $request)
{
    // Validate the request data
    $validated = $request->validate([
        'full_name' => 'required|string|max:255',
        'email' => 'required|email|unique:candidates,email',
        'password' => 'required|string|min:6',
        'number' => 'nullable|string|max:20',
        'dob' => 'nullable|date',
        'gender' => 'nullable|string|in:male,female,other',
        'address' => 'nullable|string',
        'city' => 'nullable|string',
        'state' => 'nullable|string',
        'degree' => 'nullable|string',
        'specialization' => 'nullable|string',
        'college_name' => 'nullable|string',
        'passing_marks' => 'nullable|numeric',
        'pursuing' => 'nullable|boolean',
        'experience_years' => 'nullable|integer',
        'experience_months' => 'nullable|integer',
        'job_title' => 'nullable|string',
        'job_roles' => 'nullable|string',
        'company_name' => 'nullable|string',
        'current_salary' => 'nullable|numeric',
        'start_date' => 'nullable|date',
        'prefers_night_shift' => 'nullable|boolean',
        'prefers_day_shift' => 'nullable|boolean',
        'work_from_home' => 'nullable|boolean',
        'work_from_office' => 'nullable|boolean',
        'skills' => 'nullable|string',
        'preferred_language' => 'nullable|string',
        'resume' => 'nullable|file|mimes:pdf|max:2048', // Max 2MB PDF file
    ]);

    // Create a new candidate
    $candidate = new Candidate();
    $candidate->token = Str::uuid()->toString(); // Generate unique token
    $candidate->full_name = $request->full_name;
    $candidate->email = $request->email;
    $candidate->password = Hash::make($request->password);
    $candidate->number = $request->number;
    $candidate->dob = $request->dob;
    $candidate->gender = $request->gender;
    $candidate->address = $request->address;
    $candidate->city = $request->city;
    $candidate->state = $request->state;
    $candidate->degree = $request->degree;
    $candidate->specialization = $request->specialization;
    $candidate->college_name = $request->college_name;
    $candidate->passing_marks = $request->passing_marks;
    $candidate->pursuing = $request->pursuing;
    $candidate->experience_years = $request->experience_years;
    $candidate->experience_months = $request->experience_months;
    $candidate->job_title = $request->job_title;
    $candidate->job_roles = $request->job_roles;
    $candidate->company_name = $request->company_name;
    $candidate->current_salary = $request->current_salary;
    $candidate->start_date = $request->start_date;
    $candidate->prefers_night_shift = $request->prefers_night_shift;
    $candidate->prefers_day_shift = $request->prefers_day_shift;
    $candidate->work_from_home = $request->work_from_home;
    $candidate->work_from_office = $request->work_from_office;
    $candidate->skills = $request->skills;
    $candidate->preferred_language = $request->preferred_language;
    $candidate->doneprofile = 1;

    // Handle resume file upload
    if ($request->hasFile('resume')) {
        $path = $request->file('resume')->store('pdf', 'public');
        $candidate->resume = $path;
    }

    // Save the candidate
    $candidate->save();

    return response()->json([
        'success' => true,
        'message' => 'Candidate account created successfully',
        'token' => $candidate->token,
        'path' => $candidate->resume ?? null
    ], 201);
}


}
