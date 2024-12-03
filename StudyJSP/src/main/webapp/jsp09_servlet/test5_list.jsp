<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test5_list.jsp</h1>
	<%-- request 객체에 저장된 "data" 속성값 출력 --%>
	${requestScope.data }<br>
	${param.data }

</body>
</html>