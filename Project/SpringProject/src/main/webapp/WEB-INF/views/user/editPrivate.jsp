<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>P.Dic | Join</title>

<!-- Bootstrap -->
<link href="resources/css/bootstrap-4.0.0.css" rel="stylesheet">
<style type="text/css">
.offset-right {
   
}

.title {
   
}

#main {
   margin-top: 150px;
   margin-bottom: 200px;
   width: 650px;
}
</style>

<script>
   function validate() {
      var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
      //var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      // 이메일이 적합한지 검사할 정규식

      var id = document.getElementById("id");
      var password = document.getElementById("password");
      var nickname = document.getElementById("nickname");
      var email_id = document.getElementById("email_id");

      // ------------ 이메일 까지 -----------

/*       if (!check(re, id, "아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
         return false;
      }
 */
      if (!check(re, password, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
         return false;
      }

      if (join.password.value != join.checkpw.value) {
         alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
         join.checkpw.value = "";
         join.checkpw.focus();
         return false;
      }
      if (join.nickname.value == "") {
         alert("닉네임을 입력해 주세요");
         join.nickname.focus();
         return false;
      }

      if (email_id.value == "") {
         alert("이메일을 입력해 주세요");
         email_id.focus();
         return false;
      }

      if (join.email_site[0].selected == false
            && join.email_site[1].selected == false
            && join.email_site[2].selected == false
            && join.email_site[3].selected == false
            && join.email_site[4].selected == false) {
         alert("메일제공 사이트를 선택해주세");
         return false;

         if (join.inter[0].selected == false
               && join.inter[1].selected == false
               && join.inter[2].selected == false
               && join.inter[3].selected == false
               && join.inter[4].selected == false
               && join.inter[5].selected == false
               && join.inter[6].selected == false
               && join.inter[7].selected == false
               && join.inter[8].selected == false
               && join.inter[9].selected == false) {
            alert("관심분야를 골라주세요");
            return false;
         }

         if (join.self.value == "") {
            alert("자기소개를 적어주세요");
            join.self.focus();
            return false;
         }

         alert("회원가입이 완료되었습니다.");
      }

      function check(re, what, message) {
         if (re.test(what.value)) {
            return true;
         }
         alert(message);
         what.value = "";
         what.focus();
         //return false;
      }
   }

   // 아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
   //var idCheck = 0;
   var pwdCheck = 0;
   var nNamecheck = 0;
   // 아이디 체크하여 가입버튼 비활성화, 중복확인.
   /* 
    function checkId() {
    var inputed = $('#id').val();
    var idlength = inputed.length;
    $.ajax({
    data : {
    user_id : inputed
    },
    url : "idcheck",
    success : function(data) {
    if (inputed == "" && data == '0') {
    $(".btn-primary").prop("disabled", true);
    $(".btn-primary").css("background-color", "#aaaaaa");
    $("#id").css("background-color", "#FFCECE");
    alert("아이디를 입력해주세요");
    idCheck = 0;
    } else if (idlength < 4) {
    $(".btn-primary").prop("disabled", true);
    $(".btn-primary").css("background-color", "#aaaaaa");
    $("#id").css("background-color", "#FFCECE");
    alert("아이디는 4글자 이상의 영문자 및 숫자만 사용하실수 있습니다");
    idCheck = 0;
    } else if (data == '0') {
    $("#id").css("background-color", "#B0F6AC");
    idCheck = 1;
    alert("사용가능한 아이디입니다");
    signupCheck();
    } else if (data == '1') {
    $(".btn-primary").prop("disabled", true);
    $(".btn-primary").css("background-color", "#aaaaaa");
    $("#id").css("background-color", "#FFCECE");
    idCheck = 0;
    alert("사용중인 아이디 입니다");

    }
    }
    });
    } */
   //닉네임 중복체크
    function checknick() {
      var inputed = $('#nickname').val();
      var nnamelength = inputed.length;
      
      if(inputed=='${Identity.nickName}'){
         $("#nickname").css("background-color", "#B0F6AC");
          nNamecheck = 1;
          alert("사용가능한 닉네임입니다");
          signupCheck();
      }else{
      $.ajax({
         data : {
            nickName : inputed
         },
         url : "nNamecheck",
         success : function(data) {
            if (inputed == "" && data == '0') {
               $(".btn-primary").prop("disabled", true);
               $(".btn-primary").css("background-color", "#aaaaaa");
               $("#nickname").css("background-color", "#FFCECE");
               alert("닉네임을 입력해주세요");
               nNamecheck = 0;
            } else if (nnamelength < 2) {
               $(".btn-primary").prop("disabled", true);
               $(".btn-primary").css("background-color", "#aaaaaa");
               $("#nickname").css("background-color", "#FFCECE");
               alert("닉네임은는 2글자 이상부터 사용하실수 있습니다");
               nNamecheck = 0;
            } else if (data == '0') {
               $("#nickname").css("background-color", "#B0F6AC");
               nNamecheck = 1;
               alert("사용가능한 닉네임입니다");
               signupCheck();
            } else if (data == '1') {
               $(".btn-primary").prop("disabled", true);
               $(".btn-primary").css("background-color", "#aaaaaa");
               $("#nickname").css("background-color", "#FFCECE");
               nNamecheck = 0;
               alert("사용중인 닉네임 입니다");

            }
         }
      });
      }
   }

   //재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
   function checkPwd() {
      var inputed = $('#password').val();
      var reinputed = $('#checkpw').val();
      if (reinputed == "" && (inputed != reinputed || inputed == reinputed)) {
         $(".btn-primary").prop("disabled", true);
         $(".btn-primary").css("background-color", "#aaaaaa");
         $("#checkpw").css("background-color", "#FFCECE");
         $("#password").css("background-color", "#FFCECE");
      } else if (inputed == reinputed) {
         $("#checkpw").css("background-color", "#B0F6AC");
         $("#password").css("background-color", "#B0F6AC");
         pwdCheck = 1;
         signupCheck();

      } else if (inputed != reinputed) {
         pwdCheck = 0;
         $(".signupbtn").prop("disabled", true);
         $(".signupbtn").css("background-color", "#aaaaaa");
         $("#checkpw").css("background-color", "#FFCECE");
         $("#password").css("background-color", "#FFCECE");

      }
   }

   //email입력체크
   function emailcheck() {
      var inputed1 = $("#email_id").val();
      var inputed2 = $("#email_site").val();
      if (inputed1 == "" || inputed2 == "") {
         $("#email_id").css("background-color", "#FFCECE");
         $("#email_site").css("background-color", "#FFCECE");
      } else if (inputed1 != "" && inputed2 != "") {
         $("#email_id").css("background-color", "#B0F6AC");
         $("#email_site").css("background-color", "#B0F6AC");
         signupCheck();
      }
   }
   //관심분야 입력체크
   function majorcheck() {
      var inputed = $("#major").val();
      if (inputed != "") {
         $("#major").css("background-color", "#B0F6AC");
         signupCheck();
      }
   }

   //모든 유효한 데이터를 입력했을시 가입버튼 활성화
   function signupCheck() {
      var email1 = $("#email_id").val();
      var email2 = $("#email_site").val();
      var major = $("#major").val();

      if (email1 != "" && email2 != "" && major != "" && pwdCheck == 1
            && nNamecheck == 1) {
         $(".btn-primary").prop("disabled", false);
         $(".btn-primary").css("background-color", "#4CAF50");
      } else {
      }
   }
   
   function updateSubmit(){
	      alert('수정이 완료되었습니다. 다시 로그인해주세요!')
	      document.getElementById('#updateform').submit();
	   }
   
   function deleteconfirm() {
	      alert("탈퇴하실 경우 올리신 글과 댓글은 지워지지 않습니다");
	      var delCheck = confirm("정말 탈퇴하시겠습니까?");
	      if (delCheck == true) {
	         location.href = "delete?id=${Identity.id}";
	      }else{}
	   }
</script>
<script>
   
</script>
</head>
<body id="bodyheight">



      <!--top fixed header(loged in)-->

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
            <li class="nav-item active"></li>
            <li class="nav-item"></li>
            <li class="nav-item dropdown"><a
               class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> ${Identity.nickName} </a>
               <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="binsert_form">글쓰기</a>
                  <!-- 글쓰기-->
                  <a class="dropdown-item" href="detail">회원정보 수정</a>
                  <!-- 회원정보수정(detail) -->
                  <a class="dropdown-item" href="myWork_board?id=${Identity.id}">내글보기</a>
                  <!-- 구현안됨, 서블렛필요 -->
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="logout">로그아웃</a>
                  <!-- 로그아웃 -->
               </div></li>
            <li class="nav-item"><a class="nav-link disabled offset-right">환영합니다!</a>
            </li>
         </ul>
         <form method="post" action="searchList" class="form-inline my-2 my-lg-0">
         		<input name="searchOption" value="main_all" type="hidden">
           		 <input class="form-control mr-sm-2" type="search"
              		 placeholder="Search" aria-label="Search" name="keyword">
            	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        	 </form>
      </div>
      </nav>


   <!--joinform-->

   <div class="container" id="main" style="">

      <div class="row" id="joininner">
         <div class="col-md-12 text-center align-middle" id="title">
            <h4 class="mb-3">개인정보수정</h4>
            <hr>
         </div>
         <div class="col-12">
            <form name="join" class="needs-validation" novalidate="" id="updateform"
               onsubmit="return validate();" action="update" method="post">
               <div class="row">
                  <div class="col-md-6">
                     <div class="col-md-12">
                     <input type="hidden" name="id" value="${Identity.id}" height="1">
                        <label for="id2">I D</label> <input type="text" name="user_id"
                           required="" class="form-control" id="id" value="${Identity.user_id}"
                           maxlength="12" readonly="readonly" />
                     </div>
                  </div>
                  <div class="col-md-6 align-self-end"></div>
               </div>
               <div class="row">
                  <div class="col-12">
                     <div id="idresult"></div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-6">
                     <div class="col-md-10">
                        <label for="nam">PASSWORD</label> <input type="password"
                           name="password" class="form-control" id="password"
                           placeholder="" maxlength="16" value="" required="">
                     </div>
                     <div class="invalid-feedback">비밀번호 입력이 잘못되었습니다</div>
                  </div>
                  <div class="col-md-6">
                     <div class="col-md-10">
                        <label for="password2">Duplicate confirmation</label> <input
                           type="password" class="form-control" id="checkpw"
                           placeholder="" value="" required="" oninput="checkPwd()">
                     </div>
                     <!-- 패스워드 확인(oninput 방식) -->
                     <div class="invalid-feedback">비밀번호 입력이 잘못되었습니다</div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-12">
                     <div id="idresult2"></div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-6">
                     <div class="col-md-10">
                        <label for="nickname">NICKNAME</label> <input type="text"
                           maxlength="" class="form-control" id="nickname" name="nickName"
                           placeholder="" value="${Identity.nickName}" required="">
                     </div>
                     <div class="invalid-feedback">닉네임 입력이 잘못되었습니다</div>
                  </div>
                  <div class="col-md-6 align-self-end">
                     <div class="invalid-feedback">닉네임 입력이 잘못되었습니다</div>
                     <div class="col-md-2 align-self-end">
                        <button type="button" class="btn btn-secondary btn-sm"
                           onclick="checknick()">중복확인</button>
                        <!-- 중복확인 버튼 -->
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-12">
                     <div id="idresult3"></div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-6">
                     <div class="col-md-12">
                        <label for="email">E-MAIL</label>
                        <div class="input-group">
                           <div class="input-group-prepend">
                              <input type="text" class="form-control" name="email_id"
                                 id="email_id" placeholder="email_id" required=""> <span
                                 class="input-group-text">@</span> <select id="email_site"
                                 name="email_site" required=""
                                 class="custom-select d-block w-100" oninput="emailcheck()">
                                 <option value="">선택하세요..</option>
                                 <option>naver.com</option>
                                 <option>hanmail.com</option>
                                 <option>google.com</option>
                                 <option>korea.com</option>
                              </select>
                           </div>
                           <div class="invalid-feedback" style="width: 100%;">이메일
                              입력이 잘못되었습니다</div>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-6">&nbsp;</div>
               </div>
               <div class="row">
                  <div class="col-12">
                     <div id="idresult4"></div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-6">
                     <div class="col-md-12">
                        <label for="interest">INTEREST MAJOR</label> <select
                           class="custom-select d-block w-100" id="major" name="interest"
                           oninput="majorcheck()" required="">
                           <option name="inter" value="">Choose...</option>
                           <option>HTMLCSS</option>
                           <option>Jquery</option>
                           <option>Javascript</option>
                           <option>Database</option>
                           <option>java</option>
                           <option>Spring</option>
                           <option>C</option>
                           <option>Swift</option>
                           <option>Phython</option>
                           <option>Unity</option>
                        </select>
                        <div class="invalid-feedback"></div>
                     </div>
                  </div>
                  <div class="col-md-6">&nbsp;</div>
               </div>
              <div class="row">
                  &nbsp;
                  <div class="col-md-12 text-center">
                     <button class = "btn btn-danger" type="button" onclick="deleteconfirm()">회원탈퇴</button>
                     <button type="submit" onclick="updateSubmit()" class="btn btn-primary" disabled>수정</button>
                
                  </div>
               </div>
               <div class="row">
                  <div class="col-12">
                     <div id="idresult6"></div>
                  </div>
               </div>
            </form>
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