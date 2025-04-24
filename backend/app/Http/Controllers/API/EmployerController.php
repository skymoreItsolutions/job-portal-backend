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
