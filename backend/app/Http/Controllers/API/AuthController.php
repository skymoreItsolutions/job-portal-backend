<?php

namespace App\Http\Controllers\API;

use App\Models\Candidate;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Carbon\Carbon;
use App\Mail\SendOtpMail;
class AuthController extends Controller
{
    // Signup Route
    public function signup(Request $request)
    {
        $request->validate([
            'email' => 'required|email|unique:candidates,email',
            'full_name' => 'required|string|max:255',
        ]);

        $candidate = Candidate::create([
            'email' => $request->email,
            'full_name' => $request->full_name,
            'active_user' => 1,
        ]);

        return response()->json(['message' => 'Signup successful', 'user' => $candidate], 201);
    }

      
    public function sendOtp(Request $request)
{
    // Validate the email input
    $request->validate([
        'email' => 'required|email',
    ]);

    // Generate a random OTP
    $otp = rand(100000, 999999);

    // Check if the candidate already exists
    $candidate = Candidate::where('email', $request->email)->first();

    if ($candidate) {
        // If candidate exists, update the OTP and expiration time
        $candidate->otp = $otp;
        $candidate->otp_expires_at = Carbon::now()->addMinutes(10);
        $candidate->save();
    } else { 
        // If candidate does not exist, create a new record
        $candidate = new Candidate();
        $candidate->email = $request->email;
        $candidate->otp = $otp;
        $candidate->otp_expires_at = Carbon::now()->addMinutes(10);
        $candidate->save();
    }

    try {
        // Send OTP to the user's email
        Mail::to($request->email)->send(new SendOtpMail($otp));
    } catch (\Exception $e) {
        // If sending mail fails, return an error response
        return response()->json(["success"=>false,'message' => 'Failed to send OTP', 'error' => $e->getMessage()], 500);
    }

    // Return the OTP as a response
    return response()->json(["success" => true]);
}



    

    


    public function verifyOtp(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'otp' => 'required|numeric',
        ]);

        $candidate = Candidate::where('email', $request->email)->first();

        if ($candidate->otp != $request->otp) {
            return response()->json(["success"=>false,'message' => 'Invalid OTP'], 401);
        }

        if (Carbon::now()->gt($candidate->otp_expires_at)) {
            return response()->json(["success"=>false,'message' => 'OTP expired'], 401);
        }

        // clear otp after success login
        $token = Str::random(60);
        $candidate->otp = null;
        $candidate->otp_expires_at = null;
        $candidate->last_login = Carbon::now();
        $candidate->token=$token;
        $candidate->save();

        // Generate simple token (you can use Sanctum or Passport for real app)
        
         
        return response()->json([
            "success"=>true,
            'message' => 'Login successful',
            'token' => $token,
            'user' => $candidate
        ]);
    }
}