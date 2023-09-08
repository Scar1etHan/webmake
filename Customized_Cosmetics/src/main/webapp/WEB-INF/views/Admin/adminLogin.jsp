<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>부트스트랩</title>

<!-- 부트스트랩 -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<style>
@charset "UTF-8";

@import url(https://fonts.googleapis.com/css?family=Lato:400,700);

* {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	text-rendering: optimizeLegibility;
}

body {
	font-family: 'Lato', sans-serif;
	background-color: #f8f8f8;
}

body .container {
	position: relative;
	overflow: hidden;
	width: 1000px;
	height: 500px;
	margin: 80px auto 0;
	background-color: #ffffff;
	-moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}

body .container .half {
	float: left;
	width: 50%;
	height: 100%;
	padding: 58px 40px 0;
}

body .container .half.bg-img {
	background-image: url("../img/joonggomon.jpg");
	background-size: 100%;
	justify-content: center;
}

body .container h1 {
	font-size: 18px;
	font-weight: 700;
	margin-bottom: 23px;
	text-align: center;
	text-indent: 6px;
	letter-spacing: 7px;
	text-transform: uppercase;
	color: #263238;
}

body .container .tabs {
	width: 100%;
	margin-bottom: 60px;
	border-bottom: 1px solid #d9d9d9;
}

body .container .tabs a {
	font-size: 11px;
	text-decoration: none;
	text-transform: uppercase;
	color: #d9d9d9;
	display: block;
}

body .container .content form {
	position: relative;
	height: 287px;
}

body .container .content label:first-of-type, body .container .content input:first-of-type,
	body .container .content .more:first-of-type {
	-moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
	-webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
	animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2),
	body .container .content .more:nth-of-type(2) {
	-moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
	-webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
	animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3),
	body .container .content .more:nth-of-type(3) {
	-moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
	-webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
	animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container .content label {
	font-size: 12px;
	color: #263238;
	-moz-user-select: -moz-none;
	-ms-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

body .container .content label:not([for='remember']) {
	display: none;
}

body .container .content input.inpt {
	font-size: 14px;
	display: block;
	width: 100%;
	height: 42px;
	margin-bottom: 12px;
	padding: 16px 13px;
	color: #999999;
	border: 1px solid #d9d9d9;
	background: transparent;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
}

body .container .content input.inpt::-webkit-input-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

body .container .content input.inpt:-moz-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

body .container .content input.inpt::-moz-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

body .container .content input.inpt:-ms-input-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

body .container .content input.inpt:focus {
	border-color: #999999;
}

body .container .content input.submit {
	font-size: 12px;
	line-height: 42px;
	display: block;
	width: 100%;
	height: 42px;
	cursor: pointer;
	letter-spacing: 2px;
	text-transform: uppercase;
	color: #263238;
	border: 1px solid #263238;
	background: transparent;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
}

body .container .content input.submit:hover {
	background-color: #263238;
	color: #ffffff;
	-moz-transition: all 0.2s;
	-o-transition: all 0.2s;
	-webkit-transition: all 0.2s;
	transition: all 0.2s;
}

body .container .content input:focus {
	outline: none;
}

body .container .content .checkbox {
	margin-top: 4px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	width: 0;
	height: 0;
	margin: 17px -1px;
	padding: 0;
	border: 0;
	opacity: 0;
	visibility: hidden;
}

body .container .content .checkbox+label {
	vertical-align: middle;
	display: inline-block;
	width: 50%;
}

body .container .content .checkbox+label:before {
	content: "\A";
	color: #999999;
	font-family: Verdana;
	font-weight: bold;
	font-size: 8px;
	line-height: 10px;
	text-align: center;
	display: inline-block;
	vertical-align: middle;
	position: relative;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	background: transparent;
	border: 1px solid #d9d9d9;
	width: 11px;
	height: 11px;
	margin: -2px 8px 0 0;
}

body .container .content .checkbox:checked+label:before {
	content: "✓";
}

body .container .content .submit-wrap {
	position: absolute;
	bottom: 0;
	width: 100%;
}

body .container .content .submit-wrap a {
	font-size: 12px;
	display: block;
	margin-top: 20px;
	text-align: center;
	text-decoration: none;
	color: #999999;
}

body .container .content .submit-wrap a:hover {
	text-decoration: underline;
}

body .container .content .signup-cont {
	display: none;
}

@
keyframes slideIn { 0% {
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
	opacity: 0;
	margin-left: -320px;
}

100
%
{
filter
:
progid
:
DXImageTransform.Microsoft.Alpha
(
enabled
=
false
);
opacity
:
1;
margin-left
:
0px;
}
}
@
-webkit-keyframes slideIn { 0% {
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
	opacity: 0;
	margin-left: -320px;
}

100
%
{
filter
:
progid
:
DXImageTransform.Microsoft.Alpha
(
enabled
=
false
);
opacity
:
1;
margin-left
:
0px;
}
}
.credits {
	display: block;
	position: absolute;
	right: 0;
	bottom: 0;
	color: #999999;
	font-size: 14px;
	margin: 0 10px 10px 0;
}

.credits a {
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
	opacity: 0.8;
	color: inherit;
	font-weight: 700;
	text-decoration: none;
}
</style>
</head>
<body>
	<section class="container">
		<article class="half">
			<form method="POST" action="adminLoginCheck">
				<table border="1" width="400px">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="admin_id" id="admin_id"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="admin_pw" id="admin_pw"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" id="btnLogin" value="로그인"></input>
						</td>
					</tr>
				</table>
			</form>
		</article>
		<div class="half bg-img"></div>
	</section>
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>