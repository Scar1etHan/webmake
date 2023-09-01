<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글쓰기</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">   
	$(document).ready( function() {
		$("#header").load("../Interface/header.jsp");
		$("#footer").load("../Interface/footer.jsp");
         
});
</script>
</head>
<body>
	<!--header section start -->
	<div id="header"></div>
  <!-- header section end -->
	<article>
		<div
			class="container position-absolute top-50 start-50 translate-middle" role="main">
			<h1 class="text-center" style="font-weight: bolder;">글 쓰기</h1>
			<form name="form" id="form" role="form" method="post"
				action="${pageContext.request.contextPath}/board/saveBoard">
				<div class="mb-3">
					<label for="title" style="font-weight: bolder;">제목</label> <input type="text"
						class="form-control" name="title" id="title"
						placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="reg_id" style="font-weight: bolder;">작성자</label> <input type="text"
						class="form-control" name="reg_id" id="reg_id"
						placeholder="이름을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="content" style="font-weight: bolder;">내용</label>
					<textarea class="form-control fs-4" rows="10" name="content"
						id="content" placeholder="내용을 입력해 주세요"></textarea>
				</div>
			</form>
			<div class=>
				<button type="button" class="btn btn-sm btn-primary"
					style="float: right" id="btnSave">글쓰기</button>
				<button type="button" class="btn btn-sm btn-primary"
					style="float: right" id="btnList">목록</button>
			</div>
		</div>
	</article>
	<div id="footer" style="position:relative;top:90%"></div>
	
	<!-- Javascript files-->
<script src="../js/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery-3.0.0.min.js"></script>
<script src="../js/plugin.js"></script>
</body>
</html>