<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- Action Tag(액션 태그) : JSP에서 사용하는 명령어를 태그형식으로 제공 
기본문법 : <jsp:액션태그명></jsp:액션태그명>
필요에 따라 속성 및 시작태그와 끝태그 사이에 다른 태그를 추가하여 사용
----------------------------------------------------------
현재 페이지에 다른 JSP페이지를 포함하는 태그 
<jsp:include page="includePro.jsp"></jsp:include>

--%>

<%-- 만약, 포함시킬 페이지로 전달한 데이터를 URL의 파라미터 형식으로 지정시
파라미터 데이토 취급되는 것이 아니라 포함시킬 파일명으로 취급됨
따라서 jsp:include 태그는 URL 뒤에 파라미터를 지정할 수 없다.
<jsp:include page="includePro.jsp?name=hong"></jsp:include>

포함시킬 페이지로 전달할 데이터는 jsp:include 태그 사이에 jsp:param 태그로 전달

 --%>
	<jsp:include page="includePro.jsp">
		<jsp:param value="hong" name="name"/>
	</jsp:include>
</body>
</html>