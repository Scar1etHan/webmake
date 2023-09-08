<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
	margin-top: 200px;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 20px;
	background-color: white;
}
</style>
</head>

<body class="text-center">

	<!-- 로그인 영역 -->
	<div class="card o-hidden border-0 shadow-lg my-5">
		<div>
			<h2>아이디는 :</h2>
			<br />
			<ul>
				<c:forEach items="${user}" var="user">
					<li>${user.userId}</li>
					<br />
				</c:forEach>
			</ul>
			<h2>입니다</h2>
			<button type="button" class="btn btn-primary"
				onclick="location.href='/Member/login'">로그인</button>
			<button type="button" class="btn btn-primary"
				onclick="location.href='/'">메인페이지</button>


		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.bundle.min.js"></script>
	<script src="../js/jquery-3.0.0.min.js"></script>
	<script src="../js/plugin.js"></script>
</body>
</html>
