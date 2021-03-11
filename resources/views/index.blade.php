@extends('layouts.app')
@section('title', 'Home')
@section('content')

Welcome {{ $data['user_email'] }} 
</br></br></br>
<textarea name="message_text" rows=5 cols=100></textarea>
<div class="clear"></clear>



@endsection