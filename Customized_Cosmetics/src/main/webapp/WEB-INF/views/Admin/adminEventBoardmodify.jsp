<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
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
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
	<body>
<body id="page-top">

    <%@ include file="interface.jsp" %>
		<form method="post">
			<div class="container w-75">
				<div class="container w-75">
					<p class="text-center fs-1">글 작성</p>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">제목</span>
					  <input type="text" name="title" value="${view.title}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
					</div>
					
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">작성자</span>
					  <input type="text" name="writer" value="${view.writer}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					</div>
					
					<div class="mb-3">
					  <p class="text-center fs-4">글 내용</p>
					  <textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="15">${view.content}</textarea>
					</div>
					<div class="input-group mb-3 w-50">
					  <input type="file" class="form-control" id="inputGroupFile02">
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  			<button type="submit" class="btn btn-primary">완료</button>
			  			<a href="adminEventBoardview?bno=${view.bno}" class="btn btn-primary">취소</a>
					</div>
				</div>
			</div>
		</form>
			
	</body>
<script src="../../../resources/js/jquery.min.js"></script>
<script src="../../../resources/js/popper.min.js"></script>
<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
<script src="../../../resources/js/plugin.js"></script>
</html>