<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#deletee").on("click", function() {
			if ($("#userPw").val() == "") {
				alert("비밀번호를 입력해주세요");
				$("#userPw").focus();
				return false
			}

			if ($("#userPw2").val() == "") {
				alert("비밀번호 확인을 입력해주세요");
				$("#userPw2").focus();
				return false
			}

			if ($("#userPw").val() != $("#userPw2").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#userPw").focus();

				return false;
			}

			$.ajax({
				url : "/Member/pwCheck",
				type : "POST",
				dataType : "json",
				data : $("#deleteForm").serializeArray(),
				success : function(data) {

					if (data == 0) {
						alert("비밀번호를 확인해주세요.");
						return;
					} else {
						if (confirm("탈퇴하시겠습니까?")) {
							$("#deleteForm").submit();
							alert(msg)
						}
					}
				}
			})
		});
	})
	

</script>

<body>

	<div class="fixed-top">
		<jsp:include page="/WEB-INF/views/Interface/header.jsp" />
	</div>
	<div class="container"
		style="margin-top: 100px; background-color: white; padding-bottom: 30px">
		<!-- 왼쪽 사이드바 -->
		<div class="row">
			<div class="col-md-2 sidebar">
				<ul class="nav flex-column">
					<li style="margin-top:45px">
						<h3>마이페이지</h3>
						<hr>
					</li>
					<li class="nav-item"><a class="nav-link" href="${path}/Shop/ShopList/cartList" name=add>장바구니</a><hr></li>
					<li class="nav-item"><a class="nav-link" href="${path}/Member/MemberInfo?userId=${viewMember.userId}">회원정보</a>
						<hr></li>
					<li class="nav-item"><a class="nav-link" href="${path}/Member/MemberModiInfo?userId=${viewMember.userId}">회원수정</a>
						<hr></li>
					<li class="nav-item"><a class="nav-link" href="${path}/Member/updatePw?userId=${viewMember.userId}">비밀번호 변경</a>
						<hr></li>
					<li class="nav-item"><a class="nav-link" href="${path}/Shop/Orderboard?userId=${sessionScope.userId}">주문목록</a>
					
						<hr></li>
					<li class="nav-item"><a class="nav-link" href="${path}/Member/MemberDelete">회원탈퇴</a>
						<hr></li>
				</ul>
			</div>
			<!--  -->
			<div class="col-md-10">
				<hr>
				<div class="input-form-backgroud row">
					<div class="input-form col-md-11 mx-auto">
						<form action="/Member/MemberDelete" method="post" id="deleteForm" name="deleteForm">
							<input type="hidden" id="userId" name="userId" value="${login.userId}">
							<div class="col-md-7 mb-3">
								<h1 class="mt-5 mb-4">회원정보</h1>
								<hr>
								<div class="input-form-backgroud row">
									<p class="lead">회원탈퇴를 하려면 비밀번호를 입력해주세요.</p>
									<div class="form-group">
										<input type="password" id="userPw" name="userPw" class="form-control form-control-inline text-center" placeholder="비밀번호" />
									</div>
									<div class="form-group">
										<input type="password" id="userPw2" name="userPw2" class="form-control form-control-inline text-center"	placeholder="비밀번호 확인" />
									</div>
								</div>
								<hr>
								<hr class="mb-4">
								<button type="button" id="deletee" name="delete" class="btn btn-primary btn-lg btn-block">회원탈퇴</button>
								<a href="/" class="btn btn-danger btn-lg btn-block">취소</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 하단영역(footer) -->
	<div class="fixed-bottom">
		<jsp:include page="/WEB-INF/views/Interface/footer.jsp" />
	</div>
</body>
      <script src="../../../resources/js/jquery.min.js"></script>
      <script src="../../../resources/js/popper.min.js"></script>
      <script src="../../../resources/js/bootstrap.bundle.min.js"></script>
      <script src="../../../resources/js/jquery-3.0.0.min.js"></script>
      <script src="../../../resources/js/plugin.js"></script>
</html>