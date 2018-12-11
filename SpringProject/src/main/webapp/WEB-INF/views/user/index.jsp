<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>P.Dic | Main</title>

<!-- Bootstrap -->
<link href="resources/css/bootstrap-4.0.0.css" rel="stylesheet">
<style type="text/css">
canvas {
   width: 100%;
   height: 100%;
}

.offset-right {
   
}

#card {
   height: 400px;
}

#jumbotron {
   height: 600px;
   align-content: center;
   vertical-align: middle;
   overflow: hidden;
   background: #EEE;
   box-shadow: inset 0 0 120px 40px rgba(0, 0, 0, 0.4)
}

#jumbotrontext {
   position: relative;
   top: 50%;
   left: 50;
   margin-top: -100px;
}
</style>

</head>
<body>
   <c:if test="${Identity==null}">
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
            <li class="nav-item active"><a class="nav-link"
               href="login_form">로그인<span class="sr-only">(current)</span></a></li>
            <li class="nav-item active"><a class="nav-link"
               href="join_form">회원가입<span class="sr-only">(current)</span></a></li>
            <li class="nav-item"></li>
         </ul>
         <form method="post" action="searchList"
            class="form-inline my-2 my-lg-0">
            <input name="searchOption" value="main_all" type="hidden"> <input
               class="form-control mr-sm-2" type="search" placeholder="Search"
               aria-label="Search" name="keyword">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
         </form>

      </div>
      </nav>
   </c:if>
   <c:if test="${Identity!=null}">

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
                  <a class="dropdown-item"
                     href="myWork_board?id=${Identity.id}">내글보기</a>
                  <!-- 구현안됨, 서블렛필요 -->
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="logout">로그아웃</a>
                  <!-- 로그아웃 -->
               </div></li>
            <li class="nav-item"><a class="nav-link disabled offset-right">환영합니다!</a>
            </li>
         </ul>

         <form method="post" action="searchList"
            class="form-inline my-2 my-lg-0">
            <input name="searchOption" value="main_all" type="hidden"> <input
               class="form-control mr-sm-2" type="search" placeholder="Search"
               aria-label="Search" name="keyword">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
         </form>




      </div>
      </nav>
   </c:if>



   <!--jumbotron-->
   <div class="jumbotron jumbotron-fluid text-center align-middle"
      id="jumbotron" style="cursor: none" >
