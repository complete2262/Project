<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>P.Dic | Main</title>

<!-- Bootstrap -->
<link href="resources/css/bootstrap-4.0.0.css" rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="resources/js/jquery-3.2.1.min.js"> 
</script>

   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="resources/js/popper.min.js"></script>
   <script src="resources/js/bootstrap-4.0.0.js"></script>
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

.pb-cmnt-container {
   font-family: Lato;
   margin-top: 100px;
}

.pb-cmnt-textarea {
   resize: none;
   padding: 20px;
   height: 130px;
   width: 100%;
   border: 1px solid #F2F2F2;
}
</style>

<script>
$(document).ready(function(){
      $.ajax({
         type:"post",
         url: "rlist?id=${bvoInfo.ID}&puser_id=${bvoInfo.PUSER_ID}",
         success : function(result){
            $("#replyresult").html(result);
            $(".replyobject").slice(0, 4).show();
            $("#loadMore").on('click', function (e) {
                   e.preventDefault();
                   $(".replyobject:hidden").slice(0, 4).slideDown();
                   if ($(".replyobject:hidden").length == 0) {
                       $("#load").fadeOut('slow');
                   }
                   $('html,body').animate({
                       scrollTop: $(this).offset().top
                   }, 1500);
               });
         }//석세스
      });//ajax

      function choicecheck(){
            $.ajax({
            type:"get",
            url: "choose",
               success : function(data) {
                  if(data==1){
                     $("#chooseArea").html('<div class="card card-inner"><div class="card-body" style="border: 2px solid gray;"><div class="row"><div class="col-2"><c:if test="${mm.NICKNAME==null}"><a href="#"><strong>탈퇴회원 </strong></a></c:if><c:if test="${mm.NICKNAME!=null}"><a href="#"><strong>${mm.NICKNAME} </strong></a></c:if><p class="text-secondary text-center"><fmt:formatDate value="${mm.REGDATE}"  pattern="yy.MM.dd"/></p><p class="text-center" style="background-color: #343a40; color: white; ">채택된 답변</p></div><div class="col-10" id="updatearea${status.count}"><p id="replycontent${status.count}">${mm.CONTENT}ㅇㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ</p><img class="float-right"src="resources/images/choose.png"></div></div></div></div>');
                  }
                  else{
                     
                  }
                  }
            });
         }  
});//레디

function insertreply(){
   var content = $('#replyinsert_content').val();
   $.ajax({
       type:"post",
       data : {
          content : content
       },
       url: "replyInsert?pboard1_id=${bvoInfo.ID}",
       success : function(result){
          alert("댓글이 등록되었습니다")
            $("#replyresult").html(result);
            $(".replyobject").slice(0, 4).show();
            $("#loadMore").on('click', function (e) {
                   e.preventDefault();
                   $(".replyobject:hidden").slice(0, 4).slideDown();
                   if ($(".replyobject:hidden").length == 0) {
                       $("#load").fadeOut('slow');
                   }
                   $('html,body').animate({
                       scrollTop: $(this).offset().top
                   }, 1500);
               });
       }//석세스
    });//ajax
};
function updatereply(replyId){
   var content = $('#updateContent').val();
      $.ajax({
          type:"post",
          data : {content :content
          },
          url: "replyUpdate?id="+replyId+"&pboard1_id=${bvoInfo.ID}",
          success : function(result){
               $("#replyresult").html(result);
               $(".replyobject").slice(0, 4).show();
               $("#loadMore").on('click', function (e) {
                      e.preventDefault();
                      $(".replyobject:hidden").slice(0, 4).slideDown();
                      if ($(".replyobject:hidden").length == 0) {
                          $("#load").fadeOut('slow');
                      }
                      $('html,body').animate({
                          scrollTop: $(this).offset().top
                      }, 1500);
                  });
          }//석세스
       });//ajax
}
function deletereply(url){
var checkDelete = confirm("선택하신 댓글이 삭제됩니다 정말 괜찮으시겠습니까?")
   if(checkDelete ==true){
   $.ajax({
       type:"post",
       url: url,
       success : function(result){
            $("#replyresult").html(result);
            $(".replyobject").slice(0, 4).show();
            $("#loadMore").on('click', function (e) {
                   e.preventDefault();
                   $(".replyobject:hidden").slice(0, 4).slideDown();
                   if ($(".replyobject:hidden").length == 0) {
                       $("#load").fadeOut('slow');
                   }
                   $('html,body').animate({
                       scrollTop: $(this).offset().top
                   }, 1500);
               });
       }//석세스
    });//ajax
   }else{}
}

