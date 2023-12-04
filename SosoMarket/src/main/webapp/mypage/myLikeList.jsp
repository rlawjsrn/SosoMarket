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
<link href="resources/css2/bootstrap.min.css?after" rel="stylesheet">
<link href="resources/css2/tiny-slider.css?after" rel="stylesheet">
<link href="resources/css2/style.css?after" rel="stylesheet">
<link href="resources/css/style-mypage.css?after" rel="stylesheet">
</head>
<script>
/* 관심상품 삭제 */
	function delHeart(productInterestId){
		$.ajax({
			url: '/SosoMarket/MypageDelH.do?row='+productInterestId,
			method: 'POST',
			data: {productInterestId : productInterestId},
			success: function(data){
				alert('삭제되었습니다!')
				window.location.reload();
			},
			error: function(error){
				console.error('Error', error);
			}
		});
	}
</script>
<body>

	<!-- 다른 부트스트랩 -->
	<div class="untree_co-section before-footer-section">
		<div class="">
			<div class="row mb-5">
				<form class="col-md-12" method="post">
					<div class="site-blocks-table">
						<table class="table">
							<thead>
								<tr>
									<th class="product-thumbnail">상품 사진</th>
									<th class="product-name">상품</th>
									<th class="product-price">가격</th>
									<th class="product-remove">찜하기 상태</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="vo" items="${list}">
								<tr>
									<td class="product-thumbnail">
										<img src="./upload/${vo.productPhotoName }.png?after" alt="Image" class="img-fluid" alt="">
									</td>
									<td class="product-name">
										<h2 class="h5 text-black">${vo.productName }</h2>
									</td>
									<td>${vo.productPrice }</td>
									
									<td><a href="#" class="btn btn-black btn-sm" onclick="delHeart('${vo.productInterestId}')">♥</a></td><!-- location.href='/SosoMarket/MypageDelH.do?row=${vo.productInterestId}' -->
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>

<%-- 	<jsp:include page="../resources/footer.html"></jsp:include> --%>
</body>
</html>