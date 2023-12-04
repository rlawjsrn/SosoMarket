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

<script>
    $(document).ready(function () {
        // URL에서 알림 메시지가 있는지 확인합니다. (예: 리디렉션으로부터 전달된 메시지)
        var notificationMessage = '<%= request.getParameter("notificationMessage") %>';
        if (notificationMessage) {
            
        }
    });
</script>
<%
String authCode = request.getParameter("authCode");
%>

<script type="text/javascript">
// 아이디 중복 체크
function idCheckFunction() {
    var memberId = $('#memberId').val();
    
    if (memberId.length < 4 || memberId.length > 12) {
        alert("아이디는 4~12자 이내로 입력 가능합니다.");
        $('#memberId').focus();
        return false;
    }
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
                alert("사용 중인  아이디입니다.");
                $('#memberId').focus();
                return false;
            }
        }
    });
}
// 닉네임 중복 체크
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

// 비밀번호 일치 확인
function passwordCheckFunction() {
    var password1 = $('#password').val();
    var password2 = $('#password2').val();
    if (password1 !== password2) {
        $('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
    } else {
        $('#passwordCheckMessage').html('');
    }
}
//도메인 체크 API
function domainCheck(callback) {
    var xhr = new XMLHttpRequest();
    var url = 'http://apis.data.go.kr/B551505/whois/domain_name';
    var serviceKey = 'cuTaIR9oecCXrKhEDekErNIeWS5o3gonlPjCehw64H9aUoRBZjg5rNcM8oYfPgvOSw30dT5RaUNYEuAwZxU4OQ%3D%3D'; // Replace with your actual service key
    
    var form = document.getElementById('signupForm');
    var email = form.email.value;

    // '@' 기호를 구분자로 사용하여 두 부분으로 분리
    var emailParts = email.split('@');

    if (emailParts.length === 2) {
        // 두 번째 부분 (인덱스 1)은 '@' 이후의 도메인을 포함합니다.
        var domain = emailParts[1];
        alert('Domain: ' + domain);
        
     	// 쿼리 파라미터 생성
        var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + serviceKey;
        queryParams += '&' + encodeURIComponent('query') + '=' + encodeURIComponent(domain);
        queryParams += '&' + encodeURIComponent('answer') + '=' + encodeURIComponent('xml');
        
     	// GET 요청 전송
        xhr.open('GET', url + queryParams);
        xhr.onreadystatechange = function () {
            if (this.readyState == 4) {
                if (this.status == 200) {
                	
                	// 응답이 정상인지 확인합니다.
                    var isNormal = isNormalResponse(this.responseText);
                    callback(isNormal);
                } else {
                    console.error('Request failed. Status code:', this.status);
                    callback(false); // 오류 처리를 위해 false를 전달하여 콜백 호출
                }
            }
        };

        xhr.send('');
    } else {
        console.error('Invalid email address.');
        callback(false); // 유효하지 않은 이메일 주소인 경우 false를 전달하여 콜백 호출
    }
}
// result code 응답성공:1000, 그외 실패
function isNormalResponse(responseText) {
	// XML 응답을 파싱합니다.
    var parser = new DOMParser();
    var xmlDoc = parser.parseFromString(responseText, 'text/xml');

 	// <result_code>의 값을 가져옵니다.
    var resultCode = xmlDoc.querySelector('result_code').textContent;

 	// 결과 코드가 '10000'인지 확인합니다.
    return resultCode === '10000';
}

// 인증번호 전송
function sendVerificationEmail() {
    var email = $('#email').val(); // 입력 필드에서 이메일 값을 가져옵니다.
    
    if (email === "") {
        alert("이메일을 입력해주세요.");
        $('#email').focus();
        return false;
    }
    
    var form = document.getElementById('signupForm');
    var str = form.email.value;
    var atPos = str.indexOf('@');
    var dotPos = str.indexOf('.');
    var eMailSize = str.length;

    if (
        atPos > 0 && // '@' 문자가 첫 번째 문자 이후에 나타나는지 확인합니다.
        dotPos > atPos + 1 && // '.' 문자가 '@' 이후에 나타나는지 확인합니다.
        dotPos + 1 < eMailSize // '.' 문자가 마지막 문자가 아닌지 확인합니다.
    ) {
        // 유효한 이메일 형식입니다.
    } else {
        alert('이메일 주소 형식이 올바르지 않습니다.');
        $('#email').focus();
        return;
    }

    domainCheck(function(isDomainValid) {
        if (isDomainValid) {
            // 도메인 체크가 성공하면 이곳에서 원하는 작업을 수행합니다.
            $.ajax({
                type: 'post',
                url: '/SosoMarket/MemberEmailSendServlet',
                data: { email: email }, // 이메일을 서버에 전달합니다.
                success: function (result) {
                    // 성공 응답을 처리합니다.
                    if (result === "true") {
                        alert("인증 이메일이 전송되었습니다."); // 사용자에게 알림을 표시합니다.
                    } else {
                        alert("메일 전송에 실패했습니다. 다시 시도해주세요."); // 오류 알림을 표시합니다.
                    }
                },
                error: function () {
                    // 오류 응답을 처리합니다.
                    alert("서버 오류입니다. 다시 시도해주세요."); // 오류 알림을 표시합니다.
                }
            });
        } else {
            alert('도메인을 확인해주세요.');
            $('#email').focus();
        }
    });
}


// 인증번호비교
function emailcheckFunction() {
    var emailVrf = $('#emailVrf').val();

    // 서버로 인증 번호를 비교하기 위해 AJAX 요청을 보냅니다.
    $.ajax({
        type: 'post',
        url: '/SosoMarket/CompareAuthCodeServlet', 
        data: { emailVrf: emailVrf },
        success: function (result) {
            if (result === "true") {
                $('#authPass').val('true');
                alert('이메일 인증에 성공했습니다.');
            } else {
                alert('이메일 확인 코드가 일치하지 않습니다.');
            }
        },
        error: function () {
            alert('AJAX 요청 중 오류가 발생했습니다.');
        }
    });
}

// submit
function submitForm() {
    var form = document.getElementById('signupForm');

    const id = form.memberId.value;
    var pw = form.password.value;
    var pw2 = form.password2.value;
    var pno = form.phoneNumber.value;
    var email = form.email.value;
    const nick = form.nickname.value;
    var authPass = form.authPass.value;

    if (id === "") {
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
    var str = form.email.value;
		var atPos = str.indexOf('@');
		var dotPos = str.indexOf('.');
		var eMailSize = str.length;
		
		if (
		  atPos > 0 &&                                    // '@' 문자가 첫 번째 문자 이후에 나타나는지 확인
		  dotPos > atPos + 1 &&                           // '.' 문자가 '@' 이후에 나타나는지 확인
		  dotPos + 1 < eMailSize                           // '.' 문자가 마지막 문자가 아닌지 확인
		) {
			
		} else {
		  alert('이메일 주소 형식이 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.');
		  document.form.email.focus();
		  return;
		}
		
		if (authPass !== "true") {
		    alert("이메일 인증을 해주세요");
		    document.form.emailVrf.focus();
		    return false;
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
            <input type="button" value="인증 메일 보내기" onclick="sendVerificationEmail()">
           
        </div>
        <div class="textForm">
            <input type="text" id="emailVrf" name="emailVrf" placeholder="인증코드 6자리">
            <input type="button" value="인증" onclick="emailcheckFunction()">
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
            