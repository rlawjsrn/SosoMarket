<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
</head>
<body>
	<jsp:include page="../resources/header.html" />
	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">상품 등록하기</h3>
					<ul class="breadcrumb-tree">
						<li><a href="#">소소마켓</a></li>
						<li class="active">상품 등록</li>
					</ul>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /BREADCRUMB -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<div class="col-md-7">
					<!-- Billing Details -->
					<div class="billing-details">
						<div class="form-group">
							<select class="input-select" name="cateegory">
								<option value="" selected="selected">카테고리</option>
								<option value="dd">디지털기기</option>
								<option value="fi">가구 / 인테리어</option>
								<option value="ic">유아동</option>
								<option value="wc">여성의류</option>
								<option value="wg">여성잡화</option>
								<option value="mg">남성의류/잡화</option>
								<option value="ha">생활가전</option>
								<option value="lk">생활/주방</option>
								<option value="pf">가공식품</option>
								<option value="sl">스포츠/레저</option>
								<option value="hb">취미/게임/음반</option>
								<option value="bt">뷰티/미용</option>
								<option value="pl">식물</option>
								<option value="ps">반려동물용품</option>
								<option value="tc">티켓/교환권</option>
								<option value="bk">도서</option>
								<option value="by">삽니다</option>
							</select>
						</div>
						<div class="form-group">
							<input class="input" type="text" name="prodName"
								placeholder="상품명">
						</div>

						<div class="form-group">
							<input class="input" type="email" name="prodPrice"
								placeholder="가격을 입력해주세요.">
						</div>
						<div class="form-group">
							<input class="input" type="text" name="place"
								placeholder="거래희망장소">
						</div>
						<div class="order-notes">
							<textarea class="input" placeholder="상품의 상세한 내용을 작성해주세요."></textarea>
						</div>
						<br>
						<a href="#" class="primary-btn order-submit">사진 업로드</a> <a
							href="#" class="primary-btn order-submit">상품 등록하기</a>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->
	<jsp:include page="../resources/footer.html" />
</body>
</html>