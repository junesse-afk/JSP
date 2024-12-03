<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	// JSP 내장객체 중 response 객체는 HTTP 응답 정보를 관리하는 객체이며
	// response 객체의 sendRedirect() 메서드를 호출하여
	// 메서드 파라미터로 전달된 페이지(URL)로 이동 가능
	// => 리다이렉트는 일반적인 페이지 이동과 개념이 조금 다르지만 일단 동하는 점에서 동일
	// => 기본 문법 response.sendRedirect("이동할 URL 또는 파일명");
	
	response.sendRedirect("responseTest2.jsp");
	
	/*
	
	클라이언트의 요청에 대해 서버가 응답하는 데이터에 리다이렉트가 포함될 경우
	응답 데이터에 HTTP 상태 코드로 "302"를 포함하여 전송한다!
	다만, response.sendRedirect() 메서드 호출 시점에 즉시 응답을 수행하는 것이 아니라
	다른 데이터까지 모두 HTTP 응답메세지 형태로 포함시킨 후 전체를 응답으로 전송함
	=> 응답 데이터(상태코드 302)를 수신한 클라이언트는 리다이렉트 URL에 해당하는 주소를
		요청 정보에 포함하여 다시 서버측으로 전성혼다! (= 클라이언트가 새 주소로 새 요청을 발생!)
		따라서 302 응답 데이터를 클라이언트가 수신하는 즉시 새로운 요청을 발생시키므로
		클라이언트 측에서는 responseTest1.jsp 페이지의 내용을 볼 수 없고
		리다이렉트된 responseTest2.jsp 페이지의 내용을 최종적으로 보게 된다.
		
	*/
	
	System.out.print("리다이렉트 완료!");
	// 리다이렉트를 수행하더라도 나머지 다른 자바 코드들까지 서버에서 모두 실행된 후
	// 응답이 전송되므로 이 출력 문에 포함된 메세짇조 이클립스 콘솔에서 확인이 가능하다.
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	


</body>
</html>