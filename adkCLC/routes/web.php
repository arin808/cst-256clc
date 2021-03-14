<?php

use App\Http\Controllers\AdminController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');


Route::get('/SecurityReroute', function(){
    return view('SecurityReroute');
});
    
Route::get('/suspendedUser', function(){
    return view('suspendedUser');
});

Route::get('/customer', function(){
    echo "Hello customer";
})->middleware('customer');

Route::get('/suspended', function(){
    echo "Hello suspended user";
})->middleware('suspended');

Route::get('blank', function(){
    return View('blankEditUser');
});

//===================Admin Routes======================

Route::get('/admin', 'AdminController@index');

Route::post('/editView', 'AdminController@editView');

Route::post('/editUser', 'AdminController@editUser');

Route::post('/suspend', 'AdminController@suspend');

Route::post('/delete', 'AdminController@delete');

Route::post('viewUser', 'AdminController@details');

Route::get('/moreinfo', function(){
    return view('userPages\moreinfo');
});
//==================Portfolio Management=================
Route::post('/addNewInfo', 'UserController@addNewInfo');
Route::get('/userPortfolio', function(){
    return view('userPages\userPortfolio');
});
    
Route::post('/addUserPortfolio', 'UserController@addUserPortfolio');

//=================Job Listing Routes=================

Route::get('/jobAdmin', 'AdminController@jobAdmin');

Route::get('/addJob', function(){
    if(Auth::user()->role=='admin')
    {
        return view('addJobListing');
    } 
    else 
    {
        return view('securityReroute');
    }
});

Route::post('/addJobListing', 'AdminController@addJob');

Route::post('/editJobView', 'AdminController@editJob');

Route::post('/editJobData', 'AdminController@editJobData');

Route::post('/deleteJob', 'AdminController@deleteJob');


//=======================Group Routes========================
Route::get('/adminGroup', 'AdminController@adminGroup');

Route::get('/addGroupView', function(){
    return view('addGroup');
});

Route::post('/addGroup', 'AdminController@addGroup');

Route::post('/viewGroup', 'AdminController@viewGroupMembers');

Route::post('/editGroupView','AdminController@editGroupView');

Route::post('/editGroup', 'AdminController@editGroup');

Route::post('/deleteGroup', 'AdminController@deleteGroup');

Route::post('/getMembers', 'AdminController@getMembers');
//================User Group Controllers=======================

Route::get('/groups', 'GroupController@userGroupView' );

Route::post('/joinGroup', 'GroupController@joinGroup');

Route::post('/leaveGroup', 'GroupController@leaveGroup');

Route::post('/viewGroup', 'GroupController@viewGroupMembers');

