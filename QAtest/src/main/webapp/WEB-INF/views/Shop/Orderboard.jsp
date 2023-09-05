<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 만들기 진행중</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
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
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>

	<!-- 상단 navbar -->
	<div class="fixed-top">
		<jsp:include page="/WEB-INF/views/Interface/header.jsp" />
	</div>

	<div class="container"
		style="margin-top: 200px; background-color: white; padding-bottom: 30px">
		
		<!-- 왼쪽 사이드바 -->
		<div class="row">
			<div class="col-md-2 sidebar">
				<ul class="nav flex-column">
					<li>
						<h3>마이페이지</h3>
						<hr>
					</li>
					<li class="nav-item"><a class="nav-link" href="../Member/MemberInfo?user_id=${sessionScope.loginUser.user_id}">회원정보</a><hr></li>
					<li class="nav-item"><a class="nav-link" href="../Member/MemberModiInfo?user_id=${sessionScope.loginUser.user_id}">회원수정</a><hr></li>
					<li class="nav-item"><a class="nav-link" href="../Shop/Orderboard?user_id=${sessionScope.loginUser.user_id}">주문목록</a><hr></li>
					<li class="nav-item"><a class="nav-link" onclick="confirmDeleteMember('${sessionScope.loginUser.user_id}')" style="cursor:pointer">회원탈퇴</a><hr></li>
				</ul>
			</div>
			
			<!-- 오른쪽 주문내역 -->
			<div class="col-md-10">
				<h1 class="mt-5 mb-4">주문내역</h1>
				<table class="table table-striped table-bordered table-hover" style="text-align:center">
					<thead>
						<tr>
							<th style="width: 10%;">주문번호</th>
							<th style="width: 20%;">주문날짜</th>
							<th style="width: 20%;">결제수단</th>
							<th style="width: 20%;">배송상태</th>
							<th style="width: 10%;">주문상세</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="orderlist">
						<tr>
							<td>${orderlist.order_number}</td>
							<td>
								<fmt:formatDate value="${orderlist.order_date}" pattern="yy-MM-dd a h:mm"/>
							</td>
							<td>${orderlist.order_payment}</td>
							<td>${orderlist.order_deliver}</td>
							<td><a class="btn btn-primary" href="${path}/Shop/Order?order_number=${orderlist.order_number}">주문상세</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- 하단영역(footer) -->
	<div style="padding-top:370px">
		<jsp:include page="/WEB-INF/views/Interface/footer.jsp" />
	</div>

	<!-- 회원 삭제 -->
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
	                location.href = '/'; 		// 삭제 성공 후 홈페이지로 이동 또는 원하는 페이지로 이동
	            }
	        });
	    }
	</script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
		
	<script src="../../../resources/js/jquery.min.js"></script>
	<script src="../../../resources/js/popper.min.js"></script>
	<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
	<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
	<script src="../../../resources/js/plugin.js"></script>
</body>
</html>
