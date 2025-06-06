<?php

namespace App\Http\Controllers\API;

use App\Models\Candidate;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

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

     
    public function filter(Request $request)
    {
        // Validate query parameters
        $validator = Validator::make($request->all(), [
            'job_title' => 'nullable|string|max:255',
            'skills' => 'nullable|string',
            'education' => 'nullable|string|max:255',
            'experience' => 'nullable|string|in:0-2,3-5,6-10,10+',
            'active' => 'nullable|boolean',
            'location' => 'nullable|string|max:255',
        ]);

        if ($validator->fails()) {
            Log::error('Validation failed', ['errors' => $validator->errors()]);
            return response()->json([
                'error' => 'Invalid input',
                'messages' => $validator->errors(),
            ], 422);
        }

        // Build the query
        $query = Candidate::query()
            ->with(['educations', 'experiences', 'skills', 'languages'])
            ->select('candidates.*');

        // Check if any filter parameters are provided
        $hasFilters = $request->hasAny(['job_title', 'skills', 'education', 'experience', 'active', 'location']);

        if ($hasFilters) {
            // Filter by job title (from CandidateExperience or direct attribute)
            if ($jobTitle = $request->query('job_title')) {
                $query->where(function ($q) use ($jobTitle) {
                    $q->where('job_title', 'like', '%' . $jobTitle . '%')
                      ->orWhereHas('experiences', function ($q) use ($jobTitle) {
                          $q->where('job_title', 'like', '%' . $jobTitle . '%');
                      });
                });
            }

            // Filter by skills (from CandidateSkill)
             if ($skills = $request->query('skills')) {
    $skillArray = array_map('trim', explode(',', $skills));
    $query->whereHas('skills', function ($q) use ($skillArray) {
        $q->whereIn(DB::raw('LOWER(skill_name)'), array_map('strtolower', $skillArray));
    });
}


            // Filter by education level (from CandidateEducation or direct attribute)
            if ($education = $request->query('education')) {
                $query->where(function ($q) use ($education) {
                    $q->where('degree', $education)
                      ->orWhereHas('educations', function ($q) use ($education) {
                          $q->where('degree', $education);
                      });
                });
            }

            // Filter by experience (from CandidateExperience or direct attribute)
            if ($experience = $request->query('experience')) {
                $ranges = [
                    '0-2' => [0, 2],
                    '3-5' => [3, 5],
                    '6-10' => [6, 10],
                    '10+' => [10, 999],
                ];
                $range = $ranges[$experience] ?? [0, 999];
                $query->where(function ($q) use ($range) {
                    $q->whereBetween('experience_years', $range)
                      ->orWhereHas('experiences', function ($q) use ($range) {
                          $q->whereBetween('experience_years', $range);
                      });
                });
            }

            // Filter by active status
            if ($request->has('active')) {
                $query->where('active_user', $request->query('active'));
            }

            // Filter by location (city)
            if ($location = $request->query('location')) {
                $query->where('city', 'like', '%' . $location . '%');
            }
        }

        // Default sorting to ensure consistent order
        $query->orderBy('full_name', 'asc');

        // Paginate results (limit to 10 per page)
        $candidates = $query->paginate(10);

        // Transform response to include relevant data
        $candidates->getCollection()->transform(function ($candidate) {
            // Debug relationships
            Log::debug('Transforming candidate', [
                'id' => $candidate->id,
                'full_name' => $candidate->full_name,
                'has_experiences' => !is_null($candidate->experiences),
                'has_skills' => !is_null($candidate->skills),
                'has_educations' => !is_null($candidate->educations),
                'has_languages' => !is_null($candidate->languages),
            ]);

            return [
                'id' => $candidate->id,
                'name' => $candidate->full_name,
                'job_title' => $candidate->job_title ?? optional($candidate->experiences)->pluck('job_title')->first() ?? 'N/A',
          
              'skills' => explode(',', $candidate->skills),

                'experience' => $candidate->experience_years ?? optional($candidate->experiences)->pluck('experience_years')->first() ?? null,
                'location' => $candidate->city ?? 'N/A',
                'education' => $candidate->degree ?? optional($candidate->educations)->pluck('degree')->first() ?? 'N/A',
                'active' => (bool) $candidate->active_user,
            ];
        });

        Log::info('Candidates fetched', [
            'filters' => $request->all(),
            'count' => $candidates->total(),
            'page' => $candidates->currentPage(),
        ]);

        return response()->json([
            'data' => $candidates->items(),
            'pagination' => [
                'total' => $candidates->total(),
                'per_page' => $candidates->perPage(),
                'current_page' => $candidates->currentPage(),
                'last_page' => $candidates->lastPage(),
                'next_page_url' => $candidates->nextPageUrl(),
                'prev_page_url' => $candidates->previousPageUrl(),
            ],
        ], 200);
    }
 

  
}