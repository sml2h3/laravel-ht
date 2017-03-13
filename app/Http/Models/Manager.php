<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;

class Manager extends Model
{
    protected $table = "managers";
    protected $primaryKey = 'Id';
    public $timestamps = false;
}
