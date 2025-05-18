<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Employer;
use Illuminate\Support\Facades\Hash;
use App\Mail\SendOtpMail;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Carbon\Carbon;
use App\Models\OtpVerification;

use App\Mail\NewCompanyRegistered;
class EmployerAuthController extends Controller
{
    /**
     * Send OTP to email
     */
    public function sendOtp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'contact_email' => 'required|email',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $email = $request->contact_email;

        // Generate OTP
        $otp = sprintf("%06d", mt_rand(100000, 999999)); // Secure 6-digit OTP

        // Store or update OTP in otp_verifications table
        OtpVerification::updateOrCreate(
            ['email' => $email],
            [
                'otp' => $otp,
                'expires_at' => Carbon::now()->addMinutes(10),
                'session_token' => null, // Reset session token
            ]
        );

        try {
            Mail::to($email)->send(new SendOtpMail($otp));
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to send OTP',
                'error' => $e->getMessage(),
            ], 500);
        }

        return response()->json([
            'success' => true,
            'message' => 'OTP sent to email',
        ]);
    }

    /**
     * Verify OTP before account creation
     */
 public function verifyOtp(Request $request)
{
    $validator = Validator::make($request->all(), [
        'contact_email' => 'required|email',
        'otp' => 'required|numeric|digits:6',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'success' => false,
            'errors' => $validator->errors(),
        ], 422);
    }

    $otpRecord = OtpVerification::where('email', $request->contact_email)
        ->where('otp', $request->otp)
        ->first();

    if (!$otpRecord) {
        return response()->json([
            'success' => false,
            'message' => 'Invalid OTP',
        ], 400);
    }

    if (Carbon::now()->gt($otpRecord->expires_at)) {
        return response()->json([
            'success' => false,
            'message' => 'OTP has expired',
        ], 400);
    }

    // Check if employer exists
    $employer = Employer::where('contact_email', $request->contact_email)->first();

    $response = [
        'success' => true,
        'message' => 'OTP verified successfully',
        'email' => $request->contact_email,
    ];

    // Only generate and return session token if employer exists
    if ($employer) {
        $sessionToken = Str::random(60);
        $otpRecord->update([
            'session_token' => $sessionToken,
            'session_token_expires_at' => Carbon::now()->addMinutes(30),
        ]);

        $response['session_token'] = $sessionToken;
    }

    return response()->json($response);
}

    /**
     * Create employer account after OTP verification
     */
   public function signup(Request $request)
{
    $validator = Validator::make($request->all(), [
        'contact_email' => 'required|email',
        'password' => 'required|string|min:6',
        'name' => 'required|string|max:255',
        'company_name' => 'nullable|string|max:255',
        'company_location' => 'nullable|string|max:255',
        'contact_person' => 'nullable|string|max:255',
        'contact_phone' => 'nullable|string|max:20',
    ]);

    if ($validator->fails()) {
        return response()->json(['errors' => $validator->errors()], 422);
    }

    // Create or update employer by email
    $employer = Employer::updateOrCreate(
        ['contact_email' => $request->contact_email],
        [
            'name' => $request->name,
            'company_name' => $request->company_name,
            'company_location' => $request->company_location,
            'contact_person' => $request->contact_person,
            'contact_phone' => $request->contact_phone,
            'password' => Hash::make($request->password),
            'email_verified_at' => now(),
        ]
    );

    Mail::to('manshu.developer@gmail.com')->send(new NewCompanyRegistered($employer));

    // Generate token
    $token = $employer->createToken('EmployerToken')->plainTextToken;

    return response()->json([
        'success' => true,
        'message' => 'Employer account created/updated successfully',
        'token' => $token,
    ], 201);
}


    public function profile(Request $request)
{
    // Retrieve the authenticated employer
    $employer = $request->user();

    if (!$employer) {
        return response()->json([
            'success' => false,
            'message' => 'Unauthorized',
        ], 401);
    }

    return response()->json([
        'success' => true,
        'message' => 'All employers retrieved successfully',
        'data' => $employer,
    ], 200);

}
}