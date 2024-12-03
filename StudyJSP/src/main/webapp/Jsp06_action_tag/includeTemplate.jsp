<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
	[ 템플릿(Template) 페이지 ]
	- 웹페이지 구성 시 각각의 모듈화 된 페이지들을 별도로 작성하고
	  각 모듈을 하나의 페이지에서 결합하기 위한 틀을 제공하는 페이지
	--%>
	
	<h1 align="center">include 템플릿 페이지</h1>
	<hr>
	<div align="center">
		<table border="1">
			<tr>
				<td colspan="2" width="800" height="100">
					<jsp:include page="includeTemplate_top.jsp"></jsp:include>
				</td>
			</tr>
		
			<tr>
				<td width="200" height="400">
					<jsp:include page="includeTemplate_left.jsp"></jsp:include>
				</td>
				<td>
					<jsp:include page="includeTemplate_main.jsp"></jsp:include>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" height="100">
					<jsp:include page="includeTemplate_bottom.jsp"></jsp:include>
				</td>
			</tr>
		</table>
	</div>


</body>
</html>