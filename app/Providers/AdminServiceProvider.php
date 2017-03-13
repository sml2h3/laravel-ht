<?php
/**
 * Created by PhpStorm.
 * User: wenanzhe
 * Date: 17/3/6
 * Time: 16:56
 */

namespace App\Providers;
use Illuminate\Support\ServiceProvider;

class AdminServiceProvider extends ServiceProvider
{
    /**
     * 在容器中注册绑定.
     *
     * @return void
     * @author sml2h3
     */
    public function boot()
    {
        // 使用基于类的composers...
        view()->composer(
            'base', 'App\Http\ViewComposer\BaseComposer'
        );

    }

    /**
     * 注册服务提供者.
     *
     * @return void
     */
    public function register()
    {

        //
    }
}