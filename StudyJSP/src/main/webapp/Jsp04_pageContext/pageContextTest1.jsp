<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>pageContextTest1.jsp</h1>
	<%
	// response.sendRedirect("pageContextTest2.jsp");
	/* 
	=> pageContextTest1.jsp 페이지가 서버에 요청되면
	서버측에서 클라이언트로 전송하는 응답데이터에 리다이렉트 신호를 포함하여 전송하면
	클라이언트가 다시 pageContextTest2.jsp 페이지로 "새로운 요청을 수행한다."
	이때, 최종적으로 서버가 클라이언트(웹브라우저)의 주소표시줄은 다음과 같다.
	http://localhost:8080/StudyJSP/Jsp04_pageContext/pageContextTest2.jsp
	이처럼 리다이렉트 신호로 새로운 요청에 의해 새 페이지로 이동 시
	주소표시줄의 URL(주소)가 변경되는 방식을 리다이렉트(Redirect)라고 한다.
	*/
	/*----------------------------------------------------------------------
	// pageContext.forward("pageContextTest2.jsp");
	또 다른 내장객체인 pageContext 객체의 forward() 메서드를 호출하여 동일한 페이지로 이동
	=> pageContextTest2.jsp 페이지가 서버에 요청되면
	서버측에서 forward() 메서드 파라미터로 전달된 URL(주소)에 대한 페이지를 처리하며
	처리결과를 클라이언트에게 응답 데이터로 전송한다.
	따라서, 클라이언트는 서버로부터 pageContextTest1.jsp 페이지가 아닌
	pageContextTest2.jsp 페이지의 처리 결과를 응답 데이터로 전달받게 된다.
	이때, 최종 클라이언트(웹브라우정)의 주소표시줄 주소는 다음과 같다.
	http://localhost:8080/StudyJSP/Jsp04_pageContext/pageContextTest1.jsp
	   (이전 주소 유지됨) 대신, 표시되는 내용은 포워딩 된 새 페이지의 내용이 출력됨
	   이처럼 새로운 주소 요청 시 기존 요청 주소가 그대로 유지되고
	   새로운 주소에 대한 내용만 응답 데이터로 전달받는 방식을 포워딩(forwarding)이라고 함
	   (정확히는 디스패치(dispatch) 방식의 포워딩(forwarding)이라고 함)
	
	*/
	pageContext.forward("pageContextTest2.jsp");
	%>

</body>
</html>