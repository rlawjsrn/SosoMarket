<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

	
</script>

<body>
<img alt="" src="../resources/img/logo.png">
	<h5 style="color:blue;" id="memberNicname"></h5>
	<form method="post" action="/SosoMarket/LogIn.do">
		<p>아 이 디:<input type="text" name="memberId">
		<p>비밀번호:<input type="password" name="password">
		<input type="submit" value="로그인">
	</form>
	<a href="signin.jsp">회원가입</a>
	
	<%
		String messageContent = null;
		if (session.getAttribute("messageContent") != null) {
			messageContent = (String) session.getAttribute("messageContent");
		}
		String messageType = null;
		if (session.getAttribute("messageType") != null) {
			messageType = (String) session.getAttribute("messageType");
		}
		if (messageContent != null) {
		%>
		<script>
	        alert('<%=messageContent%>');
		</script>
		
		<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>
	<h5><%=session.getAttribute("nickname")%>님 어쉉쉉</h5>
</body>
</html>