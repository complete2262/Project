<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404에러페이지</title>
</head>
<body>
	<script type="text/javascript">
	alert('404서비스 오류가 발생했습니다. 시스템 담당자에게 문의해 주세요.');
	history.back();
	</script>
</body>
</html>