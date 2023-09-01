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

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body class="text-center">

	<!-- 상단 navbar -->
	<div class="fixed-top">
		<jsp:include page="/WEB-INF/views/Interface/header.jsp" />
	</div>

	<!-- 비밀번호 찾기 영역 -->
	<div class="container login-container" style="width:30%;">
		<form>
			<h1 class="h3 mb-3 fw-normal mt-7">비밀번호 찾기</h1>
			<div class="row mt-3">
				<div class="form-floating">
					<input type="text" class="form-control" id="floatingname" placeholder="이름 입력" required> 
					<label for="floatingid">이름</label>
				</div>
			</div>
			<div class="row mt-5">
				<div class="form-floating">
					<input type="text" class="form-control" id="floatingID" placeholder="아이디 입력" required> 
					<label for="floatingID">아이디</label>
				</div>
			</div>
			<div class="row mt-5">
				<div class="form-floating">
					<input type="text" class="form-control" id="floatingemail" placeholder="이메일 입력" required> 
					<label for="floatingemail">이메일</label>
				</div>
			</div>
			<div class="row mt-5">
				<div class="flex-container">
					<button class="btn btn-primary" onclick="history.go(-1)">돌아가기</button>
					<button class="btn btn-success" type="button" onclick="findPassword()">비밀번호찾기</button>
				</div>
			</div>
		</form>
	</div>
	
	<!-- 하단영역 footer -->
	<div class="fixed-bottom">
		<jsp:include page="/WEB-INF/views/Interface/footer.jsp" />
	</div>
	
	<script>
function findPassword() {
  	
	// 변수값
  var user_name = document.getElementById("floatingname").value;
  var user_id = document.getElementById("floatingID").value;
  var user_email = document.getElementById("floatingemail").value;

  $.ajax({
    url: '/Member/findPw',
    type: 'POST',
    data: {"user_name": user_name, "user_id": user_id, "user_email": user_email},
    success: function(response) {
      
    // 팝업창 생성 및 크기 지정
      var popupWindow = window.open("", "popuppassword", "width=400, height=250");

      // 닫기 버튼 추가
      var closeButton = popupWindow.document.createElement("button");
      closeButton.innerHTML = "닫기";
      closeButton.style.position = "fixed";
      closeButton.style.bottom = "10px";
      closeButton.style.left = "50%";
      closeButton.style.transform = "translateX(-50%)";
      closeButton.addEventListener("click", function() {
        popupWindow.close();
      });
      popupWindow.document.body.appendChild(closeButton);

      // 팝업창 뜰때 모니터 한가운데 위치하게 함
      var textContainer = popupWindow.document.createElement("div");
      textContainer.style.position = "absolute";
      textContainer.style.top = "50%";
      textContainer.style.left = "50%";
      textContainer.style.transform = "translate(-50%, -50%)";
      textContainer.innerHTML = user_id + "의 비밀번호 : " + response;
      popupWindow.document.body.appendChild(textContainer);

      // 팝업창 안에 텍스트들 가운데 정렬
      popupWindow.document.body.style.textAlign = "center";
      
      var leftPosition = (screen.width - popupWindow.outerWidth) / 2;
      var topPosition = (screen.height - popupWindow.outerHeight) / 2;
      popupWindow.moveTo(leftPosition, topPosition);
    },
    error: function() {
      alert('회원 정보를 찾을 수 없습니다.');
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
