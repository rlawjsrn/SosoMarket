<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
</head>
<body>
	<%
	String memberId = (String) session.getAttribute("memberId");
	%>
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

		function modifyProduct(prodId) {
			if (confirm("수정하시겠습니까?")) {
				// Ajax를 사용하여 서버에 삭제 요청을 보냄
				$.ajax({
					type : 'GET',
					url : '/SosoMarket/ProdUpdate.do?prodId=' + prodId,
					data : {
						prodId : prodId
					},
					success : function(response) {
						alert('수정되었습니다.');
						// 수정 성공하면 필요한 작업을 수행
						location.href = 'ProdOne.do?prodId=' + prodId; // 수정 성공 시 목록 페이지로 이동
					},
					error : function() {
						alert('서버 오류로 수정이 실패했습니다.');
					}
				});
			}
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
					<h3 class="breadcrumb-header">상품 수정하기</h3>
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
							<input value="<%=memberId%>" name="memberId"
								style="display: none" />
							<div class="form-group">
								<select class="input-select" name="category">
									<option value=""
										${empty vo.category ? 'selected="selected"' : ''}>카테고리</option>
									<option value="dd"
										${vo.category == '디지털기기' ? 'selected="selected"' : ''}>디지털기기</option>
									<option value="fi"
										${vo.category == '가구/인테리어' ? 'selected="selected"' : ''}>가구/인테리어</option>
									<option value="ic"
										${vo.category == '유아동' ? 'selected="selected"' : ''}>유아동</option>
									<option value="wc"
										${vo.category == '여성의류' ? 'selected="selected"' : ''}>여성의류</option>
									<option value="wg"
										${vo.category == '여성잡화' ? 'selected="selected"' : ''}>여성잡화</option>
									<option value="mg"
										${vo.category == '남성의류/잡화' ? 'selected="selected"' : ''}>남성의류/잡화</option>
									<option value="ha"
										${vo.category == '생활가전' ? 'selected="selected"' : ''}>생활가전</option>
									<option value="lk"
										${vo.category == '생활/주방' ? 'selected="selected"' : ''}>생활/주방</option>
									<option value="pf"
										${vo.category == '가공식품' ? 'selected="selected"' : ''}>가공식품</option>
									<option value="sl"
										${vo.category == '스포츠/레저' ? 'selected="selected"' : ''}>스포츠/레저</option>
									<option value="hb"
										${vo.category == '취미/게임/음반' ? 'selected="selected"' : ''}>취미/게임/음반</option>
									<option value="bt"
										${vo.category == '뷰티/미용' ? 'selected="selected"' : ''}>뷰티/미용</option>
									<option value="pl"
										${vo.category == '식물' ? 'selected="selected"' : ''}>식물</option>
									<option value="ps"
										${vo.category == '반려동물용품' ? 'selected="selected"' : ''}>반려동물용품</option>
									<option value="tc"
										${vo.category == '티켓/교환권' ? 'selected="selected"' : ''}>티켓/교환권</option>
									<option value="bk"
										${vo.category == '도서' ? 'selected="selected"' : ''}>도서</option>
									<option value="by"
										${vo.category == '삽니다' ? 'selected="selected"' : ''}>삽니다</option>
								</select>
							</div>
							<div class="form-group">
								<input class="input" type="text" name="prodName"
									placeholder="상품명" required="required" value="${vo.prodName }">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="prodPrice"
									placeholder="가격을 입력해주세요." required="required"
									value="${vo.prodPrice }">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="place"
									placeholder="거래희망장소" required="required"
									value="<c:out value="${vo.placeTrans}"/>">
							</div>
							<div class="order-notes">
								<textarea class="input" name="prodDscrp"
									placeholder="상품의 상세한 내용을 작성해주세요." required="required">${vo.prodDscrp}</textarea>
							</div>
							<br>
							<%
							int cnt = 1;
							%>
							<c:forEach var="vo" items="${list}">
								<div>
									<img id="preview<%=cnt %>"
										src="./upload/${vo.prodPhotoName}.png?after" alt="image"
										style="width: 200px" />
								</div>
								<input type="file" name="file<%=cnt%>" id="file<%=cnt%>"
									onchange="readURL(this, 'preview<%=cnt++%>');">
								<br>
							</c:forEach>
							<input type="submit" class="primary-btn order-submit"
								value="상품수정하기" onclick="modifyProduct('${vo.prodId}')">
						</div>
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