<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    use HasFactory;

    public $fillable = ['car_id', 'user_id', 'mark_id', 'model_id', 'car_register_number', 'car_created_at', 'car_updated_at', 'car_status' ];
}
