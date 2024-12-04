<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 상세정보</h1>
	<table border="1">
		<tr>
			<th>상품번호</th>
			<td>${ProductDetail.product_id}</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td>${ProductDetail.product_name}</td>
		</tr>
		<tr>
			<th>상품가격</th>
			<td>${ProductDetail.product_price} 원</td>
		</tr>
		<tr>
			<th>상품수량</th>
			<td>${ProductDetail.product_qty} 개</td>
		</tr>
		<tr>
			<th>상품 이미지</th>
			<td>${ProductDetail.product_img}</td>
		</tr>
		<tr>
			<td colspan="2">
				<%-- 상품삭제 버튼 클릭 시 "ProductDelete.pr" 서블릿 주소 요청 --%>
				<%-- => URL 파라미터로 상품번호 전달 --%>
				<input type="button" value="상품삭제" 
						onclick="location.href='ProductDelete.js?product_id=${ProductDetail.product_id}'">
				<input type="button" value="이전페이지" onclick="history.back()">
			</td>
		</tr>
	</table>
</body>
</html>










