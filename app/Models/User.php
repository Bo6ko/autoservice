<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\DB;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function create( $data ) {
        extract($data);
        DB::table('users')->insert([
            'user_name'  => $user_name,
            'user_email' => $user_email,
            'user_phone' => $user_phone,
            'user_password' => $user_password,
            'user_created_at' => date('Y-m-d H:i:s'),
            'user_role'  => $user_role   
        ]);
    }

    public function getAllUsers() {
        $users = DB::table('users')->get();
        return $users;
    }

    public static function getByEmail( $user_email ) {
        $user = DB::table('users')->where(['user_email' => $user_email])->get();
        return $user;
    }

    public function isExistsByEmail( $user_email ) {
        $user = DB::table('users')->where(['user_email' => $user_email])->get();
        if ( count($user) > 0 ) {
            return true;
        }
        return false;
    }

    public function isSuccessfullyLogin( $user_email, $user_password ) {
        $user = DB::table('users')->where(['user_email' => $user_email, 'user_password' => $user_password])->get();
        if ( count($user) > 0 ) {
            return true;
        }
        return false;
    }

    public function registerValidation( $data ) {

        extract( $data );
        $err = array();
        $isExistUser = $this->isExistsByEmail( $user_email );

        if ( empty($user_name) || strlen($user_name) < 4 ) {
            $err['user_name'] = 'This field is required and must be more than 3 symbols!';
        }

        if ( $isExistUser ) {
            $err['user_email'] = 'This email already exists!';
        }
        if (!filter_var($user_email, FILTER_VALIDATE_EMAIL)) {
            $err['user_email'] = "Invalid email format";
        }
        if ( empty($user_email) || strlen($user_email) < 4 ) {
            $err['user_email'] = 'This field is required and must be more than 3 symbols!';
        }

        if ( empty($user_phone) || strlen($user_phone) < 4 ) {
            $err['user_phone'] = 'This field is required!';
        }

        if ( empty($user_password) || strlen($user_password) < 4 ) {
            $err['user_password'] = 'This field is required and must be more than 3 symbols!';
        }

        if ($user_password != $user_repeat_password) {
            $err['password_not_equal'] = 'Fields: password and repeat password are not equal!';
        }   

        if ( !empty($err) ) {
            return [
                'isValid' => false,
                'err'     => $err  
            ];
        }

        return ['isValid' => true,];
    }
}
