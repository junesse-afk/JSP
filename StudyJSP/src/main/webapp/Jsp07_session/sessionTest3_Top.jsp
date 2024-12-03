<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h4>
		<a href="sessionTest3_main.jsp">HOME</a>
		<%-- 
		로그인 성공/실패 에 따른 작업 수행(= 서로 다른 하이퍼링크 표시)
		=> 미 로그인 시 세션에 로그인 아이디(속성명 sId)가 없으므로(= null)
		   [로그인] & [회원가입]
		=> 로그인 시 세션에 로그인 한 아이디가 존재하므로 (sId 속성값이 null이 아님)
		   현재 로그인 한 세션에 저장된 아이디와 [로그아웃] 링크 표시   
		--%>
		<%
		// 세션 객체에 저장된 세션 아이디(속성명: sId)를 String 타입 변수 id에 저장
		String id = (String)session.getAttribute("sId");
		
		if (id == null) { // 미 로그인 시
		%>
			<a href="sessionTest3_login_form.jsp">로그인</a>
			<a href="sessionTest3_join_form.jsp">회원가입</a>
		<% 
		} else { // 로그인 시
		%>	
			<a href=""><%=id %></a>님 |
			<!--  <a href="sessionTest3_logout.jsp">로그아웃</a> -->
		
		<%-- 만약, 하이퍼링크 클릭 시 자바스크립트 함수를 통해 작업을 수행할 경우
		href 속성값으로 "javascript:함수명()" 형태로 자바스크립트 호출 가능
		또는, href 속성값을 "javascript:void(0)"로 설정하고 onclick 속성으로 함수 호출도 가능
		 --%>
		 	<!-- <a href="javascript:logout()">로그아웃</a> -->
		 	<a href="javascript:void(0)">로그아웃</a>
		
		<%	
		}
		%>
		
		
	</h4>
	
	<script type="text/javascript">
	function logout() {
		// confirm()함수 활용하여 "로그아웃하시겠습니까" 질문을 통해
		// 확인 버튼 클릭 시 "sessionTest3_logout.jsp" 페이지로 이동
			if (confirm("로그아웃하시겠습니까?")){
				location.href="sessionTest3_logout.jsp";
			}
	}
	</script>

</body>
</html>