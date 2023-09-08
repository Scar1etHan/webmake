<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <!-- 로그인 css -->
    <link rel="stylesheet" type="text/css" href="../../../resources/css/login.css">
    
<script type="text/javascript">
/* 회원탈퇴 */
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
</script>

</head>
	<body>
	    <div class="wrap">
	      <a href="/" class="logo">
	        <h1 class="blind">CUSTOMIZED COSMETICS</h1>
	      </a>
	        <div class="login">
	      <form name="form1" action="loginPost" method="POST">
	            <h2>로그인</h2>
	            <div class="login_id">
	                <h4>Id</h4>
	                <input type="text" name="userId" id="userId" placeholder="Id">
	            </div>
	            <div class="login_pw">
	                <h4>Password</h4>
	                <input type="password" name="userPw" id="userPw" placeholder="Password">
	            </div>
	            <div class="col-xs-8">
				    <div class="checkbox icheck">
				        <label>
				            <input type="checkbox" name="useCookie"> 로그인유지
				        </label>
				    </div>
				</div>
	            <div class="login_etc">
	               <div class="forgot_id">
	                	<a href="FindID">아이디 찾기</a>
	            	</div>
	                <div class="forgot_pw">
	                	<a href="FindPassword">비밀번호 찾기</a>
	            	</div>
	            	
	            </div>
	                <input type="submit" id="btnLogin" value="로그인">
	            </form>
	              <a href="Signcheck"><input type="button" value="회원가입"></a>
	        </div>
	    </div>

	</body>
<script>

    var msg = "${msg}";
    if (msg === "회원가입이 완료되었습니다") {
    } else if (msg == "FAILURE") {
        alert("아이디와 비밀번호를 확인해주세요.");
    }

    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</html>