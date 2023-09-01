<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="../../../resources/css/paginationcss/paginate.css">
<link rel="stylesheet" href="../../../resources/css/paginationcss/ligne.css">

<style>
.table-hover>tbody>tr:hover {
	background-color: skyblue;
}
.pagination-container {
    justify-content: center;
    margin-top: 20px; /* 필요한 여백 조정 */
}
.myTable {
    border-collapse: collapse; /* 핵심: 테두리 합치기 */
    width: 100%;
    border: 1px solid #ddd; /* 테두리 선 */
    text-align:center;
    margin:0 auto;
  }

  .myTable th, .myTable td {
    border: 1px solid #ddd; /* 내부 선 */
    padding: 8px;
  }

  .myTable th {
    background-color: #f2f2f2;
  }

  .myTable tr:hover {
    background-color: #f5f5f5;
  }

</style>
<script src="../../../resources/js/paginationjs/paginate.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
	
	<div class="fixed-top">
		<jsp:include page="/WEB-INF/views/Interface/header.jsp" />
	</div>
	
	<!-- main section start -->
	<div class="container" style="margin-top: 100px; background-color: white; padding-bottom: 30px; border: 1px solid #ccc">
		<h1 class="text-center mt-5 mb-4" style="padding-top: 50px;">회원 목록</h1>
		<div class="text-right mb-3" style="margin-bottom: 10px;">
<!-- 			<button class="btn btn-success float-end"
				onclick="location.href='QABoardwrite'">글작성</button> -->
			<div class="panel col-md-8">
				<div class="body">
					<div class="input-group">
						<label for="searchBox"><h2>검색 : </h2></label>
						<input type="search" id="searchBox" placeholder="검색하는 곳"
							style="margin-left:20px;">
					</div>
				</div>
			</div>
		</div>
		
	    <table class="myTable table table-hover"">
			<tr>
				<th style="width: 9%;">아이디</th>
				<th style="width: 9%;">비번</th>
				<th style="width: 9%;">이름</th>
				<th style="width: 9%;">번호</th>
				<th style="width: 4%;">나이</th>
				<th style="width: 4%;">성별</th>
				<th style="width: 13%;">메일</th>
				<th style="width: 8%;">주소1</th>
				<th style="width: 13%;">주소2</th>
				<th style="width: 12%;">주소3</th>
				<th style="width: 10%;">등록일</th>
			</tr>
			<tbody>
				<c:forEach items="${list}" var="memberlist">
					<tr>  <!-- path는 jsp에서 사용하는 el문으로 페이지에서 데이터를 쉽게 쓰게 해주는 스크립언어 -->
						<td><a href="${path}/Member/MemberInfo?user_id=${memberlist.user_id}">${memberlist.user_id}</a></td>
						<td>${memberlist.user_pw}</td>
						<td>${memberlist.user_name}</td>
						<td>${memberlist.user_phone}</td>
						<td>${memberlist.user_age}</td>
						<td>${memberlist.user_sex}</td>
						<td>${memberlist.user_email}</td>
						<td>${memberlist.user_Addr1}</td>
						<td>${memberlist.user_Addr2}</td>
						<td>${memberlist.user_Addr3}</td>
						<td>
						  <fmt:formatDate value="${memberlist.user_regDate}" pattern="yy-MM-dd a h:mm"/>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- 하단영역(footer) -->
	<div style="padding-top:300px">
		<jsp:include page="/WEB-INF/views/Interface/footer.jsp" />
	</div>

	<script>
	    let options = {
	        numberPerPage:10, 
	        goBar:true, 
	        pageCounter:true,
	    };

	    let filterOptions = {
	        el:'#searchBox' 
	    };

	    paginate.init('.myTable',options,filterOptions);
	    
	    let paginationWrap = document.querySelector('.paginate-wrap');
	    paginationWrap.style.margin = '0 auto';
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
