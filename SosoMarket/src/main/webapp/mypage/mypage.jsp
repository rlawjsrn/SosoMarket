<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,600,600i,700,700i|Satisfy|Comic+Neue:300,300i,400,400i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../resources/Mycss/animateMypage.min.css?after"
	rel="stylesheet">
<link href="../resources/Mycss/bootstrapMypage.min.css?after"
	rel="stylesheet">
<link href="../resources/Mycss/bootstrap-icons.css?after" rel="stylesheet">
<link href="../resources/Mycss/boxicons.min.css?after" rel="stylesheet">
<link href="../resources/Mycss/glightbox.min.css?after" rel="stylesheet">
<link href="../resources/Mycss/swiper-bundle.min.css?after"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="../resources/Mycss/styleMypage.css" rel="stylesheet">
<body>
	<%-- <jsp:include page="../resources/header.html"></jsp:include> --%>
	<a href="/SosoMarket/MypageLikeList.do">회원별 찜 목록(관심목록)</a>
	<!-- 나의 프로필 보기 + 사진 -->
	<a href="/SosoMarket/MypageSellList.do">판매내역</a>
	<!-- 판매내역 -->
	<a href="/SosoMarket/MypageBuyList.do">구매내역</a>
	<!-- 구매내역 -->
	<!-- 회사생활 -->
	<%-- <jsp:include page="../resources/footer.html"></jsp:include> --%>

	<!-- 부트스트랩 -->
	<section id="specials" class="specials">
		<div class="container">

			<div class="section-title">
				<h2>
					<span>Specials</span>의 마이페이지
				</h2>
			</div>

			<div class="row">
				<div class="col-lg-3">
					<ul class="nav nav-tabs flex-column">
						<li class="nav-item"><a class="nav-link active show"
							data-bs-toggle="tab" href="#tab-1">나의 프로필</a></li>
						<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
							href="#tab-2">나의 관심목록</a></li>
						<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
							href="#tab-3">나의 구매내역</a></li>
						<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
							href="#tab-4">나의 판매내역</a></li>
						<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
							href="#tab-5">나의 회사생활</a></li>
					</ul>
				</div>
				<div class="col-lg-9 mt-4 mt-lg-0">
					<div class="tab-content">
						<div class="tab-pane active show" id="tab-1">
							<div class="row">
								<div class="col-lg-8 details order-2 order-lg-1">
									<h3>Architecto ut aperiam autem id</h3>
									<p class="fst-italic">Qui laudantium consequatur laborum
										sit qui ad sapiente dila parde sonata raqer a videna mareta
										paulona marka</p>
									<p>Et nobis maiores eius. Voluptatibus ut enim blanditiis
										atque harum sint. Laborum eos ipsum ipsa odit magni. Incidunt
										hic ut molestiae aut qui. Est repellat minima eveniet eius et
										quis magni nihil. Consequatur dolorem quaerat quos qui
										similique accusamus nostrum rem vero</p>
								</div>
								<div class="col-lg-4 text-center order-1 order-lg-2">
									<img src="../upload/iphone.png" alt="" class="img-fluid">
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-2">
							<div class="row">
								<div class="col-lg-8 details order-2 order-lg-1">
									<h3>Et blanditiis nemo veritatis excepturi</h3>
									<p class="fst-italic">Qui laudantium consequatur laborum
										sit qui ad sapiente dila parde sonata raqer a videna mareta
										paulona marka</p>
									<p>Ea ipsum voluptatem consequatur quis est. Illum error
										ullam omnis quia et reiciendis sunt sunt est. Non aliquid
										repellendus itaque accusamus eius et velit ipsa voluptates.
										Optio nesciunt eaque beatae accusamus lerode pakto madirna
										desera vafle de nideran pal</p>
								</div>
								<div class="col-lg-4 text-center order-1 order-lg-2">
									<img src="assets/img/specials-2.jpg" alt="" class="img-fluid">
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-3">
							<div class="row">
								<div class="col-lg-8 details order-2 order-lg-1">
									<h3>Impedit facilis occaecati odio neque aperiam sit</h3>
									<p class="fst-italic">Eos voluptatibus quo. Odio similique
										illum id quidem non enim fuga. Qui natus non sunt dicta dolor
										et. In asperiores velit quaerat perferendis aut</p>
									<p>Iure officiis odit rerum. Harum sequi eum illum corrupti
										culpa veritatis quisquam. Neque necessitatibus illo rerum eum
										ut. Commodi ipsam minima molestiae sed laboriosam a iste odio.
										Earum odit nesciunt fugiat sit ullam. Soluta et harum
										voluptatem optio quae</p>
								</div>
								<div class="col-lg-4 text-center order-1 order-lg-2">
									<img src="assets/img/specials-3.jpg" alt="" class="img-fluid">
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-4">
							<div class="row">
								<div class="col-lg-8 details order-2 order-lg-1">
									<h3>Fuga dolores inventore laboriosam ut est accusamus
										laboriosam dolore</h3>
									<p class="fst-italic">Totam aperiam accusamus. Repellat
										consequuntur iure voluptas iure porro quis delectus</p>
									<p>Eaque consequuntur consequuntur libero expedita in
										voluptas. Nostrum ipsam necessitatibus aliquam fugiat debitis
										quis velit. Eum ex maxime error in consequatur corporis atque.
										Eligendi asperiores sed qui veritatis aperiam quia a laborum
										inventore</p>
								</div>
								<div class="col-lg-4 text-center order-1 order-lg-2">
									<img src="assets/img/specials-4.jpg" alt="" class="img-fluid">
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-5">
							<div class="row">
								<div class="col-lg-8 details order-2 order-lg-1">
									<h3>Est eveniet ipsam sindera pad rone matrelat sando reda</h3>
									<p class="fst-italic">Omnis blanditiis saepe eos autem qui
										sunt debitis porro quia.</p>
									<p>Exercitationem nostrum omnis. Ut reiciendis repudiandae
										minus. Omnis recusandae ut non quam ut quod eius qui. Ipsum
										quia odit vero atque qui quibusdam amet. Occaecati sed est
										sint aut vitae molestiae voluptate vel</p>
								</div>
								<div class="col-lg-4 text-center order-1 order-lg-2">
									<img src="assets/img/specials-5.jpg" alt="" class="img-fluid">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- End Specials Section -->
	<!-- Vendor JS Files -->
	<script src="../resources/Myjs/bootstrap.bundle.min.js"></script>
	<script src="../resources/Myjs/glightbox.min.js"></script>
	<script src="../resources/Myjs/isotope.pkgd.min.js"></script>
	<script src="../resources/Myjs/swiper-bundle.min.js"></script>
	<script src="../resources/Myjs/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="../resources/Myjs/main.js"></script>
</body>
</html>