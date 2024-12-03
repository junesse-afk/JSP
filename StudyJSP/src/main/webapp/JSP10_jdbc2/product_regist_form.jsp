<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 등록</h1>
	<form action="ProductRegist.pr" method="post">
		<table border="1">
			<tr>
				<th>상품번호</th>
				<td><input type="text" name="product_id"></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="product_name"></td>
			</tr>
			<tr>
				<th>상품가격</th>
				<td><input type="text" name="product_price"> 원</td>
			</tr>
			<tr>
				<th>상품수량</th>
				<td><input type="number" name="product_qty"></td>
			</tr>
			<tr>
				<th>상품 이미지</th>
				<td><input type="file" name="product_img"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="상품등록">
					<input type="button" value="이전페이지" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>