<div id="jumboinclude" style="z-index: 1;"></div>

      <div class="container-fluid" id="jumbotrontext" style="   display: block;
  position: absolute;
  top: 41%; left: 50%;
  transform: translate(-50%,-50%);
  color: #222;
  text-decoration: none;

  font-size: 20px;
  text-shadow: 0 1px 0 #fff;
  border-radius: 10px;z-index: 2;">
         <h1 class="display-4" id="title">P.Dic</h1>
         <p class="lead" id="title">
            P.Dic은 Programing Dictionary의 약자입니다<br>한국에서 프로그래밍을 배우는 개발자들을 위한
           정보공유 커뮤니티입니다
         </p>
         <strong>※잠시만요!※</strong>
         <p>P.Dic은 간단한 가입 및 로그인을 하시면 글쓰기,추천 등 좀 더 다양한 기능을 사용하실 수 있습니다</p>
         
      </div>
      
   </div>
      
   <!--main contents container -->
   <div class="container">

      <div class="row">
         <div class="col-12" id="likearea"></div>
      </div>
      <div class="text-center" id="frontEnd">
         <hr>
         <h1 class="display-4">FRONT-END</h1>
         <hr>
         <div class="row text-center">
            <div class="col-md-4 offset-4 offset-xl-0 col-xl-12"
               style="font-size: 1em; color: #777777">
            </div>
         </div>
         <br />

         <div class="row">
            <div class="col-md-4">
               <div class="card" id="card">
                  <img class="card-img-top" src="resources/images/logo/1.png"
                     alt="Card image cap">
                  <div class="card-body">
                     <p class="card-text">jQuery (제이쿼리)는 HTML의 클라이언트 사이드 조작을 단순화
                        하도록 설계된 크로스 플랫폼의 자바스크립트 라이브러리 입니다.</p>
                  </div>
                  <a href="boardList?tag=Jquery" class="btn btn-primary">jQuery 글 보기</a>
               </div>
            </div>
            <div class="col-md-4">
               <div class="card" id="card">
                  <img class="card-img-top" src="resources/images/logo/2.png"
                     alt="Card image cap">
                  <div class="card-body">
                     <p class="card-text">웹 문서를 만들기 위하여 사용하는 기본적인 프로그래밍 언어/HTML을
                        보조하는 스타일 시트 입니다.</p>
                  </div>
                  <a href="boardList?tag=HTML/CSS" class="btn btn-primary">HTML/CSS 글 보기</a>
               </div>
            </div>
            <div class="col-md-4">
               <div class="card" id="card">
                  <img class="card-img-top" src="resources/images/logo/3.png"
                     alt="Card image cap">
                  <div class="card-body">
                     <p class="card-text">객체지향 프로그래밍 언어로 웹페이지의 동작을 담당하는 크로스플랫폼 언어 입니다.
                     </p>
                  </div>
                  <a href="boardList?tag=JavaScript" class="btn btn-primary">JavaScript 글 보기</a>
               </div>
            </div>
         </div>
      </div>
      <div class="text-center" id="backEnd">
         <hr>
         <h1 class="display-4">BACK-END</h1>
         <hr>
         <div class="row text-center">
            <div class="col-md-4 offset-4 offset-xl-0 col-xl-12"
               style="font-size: 1em; color: #777777">
            </div>
         </div>
         <br />

         <div class="row">
            <div class="col-md-4">
               <div class="card" id="card">
                  <img class="card-img-top" src="resources/images/logo/4.png"
                     alt="Card image cap">
                  <div class="card-body">
                     <p class="card-text"> 클라이언트에게 네트워크를 통해 서비스하는 컴퓨터를 의미합니다.</p>
                  </div>
                  <a href="boardList?tag=Server" class="btn btn-primary">Server 글 보기</a>
               </div>
            </div>
            <div class="col-md-4">
               <div class="card" id="card">
                  <img class="card-img-top" src="resources/images/logo/5.png"
                     alt="Card image cap">
                  <div class="card-body">
                     <p class="card-text">여러 사람이 공유하고 사용할 목적으로 통합 관리되는 정보의 집합입니다. </p>
                  </div>
                  <a href="boardList?tag=Database" class="btn btn-primary">Datebase 글 보기</a>
               </div>
            </div>
            <div class="col-md-4">
               <div class="card" id="card">
                  <img class="card-img-top" src="resources/images/logo/6.png"
                     alt="Card image cap">
                  <div class="card-body">
                     <p class="card-text">Spring 등 개발을 조금 더 빠르고 편리하게 하기위한 시스템 입니다.</p>
                     <p class="card-text">&nbsp;</p>
                  </div>
                  <a href="boardList?tag=Framework" class="btn btn-primary">Framework 글 보기</a>
               </div>
            </div>
            <div class="col-md-4"></div>
         </div>
      </div>
   </div>
   <br>

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
   
      <script>
    $(document).ready(function(){
       
          $.ajax({
              type:"get",
              url: "likeList",
              success : function(result){
                 $("#likearea").html(result);
              }//석세스
           });//ajax
           
          $.ajax({
             type:"get",
             url:"jumboinclude",
                 success : function(result){
                     $("#jumboinclude").html(result);
             }
          });
       });//레디
             
       </script>
   <script>
 
</script>
   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="resources/js/popper.min.js"></script>
   <script src="resources/js/bootstrap-4.0.0.js"></script>

</body>
</html>