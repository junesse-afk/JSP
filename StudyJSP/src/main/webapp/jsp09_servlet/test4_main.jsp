<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 패턴만 맞으면 다 보낼 수 있게 --%>
	<h1>test4_main.jsp</h1>
	<form action="asdasd.test" method="get">
		<input type="submit" value="요청(GET)">
	</form>
	<form action="azxczxcsw.test" method="post">
		<input type="submit" value="요청(POST)">
	</form>
	<hr>
	<%-- 프로젝트명만 정해주면 그 밑으로 알아서 판단하고 가져옴 --%>
	<form action="/StudyJSP/sdsds/aaa.test" method="post">
		<input type="submit" value="/aaa요청(POST)">
	</form>
	<form action="${pageContext.request.contextPath}/aaa.test" method="post">
		<input type="submit" value="/aaa요청(POST)">
	</form>
	
</body>
</html>