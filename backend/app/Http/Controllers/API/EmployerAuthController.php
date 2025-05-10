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

class EmployerAuthController extends Controller
{


     public function signup(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'contact_email' => 'required|email|unique:employers',
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

        $otp = rand(100000, 999999);
        $sessionToken = Str::random(60); // Generate a unique session token

        $employer = Employer::create([
            'name' => $request->name,
            'company_name' => $request->company_name,
            'company_location' => $request->company_location,
            'contact_person' => $request->contact_person,
            'contact_email' => $request->contact_email,
            'contact_phone' => $request->contact_phone,
            'password' => Hash::make($request->password),
            'otp' => $otp,
            'session_token' => $sessionToken,
        ]);

        Mail::to($request->contact_email)->send(new SendOtpMail($otp));
        return response()->json([
            'message' => 'OTP sent to email',
            'otp' => $otp,
            'session_token' => $sessionToken
        ], 201);
    }

    public function verifyOtp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'contact_email' => 'required|email',
            'otp' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $employer = Employer::where('contact_email', $request->contact_email)->first();

        if (!$employer || $employer->otp !== $request->otp) {
            return response()->json(['message' => 'Invalid OTP'], 400);
        }

        $employer->update([
            'email_verified_at' => now(),
            'otp' => null,
        ]);

        return response()->json([
            'message' => 'Email verified successfully',
            'session_token' => $employer->session_token
        ]);
    }

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

        // Generate a new session token on login
        $sessionToken = Str::random(60);
        $employer->update(['session_token' => $sessionToken]);

        $token = $employer->createToken('EmployerToken')->plainTextToken;

        return response()->json([
            'token' => $token,
            'session_token' => $sessionToken
        ]);
    }

    public function profile(Request $request)
    {
        $employer = auth()->user();

        // Verify session token
        if ($employer->session_token !== $request->header('Session-Token')) {
            return response()->json(['message' => 'Invalid session token'], 401);
        }

        return response()->json($employer);
    }

    public function logout(Request $request)
    {
        $employer = auth()->user();

        // Invalidate session token
        $employer->update(['session_token' => null]);
        $employer->tokens()->delete(); // Revoke all Sanctum tokens

        return response()->json(['message' => 'Logged out successfully']);
    }

}
