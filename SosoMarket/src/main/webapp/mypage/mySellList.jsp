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
<style>
#tabCon1, #tabCon2, #tabCon3 {
	display: none;
}
</style>
</head>
<body>

	<!-- nav 부트스트랩 -->
	<div class="container mb-5">
		<div class="section-title mb-5">
			<div class="section-nav">
				<ul class="section-tab-nav tab-nav">
					<li><a id="tab1" data-toggle="tab" onclick="togEvent1()">판매중</a></li>
					<!-- class=active -->
					<li id="tab2"><a data-toggle="tab" onclick="togEvent2()">거래완료</a></li>
					<li id="tab3"><a data-toggle="tab" onclick="togEvent3()">예약중</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 다른 부트스트랩 -->
	<div class="untree_co-section before-footer-section mt-5">
		<!-- 판매중인 상품 목록 띄우기 -->
		<div class="container" id="tabCon1">
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
									<c:if test="${vo.productStatus eq 0}">	<!-- product_status = 0 -> 판매중 -->
										<tr>
											<td class="product-thumbnail"><img
												src="${vo.productPhotoId }" alt="Image" class="img-fluid">
											</td>
											<td class="product-name">
												<h2 class="h5 text-black">${vo.productName }</h2>
											</td>
											<td>${vo.productPrice }</td>
											<%-- <c:if test="${vo.productStatus eq 0}"> --%>
											<td>판매중</td>
											<%-- </c:if> --%>
											<td>${vo.generationDate }</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	<!-- 거래완료 목록 띄우기 -->
		<div class="container" id="tabCon2">
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
									<c:if test="${vo.productStatus eq 1}">	<!-- product_status = 1 -> 거래완료 -->
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
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
		
		<!-- 예약중 거래 목록 띄우기 -->
		<div class="container" id="tabCon3">
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
									<c:if test="${vo.productStatus eq 2}">	<!-- product_status = 2 -> 예약중 -->
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
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>


	<script>
	/* 판매중 토글 */
	const togEvent1 = (e) => {
		document.getElementById("tabCon1").style.display = "block";
		document.getElementById("tabCon2").style.display = "none";
		document.getElementById("tabCon3").style.display = "none";
	}
	/* 거래완료 토글 */
	const togEvent2 = (e) => {
		document.getElementById("tabCon2").style.display = "block";
		document.getElementById("tabCon1").style.display = "none";
		document.getElementById("tabCon3").style.display = "none";
	}
	/* 예약중 토글 */
	const togEvent3 = (e) => {
		document.getElementById("tabCon3").style.display = "block";
		document.getElementById("tabCon1").style.display = "none";
		document.getElementById("tabCon2").style.display = "none";
	}

	</script>
</body>
</html>