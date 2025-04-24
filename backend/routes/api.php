<?php



use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\CandidateController;
use App\Http\Controllers\API\CandidateEducationController;
use App\Http\Controllers\API\CandidateExperienceController;
use App\Http\Controllers\API\CandidateSkillController;
use App\Http\Controllers\API\CandidateLanguageController;

Route::prefix('v1')->group(function () {

    Route::apiResource('candidates', CandidateController::class);
    Route::apiResource('candidate-educations', CandidateEducationController::class);
    Route::apiResource('candidate-experiences', CandidateExperienceController::class);
    Route::apiResource('candidate-skills', CandidateSkillController::class);
    Route::apiResource('candidate-languages', CandidateLanguageController::class);

});