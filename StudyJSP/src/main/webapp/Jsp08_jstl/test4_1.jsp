<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 연습문제
	// 1) 배열 names에 이름 3~5개 정도 문자열로 저장 1개는 널스트링 저장
	
	String[]names = {"홍길동", "이순신", "", "김태희","전지현"};
	// 2) 자바 for문 활용하여 names 배열값 출력
	// 단, 이름이 비어있을 경우(널스트링) "noname" 문자열 출력
	
	pageContext.setAttribute("names", names);%>	
	
	<%-- <c:forEach> 태그로 동일한 작업 수행 --%>

	<%
	for (String nm : names){
		if (nm.equals("")){
			out.print("noname");
		} else{
			out.print(nm + " ");
		}
		
	}
	out.print("<br>");
	%>
	
	<br>
		<c:forEach var="nm" items="${pageScope.names}">
		<c:choose>
			<c:when test="${nm eq '' }">
			noname
			</c:when>
			<c:otherwise>
				${nm }
			</c:otherwise>
		</c:choose>
		${pageScope.nm[i]}
		</c:forEach>
	<br>
		<c:forEach var="nm" items="${pageScope.names}">
		<c:if test="${nm eq '' }">
			<c:set var="name" value="noname"></c:set>
			</c:if>
			${name }
		</c:forEach>

</body>
</html>