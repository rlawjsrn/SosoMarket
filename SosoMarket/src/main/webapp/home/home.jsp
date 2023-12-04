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
.product-img {
	width: 200px;
	height: 200px;
}
</style>

</head>
<body>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function () {
        // 페이지 로드 시 최근 등록순 목록을 미리 로드하여 표시
        loadRecentProducts();

        // act 클래스를 클릭 시, 해당 href를 tab-1에 불러오기
        $(document).on('click', '.act', function (e) {
            e.preventDefault(); // 기본 동작 방지
            // Ajax를 이용해 최근순, 인기순 호출
            $.ajax({
                url: $(this).attr('href'),
                method: 'POST',
                success: function (data) {
                    // 성공시 tab-1에 해당하는 .do 띄우기
                    $('#tab-1').html(data);
                },
                error: function (error) {
                    alert("실패!!!!");
                    console.error('Error:', error);
                }
            });
        });

        // 최근 등록순 목록을 로드하고 표시하는 함수
        function loadRecentProducts() {
            $.ajax({
                url: '/SosoMarket/HomeProd.do', // 최근 등록순 목록을 불러올 URL
                method: 'POST',
                success: function (data) {
                    // 성공시 tab-1에 해당하는 .do 띄우기
                    $('#tab-1').html(data);
                },
                error: function (error) {
                    alert("실패!!!!");
                    console.error('Error:', error);
                }
            });
        }
    });


	// 로그인 여부 체크 함수
	function checkLoginAndRedirect() {
	    var memberId = '<%=(String) session.getAttribute("memberId")%>';


		if (memberId === 'null' || memberId === undefined || memberId === '') {
			// 로그인이 필요한 경우, 얼럿창을 띄우고 로그인 페이지로 리다이렉트
			alert("로그인이 필요합니다.");
			location.href = "/SosoMarket/LoginMove.do"; // 로그인 페이지 URL로 변경
		} else {
			// 로그인이 되어 있으면 상품 등록 페이지로 이동
			location.href = "/SosoMarket/ProdInsertPage.do"; // 상품 등록 페이지 URL로 변경
		}
	}
</script>
</head>

<body>
	<jsp:include page="/resources/header.jsp" />
	<!-- HOT DEAL SECTION -->
	<div id="hot-deal" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="hot-deal">
						<h2 class="text-uppercase">사내에서 이걸 사네?</h2>
						<p>지금 필요한 물건을</p>
						<p>가장 가까운 곳에서!</p>
						<a class="primary-btn cta-btn" onclick="checkLoginAndRedirect()">상품 등록하러 가기 →</a>

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

				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h3 class="title">오늘의 소소한 상품들</h3>
						<div class="section-nav">
							<ul class="section-tab-nav tab-nav">
								<li class="active"><a class="nav-link act"
									data-toggle="tab" href="/SosoMarket/HomeProd.do">최근 등록순</a></li>
								<li class="active"><a class="nav-link act"
									data-toggle="tab" href="/SosoMarket/HomeProdPop.do">인기 상품순</a></li>
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

								<div id="tab-1" class="products-slick" data-nav="#slick-nav-1">
									<!-- ajax 들어올 공간 -->


								<div class="products-slick" data-nav="#slick-nav-1">
									<!-- product -->
									<c:forEach var="product" items="${list}">
										<div class="product">
											<div class="product-img">
												<img src="./upload/${product.prodPhotoName}.png?after"
													alt="">
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
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->
</body>
</html>


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
