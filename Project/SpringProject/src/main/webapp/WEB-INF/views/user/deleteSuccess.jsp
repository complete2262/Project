<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>
<% session.invalidate(); %>
<script>
alert('회원탈퇴가 완료되었습니다');
window.location='index';
</script>
</body>
</html>