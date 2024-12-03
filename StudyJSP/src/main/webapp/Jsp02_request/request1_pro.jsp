<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<h1>request1_pro.jsp - 요청 파라미터 처리</h1>
	<%
	/*  
	request1_form.jsp 페이지에서 submit 버튼 클릭 시
	form 태그 내의 데이터(= 폼 파라미터)가 HTTP 요청 메세지에 포함되고
	action 속성에 지정된 페이지로 이동(= 페이지를 요청)하면서 HTTP 요청 메세지 전달함
	=> 요청 관련 모든 정보는 request 객체가 관리(= JSP가 자동으로 생성하는 객체 = 내장 객체)
	   따라서, request.메서드명()형태로 request 객체의 메서드 호출하여 객체 다루기 가능
	=> 요청받은 request 객체에 저장된 폼 파라미터 데이터를 가져오는 방법
	   1) request.getParameter("파라미터명"); // 단일 데이터 가져오기 = String 리턴
	   2) request.getParameterValues("파라미터명") // 복수 항목 파라미터 가져오기
		  = String[] 리턴(주로, checkbox 처럼 하나의 이름으로 복수개의 파라미터 전달할 경우 사용)
		=> ** "파라미터명" 부분에는 폼 태그에서 입력 항목의 name 속성에 지정된 속성값 사용**
	
	
	*/
	
	
	// 1. 폼 파라미터 중 파라미터명(name 속성값)이 "name"인 파라미터 값을 가져와서
	// String 타입 변수 strName에 저장 후 웹브라우저에 출력
	String strName = request.getParameter("name");
	out.print("이름 : " + strName + "<br>");
		
	String strAge = request.getParameter("age");
	out.print("나이 : " + strAge + "<br>");
	
	String strGender = request.getParameter("gender");
	out.print("성별 : " + strGender + "<br>");
	
	String[] arrHobby = request.getParameterValues("hobby");
	out.print("취미 : " + Arrays.toString(arrHobby) + "<br>");
	// Arrays 클래스의 static 메서드 toString()메서드 호출하여 파라미터로 배열 전달 시
	// 배열 내의 요소들을 한꺼번에 문자열로 결합하여 리턴 => 한꺼번에 출력 가능
	// Arrays.toString > 배열 for문 대신 사용해서 출력

	
	%>

</body>
</html>