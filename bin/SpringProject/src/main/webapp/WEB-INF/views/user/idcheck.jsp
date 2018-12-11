<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>** ID 중복확인 _Ajax 로 구현하기 **</title>
</head>
<body>
	<c:if test="${idresult==1}">
		${userid}는 사용중인 ID 입니다.
	</c:if>
	<c:if test="${idresult==0}">
		${userid}는 사용 가능한 ID 입니다.
	</c:if>
</body>
</html>