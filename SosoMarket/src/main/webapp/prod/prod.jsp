<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
</head>
<body>
<%String memberId = (String)session.getAttribute("memberId"); %>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		// 이미지 미리보기
		function readURL(input, previewId) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#' + previewId).attr('src', e.target.result);
				};
				reader.readAsDataURL(input.files[0]);
			}
		}
		// 폼 제출 전에 카테고리 선택 여부 확인
		function validateForm() {
			var category = document.forms["prodInsertfrm"]["category"].value;
			if (category === "") {
				alert("카테고리를 선택하세요.");
				return false;
			}
			return true;
		}

		$(document).ready(function() {
			// file1을 선택했을 때
			$("#file1").change(function() {
				readURL(this, "preview1");
				// file2 보여주기
				$("#file2").show();
			});

			// file2를 선택했을 때
			$("#file2").change(function() {
				readURL(this, "preview2");
				$("#preview2").show();
				// file3 보여주기
				$("#file3").show();
			});

			// file3를 선택했을 때
			$("#file3").change(function() {
				readURL(this, "preview3");
				$("#preview3").show();
			});
		});

		// 상품 가격 유효성 검사
		function validateForm() {
			var prodPrice = document.forms["prodInsertfrm"]["prodPrice"].value;
			var numReg = /^[0-9]+$/;
			if (!numReg.test(prodPrice)) {
				alert("가격은 숫자만 입력해주세요.");
				return false;
			}
			return true;
		}
	</script>
	<jsp:include page="../resources/header.jsp" />
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
		<form action="/SosoMarket/ProdInsert.do" method="post"
			enctype="multipart/form-data" id="prodInsertfrm"
			onsubmit="return validateForm();">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-7">
						<!-- Billing Details -->
						<div class="billing-details">
						<input value="<%=memberId%>" name="memberId" style="display:none"/>
							<div class="form-group">
								<select class="input-select" name="category">
									<option value="" selected="selected">카테고리</option>
									<option value="dd">디지털기기</option>
									<option value="fi">가구/인테리어</option>
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
									placeholder="상품명" required="required">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="prodPrice"
									placeholder="가격을 입력해주세요." required="required">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="place"
									placeholder="거래희망장소" required="required">
							</div>
							<div class="order-notes">
								<textarea class="input" name="prodDscrp"
									placeholder="상품의 상세한 내용을 작성해주세요." required="required"></textarea>
							</div>
							<br> <input type="file" name="file1" id="file1"
								onchange="readURL(this, 'preview1');"> <br> <input
								type="file" name="file2" id="file2" style="display: none;"
								onchange="readURL(this, 'preview2');"> <br> <input
								type="file" name="file3" id="file3" style="display: none;"
								onchange="readURL(this, 'preview3');"> <br> <input
								type="submit" class="primary-btn order-submit" value="상품등록하기">
						</div>
					</div>
					<div>
						<img id="preview1" src="" alt="image" style="width: 200px" />
					</div>
					<div>
						<img id="preview2" src="" alt="image"
							style="width: 200px; display: none;" />
					</div>
					<div>
						<img id="preview3" src="" alt="image"
							style="width: 200px; display: none;" />
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</form>
	</div>
	<!-- /SECTION -->
	<jsp:include page="../resources/footer.html" />
</body>
</html>
























