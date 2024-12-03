<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>request1_form.jsp - 입력폼</h1>
	<%--
		[ form 태그 ]
		1) action 속성
	   	- submit 동작 시 폼 태그 내의 입력값(= 폼 파라미터)를 모두 HTTP 요청 메세지에 저장 후
	      action 속성에 지정된 페이지(또는 파일)로 포워딩(이동) 작업 수행
	      => 이때, HTTP 요청 메세지 형태로 전송
	     
	     2) method 속성
	     - GET 방식 (method="get" => 기본값) [select]
	       => URL에 파라미터가 함께 포함되어 전송되는 요청 방식
	          (POST 방식에 비해 빠르지만, 요청 데이터 길이 제한이 있으며, 데이터가 노출됨)
	          
	     - POST 방식 (method="post") [update, 
	       => URL 대신 Body에 파라미터를 포함하여 전송되는 요청 방식
	          (요청 데이터 길이 제한이 없으며, 데이터 노출이 최소화되나, 상대적으로 느림)
	       => 요청된 페이지에서 파라미터 데이터에 접근 시 한글 처리가 되지 않을 수 있으므로
	         request.setCharacterEncoding("UTF-8"); 코드를 사용하여
	         한글 인코딩 방식을 UTF-8(유니코드) 방식을 변경해야 한다.
	      
	 --%>
	
	
	<form action="request1_pro.jsp" method="get">
		이름 : <input type="text" name="name"><br>
		나이 : <input type="text" name="age"><br>
		
		성별 : <input type="radio" name="gender" value="male">남
			  <input type="radio" name="gender" value="female">여<br>
		
		취미 : <input type="checkbox" name="hobby" value="여행">여행
			  <input type="checkbox" name="hobby" value="독서">독서
			  <input type="checkbox" name="hobby" value="게임">게임<br>
			  
		<input type="submit" value="전송">
		<%-- 전송(submit) 버튼 클릭 시 form 태그 내의 action 속성에 기술된 페이지로 이동 --%>
		<%-- 이때, GET방식 요청(method="get")에 입력된 폼 파라미터 데이터가 모두 뒷부분에 연결되어 함께 전송됨 --%>
		<%-- /request1_pro.jsp?name= .... --%>
	</form>
	

</body>
</html>