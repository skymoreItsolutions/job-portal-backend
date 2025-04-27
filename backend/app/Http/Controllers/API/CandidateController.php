<?php

namespace App\Http\Controllers\API;
use App\Models\Candidate;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CandidateController extends Controller
{
    /**
     * Display a listing of the resource.
     */
  

     public function index()
     {
         return response()->json(Candidate::with(['educations', 'experiences', 'skills', 'languages'])->get());
     }
 
     public function store(Request $request)
     {
         $candidate = Candidate::create($request->only([
             'full_name', 'dob', 'gender', 'address', 'city', 'state',
             'prefers_night_shift', 'prefers_day_shift', 'work_from_home',
             'work_from_office', 'field_job', 'employment_type', 'resume',
             'active_user', 'last_login', 'total_jobs_applied', 'total_job_views'
         ]));
 
         return response()->json($candidate, 201);
     }
 
     public function show($id)
     {
         $candidate = Candidate::with(['educations', 'experiences', 'skills', 'languages'])->findOrFail($id);
         return response()->json($candidate);
     }
 
     public function update(Request $request, $id)
     {
         $candidate = Candidate::findOrFail($id);
         $candidate->update($request->all());
         return response()->json($candidate);
     }
 
     public function destroy($id)
     {
         Candidate::destroy($id);
         return response()->json(['message' => 'Deleted successfully']);
     }


}
