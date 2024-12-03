<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String dbId = "admin";
	String dbPasswd = "1234";
	
	if (id.equals(dbId) && passwd.equals(dbPasswd)) {
		
		// 로그인 성공 했을 경우
		// 세션 객체에 "sId" 라는 속성명으로 로그인에 성공한 아이디값 저장하기
		session.setAttribute("sId", id);
		
		response.sendRedirect("sessionTest3_main.jsp");
	} else {
	%>
	<script type="text/javascript">
		alert('로그인 실패')
		history.back();
	</script>	
	<% 
	}
	%>
</body>
</html>