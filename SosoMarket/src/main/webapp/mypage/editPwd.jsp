<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>소소마켓 비밀번호 변경</title>

<%
    String message = null;

    if (session.getAttribute("message") != null) {
        message = (String) session.getAttribute("message");
    }
    if (message != null) {
%>
    <script>
        alert('<%=message%>');
    </script>
<%
    session.removeAttribute("message");
    }
%>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	function passwordCheckFunction() {
		var password2 = $('#password2').val();
		var password3 = $('#password3').val();
		if (password2 !== password3) {
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		} else {
			$('#passwordCheckMessage').html('');
		}
	}

	/* 유효성 검사 */
	function submitForm() {
		var form = document.getElementById('editForm');

		var pw = form.password.value;
		var pw2 = form.password2.value;
		var pw3 = form.password3.value;

		if (pw === "") {
			alert("기존 비밀번호를 입력해주세요.");
			$('#password').focus();
			return false;
		}
		if (pw.length < 4) {
			alert("4자 이상 입력해주세요.");
			$('#password').focus();
			return false;
		}

		if (pw2 === "") {
			alert("새 비밀번호를 입력해주세요");
			$('#password2').focus();
			return false;
		}
		if (pw2.length < 4) {
			alert("4자 이상으로 입력해주세요.");
			$('#password2').focus();
			return false;
		}

		if (pw2 !== pw3) {
			alert('비밀번호가 서로 일치하지 않습니다.');
			return false;
		}

		form.submit();

		
	}
</script>

</head>
<body>

	<!-- HEADER -->
	<jsp:include page="../resources/header.jsp" />

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
							<h3 class="title">${vo.memberId}님:비밀번호수정</h3>
						</div>

						<!-- 수정란 -->
						<form action="/SosoMarket/UpdatePwd.do?memberId=${vo.memberId }"
							method="post" id="editForm">
							<div class="form-group">
								기존 비밀번호<input class="input" type="password" name="password"
									id="password">
							</div>
							<div class="form-group">
								새 비밀번호<input class="input" type="password" name="password2"
									id="password2">
							</div>
							<div class="form-group">
								비밀번호 확인<input class="input" onkeyup="passwordCheckFunction();"
									type="password" name="password3" id="password3">
							</div>
							<div class="errorForm">
								<h5 style="color: red;" id="passwordCheckMessage"></h5>
							</div>

							
							<input type = "button" class="primary-btn" onclick="submitForm()" value="변경하기">

						</form>
						<!-- /수정란 -->

						<br>
						<button class="primary-btn"
							onclick="location.href='/SosoMarket/MyPageHome.do?memberId=${vo.memberId }'">돌아가기</button>

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