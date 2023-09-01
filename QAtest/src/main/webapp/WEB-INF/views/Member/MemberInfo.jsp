<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 만들기 진행중</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style>
.table-hover>tbody>tr:hover {
	background-color: skyblue;
}

.sidebar {
	background-color: white;
	padding: 20px;
}

.order-history {
	margin-top: 20px;
	background-color: white;
	padding: 20px;
}

th, td {
	vertical-align: middle;
}

.input-form {
	max-width: 100%;
	padding: 32px;
	background: #fff;
	border-radius: 10px;
	border: 1px solid #ccc;
}
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>

	<!-- 상단 navbar -->
		<div class="fixed-top">
			<jsp:include page="/WEB-INF/views/Interface/header.jsp" />
		</div>

	<div class="container"
		style="padding-top:150px; background-color: white; padding-bottom: 30px">
		<!-- 왼쪽 사이드바 -->
		<div class="row">
			<div class="col-md-2 sidebar">
				<ul class="nav flex-column">
					<li style="margin-top:45px">
						<h3>마이페이지</h3>
						<hr>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="MemberInfo">회원정보</a><hr>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="MemberModiInfo">회원수정</a><hr>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="../Shop/Orderboard">주문목록</a><hr>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">회원탈퇴</a><hr>
					</li>
				</ul>
			</div>

			<!-- 오른쪽 주문내역 -->
			<div class="col-md-10">
				<h1 class="mt-5 mb-4">회원정보</h1>
				<hr>
				<div class="input-form-backgroud row">
					<div class="input-form col-md-11 mx-auto">
						<form class="validation-form" novalidate>
							<!-- 이름, 나이, 성별 입력 부분 -->
							<div class="row">
								<div class="col-md-7 mb-3">
									<label for="name">이름</label> 
									<input type="text" class="form-control" id="user_name" value="${viewMember.user_name}" readonly>
										
								</div>
							</div>
							<hr>

							<div class="row">
								<div class="col-md-7 mb-3">
									<label for="name">나이</label> 
									<input type="text" class="form-control" id="user_age" value="${viewMember.user_age}" readonly>
								</div>
							</div>
							<hr>

							<div class="row">
								<div class="col-md-7 mb-3">
									<label for="sex">성별</label> 
									<input type="text" class="form-control" id="user_sex" value="${viewMember.user_sex}" readonly>
										
								</div>
							</div>
							<hr>

							<!-- 전화번호  -->
							<div class="row">
								<div class="col-md-7 mb-3">
									<label for="name">피부타입</label> <input type="text"
										class="form-control" id="Skin" value="임시 회원 피부타입" readonly>
								</div>
							</div>
							<hr>

							<!-- 아이디 입력 부분 -->
							<div class="row">
								<div class="col-md-7 mb-3">
									<label for="name">아이디</label> 
									<input type="text" class="form-control" id="user_id" value="${viewMember.user_id}" readonly>
								</div>
							</div>
							<hr>

							<!-- 전화번호  -->
							<div class="row">
								<div class="col-md-7 mb-3">
									<label for="name">전화번호</label> 
									<input type="text" class="form-control" id="user_phone" value="${viewMember.user_phone}" readonly>
								</div>
							</div>
							<hr>

							<!-- 이메일 입력 부분 -->
							<div class="row">
								<div class="col-md-7 mb-3">
									<label for="email">이메일</label> 
									<input type="email" class="form-control" id="user_email" value="${viewMember.user_email}" readonly>
								</div>
							</div>
							<hr>

							<!-- 주소 입력 부분 -->
							<div class="row">
								<div class="col-md-7 mb-3">
									<label for="address">주소</label> 
									<input type="text" class="form-control mb-3" id="user_Addr1"
										value="${viewMember.user_Addr1}" size="10" readonly> 
									<input type="text" class="form-control mb-3" id="user_Addr2"
										value="${viewMember.user_Addr2}" size="60" readonly> 
									<input type="text" class="form-control mb-3" id="user_Addr3"
										value="${viewMember.user_Addr3}" size="60" readonly>
								</div>
							</div>
							<hr class="mb-4">
							<button type="button" class="btn btn-primary btn-lg btn-block"  onclick="location.href='MemberModiInfo?user_id=${viewMember.user_id}'">회원 정보 수정</button>
							<button type="button" class="btn btn-danger btn-lg btn-block" onclick="confirmDeleteMember('${viewMember.user_id}')">회원 삭제</button>
							<%-- <button type="button" class="btn btn-danger btn-lg btn-block" onclick="location.href='MemberDelete?user_id=${viewMember.user_id}'">회원 삭제</button> --%>
						</form>
					</div>
				</div>
				<!-- 주문내역 -->

			</div>
			<!-- 왼쪽 사이드바 -->
		</div>
	</div>

	<!-- 하단영역(footer) -->
	<jsp:include page="/WEB-INF/views/Interface/footer.jsp" />
	
	
	<!-- 회원 삭제 버튼 js -->
	<script>
	    function confirmDeleteMember(user_id) {
	        var result = confirm("회원을 삭제하시겠습니까?");
	        if (result) {
	            deleteMember(user_id);
	        }
	    }
	
	    function deleteMember(user_id) {
	        $.ajax({
	            type: "POST",
	            url: "/Member/MemberDelete", 			// 회원 삭제 처리를 위한 URL로 수정해야 합니다.
	            data: { user_id: user_id }, 	// 삭제할 회원의 아이디를 데이터로 전달
	            success: function(response) {
	                location.href = '/Member/MemberList'; 		// 삭제 성공 후 홈페이지로 이동 또는 원하는 페이지로 이동
	            }
	        });
	    }
	</script>
	
	
	<script src="../../../resources/js/jquery.min.js"></script>
	<script src="../../../resources/js/popper.min.js"></script>
	<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
	<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
	<script src="../../../resources/js/plugin.js"></script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
