<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class UserRole extends Model
{
    use HasFactory;

    protected $fillable = ['role_id', 'role', 'role_created_at', 'role_updated_at', 'role_status' ];

    public static function getAll() {
        return DB::table('user_roles')->get();
    }
}
