<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<h1>로그인</h1>
		<form action="request3_pro.jsp" method="get">
			<input type="text" name="id" placeholder="아이디"><br>
			<input type="password" name="passwd" placeholder="패스워드"><br>
			<!-- 체크박스 생성시 value  -->
			<input type="checkbox" name="rememberId">아이디 기억<br>
			<input type="submit" value="로그인">
		</form>
	
	</div>

</body>
</html>