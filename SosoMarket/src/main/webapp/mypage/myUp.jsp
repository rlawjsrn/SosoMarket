<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
const phoneAutoHyphen = (target) => {
	 target.value = target.value
	  .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}

 // 닉네임 체크 boolean
 var isNicknameAvailable = false;
 
 function nicknameCheckFunction(new_nick) {
	    var nickname = $('#nickname').val();
	    console.log(nickname);
	    if (nickname === "") {
	        alert("닉네임를 입력해주세요");
	        $('#nickname').focus();
	        return false;
	        
	    }
	    $.ajax({
	        type: 'post',
	        url: '/SosoMarket/MemberNicknameCheckServlet',
	        data: { nickname: nickname }, // nickname을 서버로 전송
	        success: function (result) {
	            if (result == 1 || nickname === new_nick) {
	                alert("사용가능한 닉네임입니다.");
	                isNicknameAvailable = true;
	                console.log(isNicknameAvailable + "사용 가능");
	                console.log(new_nick + "기존 닉네임")
	            }else {
	                alert("사용중인 닉네임입니다.");
	                $('#nickname').focus();
	                isNicknameAvailable = false
	                console.log(isNicknameAvailable + "불가")
	                return false;
	            }
	        }
	    });
	}
 
 const editForm = document.forms['editForm'];
 
 function submitAfterChecks(new_nick) {
	 var nickname = $('#nickname').val();
    	 console.log(document.forms['editForm']);
	 if(nickname === new_nick){
    	 document.forms['editForm'].submit();
    	 return true;
     }else if(!isNicknameAvailable) {
         alert("사용중인 닉네임입니다.");
         $('#nickname').focus();
         return false;
     }else{
    	 document.forms['editForm'].submit();
    	 return true;
     }
	 return false;
 }
</script>

<script>

<%String memberId = (String) session.getAttribute("memberId");%>
</script>
</head>

<body>
	<jsp:include page="../resources/header.jsp"></jsp:include>

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
						<form action="/SosoMarket/MemberUp.do?memberId=${vo.memberId }"
							method="post" name="editForm">
							<div class="form-group">
								닉네임<input class="input" type="text" name="nickname"
									id="nickname" value="${vo.nickname }">
								<button class="primary-btn" type="button"
									onclick="nicknameCheckFunction('${vo.nickname }')">중복
									체크</button>
							</div>
							<div class="form-group">
								폰 번호<input class="input" type="text" name="phoneNumber"
									id="phoneNumber" value="${vo.phoneNumber}"
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
							<button class="primary-btn" type="button"
								onclick="submitAfterChecks('${vo.nickname }')">수정하기</button>
							<button class="primary-btn" type="button"
								onclick="location.href='/SosoMarket/EditPwd.do?memberId=${vo.memberId }'">비밀번호
								변경</button>
						</form>
						<br>
						<button class="primary-btn"
							onclick="location.href='/SosoMarket/MyPageHome.do?memberId=<%=memberId%>'">돌아가기</button>
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