<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원가입</title>

<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="../resources/css/bootstrap.min.css"/>

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="../resources/css/slick.css"/>
<link type="text/css" rel="stylesheet" href="../resources/css/slick-theme.css"/>

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="../resources/css/nouislider.min.css"/>

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="../resources/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="../resources/css/style.css"/>
 		
<style>
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family: sans-serif;
}

body {
  background-image: #34495e;
}

.signin {
 display: flex;
  flex-direction: column;
  width: 100%;
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  background-color: #FFFFFF;
  border-radius: 15px;
}

.signin h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.pwtextForm {
  border-bottom: 2px solid #adadad;
  margin: 30px 30px 0px 30px;
  padding: 10px 10px;
}

.errorForm {
	margin: 0px 30px;
}

#memberId,
#password,
#password2,
#phoneNumber,
#email,
#emailVrf,
#nickname {
  width: 100%;
  border: none;
  outline: none;
  color: #636e72;
  font-size: 16px;
  height: 25px;
  background: none;
}

.signin input[type="text"],
.signin input[type="password"] {
  width: 100%;
  margin-bottom: 10px;
  padding: 5px;
}

.signin input[type="button"],
.signin input[type="submit"],
.signin button {
  background-color: #337ab7;
  color: #fff;
  border: none;
  padding: 8px 16px;
  cursor: pointer;
  border-radius: 5px;
}

.signin input[type="button"]:hover,
.signin input[type="submit"]:hover,
.signin button:hover {
  background-color: #357ae8;
}

.signin #idCheckMessage,
.signin #passwordCheckMessage {
  color: red;
  margin-top: 5px;
}

.signin input[type="button"],
.signin input[type="submit"],
.signin button,
.signin #idCheckMessage,
.signin #passwordCheckMessage {
  width: 100%;
}
</style>

</head>
<body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

function idCheckFunction() {
    var memberId = $('#memberId').val();
    if (memberId === "") {
        alert("아이디를 입력해주세요");
        $('#memberId').focus();
        return false;
    }
    
    $.ajax({
        type: 'post',
        url: '/SosoMarket/MemberIdCheckServlet',
        data: { memberId: memberId }, // memberId를 서버로 전송
        success: function (result) {
            if (result == 1) {
                alert("사용가능한 아이디입니다.");
            } else {
                alert("사용할 수 없는 아이디입니다.");
                $('#memberId').focus();
                return false;
            }
        }
    });
}

function nicknameCheckFunction() {
    var nickname = $('#nickname').val();
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
            if (result == 1) {
                alert("사용가능한 닉네임입니다.");
            } else {
                alert("사용중인 닉네임입니다.");
                $('#nickname').focus();
                return false;
            }
        }
    });
}

