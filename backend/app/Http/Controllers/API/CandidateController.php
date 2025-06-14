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
            'experience' => 'nullable|string|in:0-2,3-5,6-10,10+,any',
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
            // Keyword-based search
            if ($keywords = $request->query('keywords')) {
                $keywordArray = array_map('trim', explode(' ', $keywords));
                $query->where(function ($q) use ($keywordArray) {
                    foreach ($keywordArray as $keyword) {
                        $q->orWhereRaw('LOWER(job_title) LIKE ?', ['%' . strtolower($keyword) . '%'])
                          ->orWhereRaw('LOWER(city) LIKE ?', ['%' . strtolower($keyword) . '%'])
                          ->orWhereHas('skills', function ($q) use ($keyword) {
                              $q->whereRaw('LOWER(skill_name) LIKE ?', ['%' . strtolower($keyword) . '%']);
                          })
                          ->orWhereHas('educations', function ($q) use ($keyword) {
                              $q->whereRaw('LOWER(degree) LIKE ?', ['%' . strtolower($keyword) . '%'])
                                ->orWhereRaw('LOWER(specialization) LIKE ?', ['%' . strtolower($keyword) . '%']);
                          })
                          ->orWhereHas('experiences', function ($q) use ($keyword) {
                              $q->whereRaw('LOWER(job_title) LIKE ?', ['%' . strtolower($keyword) . '%'])
                                ->orWhere('experience_years', 'like', '%' . $keyword . '%');
                          });
                    }
                });
            }
    
            // Filter by job title (from Candidate or CandidateExperience)
            if ($jobTitle = $request->query('job_title')) {
                $query->where(function ($q) use ($jobTitle) {
                    $q->whereRaw('LOWER(job_title) LIKE ?', ['%' . strtolower($jobTitle) . '%'])
                      ->orWhereHas('experiences', function ($q) use ($jobTitle) {
                          $q->whereRaw('LOWER(job_title) LIKE ?', ['%' . strtolower($jobTitle) . '%']);
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
                $educationLevels = [
                    'graduate' => ['B.Com', 'B.Tech', 'BCA', 'BA', 'B.Sc', 'BBA', 'BE', 'B.Ed'],
                    'post-graduate' => ['M.Com', 'M.Tech', 'MCA', 'MA', 'M.Sc', 'MBA', 'ME', 'M.Ed'],
                    '10th' => ['10th', 'SSC', 'Matriculation', 'High School'],
                    '12th' => ['12th', 'HSC', 'Intermediate', 'Senior Secondary'],
                    'iti' => ['ITI', 'ITI Electrician', 'ITI Fitter', 'ITI Welder', 'ITI Mechanic'],
                ];
            
                $degrees = $educationLevels[strtolower($education)] ?? [$education];
                $query->where(function ($q) use ($degrees) {
                    $q->whereIn(DB::raw('LOWER(degree)'), array_map('strtolower', $degrees))
                      ->orWhereHas('educations', function ($q) use ($degrees) {
                          $q->whereIn(DB::raw('LOWER(degree)'), array_map('strtolower', $degrees));
                      });
                });
            }
    
            // Filter by experience (from CandidateExperience or direct attribute)
            $experience = $request->query('experience');
            if ($experience && $experience !== 'any') {
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
                $query->whereRaw('LOWER(city) LIKE ?', ['%' . strtolower($location) . '%']);
            }
        }
    
        // Default sorting to ensure consistent order
        $query->orderBy('full_name', 'asc');
    
        // Log matched candidates before pagination
        $matchedCandidates = $query->count();
        Log::info('Candidates matched before pagination', [
            'filters' => $request->all(),
            'matched_count' => $matchedCandidates,
        ]);
    
        // Paginate results (limit to 10 per page)
        $candidates = $query->paginate($request->query('per_page', 10));
    
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
                'full_name' => $candidate->full_name,
                'dob' => $candidate->dob,
                'gender' => $candidate->gender,
                'email' => $candidate->email,
                'number' => $candidate->number,
                'address' => $candidate->address,
                'city' => $candidate->city,
                'state' => $candidate->state,
                'prefers_night_shift' => $candidate->prefers_night_shift,
                'prefers_day_shift' => $candidate->prefers_day_shift,
                'work_from_home' => $candidate->work_from_home,
                'work_from_office' => $candidate->work_from_office,
                'field_job' => $candidate->field_job,
                'employment_type' => $candidate->employment_type,
                'resume' => $candidate->resume,
                'active_user' => (bool) $candidate->active_user,
                'last_login' => $candidate->last_login,
                'total_jobs_applied' => $candidate->total_jobs_applied,
                'total_job_views' => $candidate->total_job_views,
                'otp' => $candidate->otp,
                'otp_expires_at' => $candidate->otp_expires_at,
                'preferred_language' => $candidate->preferred_language,
                'token' => $candidate->token,
    
                // From education relationship or main table
                'degree' => $candidate->degree ?? optional($candidate->educations->first())->degree,
                'specialization' => $candidate->specialization ?? optional($candidate->educations->first())->specialization,
                'college_name' => $candidate->college_name ?? optional($candidate->educations->first())->college_name,
                'passing_marks' => $candidate->passing_marks ?? optional($candidate->educations->first())->passing_marks,
                'pursuing' => $candidate->pursuing ?? optional($candidate->educations->first())->pursuing,
    
                // From experience relationship or main table
                'experience_years' => $candidate->experience_years ?? optional($candidate->experiences->first())->experience_years,
                'experience_months' => $candidate->experience_months ?? optional($candidate->experiences->first())->experience_months,
                'job_title' => $candidate->job_title ?? optional($candidate->experiences->first())->job_title,
                'job_roles' => $candidate->job_roles ?? optional($candidate->experiences->first())->job_roles,
                'company_name' => $candidate->company_name ?? optional($candidate->experiences->first())->company_name,
                'current_salary' => $candidate->current_salary ?? optional($candidate->experiences->first())->current_salary,
                'start_date' => $candidate->start_date ?? optional($candidate->experiences->first())->start_date,
                'skills' => explode(',', $candidate->skills),
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