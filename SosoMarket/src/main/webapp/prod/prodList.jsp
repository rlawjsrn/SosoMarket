<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품전체조회페이지</title>
<script>
    function applyFilters() {
    	// 정렬 기준 값
        var sortOption = document.getElementById("sortOption").value;
    	
    	// 보여질 갯수 값
        var quantityOption = document.getElementById("quantityOption").value;

        // 카테고리 체크박스 선택값
        var checkboxes = document.querySelectorAll('input[type=checkbox]');
        var selectedCategories = Array.from(checkboxes)
            .filter(checkbox => checkbox.checked)
            .map(checkbox => checkbox.value);
        
        // 가격 범위 값
        var priceMin = document.getElementById("price-min").value;
        var priceMax = document.getElementById("price-max").value;

        // AJAX를 사용하여 서버로 데이터 전송
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/SosoMarket/ProdCtgrList.do", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        // 데이터 전송
        var data = "sortOption=" + sortOption + "&quantityOption=" + quantityOption + "&selectedCategories=" + selectedCategories.join(",") + "&priceMin="+ priceMin + "&priceMax=" + priceMax;
        console.log(data);
        xhr.send(data);

        // 서버 응답 처리
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 서버 응답에 대한 처리
                console.log("아작스 호출 성공?");
            }
        };
    }
</script>
</head>
<body>
	<jsp:include page="../resources/header.html" />

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- ASIDE -->
				<div id="aside" class="col-md-3">
					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">카테고리</h3>
						<div class="checkbox-filter">
							<%
							int cnt1 = 1;
							int cnt2 = 1;
							%>
							<c:forEach var="vo" items="${ctgrList }">
								<div class="input-checkbox">
									<input type="checkbox" id="category-<%=cnt1++%>"
										value="${vo.category }" onchange="filterProducts()"> <label
										for="category-<%=cnt2++%>"> <span></span>
										${vo.category } <small>(${vo.cntCtgr }) </small>
									</label>
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">가격</h3>
						<div class="price-filter">
							<div id="price-slider"></div>
							<div class="input-number price-min">
								<input id="price-min" type="number">
							</div>
							<span>-</span>
							<div class="input-number price-max">
								<input id="price-max" type="number">
							</div>
						</div>
					</div>
					<!-- /aside Widget -->
					<div>
						<button onclick="applyFilters()">검색</button>
						<button onclick="#">초기화</button>
					</div>
					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">인기 상품</h3>
						<c:forEach var="vv" items="${popList}">
							<div class="product-widget">
								<div class="product-img">
									<img src="./upload/${vv.prodPhotoName}.png?after" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">${vv.category }</p>
									<h3 class="product-name">
										<a href="#">${vv.prodName }</a>
									</h3>
									<h4 class="product-price">${vv.prodPrice }</h4>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- /aside Widget -->
				</div>

				<!-- /ASIDE -->

				<!-- STORE -->
				<div id="store" class="col-md-9">
					<!-- store top filter -->
					<div class="store-filter clearfix">
						<div class="store-sort">
							<label> 정렬 기준: <select id="sortOption"
								class="input-select">
									<option value="0">조회많은순</option>
									<option value="1">최근등록순</option>
							</select>
							</label> <label> 갯수: <select id="quantityOption"
								class="input-select">
									<option value="0">20</option>
									<option value="1">50</option>
							</select>
							</label>
							<button onclick="applyFilters()">검색</button>
						</div>
					</div>
					<!-- /store top filter -->

					<!-- store products -->
					<div class="row">
						<!-- product -->
						<c:forEach var="voo" items="${list}">
							<div class="col-md-4 col-xs-6">
								<div class="product" id="prodId">
									<div class="product-img">
										<img id="prodPhotoName"
											src="./upload/${voo.prodPhotoName}.png?after" alt="">
									</div>
									<div class="product-body">
										<p class="product-category" id="category">${voo.category}</p>
										<h3 class="product-name" id="prodName">
											<a href="#">${voo.prodName }</a>
										</h3>
										<h4 class="product-price" id="prodPrice">${voo.prodPrice}원</h4>

										<div class="product-btns">
											<button class="add-to-wishlist">
												<i class="fa fa-heart-o"></i><span class="tooltipp">관심상품등록</span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- /product -->
					</div>
					<!-- store bottom filter -->
					<div class="store-filter clearfix">
						<span class="store-qty">페이징</span>
						<ul class="store-pagination">
							<li class="active">1</li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
						</ul>
					</div>
					<!-- /store bottom filter -->
				</div>
				<!-- /STORE -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<jsp:include page="../resources/footer.html" />
</body>
</html>
