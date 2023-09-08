<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <!-- CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- 테마 -->
	<link rel="stylesheet" href="../../../resources/css/asd.css">
	<!-- 자바스크립트 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<meta charset="UTF-8">
<title>새 글쓰기</title>
</head>
	<body>
		<jsp:include page="/WEB-INF/views/Interface/header.jsp"/>
		<article style="background-color: white">
			<div class="container mt-5">
				<h2 class="text-center mb-4" style="padding-top: 30px">글내용 보기</h2>
				<form>
					<table class="table table-bordered">
						<tr>
							<th class="bg-light" width="125">글번호</th>
							<td width="125">
								<input type="text" name="title"	value="${view.bno}" disabled style="border:none; background-color: white" />
							</td>
							<th class="bg-light" width="125">조회수</th>
							<td width="125">
								<input type="text" name="title"	value="${view.viewCnt}" disabled style="border:none; background-color: white" />
							</td>
						</tr>
						<tr>
							<th class="bg-light" width="125">작성자</th>
							<td width="125">
								<input type="text" name="title"	value="${view.writer}" disabled style="border:none; background-color: white" />
							</td>
							<th class="bg-light" width="125">작성일</th>
							<td width="125">
								<fmt:formatDate value="${view.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
						</tr>
						<tr>
							<th class="bg-light" width="125">글제목</th>
							<td colspan="3" >
								<input type="text" name="title"	value="${view.title}" disabled style="border:none; background-color: white" />
							</td>
						</tr>
						<tr>
							<th class="bg-light" width="125">글내용</th>
							<td colspan="3">
								<input type="text" name="title"	value="${view.content}" disabled style="border:none; background-color: white" />
							</td>
						</tr>
						<tr>
							<td colspan="4" class="bg-light text-end">
							<input type="button" class="btn btn-primary me-2" value="글수정"
								onclick="location.href='/Board/ReviewBoardmodify?bno=${view.bno}'">
							<input type="button" class="btn btn-danger me-2" value="글삭제"
								onclick="location.href='/Board/ReviewBoarddelete?bno=${view.bno}'"> 
							<input type="button" class="btn btn-primary me-2" value="답글쓰기"
								onclick="location.href='BoardComment.jsp'"> 
							<input type="button" class="btn btn-primary" value="글목록"
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
				<div>
					<p>
						<label>댓글 작성자</label> <input type="text">
					</p>
					<p>
						<textarea rows="5" cols="150"></textarea>
					</p>
					<p>
						<button type="button">댓글 작성</button>
					</p>
				</div>
				<!-- 댓글영역 끝 -->
			</div>
		</article>
		<jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
	</body>
<script src="../../../resources/js/jquery.min.js"></script>
<script src="../../../resources/js/popper.min.js"></script>
<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
<script src="../../../resources/js/plugin.js"></script>
</html>