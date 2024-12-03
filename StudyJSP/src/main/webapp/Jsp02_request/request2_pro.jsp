<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<h1>request2_pro.jps</h1>
	<h3>회원가입 데이터 확인</h3>
	<%
	// 이름, 아이디, 비밀번호, 주민번호(jumin1, jumin2), 주소(address1, address2)
	// 이메일(email, email2), 직업, 성별 파라미터 가져와서 변수에 저장 후 출력
	// 주민번호 앞자리, 뒷자리를 하나의 변수에 결합(구분자 "-" 사용) => DB 등에 저장 시 필요
	// 기본주소(address1)와 상세주소(address2)를 하나의 변수에 결합(구분자 "/") 사용
	// email, email2 하나의 변수에 결합 (구분자"@"사용)
	
	%>
	
	<table border="1">
	<tr>
		<th>이름</th>
		<td><%String strName = request.getParameter("name"); out.print(strName); %></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><%String strPasswd = request.getParameter("passwd"); out.print(strPasswd); %></td>
	</tr>
	<tr>
		<th>주민번호</th>
		<td><%String strjumin1 = request.getParameter("jumin1");
			String strjumin2 = request.getParameter("jumin2");
			out.print(strjumin1 + " - " + strjumin2); %></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><%String strPostCode = request.getParameter("address1");
			String strPostCode2 = request.getParameter("address2");
			out.print(strPostCode + " / " + strPostCode2); %></td>
	</tr>
	<tr>
		<th>Email</th>
		<td><%String strEmail = request.getParameter("email1");
			String strEmail2 = request.getParameter("email2");
			out.print(strEmail + " @ " + strEmail2); %></td>
	</tr>
	<tr>
		<th>직업</th>
		<td><%String[] arrJob = request.getParameterValues("job");
				
			if (arrJob != null) {
				for (String job : arrJob) {
		 			out.print("직업: " + job + "<br>");
		 			}
				} else {
				out.print("직업없음<br>");
			}
		
		%>
		</td>
	</tr>
	<tr>
		<th>성별</th>
		<td><%String[] arrGender = request.getParameterValues("gender");
		if (arrGender != null) {
			for (String gender : arrGender) {
 				out.print(gender);
 				}
			} else {
			out.print("성별없음<br>");
		}
		%>
		
		</td>
	</tr>
	<tr>
		<th>취미</th>
		<td><%String[] arrHobby = request.getParameterValues("hobby");
		if (arrHobby != null) {
			for (String hobby : arrHobby) {
 				out.print(hobby);
 				}
			} else {
			out.print("취미없음<br>");
		}
		%></td>
	</tr>
	<tr>
		<th>가입동기</th>
		<td><%String strMoti = request.getParameter("motivation");
			out.print(strMoti);%>
		</td>
	</tr>
	<%
// 	String str = "admin";
// 	str == admin; 
	
// str.equals("admin");
	
	%>

	
	</table>
	
</body>
</html>