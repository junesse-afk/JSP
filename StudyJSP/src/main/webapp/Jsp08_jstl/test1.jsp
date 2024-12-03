<%@page import="jsp08_jstl.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>test1.jsp</h1>
	<form action="test1_result.jsp">
		<input type="text" placeholder="이름" name="name"><br>
		<input type="text" placeholder="나이" name="age"><br>
		<input type="text" placeholder="이메일" name="email"><br>
		<input type="submit" value="전송"><br>	
	
	</form>
	<%
	//세션 객체에 데이터 저장
	// 1) "testValue" 속성명으로 "세션값" 문자열 저장
	session.setAttribute("testValue", "세션값");
	
	// 2) Person 클래스의 인스턴스 생성 후 "person" 속성명으로 세션에 저장
	Person p = new Person(10, "홍길동");
	session.setAttribute("person", p);
	%>
	

	
</body>
</html>