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
<script>
	/* 관심상품 삭제 */
	function delHeart(productInterestId) {
		$.ajax({
			url : '/SosoMarket/ProdDelH.do?row=' + productInterestId,
			method : 'POST',
			data : {
				productInterestId : productInterestId
			},
			success : function(data) {
				alert('삭제되었습니다!')
				window.location.reload();
			},
			error : function(error) {
				console.error('Error', error);
			}
		});
	}

	/* 관심상품 등록 */
	function insertH(memberId, prodId) {
		$.ajax({
			url : '/SosoMarket/ProdInsertH.do?memberId=' + memberId  + "&prodId=" + prodId,
			method : 'POST',
			data : {
				memberId : memberId,
				prodId : prodId
			},
			success : function(data) {
				alert('추가하였습니다!')
				window.location.reload();
			},
			error : function(error) {
				console.error('Error', error);
			}
		});
	}
</script>
</head>
<body>
	<script>
		function deleteProduct(prodId) {
			if (confirm("정말로 삭제하시겠습니까?")) {
				// Ajax를 사용하여 서버에 삭제 요청을 보냄
				$.ajax({
					type : 'GET',
					url : '/SosoMarket/ProdDel.do?prodId=' + prodId,
					data : {
						prodId : prodId
					},
					success : function(response) {
						alert('삭제되었습니다.');
						// 삭제가 성공하면 필요한 작업을 수행
						location.href = 'ProdList.do'; // 삭제 성공 시 목록 페이지로 이동
					},
					error : function() {
						alert('서버 오류로 삭제에 실패했습니다.');
					}
				});
			}
		}
	</script>
	<%
	String memberId = (String) session.getAttribute("memberId");
	%>
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

							<ul class="product-links">
								<li>카테고리:</li>
								<li>${vo.category}</li>
							</ul>
							<ul class="product-links">
								<li>거래희망장소:</li>
								<li>${vo.placeTrans}</li>
							</ul>
							<ul class="product-links">
								<li>조회수:</li>
								<li>${vo.prodViews}</li>
							</ul>
							<br>
							<ul class="product-btns">
								<c:if test="${empty mvo.prodInterestId }">
									<li><a href="#" onclick="insertH('${mvo.memberId }', '${mvo.prodId }')"><i class="fa fa-heart-o"></i> 관심상품 추가</a></li>
									<!-- <i class="fa fa-heart"></i> 꽉 찬 하트 -->
								</c:if>
								<c:if test="${!empty mvo.prodInterestId }">
									<li><a href="#"
										onclick="delHeart('${mvo.prodInterestId}')"><i
											class="fa fa-heart"></i></i> 관심상품 삭제</a></li>
									<!-- <i class="fa fa-heart"></i> 꽉 찬 하트 -->
								</c:if>
							</ul>
							<br>
							<c:if test="${memberId eq vo.memberId}">
								<button class="primary-btn cta-btn"
									onclick="deleteProduct('${vo.prodId}')">삭제하기</button>
								<button class="primary-btn cta-btn"
									onclick="location.href='/SosoMarket/ProdMod.do?prodId=${vo.prodId }'">수정하기</button>
							</c:if>
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
	<script src="resources/js/slick.min.js"></script>
	<script src="resources/js/nouislider.min.js"></script>
	<script src="resources/js/jquery.zoom.min.js"></script>
	<script src="resources/js/main.js"></script>

	<jsp:include page="../resources/footer.html" />
</body>
</html>