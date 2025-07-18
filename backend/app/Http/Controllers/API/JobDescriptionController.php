<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Cache;




class JobDescriptionController extends Controller
{
    public function generateJobDescription(Request $request)
    {
        // Step 1: Validate input
        $validator = Validator::make($request->all(), [
            'jobTitle' => 'required|string|max:255',
            'industry' => 'required|string|max:255',
            'department' => 'nullable|string|max:255',
            'requiredSkills' => 'required|array',
            'requiredSkills.*' => 'string|max:255',
            'experienceLevel' => 'required|string|max:50',
            'educationLevel' => 'required|string|max:255',
            'course' => 'nullable|string|max:255',
            'specialization' => 'nullable|string|max:255',
        ]);

        

        // Step 2: Format Prompt
        $formData = $request->all();
        $prompt = "
            Write a professional job description for a {$formData['jobTitle']} position in the {$formData['industry']} industry.
            The job is in the " . ($formData['department'] ?? 'unspecified') . " department and requires the following skills: " . implode(', ', $formData['requiredSkills']) . ".
            The candidate should have {$formData['experienceLevel']} years of experience and a {$formData['educationLevel']} level of education" .
            (isset($formData['course']) ? " in {$formData['course']}" . (isset($formData['specialization']) ? ", specializing in {$formData['specialization']}" : "") : "") . ".
            Include a brief overview, key responsibilities, and qualifications. Format the response with headings, bullet points for responsibilities and qualifications, and use professional language.
        ";

        // Step 3: Call OpenAI Chat API with GPT-4 or GPT-3.5-turbo
        try {
          

            $response = Http::withHeaders([
    'Authorization' => 'Bearer ' . config('services.together.api_key'),
])->post('https://api.together.xyz/v1/chat/completions', [
    'model' => 'mistralai/Mistral-7B-Instruct-v0.2',
    'messages' => [
        ['role' => 'system', 'content' => 'You are a helpful assistant that writes job descriptions.'],
        ['role' => 'user', 'content' => $prompt],
    ],
    'temperature' => 0.7,
]);

$generatedText = $response->json('choices')[0]['message']['content'] ?? 'No text generated.';


            return response()->json([
                'success' => true,
                'jobOverview' => $generatedText,
            ]);
        } catch (\Exception $e) {
            \Log::error('OpenAI API Error: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'errors' => ['api' => 'Failed to generate job description. Please try again later.'],
            ], 500);
        }
    }
}