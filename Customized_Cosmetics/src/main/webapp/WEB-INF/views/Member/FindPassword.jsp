<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<meta charset="utf-8">
<title>시험중인 템플릿</title>
<style>

.login-container {
	width: 30%;
	margin-top: 150px;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 20px;
	background-color: white;
}
</style>
 <script type="text/javascript">
	var msg = "${msg}";		 
		if (msg != "") {
			alert(msg);
		}
</script>
</head>
<body class="text-center">



	<div class="container login-container" style="width:30%;">
		<form method="post">
			<h1 class="h3 mb-3 fw-normal mt-7">비밀번호 찾기</h1>
			<div class="row mt-3">
				<div class="form-floating">
					<input type="text" class="form-control" id="floatingid" name="userName"
						placeholder="이름 입력" required> <label for="floatingid">이름</label>
				</div>
			</div>
			<div class="row mt-5">
				<div class="form-floating">
					<input type="text" class="form-control" id="floatingID" name="userId"
						placeholder="아이디 입력" required> <label for="floatingID">아이디</label>
				</div>
			</div>
			<div class="row mt-5">
				<div class="form-floating">
					<input type="email" class="form-control" id="floatingemail" name="userEmail"
						placeholder="이메일 입력" required> <label for="floatingemail">이메일</label>
				</div>
			</div>
			<div class="row mt-5">
				<div class="flex-container">
					<button class="btn btn-primary" onclick="location.href='login'">돌아가기</button>
					<button class="btn btn-success" type="submit" onclick="findPassword()">비밀번호찾기</button>
				</div>
			</div>
		</form>
	</div>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery-3.0.0.min.js"></script>
<script src="../js/plugin.js"></script>
</body>
</html>
