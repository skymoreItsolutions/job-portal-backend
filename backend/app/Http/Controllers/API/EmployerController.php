<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Employer;
class EmployerController extends Controller
{
    
    public function index()
    {
        $employers = Employer::all();
        return response()->json($employers);
    }



    public function store(Request $request)
    {
        $request->validate([
            'company_name' => 'required|string',
            'company_location' => 'required|string',
            'contact_person' => 'required|string',
            'contact_email' => 'required|email',
            'contact_phone' => 'required|string',
        ]);

        $employer = Employer::create($request->all());
        return response()->json($employer, 201);
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
    $candidate = Employer::where('contact_email', $request->email)->first();

    if ($candidate) {
        // If candidate exists, update the OTP and expiration time
        $candidate->otp = $otp;
        $candidate->otp_expires_at = Carbon::now()->addMinutes(10);
        $candidate->save();
    } else { 
        // If candidate does not exist, create a new record
        $candidate = new Employer();
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

    public function show($id)
    {
        $employer = Employer::find($id);

        if (!$employer) {
            return response()->json(['message' => 'Employer not found'], 404);
        }

        return response()->json($employer);
    }

    public function update(Request $request, $id)
    {
        $employer = Employer::find($id);

        if (!$employer) {
            return response()->json(['message' => 'Employer not found'], 404);
        }

        $employer->update($request->all());
        return response()->json($employer);
    }

    public function destroy($id)
    {
        $employer = Employer::find($id);

        if (!$employer) {
            return response()->json(['message' => 'Employer not found'], 404);
        }

        $employer->delete();
        return response()->json(['message' => 'Employer deleted successfully']);
    }
}