function passwordCheckFunction() {
    var password1 = $('#password').val();
    var password2 = $('#password2').val();
    if (password1 !== password2) {
        $('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
    } else {
        $('#passwordCheckMessage').html('');
    }
}

function submitForm() {
    var form = document.getElementById('signupForm');

    const id = form.memberId.value;
    var pw = form.password.value;
    var pw2 = form.password2.value;
    var pno = form.phoneNumber.value;
    var email = form.email.value;
    const nick = form.nickname.value;

    if (id === "" && id.length < 4 || id.length > 12) {
        alert("아이디를 입력해주세요");
        $('#memberId').focus();
        return false;
    }
    if (id.length < 4 || id.length > 12) {
        alert("아이디는 4~12자 이내로 입력 가능합니다.");
        $('#memberId').focus();
        return false;
    }
    
    if (pw === "") {
        alert("비밀번호를 입력해주세요");
        $('#password').focus();
        return false;
    }
    if (pw.length < 4) {
        alert("비밀번호는 4자 이상으로 입력해야 합니다.");
        $('#password').focus();
        return false;
    }
   
    if (pw2 === "") {
        alert("비밀번호를 확인해주세요");
        $('#password2').focus();
        return false;
    }
    if (pno === "") {
        alert("전화번호를 입력해주세요");
        $('#phoneNumber').focus();
        return false;
    }
    if (email === "") {
        alert("이메일을 입력해주세요");
        $('#email').focus();
        return false;
    }
	/*이메일 형식 검사 코드*/
    var str=form.email.value;	   
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
	      document.form.email.focus();
		  return;
    }
    
    if (nick === "") {
        alert("닉네임을 입력해주세요");
        $('#nickname').focus();
        return false;
    }

    // 아이디와 닉네임 중복 체크
    var isIdAvailable = false;
    var isNicknameAvailable = false;

    // 아이디 중복 체크
    $.ajax({
        type: 'post',
        url: '/SosoMarket/MemberIdCheckServlet',
        data: { memberId: id },
        success: function (result) {
            if (result === "0") { // 이미 존재하는 회원인 경우
                isIdAvailable = false;
                submitAfterChecks(); // Call submit function after ID check
            } else if (result === "1") { // 가입 가능한 회원인 경우
                isIdAvailable = true;
                checkNickname(); // Check nickname after ID check
            }
        },
        error: function () {
            alert("아이디 중복 체크에 실패했습니다.");
            return false;
        }
    });

    function checkNickname() {
        // 닉네임 중복 체크
        $.ajax({
            type: 'post',
            url: '/SosoMarket/MemberNicknameCheckServlet',
            data: { nickname: nick },
            success: function (result) {
                if (result === "0") { // 이미 존재하는 회원인 경우
                    isNicknameAvailable = false;
                } else if (result === "1") { // 가입 가능한 회원인 경우
                    isNicknameAvailable = true;
                }
                // Submit the form after nickname check
                submitAfterChecks();
            },
            error: function () {
                alert("닉네임 중복 체크에 실패했습니다.");
                return false;
            }
        });
    }

    function submitAfterChecks() {
        if (!isIdAvailable) {
            alert("사용중인 아이디입니다.");
            $('#memberId').focus();
            return false;
        }

        if (!isNicknameAvailable) {
            alert("사용중인 닉네임입니다.");
            $('#nickname').focus();
            return false;
        }

        // 모든 조건이 충족되었을 때, 폼을 제출합니다.
        form.submit();
    }
}



</script>

<jsp:include page="../resources/header.jsp"></jsp:include>

<div id="breadcrumb" class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">회원가입</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="/SosoMarket/Home.do">Home</a></li>
                    <li class="active">회원가입</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="signin">  
    <form action="/SosoMarket/SignIn.do" method="POST" id="signupForm">
        <h2>회원가입</h2>
    
        <div class="textForm">
            <input type="text" id="memberId" name="memberId" placeholder="아이디">
            <input type="button" value="중복 체크" onclick="idCheckFunction()">
        </div>
	
        <h5 style="color:red;" id="idCheckMessage"></h5>
    
        <div class="textForm">
            <input type="password" id="password" name="password" placeholder="비밀번호">
        </div>
        <div class="pwtextForm">
            <input type="password" onkeyup="passwordCheckFunction();" id="password2" name="password2" placeholder="비밀번호 확인">
        </div>
        <div class="errorForm">    
            <h5 style="color:red;" id="passwordCheckMessage"></h5>
        </div>

        <div class="textForm">
            <input type="text" id="phoneNumber" name="phoneNumber" placeholder="전화번호">
        </div>
        <div class="textForm">
            <input type="text" id="email" name="email" placeholder="이메일">
            <button type="button">인증 메일 보내기</button>
        </div>
        <div class="textForm">
            <input type="text" id="emailVrf" name="emailVrf" placeholder="이메일 인증">
            <button type="button">인증</button>
            <input type="hidden" name="authPass" id="authPass" value="false">
        </div>
        <div class="textForm">
            <input type="text" id="nickname" name="nickname" placeholder="닉네임">   
            <input type="button" value="중복 체크" onclick="nicknameCheckFunction()">
        </div>
        <input type="button" value="회원가입" onclick="submitForm()">
    </form>
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
            