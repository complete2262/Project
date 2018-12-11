<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
         		<input name="searchOption" value="main_all" type="hidden">
           		 <input class="form-control mr-sm-2" type="search"
              		 placeholder="Search" aria-label="Search" name="keyword">
            	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        	 </form>
         </div>
      </nav>
  


   <!--write form-->

   <div class="container" style="margin-top: 100px; margin-bottom: 100px;">
      <div class="row"></div>
      <div class="row">
         <div class="col-6 align-self-end">
            <div class="title">
               <h2 class="display-4">
                  <a href="boardList?tag=${param.tag}"
                     style="color: black; text-decoration: none;">${param.tag}</a>
               </h2>
               <hr>
            </div>
         </div>
         <div class="col-6 align-self-end text-center"></div>
      </div>

      <div class="row">
         <div class="col-12">

            <form method="post" action="boardInsert?tag=${param.tag}"
               enctype="multipart/form-data">
               <input name="puser_id" id="puser_id" type="hidden"
                  value="${Identity.id}" />
               <table class="table" style="text-align: center; border: 1px">

                  <tbody>

                     <tr>

                        <td colspan="2"><input type="text" class="form-control"
                           placeholder="글제목" name="title" id="title" maxlength="50"></td>

                     </tr>
                     <tr>

                        <td><input type="text" class="form-control"
                           placeholder="작성자" value="${Identity.nickName}" id="writer"
                           name="writer" maxlength="20" disabled></td>
                        <td><select class="custom-select d-block w-100" id="tag"
                           name="tag" required="">
                              <c:choose>
                                 <c:when test="${param.tag=='Jquery'}">
                                    <option value="Jquery" selected="selected">Jquery</option>
                                    <option value="HTML/CSS">HTML/CSS</option>
                                    <option value="JavaScript">JavaScript</option>
                                    <option value="Server">Server</option>
                                    <option value="Database">Database</option>
                                    <option value="Framework">Framework</option>
                                 </c:when>
                                 <c:when test="${param.tag=='HTML/CSS'}">
                                    <option value="Jquery">Jquery</option>
                                    <option value="HTML/CSS" selected="selected">HTML/CSS</option>
                                    <option value="JavaScript">JavaScript</option>
                                    <option value="Server">Server</option>
                                    <option value="Database">Database</option>
                                    <option value="Framework">Framework</option>
                                 </c:when>
                                 <c:when test="${param.tag=='JavaScript'}">
                                    <option value="Jquery">Jquery</option>
                                    <option value="HTML/CSS">HTML/CSS</option>
                                    <option value="JavaScript" selected="selected">JavaScript</option>
                                    <option value="Server">Server</option>
                                    <option value="Database">Database</option>
                                    <option value="Framework">Framework</option>
                                 </c:when>
                                 <c:when test="${param.tag=='Server'}">
                                    <option value="Jquery">Jquery</option>
                                    <option value="HTML/CSS">HTML/CSS</option>
                                    <option value="JavaScript">JavaScript</option>
                                    <option value="Server" selected="selected">Server</option>
                                    <option value="Database">Database</option>
                                    <option value="Framework">Framework</option>
                                 </c:when>
                                 <c:when test="${param.tag=='Database'}">
                                    <option value="Jquery">Jquery</option>
                                    <option value="HTML/CSS">HTML/CSS</option>
                                    <option value="JavaScript">JavaScript</option>
                                    <option value="Server">Server</option>
                                    <option value="Database" selected="selected">Database</option>
                                    <option value="Framework">Framework</option>
                                 </c:when>
                                 <c:when test="${param.tag=='Framework'}">
                                    <option value="Jquery">Jquery</option>
                                    <option value="HTML/CSS">HTML/CSS</option>
                                    <option value="JavaScript">JavaScript</option>
                                    <option value="Server">Server</option>
                                    <option value="Database">Database</option>
                                    <option value="Framework" selected="selected">Framework</option>
                                 </c:when>
                                 <c:otherwise>
                                    <option disabled="disabled" selected="selected">선택해주세요</option>
                                    <option value="Jquery">Jquery</option>
                                    <option value="HTML/CSS">HTML/CSS</option>
                                    <option value="JavaScript">JavaScript</option>
                                    <option value="Server">Server</option>
                                    <option value="Database">Database</option>
                                    <option value="Framework">Framework</option>
                                 </c:otherwise>
                              </c:choose>
                        </select></td>

                     </tr>


                     <tr>

                        <td colspan="2"><textarea class="form-control"
                              placeholder="글 내용" name="content" id="content"
                              style="height: 450px; width: 95%" rows="10" cols="100"></textarea>
                        </td>
            
                     </tr>
                     <tr>

               <td></td>
               
                     <td></td>

                     </tr>

                  </tbody>

               </table>
               <div class="row justify-content-center">
                  <div class="col-1 text-center">
                     <input type="reset" class="btn btn-outline-secondary pull-right"
                        value="취소">
                  </div>
                  <div class="col-1 text-center">
                     <input type="submit" class="btn btn-secondary pull-right"
                        onclick="submitContents()" value="글쓰기"> &nbsp;
                  </div>
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
            <p>
               Copyright &copy; 2018 &middot; All Rights Reserved &middot; <a
                  href="index">PDic</a>
            </p>
         </div>
      </div>
   </footer>

   <script type="text/javascript"
      src="resources/js/service/HuskyEZCreator.js" charset="utf-8"></script>
   <script type="text/javascript">

var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "SmartEditor2Skin",

    fCreator: "createSEditor2"

});
//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

// 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
// 에디터의 내용에 대한 값 검증은 이곳에서            
// document.getElementById("ir1").value를 이용해서 처리한다.

var contentScript = document.getElementById("content").value

try {      
elClickedObj.form.submit();   

} catch(e) {}}

// textArea에 이미지 첨부
function pasteHTML(filepath){
   
    var sHTML = '<img src="'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
    
}

</script>
   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="resources/js/jquery-3.2.1.min.js"></script>

   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="resources/js/popper.min.js"></script>
   <script src="resources/js/bootstrap-4.0.0.js"></script>
</body>
</html>