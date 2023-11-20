<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,600,600i,700,700i|Satisfy|Comic+Neue:300,300i,400,400i,700,700i"
	rel="stylesheet">
<!-- Template Main CSS File -->
<link href="resources/Mycss/styleMypage.css?after" rel="stylesheet">
<!-- Vendor CSS Files -->
<link href="resources/Mycss/bootstrapMypage.min.css?after"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	// act 클래스를 클릭 시, 해당 href를 tab-1에 불러오기
	$(document).on('click', '.act', function(e) {
		e.preventDefault(); // 기본 동작 방지
		var memberId = "${vo.memberId}";
		var LikeList = $(this).attr('href') + '?memberId=' + memberId;
		// Ajax를 이용해 LikeList 호출
		$.ajax({
			url : LikeList,
			method : 'POST',
			success : function(data) {
				// 성공시 tab-1에 해당하는 .do 띄우기
				$('#tab-1').html(data);
			},
			error : function(error) {
				console.error('Error:', error);
			}
		});
	});
</script>
</head>


<body>
	<jsp:include page="../resources/header.html"></jsp:include>
	<!-- 부트스트랩 -->

	<section id="specials" class="specials">
		<div class="container">
			<div class="section-title">
				<h2>
					<span>${vo.nickname}</span>의 마이페이지
				</h2>
			</div>
			<div class="row">
				<div class="col-lg-3">
					<ul class="nav nav-tabs flex-column">
						<li class="nav-item"><a class="nav-link act active show"
							data-bs-toggle="tab" href="/SosoMarket/MyPageInfo.do">나의 프로필</a></li>
						<li class="nav-item"><a class="nav-link act"
							href="/SosoMarket/MypageLikeList.do">나의 관심목록</a></li>
						<li class="nav-item"><a class="nav-link act"
							data-bs-toggle="tab" id="tabb2"
							href="/SosoMarket/MypageBuyList.do">나의 구매내역</a></li>
						<li class="nav-item"><a class="nav-link act"
							data-bs-toggle="tab" href="/SosoMarket/MypageSellList.do">나의
								판매내역</a></li>
						<li class="nav-item"><a class="nav-link act"
							data-bs-toggle="tab" href="#tab-5">나의 회사생활</a></li>
					</ul>
				</div>
				<div class="col-lg-9 mt-4 mt-lg-0">
					<div class="tab-content">
						<div class="tab-pane active show" id="tab-1">
							<div class="row">
								<!-- ajax 들어올 공간 -->
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- End Specials Section -->
	<jsp:include page="../resources/footer.html"></jsp:include>
	<!-- Vendor JS Files -->
	<!-- <script src="resources/Myjs/bootstrapMypage.bundle.min.js?after"></script> -->
	<script src="resources/Myjs/glightbox.min.js?after"></script>
	<script src="resources/Myjs/isotope.pkgd.min.js?after"></script>

	<!-- Template Main JS File -->
	<!-- 	<script src="resources/js/main.js?after"></script> -->
</body>
</html>