</script>
<script>
function editform(replyNo, replyId){
   var contentno = "replycontent"+replyNo
   var content= $('#'+contentno).html();
   $('#updatearea'+replyNo).replaceWith('<div class="col-10" id="updatearea"><textarea name="content" id="updateContent" class="pb-cmnt-textarea">'+content+'</textarea> <button class="btn btn-primary btn-block" type="button" onclick="updatereply('+replyId+')" >등록</button></form>   </div>');
}

function like(){

      $.ajax({
         type:"get",
         url: "boardChoice?id=${bvoInfo.ID}",
         success : function(result){
            if (result =="0"){
               alert("글에대한 좋아요를 누르셨습니다");
               $("#likebutton").attr({
                    src: "resources/images/opendBook.png",
                    id: "dislikebutton",
                    onclick: "dislike()"
                    });
               
            }if (result =="1"){
               alert("이미 좋아요를 눌렀습니다");
            }
         }//석세스
      });//ajax

   }//like;
   
</script>
<script>
function dislike(){
      $.ajax({
         type:"get",
         url: "choiceCancel?id=${bvoInfo.ID}",
         success : function(result){
               if (result =="0"){
                  alert("아직 해당 글에 대한 좋아요를 누르지 않았습니다");
               }if (result =="1"){
                  $("#dislikebutton").attr({
                       src: "resources/images/closedBook.png",
                       id: "likebutton",
                       onclick: "like()"
                       });
               }
         }//석세스
      });//ajax

   }//like;
