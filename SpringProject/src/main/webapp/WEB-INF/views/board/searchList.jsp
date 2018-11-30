
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


</head>
<body id="bodyheight">

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
            <li class="nav-item active"><a class="nav-link" href="login_form">로그인<span
                  class="sr-only">(current)</span></a></li>
            <li class="nav-item active"><a class="nav-link" href="join_form">회원가입<span
                  class="sr-only">(current)</span></a></li>
            <li class="nav-item"></li>
         </ul>
        <form method="post" action="searchList" class="form-inline my-2 my-lg-0">
         <input name="searchOption" value="main_all" type="hidden">
            <input class="form-control mr-sm-2" type="search"
               placeholder="Search" aria-label="Search" name="keyword">
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
   </c:if>
     <!--컨테이너-->

   <div class="container" style="margin-top: 100px; margin-bottom: 100px;">
      <div class="row">      <div class="center" style="">
  <div id="card" style="">
    <div id="writer_content" style="">

      <span class="opt" onclick="hide();">닫기</span>
    </div>  
  </div>
</div>
<div id="shade"></div></div>
      <div class="row">
         <div class="col-6 align-self-end">
            <div class="title">
                총 ${totalRecord}개의 글이 있습니다.
               <hr>
            </div>
         </div>
         <div class="col-6 align-self-end text-center">
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
                     <th class="category">분류</th>
                     <th class="subject">제목</th>
                     <th class="writer">작성자</th>
                     <th class="date">날짜</th>
                     <th class="viewcount">조회수</th>
                     <th class="like">좋아요</th>
                  </tr>

               </thead>
               <tbody>
                  <c:forEach var="mm" items="${map.list}" varStatus="status">
                     <tr>
                        <td class="number">${totalRecord - ((pageNum-1) * 10 + status.index) }</td>
                        <td class="category">${mm.TAG}</td>
                        <td class="subject"><a href="boardDetail?id=${mm.ID}" style="color:black;">${mm.TITLE} 
                        </a> (${mm.REPLYCOUNT})</td>
                        <c:if test="${mm.NICKNAME==null}">
                        <td class="writer">탈퇴회원</td>
                        </c:if>
                        <c:if test="${mm.NICKNAME!=null}">
                           
                           <td class="writer" id="writerhandler"><ul class="navbar-nav mr-auto"><li class="dropdown"><a
                              class="nav-link dropdown-toggle" href="#" id="writerDropdown" 
                              role="button" data-toggle="dropdown" aria-haspopup="true"
                              aria-expanded="false" style="color:black;">${mm.NICKNAME}</a>
                              <div class='dropdown-menu'
                                 aria-labelledby='writerDropdown'>
                                 <a class='dropdown-item' href="#" onclick="writerboard('${mm.PUSER_ID}')">다른 글 보기</a><a
                                    class='dropdown-item' href='detail'>작성 댓글 보기</a>
                              </div></li></ul></td>

                        </c:if>
                        <td class="date text-center" style="font-size:14px;"><fmt:formatDate value="${mm.REGDATE}"  pattern="yy.MM.dd"/><br></td>
                        <td class="viewcount">${mm.CNT}</td>
                        <td class="like">${mm.CHOICE}</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
            <hr>
         </div>
      </div>
      <div class="row">
         <div class="col-4" >
            <form method="post" action="searchList">
               <div class="row"> <div class="col-4" style="padding: 10px,0px;">
                     <select class="form-control" name="searchOption">
                        <option value="all">전체</option>
                        <option value="nickName">글쓴이</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                     </select>
                  </div>
                  <div class="col-6" style="padding: 0px;">
                     <input name="keyword" class="form-control" value="${map.keyword}">
                     <input name="tag" type="hidden" value="${map.tag}">
                  </div>
               
                  <div class="col-2 justify-content-center">
                     <input class="btn btn-outline-success" type="submit"
                        value="Serach">
                  </div>
               </div>
            </form>
         </div>
         <div class="col-6"></div>
         <div class="col-1">

         </div>
      </div>






      <div class="row">
         <div class="col-md-12">
            <div class="toolbar d-flex justify-content-center">
               <ul class="pagination justify-content-center">
               <c:if test="${pageNum==1}">
                  <li class="page-item"><a class="page-link" href="#"
                     aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span></a></li>
               </c:if>
               <c:if test="${pageNum!=1}">
                  <li class="page-item"><a class="page-link" href= "searchList?keyword=${map.keyword}&searchOption=${map.searchOption}&pageNum=${pageNum-1}c"
                     aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span></a></li>
               </c:if>
                  <c:forEach var="i" begin="1" end="${totalPage}">
                  <c:choose>
                  <c:when test='${pageNum==i}'> <li class="page-item page-link" style="color:black;cursor:default;">${i}</li>
                        </c:when>
                  <c:when test='${pageNum!=i}'>
                     <li class="page-item"><a class="page-link"
                        href= "searchList?keyword=${map.keyword}&searchOption=${map.searchOption}&pageNum=${i}&tag=${map.tag}">${i}</a></li>
                         </c:when>
                  </c:choose>
                  </c:forEach>
                  

                  <c:if test="${pageNum==totalPage}"> 
                  <li class="page-item"><a class="page-link" href="#"
                     aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
                        class="sr-only">Next</span></a></li>
                </c:if>
                <c:if test="${pageNum!=totalPage}">   
                  <li class="page-item"><a class="page-link" href= "searchList?keyword=${map.keyword}&searchOption=${map.searchOption}&pageNum=${pageNum+1}&tag=${map.tag}"
                     aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
                        class="sr-only">Next</span></a></li>
                </c:if>
               </ul>
            </div>
         </div>   
      </div>

   </div>



