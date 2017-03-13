<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Crypt;
use App\Http\Models\Manager;

class LoginController extends Controller
{
    public function index(Request $request){
        $coo = Cookie::get('user_token');
        $coo2 = Cookie::get('sid');
        $bool = False;
        if($coo == null && $coo2 == null){
            return redirect()->to('admin/login');
        }
        if($coo2 != null){
            $info = json_decode(Crypt::decrypt($coo2));
            if (isset($info->username) && isset($info->password)){
                $result = Manager::where('username',$info->username)->first();
                if(Crypt::decrypt($result->password) == $info->password){
                    $bool = True;
                }else{
                    return redirect()->to('admin/login');
                }
            }else{
                return redirect()->to('admin/login');
            }
        }
        if($coo != null && $bool === False){
            $token = Crypt::decrypt($coo);
            $result = Manager::where('remtoken',$token)->first();
            if(!$result){
                return redirect()->to('admin/login');
            }
        }
        return $this->showindex($result);
    }

    private function showindex($info){
        return view('base',['activeMenu'=>'index']);
    }

    public function login(Request $request){
        $username = $request->get('username');
        $password = $request->get('password');
        $isrem = $request->get('isrem');
        $result = Manager::where('username',$username)->first();
        if(Crypt::decrypt($result->password) === $password){
            $token = Crypt::encrypt($username);
            if($isrem === 'on'){
                Manager::where('username',$username)->update(['remtoken'=>$token]);
                Cookie::queue('user_token',$token);
            }
            $array = array(
                'username' => $username,
                'password' => $password
            );
            Cookie::queue('sid',Crypt::encrypt(json_encode($array)),60);
            return redirect()->to('admin/index');
        }else{
            return redirect()->back();
        }
    }
}
