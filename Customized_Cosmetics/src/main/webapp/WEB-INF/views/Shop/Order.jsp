<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>주문상세내역 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style>
/* CSS 스타일 지정 */
body {
	font-family: Arial, sans-serif;
}

.order-details {
	margin-bottom: 30px;
}

.order-details table {
	width: 100%;
	border-collapse: collapse;
}

.order-details th, .order-details td {
	padding: 8px;
	border: 1px solid #ddd;
}

.order-details th {
	background-color: #f5f5f5;
	text-align: center;
}
.detailorderlist th, .detailorderlist td{
	border: 1px solid #ddd;
}

.total-amount {
	font-weight: bold;
	margin-top: 20px;
}

th, td {
	vertical-align: middle;
}

/* 왼쪽 사이드 영역 */
.side-nav {
	margin-top: 30px;
}

.side-nav li {
	margin-bottom: 10px;
}

.side-nav .nav-link {
	font-size: 15px;
	font-weight: bold;
}
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>

	<!-- 상단 navbar -->
	<div class="fixed-top">
		<jsp:include page="/WEB-INF/views/Interface/header.jsp" />
	</div>
	<!-- 상단 메뉴 영역 끝 -->

	<!-- 상품상세정보 및 왼쪽 사이드 바 -->
	<div class="container" style="background-color: white;margin-top:180px">
		<div class="row">
			<div class="col-md-2 sidebar">
				<ul class="nav flex-column">
					<li style="margin-top:45px">
						<h3>마이페이지</h3>
						<hr>
					</li>
					<li class="nav-item"><a class="nav-link" href="${path}..//Member/MemberInfo?userId=${viewMember.userId}">회원정보</a>
						<hr></li>
					<li class="nav-item"><a class="nav-link" href="${path}..//Member/MemberModiInfo?userId=${viewMember.userId}">회원수정</a>
						<hr></li>
					<li class="nav-item"><a class="nav-link" href="..//Member/updatePw?userId=${viewMember.userId}">비밀번호 변경</a>
						<hr></li>
					<li class="nav-item"><a class="nav-link" href="/Shop/Orderboard?userId=${sessionScope.userId}">주문목록</a>
						<hr></li>
					<li class="nav-item"><a class="nav-link" href="MemberDelete">회원탈퇴</a>
						<hr></li>
				</ul>
			</div>

			<!-- 주문상세내역 영역 -->
			<div class="col-md-10">
				<div class="order-details">
					<div class="d-flex justify-content-between align-items-center">
						<h2 style="padding-top: 30px; padding-bottom: 20px">주문상세정보</h2>
						<button class="btn btn-primary" onclick="history.go(-1)">이전으로</button>
					</div>
					<table>
						<tr>
							<th>주문번호</th>
							<td>${orderdetail[0].order_number}</td>
						</tr>
						<tr>
							<th>주문일자</th>
							<td>
								<fmt:formatDate value="${orderdetail[0].order_date}" pattern="yy-MM-dd a h시"/>
							</td>
						</tr>
						<tr>
							<th>배송상태</th>
							<td>${orderdetail[0].order_deliver}</td>
						</tr>
						<tr>
							<th>주문상품</th>
							<td>
								<table style="text-align: center">
									<tr>
										<th>상품명</th>
										<th>가격</th>
										<th>수량</th>
										<th>합계</th>
									</tr>  				<!-- jstl varStatus 속성으로 반복문 추적가능 -->
									<c:forEach items="${orderdetail}" var="od" varStatus="status">
										<tr>
											<td>${od.p_name}</td>
											<td><fmt:formatNumber value="${od.p_price}" pattern="#,##0"/> 원</td>
											<td>${od.orderdetail_quantity} 개</td>
											<td><fmt:formatNumber value="${od.orderdetail_quantity * od.p_price}" pattern="#,##0"/> 원</td>
										</tr>
										<c:set var="totalPrice" value="${totalPrice + (od.orderdetail_quantity * od.p_price)}" scope="page"/>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>
				</div>

				<div class="total-amount">총 주문금액 : <fmt:formatNumber value="${totalPrice}" pattern="#,##0"/> 원</div>
				<div class="payment-method">결제방법 : ${orderdetail[0].order_payment}</div>

				<hr style="border-top:1px solid black; margin-top:20px; margin-bottom:20px;">
				<h2>상품정보</h2>
				<div class="detailorderlist">
				<table class="table table-striped" style="text-align:center;">
					<thead>
						<tr>
							<th style="width: 8%;">상품번호</th>
							<th>상품이미지</th>
							<th>상품가격</th>
							<th style="width: 8%;">주문수량</th>
							<th style="width: 15%;">합계</th>
						</tr>
					</thead>
					<tbody> <!-- ${pageContext.request.contextPath} jsp 내장객체로 상대경로를 정확히 생성해줌 -->
						<c:forEach items="${orderdetail}" var="od">
							<tr>
								<td>${od.p_number}</td>
								<td><img src="${pageContext.request.contextPath}../../../resources/images/${od.p_image}" alt="상품 이미지" width="200" height="100"></td>
								<td><fmt:formatNumber value="${od.p_price}" pattern="#,##0" /> 원</td>
								<td>${od.orderdetail_quantity} 개</td>
								<td><fmt:formatNumber value="${od.orderdetail_quantity * od.p_price}" pattern="#,##0" /> 원</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>			<!-- 주문전체영역 -->
		</div>			<!-- 왼쪽사이드와 주문영역 묶음 -->
	</div>		<!-- 컨테이너 -->
	
	<!-- 하단 영역 -->
	<div style="margin-top:200px">
		<jsp:include page="/WEB-INF/views/Interface/footer.jsp" />
	</div>
	
	<!-- 회원 삭제 -->
	<script>
	    function confirmDeleteMember(userId) {
	        var result = confirm("회원을 삭제하시겠습니까?");
	        if (result) {
	            deleteMember(userId);
	        }
	    }
	
	    function deleteMember(userId) {
	        $.ajax({
	            type: "POST",
	            url: "/Member/MemberDelete", 			// 회원 삭제 처리를 위한 URL로 수정해야 합니다.
	            data: { userId: userId }, 	// 삭제할 회원의 아이디를 데이터로 전달
	            success: function(response) {
	                location.href = '/'; 		// 삭제 성공 후 홈페이지로 이동 또는 원하는 페이지로 이동
	            }
	        });
	    }
	</script>
	
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

