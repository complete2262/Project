
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>P.Dic | Qustions</title>

<!-- Bootstrap -->
<link href="resources/css/bootstrap-4.0.0.css" rel="stylesheet">
<style type="text/css">
.offset-right {
   
}

.title {
   
}

#main {
   width: 1200px;
}

.number {
   width: 100px;
}

.category {
   width: 100px;
}

.subject {
   width: 500px;
}

.writer {
   width: 100px;
}

.date {
   width: 100px;
}

.viewcount {
   width: 100px;
}

.like {
   width: 100px;
}

#nav {
   margin-bottom: 59px;
}
</style>
<script>   
/*    onload = function taging() {
      if ( == "jquery") {
         $(option1).button('toggle')
      } else if ( == "htmlcss") {
         $(option2).button('toggle')
      } else if ( == "javascript") {
         $(option3).button('toggle')
      } else if ( == "server") {
         $(option4).button('toggle')
      } else if ( == "database") {
         $(option5).button('toggle')
      } else if ( == "framework") {
         $(option6).button('toggle')
      } else {
      }
   }//onload  토글 애니메이션 */
   function tagpage1() {
	      location.href = "myWork_board?id=${id}"
	   }
	   function tagpage2() {
	      location.href = "myWork_reply?id=${id}"
	   }
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
               aria-expanded="false"> ${Identity.nickName}</a>
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
   <!--컨테이너-->

   <div class="container" style="margin-top: 100px; margin-bottom: 100px;">
   <div class="row"></div>
 	<div class="row">
         <div class="col-6 align-self-end">
            <div class="title">
               <h2 class="display-4">나의활동</h2> 총 ${totalRecord}개의 댓글이 있습니다
               <hr>
            </div>
         </div>
         <div class="col-6 align-self-end text-center">
            <div class="btn-group btn-group-toggle" data-toggle="buttons">
               <label class="btn btn-secondary btn-sm" onclick="tagpage1()"> <input
                  type="radio" name="tag" id="option1" autocomplete="off"
                  > 내가쓴글
               </label> <label class="btn btn-secondary btn-sm" onclick="tagpage2()"> <input
                  type="radio" name="tag" id="option2" autocomplete="off"
                  > 내가쓴댓글
               </label>
            </div>
         </div>
      </div>

       <div class="row">
         <div>
            <table class="table table-striped table-hover" id="board">
            </table>
            <table class="table table-striped table-hover">
               <thead>

                  <tr>
                     <th class="number">번호</th>
                     <th class="subject">내용</th>
                     <th class="writer">작성자</th>
                     <th class="date">날짜</th>
                     <th class="like">좋아요</th>
                  </tr>

               </thead>
               <tbody>
                <c:forEach var="mm" items="${myWork_reply}" varStatus="status">
                     <tr>
                        <td class="number">${totalRecord - ((pageNum-1) * 10 + status.index) }</td>
                        <td class="subject"><a href="boardDetail?id=${mm.PBOARD1_ID}">${mm.CONTENT}
                        </a></td>
                        <td class="writer">${mm.NICKNAME}</td>
                        <td class="date">${mm.REGDATE}</td>
                        <td class="like">${mm.CHOICE}</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
            <hr>
         </div>
      </div>
      <div class="row">
         <div class="col-md-12">
            <div class="toolbar d-flex justify-content-center">
               <ul class="pagination justify-content-center">
                  <li class="page-item"><a class="page-link" href="#"
                     aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span></a></li>
                  <c:forEach var="i" begin="1" end="${totalPage}">
                     <li class="page-item"><a class="page-link"
                        href= "myWork_reply?id=${id}&pageNum=${i}">${i}</a></li>
                  </c:forEach>

                  <li class="page-item"><a class="page-link" href="#"
                     aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
                        class="sr-only">Next</span></a></li>
               </ul>
            </div>
         </div>
      </div> 
   </div>
   


   <!--하단 footer-->


   <hr>
   <footer class="footer">
      <div class="container">
         <div class="text-center col-lg-6 offset-lg-3">
            <h5>정상원 · 이하은</h5>
            <p>
               Copyright &copy; 2018 &middot; All Rights Reserved &middot; <a
                  href="index">PDic</a>
            </p>
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