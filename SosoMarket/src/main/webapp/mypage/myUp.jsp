<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
const phoneAutoHyphen = (target) => {
	 target.value = target.value
	  .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
//핸드폰 번호에서 하이픈을 제거
 const removeHyphens = (phoneNumber) => {
     return phoneNumber.replace(/-/g, '');
 }
</script>
</head>

<body>
	<jsp:include page="../resources/header.html"></jsp:include>

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<div class="col-md-7">
					<!-- Billing Details -->
					<div class="billing-details">
						<div class="section-title">
							<h3 class="title">${vo.memberId }님의회원정보</h3>
						</div>
						<form action="/SosoMarket/MemberUp.do" method="post">
							<div class="form-group">
								닉네임<input class="input" type="text" name="nickname"
									id="nickname" value="${vo.nickname }">
							</div>
							<div class="form-group">
								폰 번호<input class="input" type="text" name="phoneNumber"
									id="phoneNumber" value= "${vo.phoneNumber}"
									oninput="phoneAutoHyphen(this)" maxlength="13">
									 <!--  -->
							</div>
							<div class="form-group">
								이메일<input class="input" type="email" name="email" id="email"
									value="${vo.email }" readonly="readonly">
							</div>
							<div class="form-group">
								이메일 인증번호<input class="input" type="text" name="address"
									value="${vo.emailVrf }" readonly="readonly">
							</div>
							<div class="form-group">
								승진률<input class="input" type="text" name="address"
									value="${vo.ratingScore }" readonly="readonly">
							</div>
							<button class="primary-btn" type="submit">수정하기</button>
						</form>
						<br>
						<button class="primary-btn"
							onclick="location.href='/SosoMarket/MyPageHome.do'">돌아가기</button>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<jsp:include page="../resources/footer.html"></jsp:include>
</body>
</html>