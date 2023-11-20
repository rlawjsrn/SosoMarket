<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>소소마켓</title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="resources/css/bootstrap.min.css?after" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="resources/css/slick.css" />
<link type="text/css" rel="stylesheet"
	href="resources/css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet"
	href="resources/css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="resources/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="resources/css/style.css" />
<style>
 .product-img{
 	width: 200px;
 	height: 200px;
 }
</style>
</head>

<body>
	<script>
	// 로그인 여부 체크 함수
		function checkLoginAndRedirect() {
			var memberId = '<%=(String)session.getAttribute("memberId")%>';

			if (memberId === null || memberId === '') {
				// 로그인이 필요한 경우, 얼럿창을 띄우고 로그인 페이지로 리다이렉트
				alert("로그인이 필요합니다.");
				location.href = "/SosoMarket/LoginMove.do"; // 로그인 페이지 URL로 변경
			} else {
				// 로그인이 되어 있으면 상품 등록 페이지로 이동
				location.href = "/SosoMarket/ProdInsertPage.do"; // 상품 등록 페이지 URL로 변경
			}
		}
	</script>
	<jsp:include page="/resources/header.jsp" />
	<!-- HOT DEAL SECTION -->
	<div id="hot-deal" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="hot-deal">
						<ul class="hot-deal-countdown">
							<li>
								<div>
									<h3>소</h3>
									<span>SO</span>
								</div>
							</li>
							<li>
								<div>
									<h3>소</h3>
									<span>SO</span>
								</div>
							</li>
							<li>
								<div>
									<h3>마</h3>
									<span>MAR</span>
								</div>
							</li>
							<li>
								<div>
									<h3>켓</h3>
									<span>KET</span>
								</div>
							</li>
						</ul>
						<h2 class="text-uppercase">사내에서 이걸 사네?</h2>
						<p>야 너두 할 수 있어</p>
						<a class="primary-btn cta-btn"
							onclick="checkLoginAndRedirect()">상품 등록하러 가기</a>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /HOT DEAL SECTION -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- shop -->
				<div class="col-md-4 col-xs-6">
					<div class="shop">
						<div class="shop-img">
							<img src="./img/shop01.png" alt="">
						</div>
						<div class="shop-body">
							<h3>
								Laptop<br>Collection
							</h3>
							<a href="#" class="cta-btn">Shop now <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- /shop -->

				<!-- shop -->
				<div class="col-md-4 col-xs-6">
					<div class="shop">
						<div class="shop-img">
							<img src="./img/shop03.png" alt="">
						</div>
						<div class="shop-body">
							<h3>
								Accessories<br>Collection
							</h3>
							<a href="#" class="cta-btn">Shop now <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- /shop -->

				<!-- shop -->
				<div class="col-md-4 col-xs-6">
					<div class="shop">
						<div class="shop-img">
							<img src="./img/shop02.png" alt="">
						</div>
						<div class="shop-body">
							<h3>
								Cameras<br>Collection
							</h3>
							<a href="#" class="cta-btn">Shop now <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- /shop -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h3 class="title">오늘의 소소한 상품들</h3>
						<div class="section-nav">
							<ul class="section-tab-nav tab-nav">
								<li class="active"><a data-toggle="tab" href="#tab1">최근
										등록순</a></li>
								<li><a data-toggle="tab" href="#tab1">인기 상품순</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /section title -->

				<!-- Products tab & slick -->
				<div class="col-md-12">
					<div class="row">
						<div class="products-tabs">
							<!-- tab -->
							<div id="tab1" class="tab-pane active">
								<div class="products-slick" data-nav="#slick-nav-1">
									<!-- product -->
									<c:forEach var = "product" items ="${list}">
									<div class="product">
										<div class="product-img">
											<img src="./upload/${product.prodPhotoName}.png?after" alt="">
										</div>
										<div class="product-body">
											<p class="product-category">${product.categoryName}</p>
											<h3 class="product-name">
												<a style="align-content: center" href="#">${product.prodName}</a>
											</h3>
											<h4 class="product-price">
												${product.prodPrice}

											</h4>

											<div class="product-btns">
												<button class="add-to-wishlist">
													<i class="fa fa-heart-o"></i><span class="tooltipp">찜하기</span>
												</button>
												<button class="add-to-compare">
													<i class="fa fa-exchange"></i><span class="tooltipp">소소톡
														보내기</span>
												</button>
												<button class="quick-view">
													<i class="fa fa-eye"></i><span class="tooltipp">상세
														보기</span>
												</button>
											</div>
										</div>

									</div>
									</c:forEach>
									<!-- /product -->
								</div>
								<div id="slick-nav-1" class="products-slick-nav"></div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>
				<!-- Products tab & slick -->


			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<jsp:include page="../resources/footer.html" />
	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>

</body>

</html>
