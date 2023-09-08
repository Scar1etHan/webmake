<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	  $("#pwUpdate").on("click", function () {
	    if ($("#userPw").val() == "") {
	      alert("현재 비밀번호를 입력해주세요");
	      $("#memberPw").focus();
	      return false;
	    }
	    if ($("#userPw1").val() == "") {
	      alert("변경비밀번호를 입력해주세요");
	      $("#userPw1").focus();
	      return false;
	    }
	    if ($("#userPw2").val() == "") {
	      alert("변경비밀번호 확인을 입력해주세요");
	      $("#userPw2").focus();
	      return false;
	    }
	    if ($("#userPw1").val() != $("#userPw2").val()) {
	      alert("변경비밀번호가 일치하지 않습니다.");
	      $("#userPw2").focus();
	      return false;
	    }

	    $.ajax({
	      url: "/Member/pwCheck",
	      type: "POST",
	      dataType: "json",
	      data: $("#pwUpdateForm").serializeArray(),
	      success: function (data) {
	        if (data == 0) {
	          alert("패스워드가 틀렸습니다.");
	          return;
	        } else {
	          if (confirm("변경하시겠습니까?")) {
	            $("#pwUpdateForm").submit();
	          }
	        }
	      },
	    });
	  });
	});

</script>
<body>
<div class="fixed-top">
	<jsp:include page="/WEB-INF/views/Interface/header.jsp" />
</div>
<div class="container" style="margin-top: 100px; background-color: white; padding-bottom: 30px">
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
				<h1 class="mt-5 mb-4">회원정보</h1>
				<hr>
				<div class="input-form-backgroud row">
					<div class="input-form col-md-11 mx-auto">
						 <form action="/Member/pwUpdate" method="post" id="pwUpdateForm" name="pwUpdateForm">
						 <input type="hidden" id="userId" name="userId" value="${login.userId}">
							<!-- 비밀번호 -->
							<div class="row">
								<div class="col-md-7 mb-3">
								 <p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
									<input type="text" class="form-control text-center" id="userName" value="${login.userName}" readonly>
									<div class="form-group">
					                    <input type="password" name="userPw" id="userPw" class="form-control form-control-inline text-center" placeholder="현재 비밀번호" />
					                </div>
					                <div class="form-group">
					                    <input type="password" name="userPw1" class="form-control form-control-inline text-center" placeholder="새 비밀번호" />
					                </div>
					                <div class="form-group">
					                    <input type="password" name="userPw2" class="form-control form-control-inline text-center" placeholder="새 비밀번호 확인" />
					                </div>
								</div>
							</div>
							<hr>
							<hr class="mb-4">
							<button type="button" id="pwUpdate" name="pwUpdate" class="btn btn-primary btn-lg btn-block">비밀번호 변경</button> 
		                	<a href="/" class="btn btn-danger btn-lg btn-block">취소</a>
		                </form>
					</div>
				</div>
	<!-- 왼쪽 사이드바 -->
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