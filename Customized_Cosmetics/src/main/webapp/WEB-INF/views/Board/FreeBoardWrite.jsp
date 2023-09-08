<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../../../resources/css/footer.css">
<title>글쓰기</title>
<%
  //String id=(String)request.getAttribute("idKey"); 로그인시 처리할 내용
%>
</head>
<body>
	<!--header section start -->
	<%@include file="../Interface/header.jsp" %>
  <!-- header section end -->
	<article>
		<div class="container position-absolute top-50 start-50 translate-middle" role="main">
			<h1 class="text-center" style="font-weight: bolder;">글 쓰기</h1>
			<form name="form" id="form" method="POST" action="insert">
				<%-- <input type="hidden"  name="id" value="<%=id%> /> --%>
				<div class="mb-3">
					<label for="title" style="font-weight: bolder;">제목</label> <input type="text"
					class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="reg_id" style="font-weight: bolder;">작성자</label> 
					   <input class="form-control" name="writer" id="writer" value="${login.userName}" readonly>
				</div>
				<div class="mb-3">
					<label for="content" style="font-weight: bolder;">내용</label>
					<textarea class="form-control fs-4" rows="10" name="content"
						id="content" placeholder="내용을 입력해 주세요"></textarea>
				</div>
				<div >
					<button type="submit" class="btn btn-sm btn-primary"
						style="float: right" id="btnSave">글쓰기</button>
					<button type="button" class="btn btn-sm btn-primary" onClick="location.href='FreeBoard'"
						style="float: right" id="btnList">목록</button>
				</div>
			</form>
		</div>

	</article>
	<%@include file="../Interface/footer.jsp" %>
	
	<!-- Javascript files-->
<script src="../../../resources/js/jquery.min.js"></script>
<script src="../../../resources/js/popper.min.js"></script>
<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
<script src="../../../resources/js/plugin.js"></script>
</body>
</html>