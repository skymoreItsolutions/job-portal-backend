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

        // Generate a session token and store it
        $sessionToken = Str::random(60);
        $otpRecord->update([
            'session_token' => $sessionToken,
            'session_token_expires_at' => Carbon::now()->addMinutes(30), // Token expires in 30 minutes
        ]);

        return response()->json([
            'success' => true,
            'message' => 'OTP verified successfully',
            'session_token' => $sessionToken,
            'email' => $request->contact_email,
        ]);
    }

    /**
     * Create employer account after OTP verification
     */
    public function signup(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'contact_email' => 'required|email|unique:employers,contact_email',
  
            'password' => 'required|string|min:6',
            'name' => 'required|string|max:255',
            'company_name' => 'string|max:255',
            'company_location' => 'string|max:255',
            'contact_person' => 'string|max:255',
            'contact_phone' => 'string|max:20',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

    
      

      

        // Create employer account
        $employer = Employer::create([
            'name' => $request->name,
            'company_name' => $request->company_name,
            'company_location' => $request->company_location,
            'contact_person' => $request->contact_person,
            'contact_email' => $request->contact_email,
            'contact_phone' => $request->contact_phone,
            'password' => Hash::make($request->password),
            'email_verified_at' => now(),

        ]);

       

        // Generate authentication token
        $token = $employer->createToken('EmployerToken')->plainTextToken;

        return response()->json([
            'success' => true,
            'message' => 'Employer account created successfully',
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
        'message' => 'Employer profile retrieved successfully',
        'data' => [
            'id' => $employer->id,
            'name' => $employer->name,
            'company_name' => $employer->company_name,
            'company_location' => $employer->company_location,
            'contact_person' => $employer->contact_person,
            'contact_email' => $employer->contact_email,
            'contact_phone' => $employer->contact_phone,
            'email_verified_at' => $employer->email_verified_at,
        ],
    ], 200);
}
}