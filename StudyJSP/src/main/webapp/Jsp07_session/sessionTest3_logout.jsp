<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//세션 초기화 후 메인페이지(sessionTest3_main.jsp)로 리다이렉트
session.invalidate();
response.sendRedirect("sessionTest3_main.jsp");

%>
</body>
</html>