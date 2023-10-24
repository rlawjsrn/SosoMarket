<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>소소마켓</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="css/slick.css" />
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style.css" />

</head>

<body>
	<!-- HEADER -->
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li><a href="#"><i class="fa fa-map-marker"></i> 회사 인증하기</a></li>
				</ul>
				<ul class="header-links pull-right">
					<li><a href="#"><i class="fa fa-user-o"></i> 회원가입/로그인</a></li>
				</ul>
			</div>
		</div>
		<!-- /TOP HEADER -->

		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<div class="col-md-3">
						<div class="header-logo">
							<a href="/Sosomarket/Home.do" class="logo">
								<img src="./img/logo.png" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->

					<!-- SEARCH BAR -->
					<div class="col-md-6">
						<div class="header-search">
							<form>
								<select class="input-select">
									<option value="0">전체</option>
									<option value="1">소소거래</option>
									<option value="1">사내이야기</option>
								</select>
								<input class="input" placeholder="필요한 상품을 검색하세요!">
								<button class="search-btn">검색</button>
							</form>
						</div>
					</div>
					<!-- /SEARCH BAR -->

					<!-- ACCOUNT -->
					<div class="col-md-3 clearfix">
						<div class="header-ctn">
							<!-- Wishlist -->
							<div>
								<a href="#">
									<i class="fa fa-heart-o"></i>
									<span>소소톡</span>
									<div class="qty">2</div>
								</a>
							</div>
							<!-- /Wishlist -->

							<!-- Cart -->
							<div class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
									<i class="fa fa-shopping-cart"></i>
									<span>마이마켓</span>
									<div class="qty">3</div>
								</a>
								<div class="cart-dropdown">
									<div class="cart-list">
										<div class="product-widget">
											<div class="product-img">
												<img src="./img/product01.png" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">product name goes here</a></h3>
												<h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
											</div>
											<button class="delete"><i class="fa fa-close"></i></button>
										</div>

										<div class="product-widget">
											<div class="product-img">
												<img src="./img/product02.png" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">product name goes here</a></h3>
												<h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
											</div>
											<button class="delete"><i class="fa fa-close"></i></button>
										</div>
									</div>
									<div class="cart-summary">
										<small>3 Item(s) selected</small>
										<h5>SUBTOTAL: $2940.00</h5>
									</div>
									<div class="cart-btns">
										<a href="#">View Cart</a>
										<a href="#">Checkout <i class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
							</div>
							<!-- /Cart -->

							<!-- Menu Toogle -->
							<div class="menu-toggle">
								<a href="#">
									<i class="fa fa-bars"></i>
									<span>Menu</span>
								</a>
							</div>
							<!-- /Menu Toogle -->
						</div>
					</div>
					<!-- /ACCOUNT -->
				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- /MAIN HEADER -->
	</header>
	<!-- /HEADER -->

	<!-- NAVIGATION -->
	<nav id="navigation">
		<!-- container -->
		<div class="container">
			<!-- responsive-nav -->
			<div id="responsive-nav">
				<!-- NAV -->
				<ul class="main-nav nav navbar-nav">
					<li><a href="#">소소거래</a></li>
					<li><a href="#">사내이야기</a></li>
				</ul>
				<!-- /NAV -->
			</div>
			<!-- /responsive-nav -->
		</div>
		<!-- /container -->
	</nav>
	<!-- /NAVIGATION -->

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
						<a class="primary-btn cta-btn" href="#">상품 등록하러 가기</a>
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
							<h3>Laptop<br>Collection</h3>
							<a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
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
							<h3>Accessories<br>Collection</h3>
							<a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
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
							<h3>Cameras<br>Collection</h3>
							<a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
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
								<li class="active"><a data-toggle="tab" href="#tab1">최근 등록순</a></li>
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
									<div class="product">
										<div class="product-img">
											<img src="./img/product01.png" alt="">
											<div class="product-label">
												<span class="sale">-30%</span>
												<span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>

											<div class="product-btns">
												<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
														class="tooltipp">찜하기</span></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span
														class="tooltipp">소소톡 보내기</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span
														class="tooltipp">상세 보기</span></button>
											</div>
										</div>

									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product02.png" alt="">
											<div class="product-label">
												<span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>

											<div class="product-btns">
												<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
														class="tooltipp">찜하기</span></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span
														class="tooltipp">소소톡 보내기</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span
														class="tooltipp">상세 보기</span></button>
											</div>
										</div>

									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product03.png" alt="">
											<div class="product-label">
												<span class="sale">-30%</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>

											<div class="product-btns">
												<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
														class="tooltipp">찜하기</span></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span
														class="tooltipp">소소톡 보내기</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span
														class="tooltipp">상세 보기</span></button>
											</div>
										</div>

									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product04.png" alt="">
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>

											<div class="product-btns">
												<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
														class="tooltipp">찜하기</span></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span
														class="tooltipp">소소톡 보내기</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span
														class="tooltipp">상세 보기</span></button>
											</div>
										</div>

									</div>
									<!-- /product -->

								</div>
								<div id="slick-nav-1" class="products-slick-nav"></div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>
				<!-- Products tab & slick -->

				<!-- Products tab & slick -->
				<div class="col-md-12">
					<div class="row">
						<div class="products-tabs">
							<!-- tab -->
							<div id="tab2" class="tab-pane fade in active">
								<div class="products-slick" data-nav="#slick-nav-2">
									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product06.png" alt="">
											<div class="product-label">
												<span class="sale">-30%</span>
												<span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>

											<div class="product-btns">
												<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
														class="tooltipp">찜하기</span></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span
														class="tooltipp">소소톡 보내기</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span
														class="tooltipp">상세 보기</span></button>
											</div>
										</div>

									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product07.png" alt="">
											<div class="product-label">
												<span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>

											<div class="product-btns">
												<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
														class="tooltipp">찜하기</span></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span
														class="tooltipp">소소톡 보내기</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span
														class="tooltipp">상세 보기</span></button>
											</div>
										</div>

									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product08.png" alt="">
											<div class="product-label">
												<span class="sale">-30%</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>

											<div class="product-btns">
												<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
														class="tooltipp">찜하기</span></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span
														class="tooltipp">소소톡 보내기</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span
														class="tooltipp">상세 보기</span></button>
											</div>
										</div>

									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product09.png" alt="">
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>

											<div class="product-btns">
												<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
														class="tooltipp">찜하기</span></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span
														class="tooltipp">소소톡 보내기</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span
														class="tooltipp">상세 보기</span></button>
											</div>
										</div>

									</div>
									<!-- /product -->

								</div>
								<div id="slick-nav-2" class="products-slick-nav"></div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>
				<!-- /Products tab & slick -->

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- FOOTER -->
	<footer id="footer">
		<!-- top footer -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-5 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">소소마켓</h3>
							<p>사업자등록번호 : 2201-2ab-a-ssmk</p>
							<p>주소 : 대구광역시 북구 복현로 35</p>
							<p>EMAIL : sosomarket@ssmk.co.kr</p>
							<p>Ⓒ Sosomarket. Inc All rights reserved.</p>
						</div>
					</div>

					<div class="col-md-5 col-xs-6">
						<div class="footer">
							<p>고객센터</p>
							<h3 class="footer-title">
								053-940-5114
							</h3>
							<p>운영시간 9시 - 18시 (주말/공휴일 휴무, 점심시간 12시 - 13시)</p>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /top footer -->

	</footer>
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>

</body>

</html>
