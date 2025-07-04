<?php

namespace Modules\LandingPage\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Modules\LandingPage\Entities\LandingPageSetting;


class LandingPageController extends Controller
{
    
    public function home()
    {
        // Directly return the pricing view without authentication check
        return view('landingpage::layouts.home'); // Ensure this view exists
    }


    public function pricing()
    {
        // Directly return the pricing view without authentication check
        return view('landingpage::layouts.pricing'); // Ensure this view exists
    }

    public function contact()
    {
        // Directly return the pricing view without authentication check
        return view('landingpage::layouts.contact'); // Ensure this view exists
    }

    public function blog()
    {
        // Directly return the pricing view without authentication check
        return view('landingpage::layouts.blog'); // Ensure this view exists
    }

    public function privacy()
    {
        // Directly return the pricing view without authentication check
        return view('landingpage::layouts.privacy'); // Ensure this view exists
    }
    
    
    public function blog1()
    {
        // Directly return the pricing view without authentication check
        return view('landingpage::layouts.blog1'); // Ensure this view exists
    }

    public function blog2()
    {
        // Directly return the pricing view without authentication check
        return view('landingpage::layouts.blog2'); // Ensure this view exists
    }

    public function blog3()
    {
        // Directly return the pricing view without authentication check
        return view('landingpage::layouts.blog3'); // Ensure this view exists
    }

    public function blog4()
    {
        // Directly return the pricing view without authentication check
        return view('landingpage::layouts.blog4'); // Ensure this view exists
    }


    

    
    
    

    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        // if (\Auth::user()->type == 'super admin') {
        //     return view('landingpage::landingpage.topbar');
        // } else {
        //     return redirect()->back()->with('error', 'Permission Denied');
        // }
        return view('layouts.landingpage');
        
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('landingpage::create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {

        $data = [
            "topbar_status" => $request->topbar_status ? $request->topbar_status : "off",
            "topbar_notification_msg" =>  $request->topbar_notification_msg,
        ];

        foreach($data as $key => $value){

            LandingPageSetting::updateOrCreate(['name' =>  $key],['value' => $value]);
        }

        return redirect()->back()->with(['success'=> 'Setting updated successfully']);

    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        return view('landingpage::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        return view('landingpage::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
        //
    }

    
}
