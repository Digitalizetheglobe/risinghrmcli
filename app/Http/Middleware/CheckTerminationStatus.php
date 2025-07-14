<?php

namespace App\Http\Middleware;

use App\Models\Termination;
use App\Models\Employee;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckTerminationStatus
{
    public function handle(Request $request, Closure $next)
    {
        // Only check for employee users
        if (Auth::check() && Auth::user()->type == 'employee') {
            $employee = Employee::where('user_id', Auth::id())->first();
            
            if ($employee) {
                $termination = Termination::where('employee_id', $employee->id)
                    ->whereDate('termination_date', '<=', now())
                    ->first();
                
                if ($termination) {
                    Auth::logout();
                    return redirect()->route('login')->with('error', __('Your account has been terminated. Please contact administrator.'));
                }
            }
        }

        return $next($request);
    }
}