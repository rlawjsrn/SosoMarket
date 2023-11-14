<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link type="text/css" rel="stylesheet"
	href="resources/css/animate.min.css?after" />
<link type="text/css" rel="stylesheet"
	href="resources/css/bootstrap.min.css?after" />
<link rel="stylesheet" href="resources/css/style-mypage.css?after">
<link href="resources/css/glightbox.min.css?after"
	rel="stylesheet">
<link href="resources/css/swiper-bundle.min.css?after" rel="stylesheet">

<script>
	$(document).on('click', '.nav-link', function(e) {
		e.preventDefault(); // 기본 동작 방지

		var pageUrl = $(this).attr('href');

		// Ajax를 이용해 ChatRoom.do 호출
		$.ajax({
			url : pageUrl,
			method : 'POST',
			success : function(data) {
				// 성공 시 div.message에 결과를 넣음
				$('.page-con').html(data);
			},
			error : function(error) {
				console.error('Error:', error);
			}
		});
	});
</script>
</head>



<body>
	<!-- 헤더 -->
	<jsp:include page="../resources/header.html"></jsp:include>

	<!-- 마이페이지 -->
	<section id="mypages" class="mypages">
		<div class="container">

			<div class="section-title">
				<h2>
					마이<span>마켓</span>
				</h2>
				<p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis
					est adipisci expedita at voluptas atque vitae autem.</p>
			</div>

			<div class="row">
				<div class="col-lg-3">
					<ul class="nav nav-tabs flex-column mypage-ul">
						<li class="nav-item"><a class="nav-link active show"
							data-bs-toggle="tab" href="#tab-1">나의 프로필</a></li>
						<li class="nav-item"><a class="nav-link" id="ttab1"
							data-bs-toggle="tab" href="/SosoMarket/MypageLikeList.do">나의
								관심목록</a></li>
						<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
							href="/SosoMarket/MypageBuyList.do">나의 구매내역</a></li>
						<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
							href="/SosoMarket/MypageSellList.do">나의 판매내역</a></li>
						<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
							href="#tab-5">나의 회사생활</a></li>
					</ul>
				</div>
				<div class="col-lg-9 mt-4 mt-lg-0">
					<div class="tab-content">
						<!-- 비어 있음 -->
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- End mypages Section -->

	<script src="resources/js/bootstrap.bundle.min.js?after"></script>

	<!-- 푸터 -->
	<jsp:include page="../resources/footer.html"></jsp:include>
</body>
</html>