<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Services\Business\UserBS;
use App\Models\UserModel;
use App\Models\MoreinfoModel;
use App\Services\Business\JobListBS;
use App\Models\JobListingModel;
use App\Models\UserPortfolioModel;

class UserController extends Controller
{
    // Direct route to admin page
    public function index()
    {
       
    }
    
    
    // Method to add additional user info
    public function addNewInfo(Request $request)
    {
        $moreInfoData = new MoreInfoModel(request()->get('age'), request()->get('gender'),request()->get('phonenumber'),request()->get('address'));
        
        $bs = new UserBS();
        
        $id = Auth::user()->id;
        
        $isValid = $bs->addNewInfo($moreInfoData, $id);
        
        if($isValid)
        {
            echo("customer data added!");
            return view('home');
        }
        else
        {
            echo("customer data not added. you got it next time!");
            return view('moreinfo');
        }
        
    }
       
    public function addUserPortfolio(Request $request)
    {
        $id = Auth::user()->id;
        
        $jobSkills = request()->get('jobSkills');
        $jobHistory = request()->get('jobHistory');
        $education = request()->get('education');
        $temp = new UserPortfolioModel($jobSkills, $jobHistory, $education);
        
        $bs = new UserBS();
        $bs->addUserPortfolio($temp, $id);
        
        $portfolio = $bs->getUserPortfolio($id);
        return View('/displayUserPortfolio')->with('portfolio', $portfolio);
       
    }
}
