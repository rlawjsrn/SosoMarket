<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 css -->
<link href="../resources/css2/bootstrap.min.css?after" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<link href="../resources/css2/tiny-slider.css?after" rel="stylesheet">
<link href="../resources/css2/style.css?after" rel="stylesheet">
</head>
<script>

</script>
<body>
	<jsp:include page="../resources/header.html"></jsp:include>
<%-- 이전꺼 막아놓음
 	<table border="1">
		<!-- sd -->
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
	</table> --%>


	<!-- 다른 부트스트랩 -->
	<div class="untree_co-section before-footer-section">
		<div class="container">
			<div class="row mb-5">
				<form class="col-md-12" method="post">
					<div class="site-blocks-table">
						<table class="table">
							<thead>
								<tr>
									<th class="product-thumbnail">상품 사진</th>
									<th class="product-name">상품</th>
									<th class="product-price">가격</th>
									<th class="product-remove">찜하기 상태</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="vo" items="${list}">
								<tr>
									<td class="product-thumbnail">
										<img src="../upload/iphone.png" alt="Image" class="img-fluid">
									</td>
									<td class="product-name">
										<h2 class="h5 text-black">${vo.productName }</h2>
									</td>
									<td>${vo.productPrice }</td>
									
									<td><a href="#" class="btn btn-black btn-sm" onclick="location.href='/SosoMarket/MypageDelH.do?row=${vo.productInterestId}'">♥</a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../resources/footer.html"></jsp:include>
</body>
</html>