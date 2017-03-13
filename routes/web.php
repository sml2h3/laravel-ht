<?php
Route::group(['prefix' => 'admin'],function (){
    Route::get('index','Admin\LoginController@index');
    Route::get('login',function(){
        return view('login');
    });
    Route::post('login','Admin\LoginController@login');

    Route::group(['middleware'=>'manager'],function(){
        Route::get('fadd','Admin\FangController@fadd_page');
    });
});
