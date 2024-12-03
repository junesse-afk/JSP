<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>attributeTest1.jsp</h1>
	<h3>영역 객체의 속성과 범위(Scope)</h3>
	<%
	/* 
	
	JSP의 4대 영역 : page, request, session, application
	4대 영역의 객체 : pageContext, request, session, apllication
	------------------------------------------------------------------------------	
	[ 영역 객체의 유효 범위(= 속성(데이터) 저장 시 전달 가능한 범위) ]
	1) page 영역 (pageContext 객체) : 현재 페이지에서만 유효(=> 페이지 이동 시 객체 제거됨)
	2) request 영역(객체) : 클라이언트 요청에 대한 응답까지 유효(= 새로운 요청 발생 시 객체 제거됨)
	3) session 영역(객체) : 세선 유지 조건까지 유효(= 세션 제거 조건 충족 시 객체 제거됨) [로그인 상황 유지]
	4) application 영역(객체) : 서버 동작 시 까지 유효(= 서버 중지 시 객체 제거됨)
	------------------------------------------------------------------------------
	각 영역 객체에 속성값 저장[세팅]하는 공통 메서드 : setAttribute(String Object, object value)
	각 영역 객체에 속성값 접근[불러올때]하는 공통 메서드 : Object getAttribute(String name);
	
	각 영역 객체에 속성값(=데이터) 저장하기 => setAttribute
	
	*/
	
	pageContext.setAttribute("page", "pageContext 값");
	request.setAttribute("request", "request 값");
	session.setAttribute("session", "session 값");
	application.setAttribute("application", "application 값");
	
	%>
	
	<%-- 각 영역 객체에 저장된 속성값(데이터)을 현재 페이지에서 확인하기 - getAttribute() --%>
	
	<h3>pageContext 속성값 : <%=pageContext.getAttribute("page") %></h3>
	<h3>request 속성값 : <%=request.getAttribute("request") %></h3>
	<h3>session 속성값 : <%=session.getAttribute("session") %></h3>
	<h3>application 속성값 : <%=application.getAttribute("application") %></h3>
	
	<%
	//attributeTest2.jsp 페이지로 이동
	//pageContext.forward("attributeTest2.jsp");
	response.sendRedirect("attributeTest2.jsp");
	
	
	%>
	
</body>
</html>