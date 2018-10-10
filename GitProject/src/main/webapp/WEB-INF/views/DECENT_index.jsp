<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>DECENT</title>

    <!-- Bootstrap core CSS -->
    <link href="./index/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="./index/all.min.css" rel="stylesheet" type="text/css">
    <link href="./index/second.css" rel="stylesheet" type="text/css">
    <link href="./index/third.css" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="./index/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="./index/freelancer.min.css" rel="stylesheet">

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="file:///C:/Users/Haeun/Desktop/startbootstrap-freelancer-gh-pages/index.html#page-top">DECENT</a>
 
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger active" href="file:///C:/Users/Haeun/Desktop/startbootstrap-freelancer-gh-pages/index.html#contact">LOGIN</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

 <!-- Contact Section -->
       <section id="contact">
      <div class="container">

        <div class="row">
             
          <div class="col-lg-8 mx-auto">
    <br><br><br><br><br><br><h3>로그인하셈</h3>
            <form name="loginRequest" id="loginForm" novalidate="novalidate">
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
               
                  <label>id</label>
                  <input class="form-control" id="id" type="text" placeholder="ID" required="required" data-validation-required-message="아이디를 입력해주세요">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Password</label>
                  <input class="form-control" id="password" type="password" placeholder="PASSWORD" required="required" data-validation-required-message="비밀번호를 입력해주세요">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <br>
              <div id="success"></div>
              <div class="form-group">
                <button type="submit" class="btn btn-primary btn-s" id="sendMessageButton">Login</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    
    
    <!--게시판-->
    <section class="boards" id="boards">
      <div class="container">
        <h2 class="text-center text-uppercase text-secondary mb-0">게시판영역</h2>
<br><br>
        <div class="row">
          <div class="col-md-6 col-lg-4">
           <center>1번영역</center>
           <br><br><br><br><br><br>
          </div>
                    <div class="col-md-6 col-lg-4">
           <center>2번영역</center><br><br><br><br><br><br>
          </div>
                    <div class="col-md-6 col-lg-4">
           <center>3번영역</center><br><br><br><br><br><br>
          </div>

                    <div class="col-md-6 col-lg-4">
           <center>4번영역</center><br><br><br><br><br><br>
          </div>
                    <div class="col-md-6 col-lg-4">
           <center>5번영역</center><br><br><br><br><br><br>
          </div>
                    <div class="col-md-6 col-lg-4">
           <center>6번영역</center><br><br><br><br><br><br>
          </div>

        </div>
      </div>
    </section>

    <!-- 기타 -->
    <section class="bg-primary text-white mb-0" id="etc">
      <div class="container">
        <h2 class="text-center text-uppercase text-white">기타 내용 구현</h2>
        <hr>

        <div class="row">
          <div class="col-lg-4 ml-auto">
            <p class="lead">안녕은 영원한 헤어짐은 아니겠지요</p>
          </div>
          <div class="col-lg-4 mr-auto">
            <p class="lead"> 다시만나기위한 약속일거야 <br><br><br><br></p>
          </div>
        </div>
      </div>
    </section>

   

    <!-- Footer -->
    <footer class="footer text-center">
      <div class="container">
        <div class="row">
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">오진욱</h4>
          </div>
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">정상원</h4>
          </div>
          <div class="col-md-4">
            <h4 class="text-uppercase mb-4">이하은</h4>
          </div>
        </div>
      </div>
    </footer>

    <div class="copyright py-4 text-center text-white">
      <div class="container">
        <small>Fucking green art academy</small>
      </div>
    </div>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-to-top d-lg-none position-fixed ">
      <a class="js-scroll-trigger d-block text-center text-white rounded" href="file:///C:/Users/Haeun/Desktop/startbootstrap-freelancer-gh-pages/index.html#page-top">
        <i class="fa fa-chevron-up"></i>
      </a>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="./index/jquery.min.js"></script>
    <script src="./index/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="./index/jquery.easing.min.js"></script>
    <script src="./index/jquery.magnific-popup.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="./index/jqBootstrapValidation.js"></script>
    <script src="./index/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="./index/freelancer.min.js"></script>

  


</body></html>