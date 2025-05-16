<?php

use App\Http\Controllers\AllCandidateController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

use App\Http\Controllers\API\CandidateController;
use App\Http\Controllers\API\CandidateEducationController;
use App\Http\Controllers\API\CandidateExperienceController;
use App\Http\Controllers\API\CandidateSkillController;
use App\Http\Controllers\API\CandidateLanguageController;
use App\Http\Controllers\API\AuthController;

Route::prefix('v1')->group(function () {
    Route::apiResource('candidates', CandidateController::class);
    Route::apiResource('candidate-educations', CandidateEducationController::class);
    Route::apiResource('candidate-experiences', CandidateExperienceController::class);
    Route::apiResource('candidate-skills', CandidateSkillController::class);
    Route::apiResource('candidate-languages', CandidateLanguageController::class);

    Route::post('signup', [AuthController::class, 'signup']);
    Route::post('send-otp', [AuthController::class, 'sendOtp']);
    Route::post('verify-otp', [AuthController::class, 'verifyOtp']);
});


Route::post("v1/updatecandidate/{token}",[AllCandidateController::class,"AddCandidateInfo"]);
Route::get("v1/candidateinfo/{token}",[AllCandidateController::class,"getCandidateinfo"]);


