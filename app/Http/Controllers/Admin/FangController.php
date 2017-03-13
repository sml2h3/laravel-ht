<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FangController extends Controller
{
    public function fadd_page(){
        return view('fadd',['activeMenu' => 'fadd']);
    }
}
