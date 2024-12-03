<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 목록</h1>
	<table border="1">
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>가격(원)</th>
			<th>수량(개)</th>
			<th></th>
		</tr>
		<c:choose>
			<%-- request 객체에 productList 속성값이 "비어있을 경우" 판별(2가지 경우의 수) --%>
			<c:when test="${empty ProductList}">
				<tr><th colspan="5">상품 목록이 존재하지 않습니다.</th></tr>
			</c:when>
			<c:otherwise>
				<%-- 반복문을 활용하여 productList 에 저장된 ProductDTO 객체 차례대로 꺼내기 --%>
				<%-- 반복문 내에서 테이블 각 열에 데이터 출력  --%>
				<c:forEach var="product" items="${ProductList}">
					<tr>
						<td>${product.product_id}</td>
						<td>${product.product_name}</td>
						<td>${product.product_price}</td>
						<td>${product.product_qty}</td>
						<td>
							<%-- 상세정보 버튼 클릭 시 "ProductDetail.pr" 서블릿 주소 요청 --%>
							<%-- 요청 URL 파라미터로 상품번호(product_id) 전달 --%>
							<input type="button" value="상세정보" 
									onclick="location.href='ProductDetail.pr?product_id=${product.product_id}'">
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>












