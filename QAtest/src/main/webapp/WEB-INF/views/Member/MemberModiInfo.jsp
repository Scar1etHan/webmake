<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 만들기 진행중</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
		style="padding-top: 150px; background-color: white; padding-bottom: 30px">

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
				<h1 class="mt-5 mb-4">회원정보 수정</h1>
				<hr>
				<div class="input-form-backgroud row">
					<div class="input-form col-md-11 mx-auto">
						<!-- <form class="validation-form" action="updateMember" method="POST" novalidate> -->
						<form class="validation-form" action="MemberModiInfo" method="POST" novalidate>
							<!-- 이름, 나이, 성별 입력 부분 -->
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="name">이름</label> 
									<%-- <input type="text" class="form-control" id="user_name" name="user_name" value="${updateMember.user_name}" readonly> --%>
									<input type="text" class="form-control" id="user_name" name="user_name" value="${updateMember.user_name}" readonly>
								</div>
							</div>
							<hr>

							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="name">나이</label> 
									<input type="text" class="form-control" id="user_age" name="user_age" value="${updateMember.user_age}" readonly>
								</div>
							</div>
							<hr>

							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="sex">성별</label> 
									<input type="text" class="form-control" id="user_sex" name="user_sex" value="${updateMember.user_sex}" readonly>
								</div>
							</div>
							<hr>

							<!-- 전화번호  -->
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="name">피부타입</label> 
									<input type="text" class="form-control" id="Skin" value="임시 회원 피부타입" readonly>
								</div>
							</div>
							<hr>

							<!-- 아이디 입력 부분 -->
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="name">아이디</label> 
									<input type="text" class="form-control" id="user_id" name="user_id" value="${updateMember.user_id}" readonly>
								</div>
							</div>
							<hr>

							<!-- 전화번호  -->
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="name">전화번호</label> 
									<input type="text" class="form-control" id="user_phone" name="user_phone" placeholder="전화번호" value="${updateMember.user_phone}" required>
								</div>
							</div>
							<hr>

							<!-- 이메일 입력 부분 -->
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="email">이메일</label> 
									<input type="email" class="form-control" id="user_email" name="user_email" placeholder="your@email.com" value="${updateMember.user_email}" required>
								</div>
							</div>
							<hr>

							<!-- 주소 입력 부분 -->
							<div class="row">
								<div class="col-md-12 mb-3">
									<label for="address">주소</label>
									<div class="input-group">
										<input type="text" class="form-control mb-3" id="user_Addr1" name="user_Addr1" value="${updateMember.user_Addr1}" placeholder="우편번호" size="10" required> 
										<input type="button" class="btn btn-outline-primary" onclick="findAddr()" value="우편번호 찾기" style="margin-left: 5px;">
									</div>
									<input type="text" class="form-control mb-3" id="user_Addr2"
										name="user_Addr2" value="${updateMember.user_Addr2}" placeholder="도로명주소"
										size="60" required> 
									<input type="hidden" id="addr" placeholder="지번주소" size="60">
									<span id="guide" style="color: #999; display: none"></span>
									<input type="text" class="form-control mb-3" id="user_Addr3" name="user_Addr3"
										 	value="${updateMember.user_Addr3}" placeholder="상세주소" size="60" required>
									<input type="hidden" id="sample4_extraAddress" placeholder="참고항목" size="60">
									<input type="hidden" id="sample4_engAddress" placeholder="영문주소" size="60">
									<div class="invalid-feedback">주소를 입력해주세요.</div>
								</div>
							</div>
							<hr class="mb-4">
							<button type="submit" class="btn btn-primary btn-lg btn-block" >회원정보 변경 완료</button>
							<button type="reset" class="btn btn-danger btn-lg btn-block me-2" id="reset">다시작성</button>
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

	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script>
     function findAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('user_Addr1').value = data.zonecode;
                document.getElementById("user_Addr2").value = roadAddr;
                document.getElementById("addr").value = data.jibunAddress;
         
                document.getElementById("sample4_engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
	<script src="../../../resources/js/jquery.min.js"></script>
	<script src="../../../resources/js/popper.min.js"></script>
	<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
	<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
	<script src="../../../resources/js/plugin.js"></script>
</body>
</html>
