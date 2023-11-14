<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style>
.login-form {
    max-width: 300px;
    margin: 0 auto;
    padding: 30px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
}

.login-form h2 {
    text-align: center;
    margin-bottom: 30px;
}

.login-form .form-group {
    margin-bottom: 20px;
}

.login-form input[type="text"],
.login-form input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.login-form button[type="submit"] {
    background-color: #337ab7;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px;
    width: 100%;
    cursor: pointer;
}

.login-form button[type="submit"]:hover {
    background-color: #286090;
}

.login-form .clearfix {
    margin-top: 20px;
}

.login-form label.checkbox-inline {
    font-weight: normal;
}

.login-form a {
    float: right;
}
</style>

</head>

<link href="../resources/Memcss/login.css" rel="stylesheet">


<script type="text/javascript">
    function loginForm() {
        var form = document.getElementById('loginForm');

        var id = form.memberId.value;
        var pw = form.password.value;

        if (id == "") {
            alert("아이디를 입력해주세요");
            form.memberId.focus();
            return false;
        }
        if (pw === "") {
            alert("비밀번호를 입력해주세요");
            form.password.focus();
            return false;
        }

        // 모든 조건이 충족됐을 때, 폼을 제출합니다.
        form.submit();
    }
</script>

<body>
    <jsp:include page="../resources/header.jsp"></jsp:include>

    <div id="breadcrumb" class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12">
                    <h3 class="breadcrumb-header">로그인</h3>
                    <ul class="breadcrumb-tree">
                        <li><a href="/SosoMarket/Home.do">Home</a></li>
                        <li class="active">로그인</li>
                    </ul>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /BREADCRUMB -->

    <div class="login-form">
        <form method="post" action="/SosoMarket/LogIn.do" id="loginForm">
            <h2 class="text-center">로그인</h2>
            <div class="form-group">
                <input type="text" class="form-control" name="memberId" placeholder="아이디" required>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="password" placeholder="비밀번호" required>
            </div>
            <div class="form-group">
                <input class="btn btn-primary btn-block" type="button" value="로그인" onclick="loginForm()">
            </div>
        </form>
        <p class="text-center"><a href="/SosoMarket/Signin.do">회원가입</a></p>
    </div>

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

    <jsp:include page="../resources/footer.html"></jsp:include>

</body>
</html>
