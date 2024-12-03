<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%-- JSTL(java Standard Tag Library)
 
 - JSP에서 사용 가능한 커스텀 태그 라이브러리
   => JSP에서 사용하는 문장을 태그 형식으로 제공
   => JSTL Core 라이브러리 : JSTL의 기본 핵심 기능 제공(조건문, 반복문, 변수 설정 및 출력)
 
 - JSTL 기능을 사용하려면 해당 라이브러리 다운로드(tomcat.apache.org -Taglibs) 후
   => Build path 추가 필요
   => 주의! Tomcat 10.x 부터는 기본 JSTL 라이브러리(1.x) 대신 최소 2.x 버전 이상을 사용해야 함
    (jakarta.servlet.jsp.jstl-2.0.0.jar jakarta.servlet.jsp.api-2.0.0.jar 필요)
    	해당 파일을 포로젝트 내의 lib 폴더에 넣고
    	파일을 선택 후 우클릭 - Build Path -Add to build path클릭
  - 또한, 등록된 JSTL 라이브러리를 실제로 적용하려면 반드시 <%@taglib %> 디렉티브를 사용하여
  현재 문서에 등록 필수(perfix 값과 uri 정보 설정)
  	=> prefix: 태그에서 사용할 문구(접두어)를 지정하며, core 라이브러리는 주로 core의 약자 c를 사용
  	           (JSTL 태그 사용시 접두어 c를 활용하여 <c:xxx> 형식의 태그 사용 가능)
  	=> uri: 태그 라이브러리 문법이 존재하는 위치를 정
  	        (이클립스 content assist 기능을 활용하여 자동 완성 가능)
 
  --%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>test2.jsp - JSTL</h1>
	<%--
	
	<c:set 태그를 사용하여 변수 생성 및 값 설정
	- var 속성에 변수명, value 속성에 변수값 지정
	- scope 속성에 변수의 유효범위 지정 가능하며, 생략 시 기본값 page
	(page 속성: 현재 페이지에서만 유효)
	- 생성(선언) 변수 EL을 통해 접근 가능(자바코드로 접근불가-별도의 작업필요)
	
	<c:set var="변수명" value="값"></c:set>
	 --%>
	 
	<%-- str 변수에 "Hello, World!" 값 저장 --%>
	<%-- 기존 자바코드 : String str = "Hello, World!"; --%>
	<c:set var="str" value="Hello,World!"></c:set>
	
	<%-- scope 속성값을 다른 영역명으로 변경 시 해당 영역의 속성으로 관리됨 --%>
	<%-- <c:set var="str" value="Hello,World!" scope="request"></c:set>--%>
	
	<%-- 위에서 선언한 변수 str의 값을 EL을 통해 출력 - ${변수명} --%>
	
	<h3>
	<%-- \ -> 이스케이프 뒤에 오는건 문자로 인식 --%>
	
	 \${str } = ${str }<br>
	 \${str } 값이 비어있는가? ${empty str }<br>
	  <%-- 주의! <c:set> 태그로 생성된 변수는 JSP 스크립트 요소에서 기본적인 방법으로 접근 불가 --%>
	  
	 <%-- 기본적으로 c:set 태그로 생성된 변수의 scope는 page 영역이다 --%>
	\${pageScope.str } = ${pageScope.str }<br>
	\${requestScope.str } = ${requestScope.str }<br>
	<%--<c:set var="str" value="Hello,World!" scope="request"></c:set>
 	이거쓰면 request에 헬로우 월드가 노출됨
 	--%>	 
	</h3>
	<hr>
	
	<%-- session 영역에 str2 변수 생성 및 값("Hello World! - session") 저장 --%>
	<c:set var="str2" value="Hello,World! - session" scope="session"></c:set>
	<%-- application 영역에 str2 변수 생성 및 값("Hello World! - application") 저장 --%>
	<c:set var="str2" value="Hello,World! - application" scope="application"></c:set>
	<h3>\${sessionScope.str2 } = {sessionScope.str2 }</h3>
	<h3>\${applicationScope.str2 } = {applicationScope.str2 }</h3>
	
	<%-- <c:remove> 태그를 사용하여 변수(영역개체내의 속성) 삭제 --%>
	<%-- 기본문법 : <c:remove var="변수명" scope="영역명"> --%>
	<c:reomve var="str"></c:reomve>
	<h3>\${remove.str }</h3>

	<%-- 주의! scope 속성 생략 시 모든 영역에서 해당 이름을 속성 제거 --%>
	<%--  <c:remove var="str2"></c:remove> --%>
	<c:remove var="str2"></c:remove>
	<h3>\${sessionScope.str2 } = {sessionScope.str2 }</h3>
	<h3>\${applicationScope.str2 } = {applicationScope.str2 }</h3>
	
</body>
</html>