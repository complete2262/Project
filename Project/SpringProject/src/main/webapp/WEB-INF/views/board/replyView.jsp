<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


</head>
<body>
   <c:if test="${Identity==null}">
      <!-- 댓글쓰기 -->
      <div class="card-body">
         <form action="replyInsert" method="post" id="replyinsertform"
            enctype="multipart/form-data">
            <input height="1" type="hidden" name="pboard1_id" value="${bvoID}">
            <div class="row">
               <div class="col-10">
                  <textarea name="content" placeholder="비회원은 댓글을 다실 수 없습니다"
                     onclick="alert('로그인이 필요합니다');location.href='login_form'"
                     class="pb-cmnt-textarea"></textarea>
               </div>

               <div class="col-2 align-self-center">
                  <button disabled="disabled" class="btn btn-primary btn-block"
                     type="button">등록</button>
               </div>
            </div>
         </form>
      </div>

<c:if test="${Identity!=null}">
      <!-- 댓글쓰기 -->
      <div class="card-body">
         <form action="replyInsert" method="post"
            enctype="multipart/form-data">
            <input height="1" type="hidden" name="pboard1_id" value="${bvoID}">
            <div class="row">
               <div class="col-10">
                  <textarea name="content" id="replyinsert_content"
                     placeholder="코멘트를 입력해주세요" class="pb-cmnt-textarea"></textarea>
               </div>

               <div class="col-2 align-self-center">
                  <button class="btn btn-primary btn-block" type="button"
                     onclick="insertreply()">등록</button>
               </div>
            </div>
         </form>
      </div></c:if>
    
      <hr>
      <c:if test="${rvoInfo != null}">
            <div class="col-12 replyobject" id="chooseArea">
            </div>
      <div class="col-12 replyobject">
               <div class="card card-inner">
                  <div class="card-body" style="border: 2px solid gray;">
                     <div class="row">
                        <div class="col-2">
                           <c:if test="${rvoInfo.NICKNAME==null}">
                              <a href="#"><strong>탈퇴회원 </strong></a>
                           </c:if>
                           <c:if test="${rvoInfo.NICKNAME!=null}">
                              <a href="#"><strong>${rvoInfo.NICKNAME} </strong></a>
                           </c:if>
                           <p class="text-secondary text-center"><fmt:formatDate value="${rvoInfo.REGDATE}"  pattern="yy.MM.dd"/></p>
                                <p class="text-center" style="background-color: #343a40; color: white; ">채택된 답변</p>
                        </div>
                        
                        <div class="col-10" id="updatearea${status.count}">
                           <p id="replycontent${status.count}">${rvoInfo.CONTENT}</p>
                            
                            <img class="float-right"src="resources/images/choose.png">
                        </div>

                     </div>
                  </div>
               </div>

            </div>
      
      </c:if>
      <c:if test="${getReply == null}">댓글을 등록해주세요</c:if>
      <c:if test="${getReply != null}">
         <c:forEach var="mm" items="${getReply}" varStatus="status">
            <div class="col-12 replyobject">
               <div class="card card-inner">
                  <div class="card-body">
                     <div class="row">
                        <div class="col-2">
                           <c:if test="${mm.NICKNAME==null}">
                              <a href="#"><strong>탈퇴회원 </strong></a>
                           </c:if>
                           <c:if test="${mm.NICKNAME!=null}">
                              <a href="#"><strong>${mm.NICKNAME} </strong></a>
                           </c:if>
                           <p class="text-secondary text-center"><fmt:formatDate value="${mm.REGDATE}"  pattern="yy.MM.dd"/></p>
                           <p>${mm.CHOICE} 추천</p>
                        </div>
                        <div class="col-10" id="updatearea${status.count}">
                           <p>${mm.CONTENT}</p>
                           <p>
         
                           </p>
                        </div>


                     </div>
                  </div>
               </div>

            </div>
         </c:forEach>
      </c:if>
   </c:if>
 <c:if test="${Identity!=null}">
      <!-- 댓글쓰기 -->
      <div class="card-body">
         <form action="replyInsert" method="post"
            enctype="multipart/form-data">
            <input height="1" type="hidden" name="pboard1_id" value="${bvoID}">
            <div class="row">
               <div class="col-10">
                  <textarea name="content" id="replyinsert_content"
                     placeholder="코멘트를 입력해주세요" class="pb-cmnt-textarea"></textarea>
               </div>

               <div class="col-2 align-self-center">
                  <button class="btn btn-primary btn-block" type="button"
                     onclick="insertreply()">등록</button>
               </div>
            </div>
         </form>
      </div>

      <hr>
        <c:if test="${rvoInfo != null}">
            <div class="col-12 replyobject" id="chooseArea">
            </div>
      <div class="col-12 replyobject">
               <div class="card card-inner">
                  <div class="card-body" style="border: 2px solid gray;">
                     <div class="row">
                        <div class="col-2">
                           <c:if test="${rvoInfo.NICKNAME==null}">
                              <a href="#"><strong>탈퇴회원 </strong></a>
                           </c:if>
                           <c:if test="${rvoInfo.NICKNAME!=null}">
                              <a href="#"><strong>${rvoInfo.NICKNAME} </strong></a>
                           </c:if>
                           <p class="text-secondary text-center"><fmt:formatDate value="${rvoInfo.REGDATE}"  pattern="yy.MM.dd"/></p>
                                <p class="text-center" style="background-color: #343a40; color: white; ">채택된 답변</p>
                        </div>
                        
                        <div class="col-10" id="updatearea${status.count}">
                           <p id="replycontent${status.count}">${rvoInfo.CONTENT}</p>
                            
                            <img class="float-right"src="resources/images/choose.png">
                        </div>

                     </div>
                  </div>
               </div>

            </div>
      
      </c:if>
      <c:if test="${getReply == null}">댓글을 등록해주세요</c:if>
      <c:if test="${getReply != null}">
         <c:forEach var="mm" items="${getReply}" varStatus="status">
            <div class="col-12 replyobject">
               <div class="card card-inner">
                  <div class="card-body">
                     <div class="row">
                        <div class="col-2">
                           <c:if test="${mm.NICKNAME==null}">
                              <a href="#"><strong>탈퇴회원 </strong></a>
                           </c:if>
                           <c:if test="${mm.NICKNAME!=null}">
                              <a href="#"><strong>${mm.NICKNAME} </strong></a>
                           </c:if>
                           <p class="text-secondary text-center"><fmt:formatDate value="${mm.REGDATE}"  pattern="yy.MM.dd"/></p>
                              <p>${mm.CHOICE} 추천</p>
                        </div>
                        
                        <div class="col-10" id="updatearea${status.count}">
                           <p id="replycontent${status.count}">${mm.CONTENT}</p>
                         <c:if test="${Identity.id ==mm.PUSER_ID}">
                         <button style="cursor:pointer; border:none;" class="float-right btn-sm btn-danger"
            onclick="deletereply('replyDelete?id=${mm.ID}&pboard1_id=${bvoID}')">삭제</button>
            <button style="cursor:pointer; border:none;" class="float-right btn-sm btn-danger"
               onclick="editform(${status.count}, ${mm.ID})">수정</button></c:if>
                           <c:if test="${Identity.id== puser_id}"> 
                <c:if test="${Identity.id != mm.PUSER_ID}">
                <c:if test="${rvoInfo == null}">   <img class="float-right" onclick="choice('${mm.ID}')" 
         src="resources/images/choice.png" style="cursor:pointer;">
         <script>
               function choice(id){
                   location.href = "replyChoice?preply1_id="+id+"&pboard1_id="+'${bvoID}';
                  }</script>
                  </c:if>
      </c:if></c:if> 
                        </div>

                     </div>
                  </div>
               </div>

            </div>

         </c:forEach>
      </c:if>
      </c:if>
            <a href="#" id="loadMore">Load More</a>
</body>

</html>