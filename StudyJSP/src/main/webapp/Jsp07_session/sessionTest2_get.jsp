<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>sessionTest2_get.jsp</h1>
	<hr>
	<h3>세션 아이디 : <%=session.getId() %></h3>
	<h3>세션값1(sessionValue1) : <%=session.getAttribute("sessionValue1") %></h3>
	<h3>세션값2(sessionValue1) : <%=session.getAttribute("sessionValue2") %></h3>
	<hr>
	<input type="button" value="이전 페이지" onclick="history.back()">
	<input type="button" value="처음으로" onclick="location.href='sessionTest2.jsp'">
</body>
</html>