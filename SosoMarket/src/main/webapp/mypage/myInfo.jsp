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
<!-- <link
	href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,600,600i,700,700i|Satisfy|Comic+Neue:300,300i,400,400i,700,700i"
	rel="stylesheet">
Template Main CSS File
<link href="resources/Mycss/styleMypage.css?after" rel="stylesheet">
Vendor CSS Files
<link href="resources/Mycss/bootstrapMypage.min.css?after"
	rel="stylesheet"> -->
</head>

<body>
	<!-- 부트스트랩 이이 -->

	<section id="specials" class="specials">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 mt-4 mt-lg-0">
					<div class="tab-content">
						<div class="tab-pane active show" id="tab-1">
							<div class="row">
								<div class="col-lg-8 details order-2 order-lg-1">
									<c:choose>
										<c:when test="${vo.ratingScore lt 20}">
											<h4>승진률</h4>
											<span>${vo.ratingScore}</span>
											<hr>
											<h4>직급</h4>
											<span>계약직</span>
										</c:when>
										<c:when test="${vo.ratingScore lt 40}">
											<h4>승진률</h4>
											<span>${vo.ratingScore}</span>
											<hr>
											<h4>직급</h4>
											<span>인턴</span>
										</c:when>
										<c:when test="${vo.ratingScore lt 60}">
											<h4>승진률</h4>
											<span>${vo.ratingScore}</span>
											<hr>
											<h4>직급</h4>
											<span>사원</span>
										</c:when>
										<c:when test="${vo.ratingScore lt 80}">
											<h4>승진률</h4>
											<span>${vo.ratingScore}</span>
											<hr>
											<h4>직급</h4>
											<span>대리</span>
										</c:when>
										<c:when test="${vo.ratingScore lt 100}">
											<h4>승진률</h4>
											<span>${vo.ratingScore}</span>
											<hr>
											<h4>직급</h4>
											<span>부장</span>
										</c:when>
									</c:choose>
									<hr>
									<button class="primary-btn"
										onclick="location.href='/SosoMarket/MyPageUpdate.do'">
										프로필 수정</button>
								</div>
								<c:choose>
									<c:when test="${vo.ratingScore lt 20}">
										<div class="col-lg-4 text-center order-1 order-lg-2">
											<img src="upload/계약직.png?after" alt="" class="img-fluid">
										</div>
									</c:when>
									<c:when test="${vo.ratingScore lt 40}">
										<div class="col-lg-4 text-center order-1 order-lg-2">
											<img src="upload/인턴.png?after" alt="" class="img-fluid">
										</div>
									</c:when>
									<c:when test="${vo.ratingScore lt 60}">
										<div class="col-lg-4 text-center order-1 order-lg-2">
											<img src="upload/사원.png?after" alt="" class="img-fluid">
										</div>
									</c:when>
									<c:when test="${vo.ratingScore lt 80}">
										<div class="col-lg-4 text-center order-1 order-lg-2">
											<img src="upload/대리.png?after" alt="" class="img-fluid">
										</div>
									</c:when>
									<c:when test="${vo.ratingScore lt 100}">
										<div class="col-lg-4 text-center order-1 order-lg-2">
											<img src="upload/부장.png?after" alt="" class="img-fluid">
										</div>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- Vendor JS Files -->
	<!-- <script src="resources/Myjs/bootstrapMypage.bundle.min.js?after"></script> -->
	<script src="resources/Myjs/glightbox.min.js?after"></script>
	<script src="resources/Myjs/isotope.pkgd.min.js?after"></script>

	<!-- Template Main JS File -->
	<!-- 	<script src="resources/js/main.js?after"></script> -->
</body>
</html>