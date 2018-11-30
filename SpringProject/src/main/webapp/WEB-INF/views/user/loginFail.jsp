<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>** LoginFail [Spring_Mybatis] **</title>
</head>
<body>
<% session.invalidate(); %>
<script>
alert('아이디 / 비밀번호를 확인해주세요');
window.location='login_form';
</script>
</body>
</html>