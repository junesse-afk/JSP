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
	<h1>test4_result.jsp</h1>
	<h3>
		이름 : ${param.name }<br>
		나이 : ${param.age }<br>
		
		<%-- 동일한 name 속성을 갖는 복수개의 파라미터는 param.파라미터로 접근시 1개만 출력됨 --%>
		<%-- 체크 박스 등의 name 속성이 동일한 파라미터들은 배열 형태로 관리 가능
		(기본 자바 문법 : request.getParameterValues() 메서드 활용)
		EL에서 접근 시 param.value 대신 paramValues 객체를 사용하면 배열처럼 접근 가능함
		=> 기본 문법 : ${pramValues.배열명[인덱스]}
			${paramValues}는 request.getParameterValuese()와 동일하게 배열 관리
		 --%>
		취미 : ${paramValues.hobby[0] }${paramValues.hobby[1] }${paramValues.hobby[2] }<br>
	</h3>
	<hr>
	
	<%--
	for(int i=0; i<10; i++){
	System.out.println(i);
	}
	 --%>
	
	<%-- 
	[ JSTL - 반복문(<c:forEach></c:forEach> 태그 ]
	- 일반 for문과 향상된 for문을 모두 사용 가능한 for문(속성 조합에 따라 달라짐)
	-------------------------------------------------------------
	1) 일반 for문과 동일(시작값 ~ 종료값까지 증감값만큼 반복)한 문법
	<c:forEach var = "제어변수명(i)" begin="시작값" end="종료값" step="증가값">
		//반복문 내에서 실행할 문장들...
		// var 속성으로 생성된 변수는 EL을 통해 접근 가능(${변수명})
	
	</c:forEach>
	=> step 속성 생략 시 기본값 1씩 증가
	=> step 속성은 0보다 큰 값만 지정 가능
	 --%>
	 
	<c:forEach var="i" begin="1" end="10">
		${i}</c:forEach>
	<br>
		<c:forEach var="i" begin="1" end="10" step="2">
		${i}</c:forEach>
	<br>
	<%-- <c:forEach> 태그로 파라미터 hobby에 대한 배열을 통해 차례대로 배열 요소 출력 --%>
		<c:forEach var="i" begin="0" end="2">
		${paramValues.hobby[i]} </c:forEach>
	<br>
	<%-- 단, 기본적인 반복문으로는 배열의 크기에 맞게 반복하지 못하므로 불필요한 반복 발생함
	따라서, 배열 크기를 알아내기 위해서는 JSTL - functions 라느 특수한 라이브러리 필요
	=> 자바의 배열명.length 속성을 대시하기 위해 ${fn:length(배열명)}으로 대체
	 --%>
	 <c:forEach var="i" begin="0" end="${fn:length(paramValues.hobby) - 1}">
	 ${paramValues.hobby[i] }</c:forEach>
	 
	 <br>
	 <%-- 자바의 향상된 for문 사용하여 취미 배열(hobbies)을 반복 접근 --%>
	<%
	String[] hobbies = request.getParameterValues("hobby");
	for (String h : hobbies){
		out.print(h+ " ");
	}
	%>
	<%-- 인덱스 없이 객체 내의 데이터를 차례대로 접근하는 forEach문(향상된 for문) 문법
	
	<c:forEach var="변수명" items="${데이터 저장된 객체}" varStatus="상태변수명">
		// 반복문 내에서 실행할 문장들...
		// var 속성으로 설정된 변수에 items 속성에서 지정한 객체 데이터가 자동으로 저장됨(필수)
		// varStatus 속성을 활용하여 반복되는 객체의 인덱스 등 상태값을 알아낼 수 있음
		// (ex. varStatus변수명.index: 인덱스값(0부터 시작), 변수명.count: 1부터 시작)
	</c:forEach>
	 --%>
	<br>
	<c:forEach var="h" items="${paramValues.hobby }">
	${h }
	</c:forEach>
	<br>
	<c:forEach var="h" items="${paramValues.hobby }" varStatus="status">
	데이터 : ${h }, ${status.index }, ${status.count }<br>
	</c:forEach>
	<%-- ------------------------------------------------------------- --%>
	<br>
	<%-- <%
	
	// 연습문제
	// 1) 배열 names에 이름 3~5개 정도 문자열로 저장 1개는 널스트링 저장
	
	String[]names = {"홍길동", "이순신", "", "김태희","전지현"};
	// 2) 자바 for문 활용하여 names 배열값 출력
	// 단, 이름이 비어있을 경우(널스트링) "noname" 문자열 출력
	
	pageContext.setAttribute("names", names); --%>	
	
	<%-- <c:forEach> 태그로 동일한 작업 수행 --%>
	
	<%--<c:forEach var="nm" items="${paramValues.names }">
	${nm }
	</c:forEach> --%>
	
</body>
</html>