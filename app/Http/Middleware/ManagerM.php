<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Crypt;
use App\Http\Models\Manager;
class ManagerM
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $coo2 = Cookie::get('sid');
        if($coo2 == null){
            return redirect()->to('admin/login');
        }
        if($coo2 != null){
            $info = json_decode(Crypt::decrypt($coo2));
            if (isset($info->username) && isset($info->password)){
                $result = Manager::where('username',$info->username)->first();
                if(Crypt::decrypt($result->password) == $info->password){
                }else{
                    return redirect()->to('admin/login');
                }
            }else{
                return redirect()->to('admin/login');
            }
        }
        return $next($request);
    }
}
