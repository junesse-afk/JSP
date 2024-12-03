<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>attributeTest2.jsp</h1>
	<%-- 각 영역 객체에 저장된 속성값(데이터)을 현재 페이지에서 확인하기 - getAttribute() --%>
	
	<h3>pageContext 속성값 : <%=pageContext.getAttribute("page") %></h3>
	<h3>request 속성값 : <%=request.getAttribute("request") %></h3>
	<h3>session 속성값 : <%=session.getAttribute("session") %></h3>
	<h3>application 속성값 : <%=application.getAttribute("application") %></h3>
	

</body>
</html>