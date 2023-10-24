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
			<th width="150">판매자</th>
			<th width="200">판매 번호</th>
			<th width="150">생성일자dfs</th>
		</tr>
	
		<c:forEach var="like" items="${likeList}">
			<tr class="row">
				<td align="center">${like.productInterestId }</td>
				<td>${like.memberId }</td>
				<td align="center">${like.productId }</td>
				<td align="center">${like.generationDate }</td>
			</tr>
		</c:forEach>
	</table>
<jsp:include page="../resources/footer.html"></jsp:include>
</body>
</html>