<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">   
	$(document).ready( function() {
		$("#header").load("../Interface/header.jsp");
		$("#footer").load("../Interface/footer.jsp");
});
</script>
</head>
<body>

	<!-- 상단 navbar -->
	<div id="header" style="position: relative; bottom: 50px"></div>

	<article style="background-color: white">
		<div class="container mt-5">
			<h2 class="text-center mb-4" style="padding-top: 30px">글내용 보기</h2>
			<form>
				<table class="table table-bordered">
					<tr>
						<th class="bg-light" width="125">글번호</th>
						<td width="125">12</td>
						<th class="bg-light" width="125">조회수</th>
						<td width="125">30</td>
					</tr>
					<tr>
						<th class="bg-light" width="125">작성자</th>
						<td width="125">밍밍이</td>
						<th class="bg-light" width="125">작성일</th>
						<td width="125">2080/3060/4060</td>
					</tr>
					<tr>
						<th class="bg-light" width="125">글제목</th>
						<td colspan="3">임시 제목</td>
					</tr>
					<tr>
						<th class="bg-light" width="125">글내용</th>
						<td colspan="3">
							<pre>
ㅇㅅㅇㅇㅅㅇㅅㅇㅅㅇㅅㅇㅅㅇㅅㅇㅅㅇㅅㅇㅅㅇㅅㅇ
ㅇㅅㅇㅅㅇㅅㅇㅅㅇㅅ
							</pre>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="bg-light text-end">
						<input type="button" class="btn btn-primary me-2" value="글수정"
							onclick="location.href='QABoardrewrite.jsp'"> <input
							type="button" class="btn btn-danger me-2" value="글삭제"
							onclick="#"> <input type="button"
							class="btn btn-primary me-2" value="답글쓰기"
							onclick="location.href='BoardComment.jsp'"> <input
							type="button" class="btn btn-primary" value="글목록"
							onclick="location.href='QABoard.jsp'">
						</td>
					</tr>
				</table>
			</form>

			<!-- 댓글 영역 -->
			<h2 style="margin-top: 50px">댓글 목록</h2>
			<div class="card mt-3">
				<div class="card-header">
					<div class="row">
						<div class="col-9">답글 작성자1</div>
						<div class="col-3 text-right">
							<small class="text-muted">작성일: 2023-07-17</small>
						</div>
					</div>
				</div>
				<div class="card-body">
					<p class="card-text">첫 번째 답글 내용</p>
				</div>
			</div>

			<div class="card mt-3">
				<div class="card-header">
					<div class="row">
						<div class="col-9">답글 작성자1</div>
						<div class="col-3 text-right">
							<small class="text-muted">작성일: 2023-07-18</small>
						</div>
					</div>
				</div>
				<div class="card-body">
					<p class="card-text">두 번째 답글 내용</p>
				</div>
			</div>

			<div class="card mt-3">
				<div class="card-header">
					<div class="row">
						<div class="col-9">답글 작성자3</div>
						<div class="col-3 text-right">
							<small class="text-muted">작성일: 2023-07-19</small>
						</div>
					</div>
				</div>
				<div class="card-body">
					<h2><p class="card-text">세 번째 답글 내용</p></h2>
				</div>
			</div>
			<!-- 댓글영역 끝 -->

		</div>
	</article>
	<div id="footer" style="margin-top:50px"></div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery-3.0.0.min.js"></script>
<script src="../js/plugin.js"></script>
</body>
</html>
