<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../resources/header.html"></jsp:include>
	<table border="1">  <!-- sd -->
		<tr>
			<th width="50">상품 아이디</th>
			<th width="150">상품 사진</th>
			<th width="200">상품 이름</th>
			<th width="150">상품 상태</th>
			<th width="150">상품 가격</th>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr class="row">
				<td align="center">${vo.productInterestId }</td>
				<td align="center">${vo.productPhotoId }</td>
				<td align="center">${vo.productName }</td>
				<td align="center">${vo.productStatus }</td>
				<td align="center">${vo.productPrice }</td>
			</tr>
		</c:forEach>
	</table>
<jsp:include page="../resources/footer.html"></jsp:include>
</body>
</html>