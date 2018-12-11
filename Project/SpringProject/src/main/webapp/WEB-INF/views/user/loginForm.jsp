<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>P.Dic | Login</title>

<!-- Bootstrap -->
<link href="resources/css/bootstrap-4.0.0.css" rel="stylesheet">


<script>
//로그인 실패 alert
function checknick() {
   var id = $('#user_id').val();
   var password = $('password').val();
   $.ajax({
      data : {
         user_id : id,
         password : password
      },
      url : "login",
      success : function(data) {
         if (inputed == "" && data == '0') {
            $(".btn-primary").prop("disabled", true);
            $(".btn-primary").css("background-color", "#aaaaaa");
            $("#nickname").css("background-color", "#FFCECE");
            alert("닉네임을 입력해주세요");
            nnameCheck = 0;
         } else if (nnamelength < 2) {
            $(".btn-primary").prop("disabled", true);
            $(".btn-primary").css("background-color", "#aaaaaa");
            $("#nickname").css("background-color", "#FFCECE");
            alert("닉네임은는 2글자 이상부터 사용하실수 있습니다");
            nnameCheck = 0;
         } else if (data == '0') {
            $("#nickname").css("background-color", "#B0F6AC");
            nnameCheck = 1;
            alert("사용가능한 닉네임입니다");
            signupCheck();
         } else if (data == '1') {
            $(".btn-primary").prop("disabled", true);
            $(".btn-primary").css("background-color", "#aaaaaa");
            $("#nickname").css("background-color", "#FFCECE");
            nnameCheck = 0;
            alert("사용중인 닉네임 입니다");

         }
      }
   });
}







</script>





</head>
<body>


   
      <!--top fixed header(not login)-->
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <a class="navbar-brand" href="index">P.Dic</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse"
         data-target="#navbarSupportedContent"
         aria-controls="navbarSupportedContent" aria-expanded="false"
         aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav mr-auto">
            <li class="nav-item active"><a class="nav-link" href="login_form">로그인<span
                  class="sr-only">(current)</span></a></li>
            <li class="nav-item active"><a class="nav-link" href="join_form">회원가입<span
                  class="sr-only">(current)</span></a></li>
            <li class="nav-item"></li>
         </ul>
         <form method="post" action="searchList" class="form-inline my-2 my-lg-0">
         <input name="searchOption" value="main" type="hidden">
            <input class="form-control mr-sm-2" type="search"
               placeholder="Search" aria-label="Search" name="keyword">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
         </form>
      </div>
      </nav>
   
   
   <!--login form-->
   <div class="container" id="login-container"
      style="margin-top: 250px; margin-bottom: 300px;">
      <div class="row justify-content-center">

         <div class="col-md-4 col-sm-4">
            <div class="row">
               <div class="col-12">
                  <h1 class="text-center login-title">P.Dic</h1>
                  <br>
                  <hr>
               </div>
            </div>
            <div class="row">
               <div class="col-12">
                  <div class="account-wall">
                     <form class="form-signin" action="login">
                        <!-- 액션 로그인 폼 -->
                        <input type="text" class="form-control" placeholder="id" name="user_id"
                           required autofocus><br> <input type="password"
                           class="form-control" placeholder="Password" name="password" style="font-family:Arial;" required><br>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">
                           Sign in</button>
                     </form>
                     <!-- 액션 로그인 폼 종료 -->
                  </div>
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-12">
                  <a href="join_form" class="text-center new-account">아직 아이디가
                     없으신가요? 가입하기 </a>      <!-- 가입하기 -->
               </div>
            </div>
         </div>
      </div>


   </div>





   <!--하단 footer-->
   <div class="container-fluid" id="fixedfooter">
      <hr>
      <div class="row">
         <div class="text-center col-lg-6 offset-lg-3">
            <h5>정상원 · 오진욱 · 이하은</h5>
            <p>
               Copyright &copy; 2018 &middot; All Rights Reserved &middot; <a
                  href="#">PDic</a>
            </p>
         </div>
      </div>
   </div>


   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="resources/js/jquery-3.2.1.min.js"></script>

   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="resources/js/popper.min.js"></script>
   <script src="resources/js/bootstrap-4.0.0.js"></script>
</body>
</html>