<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LikeView</title>
</head>
<body>
  <div class="row text-center" id="lastquestion" style="margin-top:30px;">
           <div class="col-lg-6">
         <div class="card">
            <div class="card-header">추천이 가장많은 글</div>
            <ul class="list-group list-group-flush">
               <c:forEach var="mm" items="${likeList}" begin="0" end="4">

                  <li class="list-group-item"><a class="page-link"
                     href="boardDetail?id=${mm.ID}"
                     style="color: black; font-weight: bold;">${mm.TITLE}</a></li>
               </c:forEach>
            </ul>
         </div>
         &nbsp;
      </div>
      <div class="col-lg-6">
         <div class="card">
            <div class="card-header">최근에 업로드된 글</div>
            <ul class="list-group list-group-flush">
               <c:forEach var="nn" items="${latestList}" begin="0" end="4">

                  <li class="list-group-item"><a class="page-link"
                     href="boardDetail?id=${nn.ID}"
                     style="color: black; font-weight: bold;">${nn.TITLE}</a></li>
               </c:forEach>
            </ul>
         </div>
      </div>
    </div>
   
</body>
</html>