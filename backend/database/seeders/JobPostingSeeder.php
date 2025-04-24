<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\JobPosting;
use App\Models\Employer;
use Carbon\Carbon;
class JobPostingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $techverse = Employer::where('company_name', 'Techverse Pvt Ltd')->first();
        $medicare = Employer::where('company_name', 'MediCare Solutions')->first();

        JobPosting::create([
            'employer_id' => $techverse->id,
            'job_title' => 'Frontend Developer',
            'job_type' => 'Full-Time',
            'location' => 'Bangalore',
            'work_location_type' => 'Work from Office',
            'compensation' => '6-8 LPA',
            'pay_type' => 'Salary',
            'joining_fee' => false,
            'basic_requirements' => 'Strong knowledge of HTML, CSS, JavaScript, React',
            'additional_requirements' => json_encode(['Team collaboration', 'Good communication']),
            'job_description' => 'Develop UI components and work closely with backend developers.',
            'is_walkin_interview' => false,
            'communication_preference' => 'Email',
            'total_experience_required' => 2,
            'other_job_titles' => json_encode(['UI Developer', 'JavaScript Developer']),
            'degree_specialization' => json_encode(['B.Tech in Computer Science', 'MCA']),
            'job_expire_time' => 7,
            'number_of_candidates_required' => 2,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
        ]);

        JobPosting::create([
            'employer_id' => $medicare->id,
            'job_title' => 'Medical Billing Executive',
            'job_type' => 'Full-Time',
            'location' => 'Mumbai',
            'work_location_type' => 'Hybrid',
            'compensation' => '3-4 LPA',
            'pay_type' => 'Salary',
            'joining_fee' => false,
            'basic_requirements' => 'Good knowledge of medical billing terminology',
            'additional_requirements' => json_encode(['Night shift availability']),
            'job_description' => 'Handle medical insurance claims and communicate with clients.',
            'is_walkin_interview' => true,
            'communication_preference' => 'Phone',
            'total_experience_required' => 1,
            'other_job_titles' => json_encode(['Billing Executive']),
            'degree_specialization' => json_encode(['B.Sc in Life Sciences', 'BBA']),
            'job_expire_time' => 10,
            'number_of_candidates_required' => 3,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
        ]);
    }
}
