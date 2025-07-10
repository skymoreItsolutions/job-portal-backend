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


      public function updateEmployer(Request $request)
    {
        // Get the authenticated employer
        $employer = Auth::guard('employer-api')->user();

        if (!$employer) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized',
            ], 401);
        }

        // Validate the request
        $validator = Validator::make($request->all(), [
            'name' => 'sometimes|string|max:255',
            'company_name' => 'sometimes|string|max:255',
            'company_location' => 'sometimes|string|max:255',
            'contact_person' => 'sometimes|string|max:255',
            'contact_phone' => 'sometimes|string|max:20',
            'gst_number' => 'sometimes|string|max:15',
            'gst_certificate' => 'sometimes|file|mimes:pdf|max:2048', // PDF, max 2MB
            'company_pan_card' => 'sometimes|file|mimes:pdf|max:2048', // PDF, max 2MB
            'password' => 'sometimes|string|min:6',
        ], [
            'gst_certificate.mimes' => 'The GST certificate must be a PDF file.',
            'company_pan_card.mimes' => 'The company PAN card must be a PDF file.',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        // Handle file uploads
        $gstCertificatePath = $employer->gst_certificate;
        $companyPanCardPath = $employer->company_pan_card;

        if ($request->hasFile('gst_certificate') && $request->file('gst_certificate')->isValid()) {
            $filename = 'gst_' . time() . '_' . $request->file('gst_certificate')->getClientOriginalName();
            $gstCertificatePath = $request->file('gst_certificate')->storeAs('documents', $filename, 'public');
        }

        if ($request->hasFile('company_pan_card') && $request->file('company_pan_card')->isValid()) {
            $filename = 'pan_' . time() . '_' . $request->file('company_pan_card')->getClientOriginalName();
            $companyPanCardPath = $request->file('company_pan_card')->storeAs('documents', $filename, 'public');
        }

        // Prepare data for update
        $updateData = [
            'name' => $request->input('name', $employer->name),
            'company_name' => $request->input('company_name', $employer->company_name),
            'company_location' => $request->input('company_location', $employer->company_location),
            'contact_person' => $request->input('contact_person', $employer->contact_person),
            'contact_phone' => $request->input('contact_phone', $employer->contact_phone),
            'gst_number' => $request->input('gst_number', $employer->gst_number),
            'gst_certificate' => $gstCertificatePath,
            'company_pan_card' => $companyPanCardPath,
        ];

        // Update password if provided
        if ($request->has('password')) {
            $updateData['password'] = Hash::make($request->password);
        }

        // Update employer record
        $employer->update($updateData);

        return response()->json([
            'success' => true,
            'message' => 'Employer profile updated successfully',
            'data' => $employer->fresh(), // Retrieve fresh instance to include updated data
        ], 200);
    }

}