<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Student; 
use App\Models\ParentDetail; 
use App\Models\EmploymentDetail; 
use App\Models\ReferralDetail; 
use App\Models\Document; 
use Log;
use Carbon\Carbon;
use DB;
use Storage;


class StudentController extends Controller
{
    public function createStudent(Request $request)
    {

        Log::info($request->contactNo);

        // Validate the request data  
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'dob' => 'required|date', 
            'nationality' => 'required|string|max:255',
            'contactNo' => 'required|string|size:10', 
            'email' => 'required|string|email|max:255', 
            'aadharNo' => 'required|string|size:12', 
            'residentialAddress' => 'required|string|max:255',
            'stateName' => 'required|string|max:255',
            'city' => 'required|string|max:255',
            'pin' => 'required|string|size:6', 
            'program' => 'required', 
            'specialization' => 'required', 
        ]); 
        
       

       
        // store students data
        $student = new Student();

        $student->name = $request->name;
        $student->dob = Carbon::parse($request->dob)->format('Y-m-d');       
        $student->nationality = $request->nationality;
        $student->mobile = $request->contactNo;
        $student->email = $request->email;
        $student->aadhar_no = $request->aadharNo;
        $student->address = $request->residentialAddress;
        $student->state = $request->stateName;
        $student->city = $request->city;
        $student->pin = $request->pin;
        $student->qualification = $request->highestQualification;
        $student->year_completion = $request->yearCompletion;
        $student->college = $request->schoolName;
        $student->college_city = $request->schoolCity;
        $student->college_board = $request->schoolBoard;
        $student->employment_status = $request->employmentStatus;        
        $student->program = $request->program;
        $student->specialization = $request->specialization;
        $student->study_mode = $request->studyMode;
        $student->referral_channel = $request->referral;
        $student->created_at = Carbon::now();
        $student->save();


        if ($student->id > 0) {


            // Save parent details
            $parent = new ParentDetail();
            $parent->student_id = $student->id;
            $parent->name = $request->parentName;
            $parent->relation = $request->parentRelation;
            $parent->mobile = $request->parentContactNo;
            $parent->email = $request->parentEmail;
            $parent->created_at = Carbon::now();
            $parent->save();


            // Save employment details
            if($request->employmentStatus==2)
            {
                $employment = new EmploymentDetail();

                $employment->student_id = $student->id;
                $employment->organization = $request->employeeOrganization;
                $employment->role = $request->employeeRole;
                $employment->created_at = Carbon::now();
                $employment->save();
            }

            // Save referral details
            if($request->referral==5)
            {
                $referral = new ReferralDetail();

                $referral->student_id = $student->id;
                $referral->name = $request->referralName;
                $referral->mobile = $request->referralContactNo;
                $referral->program = $request->referralProgram;
                $referral->batch_year = $request->referralBatch;
                $referral->created_at = Carbon::now();
                $referral->save();
            }



            // Store documents
            if ($request->hasFile('aadharCopy') && $request->file('aadharCopy')->isValid()) {
                
                $path = $request->file('aadharCopy')->store($student->id, 'public');

                if($path)
                {

                    $aadhar_doc = new Document();

                    $aadhar_doc->student_id = $student->id;
                    $aadhar_doc->tittle = 'Aadhar Copy';
                    $aadhar_doc->path = $path;
                    $aadhar_doc->created_at = Carbon::now();
                    $aadhar_doc->save();       
                }        
            }

            if ($request->hasFile('bonafideCertificate') && $request->file('bonafideCertificate')->isValid()) {
                
                $path = $request->file('bonafideCertificate')->store($student->id, 'public');
    
                if($path)
                {
                    $bonafide_doc = new Document();

                    $bonafide_doc->student_id = $student->id;
                    $bonafide_doc->tittle = 'Bonafide Certificate';
                    $bonafide_doc->path = $path;
                    $bonafide_doc->created_at = Carbon::now();
                    $bonafide_doc->save();
                }
            }

            if ($request->hasFile('casteCertificate') && $request->file('casteCertificate')->isValid()) {
                
                $path = $request->file('casteCertificate')->store($student->id, 'public');
    
                if($path)
                {
                    $caste_doc = new Document();

                    $caste_doc->student_id = $student->id;
                    $caste_doc->tittle = 'Caste Certificate';
                    $caste_doc->path = $path;
                    $caste_doc->created_at = Carbon::now();
                    $caste_doc->save();
                }
            }

            if ($request->hasFile('degreeProvisional') && $request->file('degreeProvisional')->isValid()) {
                
                $path = $request->file('degreeProvisional')->store($student->id, 'public');
    
                if($path)
                {
                    $provisional_doc = new Document();

                    $provisional_doc->student_id = $student->id;
                    $provisional_doc->tittle = 'Degree Provisional';
                    $provisional_doc->path = $path;
                    $provisional_doc->created_at = Carbon::now();
                    $provisional_doc->save();
                }
            }

            if ($request->hasFile('degreeConsolidated') && $request->file('degreeConsolidated')->isValid()) {
                
                $path = $request->file('degreeConsolidated')->store($student->id, 'public');
    
                if($path)
                {
                    $consolidated_doc = new Document();

                    $consolidated_doc->student_id = $student->id;
                    $consolidated_doc->tittle = 'Degree Consolidated';
                    $consolidated_doc->path = $path;
                    $consolidated_doc->created_at = Carbon::now();
                    $consolidated_doc->save();
                }
            }

            if ($request->hasFile('degreeMigration') && $request->file('degreeMigration')->isValid()) {
                
                $path = $request->file('degreeMigration')->store($student->id, 'public');
    
                if($path)
                {
                    $degree_migration = new Document();

                    $degree_migration->student_id = $student->id;
                    $degree_migration->tittle = 'Degree Migration';
                    $degree_migration->path = $path;
                    $degree_migration->created_at = Carbon::now();
                    $degree_migration->save();
                }
            }

            if ($request->hasFile('degreeTc') && $request->file('degreeTc')->isValid()) {
                
                $path = $request->file('degreeTc')->store($student->id, 'public');
    
                if($path)
                {
                    $degree_tc = new Document();

                    $degree_tc->student_id = $student->id;
                    $degree_tc->tittle = 'Degree TC';
                    $degree_tc->path = $path;
                    $degree_tc->created_at = Carbon::now();
                    $degree_tc->save();
                }
            }

            if ($request->hasFile('migrationCertificate') && $request->file('migrationCertificate')->isValid()) {
                
                $path = $request->file('migrationCertificate')->store($student->id, 'public');
    
                if($path)
                {
                    $migration_doc = new Document();

                    $migration_doc->student_id = $student->id;
                    $migration_doc->tittle = 'Migration Certificate';
                    $migration_doc->path = $path; 
                    $migration_doc->created_at = Carbon::now();
                    $migration_doc->save();
                }
            }

            if ($request->hasFile('photoCopy') && $request->file('photoCopy')->isValid()) {
                
                $path = $request->file('photoCopy')->store($student->id, 'public');
    
                if($path)
                {
                    $photocopy = new Document();

                    $photocopy->student_id = $student->id;
                    $photocopy->tittle = 'Photocopy';
                    $photocopy->path = $path;
                    $photocopy->created_at = Carbon::now();
                    $photocopy->save();
                }
            }

            if ($request->hasFile('tenthCertificate') && $request->file('tenthCertificate')->isValid()) {
                
                $path = $request->file('tenthCertificate')->store($student->id, 'public');
    
                if($path)
                {
                    $tenth_certificate = new Document();

                    $tenth_certificate->student_id = $student->id;
                    $tenth_certificate->tittle = 'Tenth Certificate';
                    $tenth_certificate->path = $path;
                    $tenth_certificate->created_at = Carbon::now();
                    $tenth_certificate->save();
                }
            }

            if ($request->hasFile('twelthCertificate') && $request->file('twelthCertificate')->isValid()) {
                
                $path = $request->file('twelthCertificate')->store($student->id, 'public');
    
                if($path)
                {
                    $twelth_certificate = new Document();

                    $twelth_certificate->student_id = $student->id;
                    $twelth_certificate->tittle = 'Twelth Certificate';
                    $twelth_certificate->path = $path;
                    $twelth_certificate->created_at = Carbon::now();
                    $twelth_certificate->save();
                }
            }

            if ($request->hasFile('twelthTc') && $request->file('twelthTc')->isValid()) {
                
                $path = $request->file('twelthTc')->store($student->id, 'public');
    
                if($path)
                {
                    $twelth_tc = new Document();

                    $twelth_tc->student_id = $student->id;
                    $twelth_tc->tittle = 'Twelth TC';
                    $twelth_tc->path = $path;
                    $twelth_tc->created_at = Carbon::now();
                    $twelth_tc->save();
                }
            }
    
    


            return response()->json([
                'message' => 'Student data saved successfully!'
              //  'student' => $student
            ], 200);


        } else {


            return response()->json([
                'message' => 'Failed to save student data.'
            ], 500);
        }
    }

    public function getStudentDetails(Request $request)
    {
        
        // set per page count
        $perPage = $request->input('per_page', 10);

        // get students dat
        $students = Student::select('students.id','students.name as student_name',
        DB::raw("DATE_FORMAT(students.dob,'%d-%m-%Y') as dob"),
        'students.nationality',
        'students.mobile',
        'students.email',
        'students.aadhar_no',
        'students.address',
        'students.state',
        'students.city',
        'students.pin',
        'students.qualification',
        'students.year_completion',
        'students.college',
        'students.college_city',
        'students.college_board',
        'students.program',
        'students.specialization',
        'students.study_mode',
        'students.referral_channel',
        DB::raw("DATE_FORMAT(students.created_at,'%d-%m-%Y') as created_at"),
        'parent_details.name as parent_name',
        'parent_details.relation',
        'parent_details.mobile as parent_mobile',
        'parent_details.email as parent_email',
        'employment_details.organization',
        'employment_details.role',
        'referral_details.name as referral_name',
        'referral_details.mobile as referral_mobile',
        'referral_details.program as referral_program',
        'referral_details.batch_year as referral_batch')
        ->leftJoin('parent_details','students.id','parent_details.student_id')
        ->leftJoin('employment_details','students.id','employment_details.student_id')
        ->leftJoin('referral_details','students.id','referral_details.student_id')
        ->orderBy('students.id', 'desc') 
        ->paginate($perPage); 
        
        
        if($students)
        {
            foreach($students as $student)
            {
                // Get documents
                $documents = Document::select('tittle','path')
                ->where('student_id', $student->id) 
                ->orderBy('tittle', 'asc') 
                ->get(); 

                if($documents)
                {
                    foreach ($documents as $document) {

                        // Generate the full URL to the document using Storage::url()
                         // $document->path = url(Storage::url($document->path));

                         $document->path = url(Storage::url($document->path));

                         Log::info($document->path);
                         


                     
       

                    }        
                   
                    $student->documents = $documents;
                }
            }
        }

        if ($students->isNotEmpty()) {
            return response()->json([
                'message' => 'Students data retrieved successfully!',
                'data' => $students,
            ], 200);
        } else {
            return response()->json([
                'message' => 'No students found.',
            ], 404);
        }        
    }
}
