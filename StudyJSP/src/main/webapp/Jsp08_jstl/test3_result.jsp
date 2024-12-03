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

	<h1>test3_result.jsp</h1>
	
		<h3>
		<%-- EL 활용하여 파라미터 name, age 값, 세션 객체의 id속성값 출력 --%>
		파라미터 name 값 : ${param.name }<br>
		파라미터 age 값 : ${param.age }<br>
		세션 객체의 id 속성값 : ${sessionScope.id }<br>	
		</h3>
	<hr>
	<%-- [ 자바에서 가장 많이 사용하는 문장(조건문, 반복문)을 표현하는 JSTL 문법 ]
	---------------------------------------------------------------
	[ 조건문 - if(단일 if문) ]
	- <c:if></c:if> 태그 : if문에 해당하는 커스텀 태그(단일 if문이므로 else문 없음)
	
	<기본 문법>
	<c:if test="${조건식}">
	 // 조건식 판별 결과가 true일때 실행할 문장들...
	</c:if>
	--%>
	
	<c:set var="num" value="10"></c:set>
	<c:if test="${num > 0 }">
		\${num }(${num }) 값이 0보다 크다!<br>
	</c:if>
	<hr>
	<%-- 파라미터 age 값이 10이상이고 20미만일 경우 "10대!" 출력 --%>
	<c:if test="${param.age >= 10 and param.age < 20 }">
		나이(${param.age }) : 10대!
	</c:if>
	<%-- 파라미터 name 값이 비어있을 경우 --%>
	<%-- 자바스크립트로 "이름 입력 필수!" 출력 후 이전페이지로 돌아가기 --%>
<%--	<c:if test="${empty param.name }">
		<script type="text/javascript">
		alert('이름 입력 필수!');
		history.back()
		</script>
	</c:if>  --%>
	
	<%--
	[ <c:choose><c:when><c:otherwise> 태그>
	- 단일 if문 대신 if~else 또는 다중 else if 문에 해당하는 커스텀 태그
	- <c:choose> 태그를 사용하여 조건문이라는 표시를 하고
	  <c:when> 태그의 test=""속성을 통해 조건식을 지정(복수개의 조건은 <c:when>태그
	- 또한, 조건식의 판별 결과가 모두 false 일때 <c:otherwise> 태그에 수행할 문장 기술
      ( = else문과 동일한 역할을 수행하며, 생략 가능)
      
      <기본 문법>
     <c:choose>
     	<c:when test="${조건식1}">
     		// 조건식1이 true일때 실행할 문장들..
     	</c:when>
     	
     	<c:when test="${조건식2}">
     		// 조건식2이 true일때 실행할 문장들..
     	</c:when>
     	<c:otherwise>
     		// 위의 조건식이 모두 false일때 실행할 문장들...
     	</c:otherwise>
     
     </c:choose>
	 --%>
	 
	 <%--
	 파라미터 age 값이 10이상 20미만 "10대", 20보다 크면 "20대 이상" --%>
	 <hr>
<%-- <c:choose>
	 <c:when test="${param.age >= 10 and param.age <20 }">
	 	나이(${param.age }) : 10대!</c:when>
	 <c:when test="${param.age >= 20 }">
	 	나이(${param.age }) : 20대!</c:when>
	<%-- <c:when test="${param.age < 10 }">
	 	나이(${param.age }) : 오류!</c:when> --%>
<%--
	 <c:otherwise>
	 나이(${param.age }) : 오류!</c:otherwise>
	 </c:choose>
	 --%>
	 
	 <%-- 세션 속성 중 id 속성값 판별
	 "admin"일 경우 "관리자 모드!" 출력 "hong"일 경우 "홍길동님!" 출력
	 속성값이 없을 경우 자바스크립트로 "로그인 필수!" 알림창 출력 후 이전 페이지로 돌아가기
	 아니면, "접근 권한이 없습니다!" 출력
	  --%>
	  

	  
<%--	 <c:choose>
	 <c:when test="${param.name.equals(dbId) }">
	 	${param.name } 관리자 모드!</c:when>
	 <c:when test="${param.name.equals(dbId2) }">
	 	${param.name } 홍길동 님!</c:when>
	 <c:when test="${empty param.name }">
	 	<script type="text/javascript">
			alert('로그인 필수!');
			history.back()
	  	</script></c:when>
	 <c:otherwise>
	 	alert('접근 권한이 없습니다!);
	 </c:otherwise>
	 
	 </c:choose> --%>
	 
<%--	 <c:set var="id" value="admin" scope="session"></c:set> --%>
	 
	 <c:choose>
	 	 <c:when test="${sessionScope.dbId.equals(dbId) }">
	 	${sessionScope.dbId } 관리자 모드!</c:when>
	 <c:when test="${sessionScope.dbId2.equals(dbId2) }">
	 	${sessionScope.dbId2 } 홍길동 님!</c:when>
	 <c:when test="${empty sessionScope.id }">
	 	<script type="text/javascript">
			alert('로그인 필수!');
			history.back()
	  	</script></c:when>
	 <c:otherwise>
	 	alert('접근 권한이 없습니다!);
	 </c:otherwise>
	 </c:choose>
	 
	 
	 
</body>
</html>