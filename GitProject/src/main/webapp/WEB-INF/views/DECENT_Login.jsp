<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>DECENT</title>

<!-- Bootstrap core CSS -->
<link href="resources/index/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="resources/index/all.min.css" rel="stylesheet" type="text/css">
<link href="resources/index/second.css" rel="stylesheet" type="text/css">
<link href="resources/index/third.css" rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link href="resources/index/magnific-popup.css" rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="resources/index/freelancer.min.css" rel="stylesheet">

</head>

<body id="page-top">

  	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="tomain">DECENT</a><!-- href 자리에 DECENT_index로 가는 ex) tomain .. 리매핑 -->

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger active"
						href=tologin">LOGIN</a></li><!-- href 자리에 DECENT_login으로 가는 ex) tologin .. 리매핑 -->
				</ul>
			</div>
		</div>
	</nav>
	
	
	<!-- 로그인폼 -->
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









		<!-- 바닥 -->
		<div class="copyrig/ht py-4 text-center text-white">
			<div class="container">
				<small>Fucking green art academy</small>
			</div>
		</div>

		<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
		<div class="scroll-to-top d-lg-none position-fixed ">
			<a class="js-scroll-trigger d-block text-center text-white rounded"
				href="file:///C:/Users/Haeun/Desktop/startbootstrap-freelancer-gh-pages/index.html#page-top">
				<i class="fa fa-chevron-up"></i>
			</a>
		</div>

		<!-- Bootstrap core JavaScript -->
		<script src="resources/index/jquery.min.js"></script>
		<script src="resources/index/bootstrap.bundle.min.js"></script>

		<!-- Plugin JavaScript -->
		<script src="resources/index/jquery.easing.min.js"></script>
		<script src="resources/index/jquery.magnific-popup.min.js"></script>

		<!-- Contact Form JavaScript -->
		<script src="resources/index/jqBootstrapValidation.js"></script>
		<script src="resources/index/contact_me.js"></script>

		<!-- Custom scripts for this template -->
		<script src="resources/index/freelancer.min.js"></script>
</body>
</html>