<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	function idCheckFuntion(){
		var memberId = $('#memberId').val();
		$.ajax({
			type: 'post',
			url:'../MemberIdCheckServlet',
			success: funtion(result){
				if(result==1){
					$('#checkMessage').html('사용할 수 있는 아이디입니다.');
					$('#checkType').attr('class','modal-content panel-success');
				}else{
					$('#checkMessage').html('사용할 수 없는 아이디입니다.');
					$('#checkType').attr('class','modal-content panel-warning');
				}
				$('#checkModal').modal('show');
			}
		})
	}
		function passwordCheckFunction();{
			var password1 = $('#password').val();
			var password2 = $('#password2').val();
			if(password != password2){
				$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
			}else
				$('#passwordCheckMessage').html('');
		}
	
</script>
</head>
<body>
	<div>
		<form method="post" action="/SosoMarket/SignIn.do">
			<table style="border:1px solid">
			<thead>
				<tr>
					<th><img alt="" src="../resources/img/logo.png"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><h5>아이디</h5></td>
					<td><input type="text" id="memberId" name="memberId"></td>
					<td><button onclick="idCheckFuntion();" type="button">중복체크</button></td>
				</tr>
				<tr>
					<td><h5>비밀번호</h5></td>
					<td><input type="password" onkeyup="passwordCheckFunction();" id="password" name="password"></td>
				</tr>
				<tr>
					<td><h5>비밀번호 확인</h5></td>
					<td><input type="password" id="password2" name="password2"></td>
				</tr>
				<tr>
					<td><h5>전화번호</h5></td>
					<td><input type="text" id="phoneNumber" name="phoneNumber"></td>
				</tr>
				<tr>
					<td><h5>이메일</h5></td>
					<td><input type="text" id="email" name="email"></td>
					<td><button onclick="idCheckFuntion();"type="button">인증하기</button></td>
				</tr>
				<tr>
					<td><input type="text" id="emailVrf" name="emailVrf"></td>
				</tr>
				<tr>
					<td><h5>닉네임</h5></td>
					<td><input type="text" id="nickname" name="nickname"></td>
				</tr>
				<tr>
					
					<td colspan="3">
						<h5 style="color:red;" id="passwordCheckMessage"></h5>
						<input type="submit" value="회원가입">
					</td>
				</tr>
			</tbody>
				
			</table>
		</form>
	</div>
	<%
		String messageContent = null;
		if(session.getAttribute("messageContent") != null){
			messageContent = (String) session.getAttribute("messageContent");
		}
		String messageType = null;
		if(session.getAttribute("messageType") != null){
			messageType = (String) session.getAttribute("messageType");
		}
		if(messageContent != null){
			%>
	<div id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div>
			<div>
				<button type="button" data-dismiss="modal">
					<span aria-hidden="true">&times;</span> <span>Close</span>
				</button>
				<h4 class="modal-title">
					<%=messageType%>
				</h4>
			</div>
			<div class="modal-body">
				<%=messageContent%>
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
	<script>
					$('#messageModal').modal("show");
				</script>
			<%
				session.removeAttribute("messageContent");
				session.removeAttribute("messageType");
		}
	%>
		<div id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div id="checkType">
				<div>
						<button type="button" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span>Close</span>
						</button>
						<h4 class="modal-title">
							확인 메세지
						</h4>
					</div>
					<div class="modal-body" id="checkMessage">
					</div>
					<div class="modal-footer">
						<button type="button" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
					



</body>
</html>