<style>
#shade {
  position:absolute;
  width:100%;
  height:100%;
  top:0;
  left:0;
  z-index:-1;
  background-color:rgba(0,0,0,0);
}

.center {
  width:100%;
  margin:auto 0;
}

#card {
  opacity:0;
  background-color:#fff;
  position:fixed;
  margin:10px;
  z-index:3;
  //width:30%;
  width:0;
  height:0;
  box-shadow:0px 1px 5px rgba(0,0,0,0.5);
  border-radius:100%;
  font-family:Roboto;
  transition:border-radius .5s, width .5s, height .5s;
}

#card .maintext {
  display:inline-block;
  margin:20px;
  margin-bottom:10px;
  font-weight:300;
  font-size:30px;
}

#card .description {
  display:inline-block;
  margin-left:20px;
}

#card .opt {
  right:-50%;
  display:inline-block;
  position:relative;
  text-transform:uppercase;
  margin:30px;
  margin-right:0px;
  cursor:pointer;
  padding:10px;
}

#card .opt:hover {
  background-color:rgba(0,0,0,0.1);
}

#card .blue {
  color:#304FFE;
}

#content {
  opacity:0;
  transition:opacity .5s .3s;
}</style>

<script>



function writerboard(obj){
   var puserid = obj;
    $.ajax({
         type:"post",
         url: "myWork_board?id="+puserid,
         success : function(result){
           material();
            $("#writer_content").html(result);
         }//석세스
      });//ajax
}


function material(){
     var s = document.getElementById("shade");
     var p = document.getElementById("card");
     var c = document.getElementById("writer_content");
     //s.style.display = "block";
     p.style.visibility = "visible";
     p.style.opacity = "1";
     p.style.borderRadius = "3px";
     p.style.width = "600px";
     p.style.height = "800px";
     c.style.opacity = "1";
     s.style.zIndex = "2";
     p.style.zIndex = "3";
     s.style.backgroundColor = "rgba(0,0,0,0.5)";
   }

   function hide(){
     var s = document.getElementById("shade");
     var p = document.getElementById("card");
     var c = document.getElementById("writer_content");
     //s.style.display = "block";
     p.style.opacity = "0";
     p.style.borderRadius = "100%";
     p.style.width = "0";
     p.style.height = "0";
     c.style.opacity = "0";
     s.style.zIndex = "-1";
     p.style.zIndex = "-1";
     s.style.backgroundColor = "rgba(0,0,0,0)";
     window.location.reload();
   }
   /*  function writerclick(mX, mY) {
         mX = event.pageX;
         mY = event.pageY;
          $("#writerClickMenu").remove();
          $("#writerhandler").append(" <div class='dropdown-menu show' aria-labelledby='navbarDropdown'><a class='dropdown-item' href='binsert_form'>다른 글 보기</a><a class='dropdown-item' href='detail'>작성 댓글 보기</a></div>");
                var wW = $(window).width(),
              wH = $(window).height();
              
          if (mX >= (wW - 230)) {
              $("#writerClickMenu").css({
                  left: mX - 220
              });
          } else {
              $("#writerClickMenu").css({
                  left: mX
              });
          }
          
          if (mY >= (wH - 249)) {
              $("#writerClickMenu").css({
                  top: mY - 239
              });
          } else {
              $("#writerClickMenu").css({
                  top: mY
              });
          }
      }; */
</script>
      <hr>
      <footer class="footer">
         <div class="container">
            <div class="text-center col-lg-6 offset-lg-3">
               <h5>정상원 · 오진욱 · 이하은</h5>
               <p>
                  Copyright &copy; 2018 &middot; All Rights Reserved &middot; <a
                     href="index">PDic</a>
               </p>
            </div>
         </div>
      </footer>
   <!--하단 footer-->


   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="resources/js/jquery-3.2.1.min.js"></script>

   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="resources/js/popper.min.js"></script>
   <script src="resources/js/bootstrap-4.0.0.js"></script>
</body>
</html>