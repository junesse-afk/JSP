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

	<h1>test3.jsp</h1>
	<form action="test3_result.jsp">
		<input type="text" placeholder="이름" name="name"><br>
		<input type="text" placeholder="나이" name="age"><br>
		<input type="submit" value="전송">
	
	<%-- 세션 영역에 "id"라는 속성으로 "admin" 문자열 저장  --%>
	<c:set var="dbId" value="admin" scope="session"></c:set>
	<c:set var="dbId2" value="hong" scope="session"></c:set>
	
	</form>

</body>
</html>