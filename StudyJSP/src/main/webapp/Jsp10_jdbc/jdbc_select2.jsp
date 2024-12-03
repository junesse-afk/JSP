<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- ${requestScope.student.idx }--%> <%-- 요기서 스튜던트는 자바서블릿에서 req.setAtrribute에서 가져옴 --%>
<%-- ${requestScope.student.name }--%>
<%-- 리퀘스트 생략가능 --%>



<%-- 만약 조회된 정보가 없을 경우 " 학생 정보가 존재하지 않습니다! --%>
<c:choose>
	<c:when test="${empty student}">
		<h1>${param.idx }번 학생 정보가 존재하지 않습니다!</h1>
	</c:when>
	<c:otherwise>
		<h1>학생정보</h1>
		<h3>${student.idx }</h3>
		<h3>${student.name }</h3>
	</c:otherwise>
</c:choose>



</body>
</html>