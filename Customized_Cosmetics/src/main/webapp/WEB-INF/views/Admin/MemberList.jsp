<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<link rel="stylesheet" href="../css/paginationcss/paginate.css">
<link rel="stylesheet" href="../css/paginationcss/ligne.css">


<style>
.table-hover>tbody>tr:hover {
	background-color: skyblue;
}
.pagination-container {
    justify-content: center;
    margin-top: 20px; /* 필요한 여백 조정 */
}
</style>

<script src="../js/paginationjs/paginate.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
    <%@ include file="interface.jsp" %>
	<!-- main section start -->
	<div style="margin-top: 100px; background-color: white; padding-bottom: 30px; border: 1px solid #ccc">
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
		
	    <table class="myTable table table-hover" style="margin:0 auto">
		<!-- <table class="table table-striped table-bordered table-hover"> -->
				<tr>
					<th style="width: 9%;">아이디</th>
					<th style="width: 9%;">이름</th>
					<th style="width: 9%;">번호</th>
					<th style="width: 4%;">나이</th>
					<th style="width: 4%;">성별</th>
					<th style="width: 13%;">메일</th>
					<th style="width: 8%;">주소1</th>
					<th style="width: 13%;">주소2</th>
					<th style="width: 12%;">주소3</th>
					<th style="width: 10%;">등록일</th>
					<th style="width: 10%">탈퇴</th>
				</tr>
			<tbody>
				<c:forEach items="${list}" var="user">
					<tr>
						<td>${user.userId}</td>
						<td>${user.userName}</td>
						<td>${user.userCell}</td>
						<td>${user.userAge}</td>
						<td>${user.userSex}</td>
						<td>${user.userEmail}</td>
						<td>${user.userAddr1}</td>
						<td>${user.userAddr2}</td>	
						<td>${user.userAddr3}</td>
						<td>
						  <fmt:formatDate value="${user.userRegDate}" pattern="yy-MM-dd a HH:mm"/>
						</td>
						<td><form action="/memberBan" method="POST">
							<input type="hidden" id="userId_input" name="userId">
							<button type="button" class="btn btn-danger me-2" name="userId" data-users-id="${user.userId}"> 
								회원탈퇴 
							</button></form></td>
						</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script>
	$(document).ready(function() {
	    $(".btn-danger").on("click", function() {
	        var usersId = $(this).data("users-id");
	        if (confirm("탈퇴하시겠습니까?")) {
	            $.ajax({
	                type: "POST",
	                url: "memberBan",
	                data: { users_id: usersId },
	                dataType: "json",
	                success: function(response) {
	                    if (response.result === "success") {
	                        console.log("사용자 ID", usersId, "탈퇴 처리 완료");
	                        alert("회원 탈퇴 성공");
	                        window.location.href = "/Admin/MemberList";
	                    } else {
	                        console.log("사용자 ID", usersId, "탈퇴 처리 실패");
	                        alert("회원 탈퇴 실패");
	                    }
	                },
	                error: function(xhr, status, error) {
	                    console.error("사용자 ID", usersId, "탈퇴 처리 오류:", error);
	                    alert("회원 탈퇴 중 오류가 발생하였습니다.");
	                }
	            });
	        }
	    });
	});



		
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

</body>
</html>
