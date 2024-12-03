<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3><a href="main.pr">상품</a></h3>

	<h1>index.jsp</h1>

	<h3><a href="Main.jdbc">JDBC 메인화면</a></h3>

	<form action="myServlet1" method="get"> <%-- myServlet1 가성서버?요청  --%>
		<input type="submit" value="GET 방식">
	</form>
	
	<form action="myServlet1" method="post">
		<input type="submit" value="POST 방식">
	</form>
	<hr>
	<%-- Servlet 연습 --%>
	<form action="myServlet2" method="get">
		<input type="submit" value="GET 방식">
	</form>
	
	<form action="myServlet2" method="post">
		<input type="submit" value="POST 방식">
	</form>

</body>
</html>