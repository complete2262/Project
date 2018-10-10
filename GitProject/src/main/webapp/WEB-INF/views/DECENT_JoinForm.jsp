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
	<nav
		class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">DECENT</a>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger active"
						href=#contact">LOGIN</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- 가입페이지 -->

      <div class="container">
		<br> <br> <br> <Br> <br> <br> <br>
		<Br>

		<h4 class="mb-3">회원가입</h4>
		<form class="needs-validation" novalidate="">
			<div class="row">
			<div class="col-md-6 mb-3">
				<label for="id">I D</label> <input type="text" class="form-control"
					id="id" placeholder="" value="" required="">
				<div class="invalid-feedback">아이디 입력이 잘못되었습니다</div>
			</div>
			</div>
			<div class="row">
				<div class="col-md-6 mb-3">
					<label for="password">PASSWORD</label> <input type="text"
						class="form-control" id="password" placeholder="" value=""
						required="">
					<div class="invalid-feedback">비밀번호 입력이 잘못되었습니다</div>
				</div>
				<div class="col-md-6 mb-3">
					<label for="password2">Duplicate confirmation</label> <input
						type="text" class="form-control" id="password2" placeholder=""
						value="" required="">
					<div class="invalid-feedback">비밀번호 입력이 잘못되었습니다</div>
				</div>
			</div>
			<div class="row">
			<div class="col-md-6 mb-3">
				<label for="nickname">닉네임</label> <input type="text" class="form-control"
					id="ninckname" placeholder="" value="" required="">
				<div class="invalid-feedback">닉네임 입력이 잘못되었습니다</div>
			</div>
			</div>
			<div class="mb-3">
				<label for="email">E-MAIL</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<input type="text" class="form-control" id="email_id"
							placeholder="email_id" required=""> <span
							class="input-group-text">@</span>
					</div>
					<input type="text" class="form-control" id="email_site"
						placeholder="email_site" required="">
					<div class="invalid-feedback" style="width: 100%;">이메일 입력이
						잘못되었습니다</div>
				</div>
			</div>
			<div class="row">
			<div class="col-md-5 mb-3">
				<label for="interest">INTEREST</label> <select
					class="custom-select d-block w-100" id="country" required="">
					<option value="">Choose...</option>

					<option>박보영</option>
					<option>보영</option>
					<option>이게 다 보영?</option>
					<option>그만좀 보영</option>
					<option>선택할게 안보영?</option>
					<option>그럼 박보영</option>

				</select>
				<div class="invalid-feedback"></div>
			</div>
			</div>
			<hr class="mb-4">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input"
					id="yourheart"> <label class="custom-control-label"
					for="yourheart">얘 진짜 좋아함?</label>
			</div>
			<br><br><br>
			
				<button class="btn btn-primary btn-lg btn-block" type="submit">가입하러 가즈아아아아</button>
		</form>










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
</body>
</html>