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
    .offset-right {
}
		#card{
			height: 400px;
		}
		#jumbotron{
			height:600px;
			align-content: center;
			vertical-align: middle;
		}
		#jumbotrontext{
			position: relative;
			top:50% ;
			left:50; 
			margin-top: -100px;
				
		}
    </style>
</head>
<body>
	<c:if test="${Dragon==null}">
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
	</c:if>
	<c:if test="${Dragon!=null}">

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
						<a class="dropdown-item" href="#">내글보기</a>
						<!-- 구현안됨, 서블렛필요 -->
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="logout">로그아웃</a>
						<!-- 로그아웃 -->
					</div></li>
				<li class="nav-item"><a class="nav-link disabled offset-right">환영합니다!</a>
				</li>
			</ul>
			<form method="post" action="searchList" class="form-inline my-2 my-lg-0">
			<input name="searchOption" value="main" type="hidden">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" name="keyword">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		</nav>
	</c:if>



	  <!--jumbotron-->
  <div class="jumbotron-fluid text-center align-middle" id="jumbotron" style="margin-top:250px;margin-bottom:300px;">
	<div class="container-fluid" id="jumbotrontext">
    <h1 class="display-4" id="title">환영합니다!</h1>
<p class="lead" id="title">가입이 성공적으로 완료되었습니다!</p>
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
