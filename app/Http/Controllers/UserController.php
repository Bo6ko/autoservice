<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\UserRole;

class UserController extends Controller
{
/**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        return view('user.login');
    }

    public function all_users(Request $request)
    {
        if ( empty($request->session()->get('user_email')) ) {
            return view('user.login');
        }
        $user = new User();
        $users = $user->getAllUsers();

        return view('user.all_users', ['users' => $users]);
    }

    public function login(Request $request)
    {
        return view('user.login');
    }
    public function login_post(Request $request)
    {
        extract($request->post());
        $err = array();
        $user = new User();
        $isSuccessfullyLogin = $user->isSuccessfullyLogin( $user_email, $user_password );

        if ( !$isSuccessfullyLogin ) {
            $err['wrong_login'] = 'Your email or password are wrong!';
        }

        if ( empty($err) ) {
            $request->session()->put('user_email', $user_email);
            return view('index',
            [
                'data' => $request->post()
            ]);
        }
        return view('user.login',
        [
            'data' => $request->post(),
            'err'  => $err,
        ]);
    }

    public function logout(Request $request)
    {
        $request->session()->forget('user_email');
        return view('user.login');
    }

    public function register(Request $request)
    {
        $user_roles = UserRole::getAll();
        return view('user.register', ['user_roles' => $user_roles]);
    }
    public function register_post(Request $request)
    {
        extract($request->post());
        $user = new User();

        $registerValidation = $user->registerValidation( $request->post() );

        if ( $registerValidation['isValid'] && empty($registerValidation['err']) ) {
            $user->create( $request->post() );

            return view('user.login', 
                [
                    'data'=> $request->post(),
                    'success_register' => true
                ]
            );
        }        

        return view('user.register', 
            [
                'data'=> $request->post(),
                'err' => $registerValidation['err']
            ]
        );
    }



}