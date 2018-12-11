<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>P.Dic | WriteQuestion</title>

    <!-- Bootstrap -->
    <link href="resources/css/bootstrap-4.0.0.css" rel="stylesheet">
    <style type="text/css">
    .offset-right {
}
    #nav {
	margin-bottom: 59px;
}
    </style>

	
  </head>
  <body id="bodyheight" style="">
	  
	  

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
			<input name="searchOption" value="main" type="hidden">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" name="keyword">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		</nav>
	
	  
	  <!--write form-->  
	  
  	 <div class="container" style="margin-top:100px;margin-bottom:100px;">
<div class="row"> </div>
    <div class="row">
	  <div class="col-6 align-self-end">
        <div class="title">
          <h2 class="display-4">${bvof.TAG}</h2>
          <hr>
        </div>
      </div>
	  <div class="col-6 align-self-end text-center"><!--
	    <div class="btn-group btn-group-toggle" data-toggle="buttons">
	      <label class="btn btn-secondary btn-sm">
	        <input type="radio" name="options" id="option7" autocomplete="off" checked>
	        Jquery </label>
	      <label class="btn btn-secondary btn-sm">
	        <input type="radio" name="options" id="option8" autocomplete="off">
	        HTML/CSS </label>
	      <label class="btn btn-secondary btn-sm">
	        <input type="radio" name="options" id="option9" autocomplete="off">
	        JavaScript </label>
	      <label class="btn btn-secondary btn-sm">
	        <input type="radio" name="options" id="option10" autocomplete="off">
	        Server </label>
	      <label class="btn btn-secondary btn-sm">
	        <input type="radio" name="options" id="option11" autocomplete="off">
	        Database </label>
	      <label class="btn btn-secondary btn-sm">
	        <input type="radio" name="options" id="option12" autocomplete="off">
	        Framework </label>
        </div>-->
</div>
    </div>

<div class="row">
			 <div class="col-12">

		 	<form method="post" action="boardUpdate" enctype="multipart/form-data">
				<input name="puser_id" id="puser_id" type="hidden" value="${Identity.id}"/>
			 	<table class="table" style="text-align:center; border:1px">

			 		<tbody>

			 			<tr>

			 				<td colspan="2"><input type="text" class="form-control" value="${bvof.TITLE}" name="title" id="title" maxlength="50"></td>

			 			</tr>
						<tr>

			 				<td><input type="text" class="form-control" value="${Identity.nickName}" id="writer" name="writer" maxlength="20" readonly="readonly"></td>
			 				<td><input type="text" class="form-control" value="${bvof.TAG}" id="tag" name="tag" maxlength="20" readonly="readonly"></td>


			 			</tr>
						

			 			<tr>	

			 				<td colspan="2"><textarea class="form-control"  name="content" id="content" maxlength="2048" style="height:350px">${bvof.CONTENT}</textarea> </td>
			 				<td><input type="text" class="form-control" value="${bvof.ID}" id="id" name="id" height="30"></td>
			 			</tr>	
						<tr>

			 				<td><input name="uploadFile" class="form-control"  id="uploadFile" type="file" value="${bvof.IMAGE}"/>
			 				<img src="${bvof.IMAGE}"/></td><td></td>

			 			</tr>

			 		</tbody>

			 	</table>
<div class="row justify-content-center"><div class="col-1 text-center"><input type="reset" class="btn btn-outline-secondary pull-right" value="취소"></div>
  <div class="col-1 text-center">
    <input type="submit" class="btn btn-secondary pull-right" value="수정하기">
    &nbsp;</div>
  <div class="col-1 text-center">
    <input type="reset" class="btn btn-secondary pull-right" value="다시쓰기">
    &nbsp;</div>
</div>
				 

			</form>
			</div>
		 </div>

	</div>

<!--하단 footer-->
	  
	  
       <hr>
<footer class="footer">
      <div class="container">
		  <div class="text-center col-lg-6 offset-lg-3">
        <h5>정상원 · 이하은</h5>
            <p>Copyright &copy; 2018 &middot; All Rights Reserved &middot; <a href="#">PDic</a></p>
			  </div>
      </div>
    </footer>

	  
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
    <script src="resources/js/jquery-3.2.1.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed --> 
    <script src="resources/js/popper.min.js"></script>
    <script src="resources/js/bootstrap-4.0.0.js"></script>
  </body>
</html>
