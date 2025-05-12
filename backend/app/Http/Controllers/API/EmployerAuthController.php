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

     
    public function sendOtp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'contact_email' => 'required|email',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $email = $request->contact_email;

        // Check if email is already registered
        if (Employer::where('contact_email', $email)->exists()) {
            return response()->json(['message' => 'Email already registered'], 400);
        }

        // Generate OTP
        $otp = rand(100000, 999999);

        // Store or update OTP in otp_verifications table
        OtpVerification::updateOrCreate(
            ['email' => $email],
            [
                'otp' => $otp,
                'expires_at' => Carbon::now()->addMinutes(10),
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

        return response()->json(['success' => true, 'message' => 'OTP sent to email']);
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
        return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
    }

    $otpRecord = OtpVerification::where('email', $request->contact_email)
        ->where('otp', $request->otp)
        ->first();

    if (!$otpRecord) {
        return response()->json(['success' => false, 'message' => 'Invalid OTP'], 400);
    }

    if (Carbon::now()->gt($otpRecord->expires_at)) {
        return response()->json(['success' => false, 'message' => 'OTP has expired'], 400);
    }

    // OTP is valid; delete the OTP record
    $otpRecord->delete();

    // Generate a session token to use during signup
    $sessionToken = Str::random(60);

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
            'session_token' => 'required|string',
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

        // Verify session token (optional, depending on your flow)
        // For simplicity, we assume the session_token was returned during verifyOtp
        // You can add additional checks if needed

        $employer = Employer::create([
            'name' => $request->name,
            'company_name' => $request->company_name,
            'company_location' => $request->company_location,
            'contact_person' => $request->contact_person,
            'contact_email' => $request->contact_email,
            'contact_phone' => $request->contact_phone,
            'password' => Hash::make($request->password),
            'email_verified_at' => now(),
            'session_token' => $request->session_token,
        ]);

        $token = $employer->createToken('EmployerToken')->plainTextToken;

        return response()->json([
            'message' => 'Employer account created successfully',
            'token' => $token,
            'session_token' => $employer->session_token,
        ], 201);
    }

    /**
     * Employer login
     */
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'contact_email' => 'required|email',
            'password' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $employer = Employer::where('contact_email', $request->contact_email)->first();

        if (!$employer || !Hash::check($request->password, $employer->password)) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        if (!$employer->email_verified_at) {
            return response()->json(['message' => 'Email not verified'], 403);
        }

        if (!$employer->is_verified) {
            return response()->json(['message' => 'Awaiting admin approval'], 403);
        }

        // Generate a new session token
        $sessionToken = Str::random(60);
        $employer->update(['session_token' => $sessionToken]);

        $token = $employer->createToken('EmployerToken')->plainTextToken;

        return response()->json([
            'token' => $token,
            'session_token' => $sessionToken,
        ]);
    }

    /**
     * Get employer profile
     */
    public function profile(Request $request)
    {
        $employer = auth()->user();

        if ($employer->session_token !== $request->header('Session-Token')) {
            return response()->json(['message' => 'Invalid session token'], 401);
        }

        return response()->json($employer);
    }

    /**
     * Employer logout
     */
    public function logout(Request $request)
    {
        $employer = auth()->user();
        $employer->update(['session_token' => null]);
        $employer->tokens()->delete();

        return response()->json(['message' => 'Logged out successfully']);
    }

}