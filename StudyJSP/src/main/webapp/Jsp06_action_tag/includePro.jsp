<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>includePro.jsp</h1>
<h3>jsp:include 액션태그에 의해 포함되는 페이지</h3>

<%
	// 현재 페이지(includePro.jsp)는 includeForm.jsp 페이지에 포함(삽입)될 페이지이며
	// <jsp:include> 액션 태그 사용 시 <jsp:param> 태그로 전달한 파라미터에 접근이 가능!
	// request 객체의 getParameter() 메서드 활용
	String name = request.getParameter("name");
%>

<h3>전달 받은 name 파라미터 값 : <%=name %></h3>