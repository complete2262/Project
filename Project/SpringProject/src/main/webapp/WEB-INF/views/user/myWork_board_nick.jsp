
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

</style>
</head>
<body id="bodyheight">

   <!--컨테이너-->

   <div class="container" style="margin-top: 100px; margin-bottom: 100px;">
    <div class="row" >
         <div class="col-6 align-self-end">
            <div class="title">
               <h2 class="display-2"></h2> 총 ${totalRecord}개의 게시글이 있습니다
               <hr>
            </div>
         </div>
      </div>
      <div class="row" style="overflow-y:scroll;height:500px;">
         <div>
            <table class="table table-striped table-hover" id="board">
            </table>
            <table class="table table-striped table-hover">
               <thead>

                  <tr>
                     <th class="number">번호</th>
                     <th class="category">분류</th>
                     <th class="subject">제목</th>
                     <th class="date">날짜</th>
                     <th class="viewcount">조회수</th>
                     <th class="like">좋아요</th>
                  </tr>

               </thead>
               <tbody>
                  <c:forEach var="mm" items="${myWork_board}" varStatus="status">
                     <tr>
                     <c:if test="${pageNum ==1 }">
                        <td class="number">${status.count}</td></c:if>
                      <c:if test="${pageNum !=1 }">
                        <td class="number">${totalRecord - ((pageNum-1) * 10 + status.index)}</td></c:if>   
                        <td class="category">${mm.TAG}</td>
                        <td class="subject"><a href="boardDetail?id=${mm.ID}">${mm.TITLE}
                        </a></td>
                        <td class="date" style="font-size:14px;"><fmt:formatDate value="${mm.REGDATE}"  pattern="yy.MM.dd"/></td>
                        <td class="viewcount">${mm.CNT}</td>
                        <td class="like">${mm.CHOICE}</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
            <hr>
         </div>
      </div>
 <span class="opt" onclick="hide();">닫기</span>
   </div>



   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="resources/js/jquery-3.2.1.min.js"></script>

   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="resources/js/popper.min.js"></script>
   <script src="resources/js/bootstrap-4.0.0.js"></script>
</body>
</html>