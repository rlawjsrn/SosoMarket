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
	<!-- product -->
	<c:forEach var="product" items="${list}">
		<div class="product"
			onclick="location.href='/SosoMarket/HomeProdOne.do?prodId=${product.prodId }'">
			<div class="product-img">
				<img src="./upload/${product.prodPhotoName}.png?after" alt="">
			</div>
			<div class="product-body">
				<p class="product-category">${product.categoryName}</p>
				<h3 class="product-name">
					<a style="align-content: center" href="#">${product.prodName}</a>
				</h3>
				<h4 class="product-price">${product.prodPrice}</h4>

				<div class="product-btns">
					<button class="add-to-wishlist">
						<i class="fa fa-heart-o"></i><span class="tooltipp">찜하기</span>
					</button>
				</div>
			</div>

		</div>
	</c:forEach>
	<!-- /product -->
</body>
</html>