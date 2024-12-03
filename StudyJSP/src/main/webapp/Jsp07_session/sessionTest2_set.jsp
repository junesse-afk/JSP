<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_set.jsp</h1>
	
	<%
	/* 
	[ session 객체에 속성값(데이터)을 저장하는 방법 ]
	=> session 객체의 setAttribute("속성명", 속성값)
	=> 첫번째 파라미터(속성명 = 키)
	   - 저장할 데이터를 지정할 때 사용할 이름
	   - 객체의 변수명과 동일한 역할 수행
	=> 두번째 파라미터(속성값 = 데이터)
	   - 세션 객체에 저장할 데이터(데이터 타입은 무관 = object)
	   - 세션 객체에 저장 후에는 속성명을 통해 접근 가능함
	=> 4대 영역 객체(pageContext, request, session, application 모두 동일한 방법 사용
			
	// 세션 객체에 "sessionValue1" 이라는 속성명으로 "첫번째 세션값" 문자열 저장하고
	// "sessionValue2"라는 속성명으로 "두번째 세션값" 문자열 저장
	
	*/
	
	session.setAttribute("sessionValue1", "첫번째 세션값");
	session.setAttribute("sessionValue2", "두번째 세션값");
	%>
	
	<hr>
	<%-- 임시) session 객체에 저장된 데이터(속성값) 꺼내서 확인 --%>
	<h3>세션값1: <%=session.getAttribute("sessionValue1") %></h3>
	<h3>세션값2: <%=session.getAttribute("sessionValue2") %></h3>
	<%-- 주의! 존재하지 않는 속성명 지정시 null 값 리턴됨 --%>
	<h3>세션값3: <%=session.getAttribute("sessionValue3") %></h3>
	
	<hr>
	<input type="button" value="이전 페이지" onclick="history.back()">
	<input type="button" value="처음으로" onclick="location.href='sessionTest2.jsp'">
</body>
</html>