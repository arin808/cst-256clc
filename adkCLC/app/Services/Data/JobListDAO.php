<?php
namespace App\Services\Data;

use Carbon\Exceptions\Exception;
use Illuminate\Support\Facades\DB;
use App\Models\JobListingModel;

class JobListDAO
{
    // Define conn string
    private $conn;
    private $servername = "localhost";
    private $username = "root";
    private $password = "root";
    private $dbname = "cst-256";
    private $dbquery;
    private $port = 8889;
    
    public function __construct()
    {
        // Create a connection to db
        $this->conn = mysqli_connect($this->servername, $this->username, $this->password, $this->dbname, $this->port);
        // Make sure to test conn for errors
    }
    
    public function getAllJobs()
    {
        try 
        {            
            $jobs = DB::table('jobs')->get();
            $jobArr = Array();
            foreach ($jobs as $job)
            {
                $jobID = $job->jobID;
                $company = $job->company;
                $position = $job->position;
                $location = $job->location;
                $experience = $job->experience;
                $skills = $job->skills;
                $newJob = new JobListingModel($jobID, $company, $position, $location, $experience, $skills);
                array_push($jobArr, $newJob);
            }
            return $jobArr;
        } 
        catch (Exception $e) 
        {
            echo $e->getMessage();
        }
    }
    
    public function getJob($id)
    {
        try 
        {
            $job = DB::table('jobs')->where('jobID', $id)->first();
            
            $company = $job->company;
            $position = $job->position;
            $location = $job->location;
            $experience = $job->experience;
            $skills = $job->skills;
      
            
            $temp = new JobListingModel($id, $company, $position, $location, $experience, $skills);
            
            return $temp;
        } 
        catch (Exception $e) 
        {
            $e->getMessage();
        }
    }
    public function addJob(JobListingModel $job)
    {
        try 
        {           
            $id = $job->getJobID();
            $company = $job->getCompany();
            $position = $job->getPosition();
            $location = $job->getLocation();
            $experience = $job->getExperience();
            $skills = $job->getSkills();
            
            $values = (['jobID'=> $id, 'company'=> $company, 'position' => $position, 'location' => $location,
                        'experience'=> $experience, 'skills'=> $skills]);
            $result = DB::table('jobs')->insert($values);
            
            if($result > 0)
            {
                mysqli_close($this->conn);
                return true;
            }
            else
            {
                mysqli_close($this->conn);
                return false;
            }
        }
        catch (Exception $e)
        {
            $e->getMessage();
        }
    }
    public function editJob(JobListingModel $job)
    {
        try
        {
            $this->dbquery = "UPDATE jobs SET company='{$job->getCompany()}',
                                position='{$job->getPosition()}', location='{$job->getLocation()}',
                                experience='{$job->getExperience()}', skills='{$job->getSkills()}'
                                WHERE jobID ='{$job->getJobID()}'";
            
            
            // If the selected query returns a result set
            $result = mysqli_query($this->conn, $this->dbquery);
            
            if($result > 0)
            {
                //mysqli_free_result($result);
                mysqli_close($this->conn);
                return true;
            }
            else
            {
                //mysqli_free_result($result);
                mysqli_close($this->conn);
                return false;
            }
            
        }
        catch (Exception $e)
        {
            $e->getMessage();
        }
    }
    
    public function deleteJob($id)
    {
        try
        {
            $result = DB::table('jobs')->where('jobID', $id)->delete();
            
            if($result > 0)
            {
                return true;
            }
            else
            {
               return false; 
            }
        }
        catch (Exception $e)
        {
            $e->getMessage();
        }
    }
}

