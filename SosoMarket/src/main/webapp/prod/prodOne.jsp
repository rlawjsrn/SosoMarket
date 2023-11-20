<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품상세조회페이지</title>
</head>
<body>
	<jsp:include page="../resources/header.jsp" />

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- 상품 메인사진 -->
				<div class="col-md-5 col-md-push-2">
					<div id="product-main-img">
						<c:forEach var="list" items="${list }">
							<div class="product-preview">
								<img src="./upload/${list.prodPhotoName}.png?after" alt="">
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- /Product main img -->

				<!-- 썸네일 상품 이미지 -->
				<div class="col-md-2  col-md-pull-5">
					<div id="product-imgs">
						<c:forEach var="list" items="${list }">
							<div class="product-preview">
								<img src="./upload/${list.prodPhotoName}.png?after" alt="">
							</div>
						</c:forEach>
						<c:forEach var="list" items="${list }">
							<div class="product-preview">
								<img src="./upload/${list.prodPhotoName}.png?after" alt="">
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- /Product thumb imgs -->

				<!-- Product details -->
				<div class="col-md-5">
					<div class="product-details">
						<c:if test="${not empty vo }">
							<h2 class="product-name">${vo.prodName}</h2>
							<div>${vo.memberId}</div>
							<div>
								<h3 class="product-price">${vo.prodPrice}원</h3>
								<span class="product-available">${vo.prodStatus}</span>
							</div>
							<p>${vo.prodDscrp}</p>
							<br>
							<ul class="product-btns">
								<li><a href="#"><i class="fa fa-heart-o"></i> 관심상품에 추가</a></li>
							</ul>

							<ul class="product-links">
								<li>카테고리:</li>
								<li><a>${vo.category}</a></li>
							</ul>
						</c:if>
					</div>
				</div>
				<!-- /Product details -->

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- jQuery Plugins -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/slick.min.js?after"></script>
	<script src="resources/js/nouislider.min.js"></script>
	<script src="resources/js/jquery.zoom.min.js"></script>
	<script src="resources/js/main.js"></script>

	<jsp:include page="../resources/footer.html" />
</body>
</html>