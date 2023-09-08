<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	
	<style>
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>board</title>

<script>
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});

	$(document)
			.on(
					'click',
					'#btnList',
					function(e) {
						e.preventDefault();
						location.href = "${pageContext.request.contextPath}/board/getBoardList";
					});
</script>
</head>
<body>

	<!-- 상단 navbar -->
	<jsp:include page="/WEB-INF/views/Interface/header.jsp" />

	<article>
		<div class="container" style="margin-top:200px; border: 1px solid #ccc; padding: 20px; overflow: hidden;
			background-color:white">
			<h2>게시판 글작성</h2>
			<form name="form" id="form" role="form" method="post" action="#">
				<div class="mb-3">
					<label for="title">제목</label> <input type="text"
						class="form-control" name="title" id="title"
						placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="reg_id">작성자</label> <input type="text"
						class="form-control" name="writer" id="writer"
						placeholder="이름을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content"
						placeholder="내용을 입력해 주세요"></textarea>
				</div>
			</form>
			<div class="text-end">
				<div class="float-start">
					<button type="reset" class="btn btn-sm btn-primary me-2" id="reset">다시작성</button>
					<button class="btn btn-sm btn-primary me-2" onclick="history.go(-1)">돌아가기</button>
				</div>
				<div class="float-end">
					<button type="submit" class="btn btn-sm btn-primary me-2" id="btnSave">저장</button>
					<button type="button" class="btn btn-sm btn-primary"
						onclick="location.href='QABoard'">목록</button>
				</div>
			</div>
		</div>
	</article>
	
	<!-- 하단영역(footer) -->
	<div class="fixed-bottom">
		<jsp:include page="/WEB-INF/views/Interface/footer.jsp" />
	</div>
	
	<script>
		document.getElementById("reset").addEventListener("click", function() {
			document.getElementById("form").reset();
		});
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
