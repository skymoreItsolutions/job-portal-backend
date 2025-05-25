<?php

namespace App\Http\Controllers\API;

use App\Models\Candidate;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CandidateController extends Controller
{
    public function index()
    {
        $candidates = Candidate::with(['educations', 'experiences', 'skills', 'languages'])->get();
        return response()->json($candidates, 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'full_name' => 'required|string|max:255',
            'dob' => 'nullable|date',
            'gender' => 'nullable|string|in:male,female,other',
            'email' => 'nullable|email|unique:candidates,email',
            'address' => 'nullable|string',
            'city' => 'nullable|string',
            'state' => 'nullable|string',
            'prefers_night_shift' => 'nullable|boolean',
            'prefers_day_shift' => 'nullable|boolean',
            'work_from_home' => 'nullable|boolean',
            'work_from_office' => 'nullable|boolean',
            'field_job' => 'nullable|boolean',
            'employment_type' => 'nullable|string',
            'resume' => 'nullable|string',
            'active_user' => 'nullable|boolean',
            'last_login' => 'nullable|datetime',
            'total_jobs_applied' => 'nullable|integer',
            'total_job_views' => 'nullable|integer',
            'otp' => 'nullable|string',
            'otp_expires_at' => 'nullable|datetime',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $candidate = Candidate::create($validator->validated());

        return response()->json($candidate, 201);
    }

    public function show($id)
    {
        $candidate = Candidate::with(['educations', 'experiences', 'skills', 'languages'])->find($id);

        if (!$candidate) {
            return response()->json(['message' => 'Candidate not found'], 404);
        }

        return response()->json($candidate, 200);
    }

    public function update(Request $request, $id)
    {
        $candidate = Candidate::find($id);

        if (!$candidate) {
            return response()->json(['message' => 'Candidate not found'], 404);
        }

        $candidate->update($request->only([
            'full_name',
            'dob',
            'gender',
            'email',
            'address',
            'city',
            'state',
            'prefers_night_shift',
            'prefers_day_shift',
            'work_from_home',
            'work_from_office',
            'field_job',
            'employment_type',
            'resume',
            'active_user',
            'last_login',
            'total_jobs_applied',
            'total_job_views',
            'otp',
            'otp_expires_at'
        ]));

        return response()->json($candidate, 200);
    }

    public function destroy($id)
    {
        $candidate = Candidate::find($id);

        if (!$candidate) {
            return response()->json(['message' => 'Candidate not found'], 404);
        }

        $candidate->delete();

        return response()->json(['message' => 'Candidate deleted successfully'], 200);
    }
}
