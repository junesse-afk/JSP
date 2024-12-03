<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>test4.jsp</h1>
	<form action="test4_result.jsp">
		<input type="text" placeholder="이름" name="name"><br>
		<input type="text" placeholder="나이" name="age"><br>
		취미:
		<input type="checkbox" name="hobby" value="여행">여행
		<input type="checkbox" name="hobby" value="독서">독서
		<input type="checkbox" name="hobby" value="게임">게임<br>
		<input type="submit" value="전송">
	</form>

</body>
</html>