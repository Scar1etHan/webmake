<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container login-container" style="width:30%;">
			<h1 class="h3 mb-3 fw-normal mt-7">비밀번호 찾기</h1>
			<div class="row mt-3">
				<div class="form-floating">
					<h2> 임시 비밀번호가 전송되었습니다. </h2><br/>
			  		<h1>${user}</h1><br/>
			  		<h2>를 확인해주세요.</h2>
				</div>
			</div>
			<div class="row mt-5">
				<div class="flex-container">
					<button class="btn btn-primary" onclick="location.href='login'">로그인</button>
					<button class="btn btn-success" type="submit" onclick="location.href='/'">메인페이지</button>
				</div>
			</div>
	</div>
</body>
</html>