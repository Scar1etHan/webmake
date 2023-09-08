<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- 테마 -->
	<link rel="stylesheet" href="../css/asd.css">
	<!-- 자바스크립트 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	
<meta charset="UTF-8">
<title>새 글쓰기</title>
</head>
<body id="page-top">

    <%@ include file="interface.jsp" %>
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
								onclick="location.href='/Admin/adminEventBoardmodify?bno=${view.bno}'">
							<input type="button" class="btn btn-danger me-2" value="글삭제"
								onclick="location.href='/Admin/EventBoarddelete?bno=${view.bno}'"> 
							<input type="button" class="btn btn-primary" value="글목록"
								onclick="location.href='adminListPage?num=1'">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</article>

	</body>
</html>