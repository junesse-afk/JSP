<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test3_main.jsp</h1>
	<form action="myServlet3" method="get">
		<input type="hidden" name="id" value="admin">
		<input type="hidden" name="name" value="홍길동">
		<input type="submit" value="myServlet3 요청(GET)">
	</form>
	<form action="myServlet3" method="post">
		<input type="hidden" name="id" value="admin">
		<input type="hidden" name="name" value="홍길동">
		<input type="submit" value="myServlet3 요청(POST)">
	</form>
	<hr>
	<hr>
	
	<%-- 요청 주소 앞에 /가 붙을 경우 루트(/)를 의미하게 되므로
		현재 요청 주소의 최상의 경로에서 myServlet3 서블릿을 요청하게 된다!
	 --%>
	<form action="../myServlet3" method="get">
		<input type="submit" value="/myServlet3 요청(GET)">
	</form>
	<%-- 현재 프로젝트명(컨텍스트 루트)까지 직접 기술하지 않고 EL을 통해 표현하는 방법--%>
	<form action="${pageContext.request.contextPath}/myServlet3" method="get">
		<input type="submit" value="EL/myServlet3 요청(GET)">
	</form>
	
	<h3>${pageContext.request.contextPath}</h3>
	
</body>
</html>