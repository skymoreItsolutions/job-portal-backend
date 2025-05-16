<?php

namespace App\Http\Controllers;

use App\Models\Candidate;
use Illuminate\Http\Request;

class AllCandidateController extends Controller
{
    //

 public function AddCandidateInfo(Request $request,$token){
$candidate=Candidate::whereToken($token)->first();

$candidate->full_name=$request->full_name ?? $candidate->full_name;
$candidate->dob=$request->dob ?? $candidate->dob;
$candidate->gender=$request->gender ?? $candidate->gender;
$candidate->email=$request->email ?? $candidate->email;
$candidate->address=$request->address ?? $candidate->address;
$candidate->city=$request->city ?? $candidate->city;
$candidate->state=$request->state ?? $candidate->state;
$candidate->degree=$request->degree ?? $candidate->degree;
$candidate->specialization=$request->specialization ?? $candidate->specialization;
$candidate->college_name=$request->college_name ?? $candidate->college_name;
$candidate->passing_marks=$request->passing_marks ?? $candidate->passing_marks;
$candidate->pursuing=$request->pursuing ?? $candidate->pursuing;
$candidate->experience_years=$request->experience_years ?? $candidate->experience_years;
$candidate->experience_months=$request->experience_months ?? $candidate->experience_months;
$candidate->job_title=$request->job_title ?? $candidate->job_title;
$candidate->job_roles=$request->job_roles ?? $candidate->job_roles;
$candidate->company_name=$request->company_name ?? $candidate->company_name;
$candidate->current_salary=$request->current_salary ?? $candidate->current_salary;
$candidate->start_date=$request->start_date ?? $candidate->start_date;
$candidate->prefers_night_shift=$request->prefers_night_shift ?? $candidate->prefers_night_shift;
$candidate->prefers_day_shift=$request->prefers_day_shift ?? $candidate->prefers_day_shift;
$candidate->work_from_home=$request->work_from_home ?? $candidate->work_from_home;
$candidate->work_from_office=$request->work_from_office ?? $candidate->work_from_office;
$candidate->skills=$request->skills ?? $candidate->skills;
$candidate->preferred_language=$request->preferred_language ?? $candidate->preferred_language;
$candidate->save();


return response()->json(["success"=>true,"message"=>"updated"]);






 }

 public function getCandidateinfo($token){
$candidate=Candidate::whereToken($token)->first();
if(!$candidate){
return response()->json(["success"=>false]);

}
return response()->json(["success"=>true,"candidate"=>$candidate]);

 }

}
