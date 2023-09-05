<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
</head>
<body>
    <div class="wrap">
      <a href="/" class="logo">
        <h1 class="blind">CUSTOMIZED COSMETICS</h1>
      </a>
        <div class="login">
            <h2>로그인</h2>
           	<form action="${pageContext.request.contextPath}/Member/login" method="post"  style="width:80%; margin:0 auto">
           		<div class="login_id">
	                <h4>ID</h4>
	                <input type="text" name="user_id" id="user_id" placeholder="아이디">
	                
            	</div>
	            <div class="login_pw">
	                <h4>Password</h4>
	                <input type="password" name="user_pw" id="user_pw" placeholder="Password">
	            </div>
            
	            <div class="login_etc">
	            	<div class="forgot_id">
	               		<a href="FindID">아이디 찾기?</a>
	            	</div>
	                <div class="forgot_pw">
	                	<a href="FindPassword">비밀번호 찾기?</a>
	            	</div>
	            </div>
            
	            <div class="submit">
	            	<input type="submit" value="로그인">
	            </div>
	            <div class="register">
            		<a href="Signcheck"><input type="button" value="회원가입"></a>
          	 	</div>
	        </form>       
        </div>
    </div>
    
	<c:if test="${not empty loginError}">
		<script>
			alert('${loginError}');
		</script>
	</c:if>
    
</body>
</html>