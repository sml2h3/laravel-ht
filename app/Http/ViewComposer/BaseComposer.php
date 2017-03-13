<?php

namespace App\Http\ViewComposer;

use Illuminate\Contracts\View\View;
use App\Http\Models\Menu;

class BaseComposer
{
    public function __construct()
    {
        $allMenu = Menu::all();
        $level_1 = array();
        $level_2 = array();
        foreach ($allMenu as $list){
            if( $list->menuLevel == 0 ){
                $level_1[$list->Id] = $list;
            }else{
                $level_2[$list->menuLinkId][] = $list;
            }
        }
        $this->menu = array();
        $this->menu['parent'] = $level_1;
        $this->menu['son'] = $level_2;

    }

    public function compose(View $view){
        $view->with('menulist',$this->menu);
    }
}