</script>
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
         <input name="searchOption" value="main" type="hidden">
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
   </c:if>

        <!--detail view-->

   <div class="container"
      style="margin-top: 100px; margin-bottom: 100px; width: 900px;">
      <div class="row"></div>
      <div class="row">
        <div class="col-6 align-self-end">
            <div class="title">
               <h2 class="display-4">
                  <a href="boardList?tag=${bvoInfo.TAG}"
                     style="color: black; text-decoration: none;">${bvoInfo.TAG}</a>
               </h2>
               <hr>
            </div>
         </div> 
         <div class="col-6 align-self-end text-center"></div>
      </div>


      <thead>
         <div class="row">
            <div class="col-6">
               <h3 class="title ub-word">
                 <%--  <span class="title_headtext">[${bvo.tag}]</span> --%> <span
                     class="title_subject">${bvoInfo.TITLE}</span>
               </h3>
                        <c:if test="${bvoInfo.NICKNAME==null}">
                        <em>탈퇴회원</em>
                        </c:if>
                        <c:if test="${bvoInfo.NICKNAME!=null}">
                        <em>${bvoInfo.NICKNAME}</em>
                        </c:if>
               
               <span class="date">${bvoInfo.REGDATE}</span>
            </div>

            <div class="col-6 align-self-end text-right">
               <span class="count">조회 ${bvoInfo.CNT}</span>&nbsp;&nbsp; <span class="reply_num">좋아요
                  ${bvoInfo.CHOICE}</span>&nbsp;&nbsp; <span class="comment">댓글 ${bvoInfo.REPLYCOUNT}</span>
            </div>
         </div>
         <hr>
      </thead>
      <tbody>
         <div class="row">
       <%--  <div class="col-12 view_contents"
               style="overflow: hidden; width: 900px; min-height: 400px; border: 1px;">
               ${bvoInfo.ID}</div>
         </div> --%>
            <div class="col-12 view_contents"
               style="overflow: hidden; width: 900px; min-height: 400px; border: 1px;">
               ${bvoInfo.CONTENT}</div>
         </div>
         
         <div>
         <form action="" style="width:1; height: 1;">
         <input name="tag" value="${bvoInfo.TAG}" type="hidden">
          <input name="puser_id" value="${bvoInfo.PUSER_ID}" type="hidden">
         </form>
         </div>
         
         <c:if test="${Identity.id!=bvoInfo.PUSER_ID}">
         <c:if test="${Identity ==null}">
         <div class="row">
            <div class="col-12 view_image"
               style="overflow: hidden; width: 900px; border: 1px;">
               <nav>
                  <a class="float-right btn text-white btn-danger"
                     href="boardList?tag=${bvoInfo.TAG}">목록</a> &nbsp; &nbsp;
               </nav>
            </div>
         </div>
         </c:if>
          <c:if test="${Identity != null}">
          <div class="row">
            <div class="col-12 view_image"
               style="overflow: hidden; width: 900px; border: 1px;">
               <nav>
               <c:if test="${likeCheck=='0'}"> 
                 <img id="likebutton" src="resources/images/closedBook.png" alt="" style="cursor:pointer;" onclick="like()">
                </c:if>
                 <c:if test="${likeCheck=='1'}"> 
                  <img id="dislikebutton" src="resources/images/opendBook.png" alt="" style="cursor:pointer;" onclick="dislike()">
                </c:if>
                 <a class="float-right btn text-white btn-danger"
                     href="boardList?tag=${bvoInfo.TAG}">목록</a> &nbsp; &nbsp;
               </nav>
            </div>
         </div>
          </c:if>
</c:if>
<c:if test="${Identity.id==bvoInfo.PUSER_ID}">

 <div class="row">
            <div class="col-12 view_image"
               style="overflow: hidden; width: 900px; border: 1px;">
               <nav>
                 &nbsp; &nbsp;
                  <a class="float-right btn text-white btn-danger"
                     href="update_form?id=${bvoInfo.ID}">수정하기</a> &nbsp; &nbsp;
                  <a class="float-right btn text-white btn-danger"
                     href="boardDelete?id=${bvoInfo.ID}">삭제하기</a> &nbsp; &nbsp;
                  <a class="float-right btn text-white btn-danger"
                     href="boardList?tag=${bvoInfo.TAG}">목록</a> &nbsp; &nbsp;
               </nav>
            </div>
         </div>
