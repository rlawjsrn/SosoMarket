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
<link href="css2/bootstrap.min.css?after" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<link href="css2/tiny-slider.css?after" rel="stylesheet">
<link href="css2/style.css?after" rel="stylesheet">
</head>
<body>
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
									<th class="product-name">상품 상태</th>
									<th class="product-name">올린 날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${list}">
									<tr>
										<td class="product-thumbnail"><img
											src="${vo.productPhotoId }" alt="Image" class="img-fluid">
										</td>
										<td class="product-name">
											<h2 class="h5 text-black">${vo.productName }</h2>
										</td>
										<td>${vo.productPrice }</td>
										<td>거래완료</td>
										<td>${vo.generationDate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>