</c:if>

         <hr>

         <!-- 댓글 -->

      </tbody>
      <div id="reply"> 
      <div class="row">
         <div class="col-12 view_reply">
            <div class="card ">
            <div id="replyresult"></div>
            
            
            <!-- 댓글쓰기 -->
            
         </div>
      </div>
   </div>
   </div> </div>

  
       <%--  <!--detail view-->

   <div class="container"
      style="margin-top: 100px; margin-bottom: 100px; width: 900px;">
      <div class="row"></div>
      <div class="row">
        <div class="col-6 align-self-end">
            <div class="title">
               <h2 class="display-4">
                  <a href="boardList?tag=${bvoInfo.TAG}"
                     style="color: black; text-decoration: none;">${bvoInfo.TAG}</a>
               </h2>
               <hr>
            </div>
         </div> 
         <div class="col-6 align-self-end text-center"></div>
      </div>


      <thead>
         <div class="row">
            <div class="col-6">
               <h3 class="title ub-word">
                  <span class="title_headtext">[${bvo.tag}]</span> <span
                     class="title_subject">${bvoInfo.TITLE}</span>
               </h3>
                        <c:if test="${bvoInfo.NICKNAME==null}">
                        <em>탈퇴회원</em>
                        </c:if>
                        <c:if test="${bvoInfo.NICKNAME!=null}">
                        <em>${bvoInfo.NICKNAME}</em>
                        </c:if>
               
               <span class="date">${bvoInfo.REGDATE}</span>
            </div>

            <div class="col-6 align-self-end text-right">
               <span class="count">조회 ${bvoInfo.CNT}</span>&nbsp;&nbsp; <span class="reply_num">좋아요
                  ${bvoInfo.CHOICE}</span>&nbsp;&nbsp; <span class="comment">댓글 ${bvoInfo.REPLYCOUNT}</span>
            </div>
         </div>
         <hr>
      </thead>
      <tbody>
         <div class="row">
        <div class="col-12 view_contents"
               style="overflow: hidden; width: 900px; min-height: 400px; border: 1px;">
               ${bvoInfo.ID}</div>
         </div>
            <div class="col-12 view_contents"
               style="overflow: hidden; width: 900px; min-height: 400px; border: 1px;">
               ${bvoInfo.CONTENT}</div>
         </div>
         <div>
         <form action="" style="width:1; height: 1;">
         <input name="tag" value="${bvoInfo.TAG}" type="hidden">
         <input name="puser_id" value="${bvoInfo.PUSER_ID}" type="hidden">
         </form>
         </div>
         
         
         <div class="row">
            <div class="col-12 view_image"
               style="overflow: hidden; width: 900px; border: 1px;">
               <nav>
               <c:if test="${likeCheck=='0'}"> 
                 <img id="likebutton" src="resources/images/closedBook.png" alt="" style="cursor:pointer;" onclick="like()">
                </c:if>
                 <c:if test="${likeCheck=='1'}"> 
                  <img id="dislikebutton" src="resources/images/opendBook.png" alt="" style="cursor:pointer;" onclick="dislike()">
                </c:if>
                 &nbsp; &nbsp;
                  <a class="float-right btn text-white btn-danger"
                     href="update_form?id=${bvoInfo.ID}">수정하기</a> &nbsp; &nbsp;
                  <a class="float-right btn text-white btn-danger"
                     href="boardDelete?id=${bvoInfo.ID}">삭제하기</a> &nbsp; &nbsp;
                  <a class="float-right btn text-white btn-danger"
                     href="boardList?tag=${bvoInfo.TAG}">목록</a> &nbsp; &nbsp;
               </nav>
            </div>
         </div>


         <hr>

         <!-- 댓글 -->

      </tbody>
      <div id="reply"> 
      <div class="row">
         <div class="col-12 view_reply">
            <div class="card ">
            <div id="replyresult"></div>
            
            
            <!-- 댓글쓰기 -->
            
         </div>
      </div>
   </div>
   </div> </div>




       --%>


 
   <!--하단 footer-->


   <hr>
   <footer class="footer">
      <div class="container">
         <div class="text-center col-lg-6 offset-lg-3">
            <h5>정상원 · 오진욱 · 이하은</h5>
            <p>
               Copyright &copy; 2018 &middot; All Rights Reserved &middot; <a
                  href="#">PDic</a>
            </p>
         </div>
      </div>
   </footer>


   
</body>
<style>
a, a:visited {
    color: #33739E;
    text-decoration: none;
    display: block;
    margin: 10px 0;
}
.replyobject {
    display:none;
   
}

a:hover {
    text-decoration: none;
}
#loadMore {
    padding: 10px;
    text-align: center;
    background-color: #33739E;
    color: #fff;
    border-width: 0 1px 1px 0;
    border-style: solid;
    border-color: #fff;
    box-shadow: 0 1px 1px #ccc;
    transition: all 600ms ease-in-out;
    -webkit-transition: all 600ms ease-in-out;
    -moz-transition: all 600ms ease-in-out;
    -o-transition: all 600ms ease-in-out;
}
#loadMore:hover {
    background-color: #fff;
    color: #33739E;
}


}</style>

</html>