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
.table th {
    text-align: center;
    vertical-align: middle;
}
</style>

<title>board</title>

<!-- 댓글 영역 script문 -->
<script>
        $(document).ready(function() {
            loadComments(${QAread.bno});
        });

        function formatDate(dateStr) {
            var date = new Date(dateStr);
            var formattedDate =
                date.getFullYear() +
                "-" +
                ("0" + (date.getMonth() + 1)).slice(-2) +
                "-" +
                ("0" + date.getDate()).slice(-2) +
                " " +
                (date.getHours() < 12 ? "오전" : "오후") +
                " " +
                ("0" + (date.getHours() % 12 || 12)).slice(-2) +
                ":" +
                ("0" + date.getMinutes()).slice(-2);

            return formattedDate;
        }

        function loadComments(bno) {
            var bno = ${QAread.bno};
            $.ajax({
                type: "GET",
                url: "/reply/list?bno=" + bno,
                dataType: "json",
                success: function(response) {
                    console.log(response);
                    var commentSection = $("#commentSection");
                    commentSection.empty(); // 댓글 영역 초기화

                    if (response.length == 0) {
                        commentSection.append("<p>등록된 댓글이 없습니다.</p>");
                    } else {
                        response.forEach(function(reply) {
                            var formattedDate = formatDate(reply.regDate);

                            var commentHtml = '<div class="card mt-3">' +
                                                '<div class="card-header">' +
                                                  '<div class="row">' +
                                                    '<div class="col-9">댓글 작성자 : ' + reply.user_id + '</div>' +
                                                    '<div class="col-3 text-right">' +
                                                      '<small class="text-muted">' +
                                                        formattedDate +
                                                      '</small>' +
                                                    '</div>' +
                                                  '</div>' +
                                                '</div>' +
                                                '<div class="card-body">' +
                                                  '<p class="card-text">내용 : ' + reply.replycontent + '</p>' +
                                                '</div>' +
                                              '</div>';
                            commentSection.append(commentHtml);
                        });
                    }
                }
            });
        }
</script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>

	<!-- 상단 navbar -->
	
	<jsp:include page="/WEB-INF/views/Interface/header.jsp" />
	
	<article style="background-color: white; padding-top:100px" >
		<div class="container mt-5">
			<h2 class="text-center mb-4" style="padding-top: 30px">글내용 보기</h2>
			<form>
				<table class="table table-bordered">
					<tr>
						<th class="bg-light" width="125">글번호</th>
						<td width="125">${QAread.bno}</td>
						<th class="bg-light" width="125">조회수</th>
						<td width="125">${QAread.viewCnt}</td>
					</tr>
					<tr>
						<th class="bg-light" width="125">작성자</th>
						<td width="125">${QAread.user_id}</td>
						<th class="bg-light" width="125">작성일</th>
						<td width="125"><fmt:formatDate value="${QAread.regDate}" pattern="yy-MM-dd a HH:mm"/></td>
					</tr>
					<tr>
						<th class="bg-light" width="125">글제목</th>
						<td colspan="3">${QAread.title}</td>
					</tr>
					<tr>
						<th class="bg-light" width="125">글내용</th>
						<td colspan="3"> <pre>${QAread.content}</pre></td>
					</tr>
					<tr>
						<td colspan="4" class="bg-light text-end">
						
						<%-- <input type="button" class="btn btn-primary me-2" value="글수정"
							onclick="location.href='QABoardrewrite?bno=${QAread.bno}'"> --%>
						<button type="button" class="btn btn-primary me-2" onclick="confirmUpdate(${QAread.bno}, '${QAread.user_id}')">글수정</button>
						<button type="button" class="btn btn-danger me-2" onclick="confirmDelete(${QAread.bno}, '${QAread.user_id}')">글삭제</button>
						<input type="button" class="btn btn-primary" value="글목록"
							onclick="location.href='QABoard'">
						</td>
					</tr>
				</table>
			</form>

			<!-- 댓글 목록 영역 -->
			<h2 style="margin-top: 50px">댓글 목록</h2>
			<div id="commentSection"></div>
			<!-- 댓글 목록 영역 끝 -->
			
			<!-- 댓글 작성 영역 -->
			<div class="card my-4">
				<h5 class="card-header">댓글 쓰기</h5>
				<div class="card-body">
					<form name='comment-form' action='/reply/write' method='post' autocomplete='off' onsubmit='checkLogin(event)'>
						<div class="form-group">
							<input type="hidden" name="user_id" value="${sessionScope.loginUser.user_id}" /> 
							<input type="hidden" name="bno" value="${QAread.bno}" />
							<textarea name="replycontent" class="form-control" rows="3" required></textarea>
						</div>
						<button type="submit" class="btn btn-primary">댓글 작성</button>
					</form>
				</div>
			</div>
		</div>
	</article>
	<!-- 하단영역(footer) -->
	<jsp:include page="/WEB-INF/views/Interface/footer.jsp" />
	
	
	<!-- 로그인 구분 댓글 작성 js -->
	<script>
		function checkLogin(event) {
		    let loginUser = '<%= session.getAttribute("loginUser") %>';
		    if (loginUser == 'null' || loginUser == '') {
		        event.preventDefault(); // 폼 제출 취소
		        alert('로그인한 사람만 게시글 작성이 가능합니다.');
		        location.href='/Member/login';
		    }
		}
	</script>
	
	<!-- 글 수정 js -->
	<script>
		function confirmUpdate(bno, user_id) {
			var loginUser = '${sessionScope.loginUser.user_id}'; // 변경된 부분
			
			if(loginUser == user_id){
				location.href='/Board/QABoardrewrite?bno='+bno;
			} else{
				alert('작성자만 글을 수정할 수 있습니다.');
			}
		}
	</script>
	
	<!-- 글 삭제 js -->
	<script>
		function confirmDelete(bno, user_id) {
	        var loginUser = '${sessionScope.loginUser.user_id}'; // 변경된 부분
	        
	        if (loginUser === user_id) {
	            var result = confirm('정말로 글을 삭제하시겠습니까?');
	            if (result) {
	                deletePost(bno);
	            }
	        } else {
	            alert('작성자만 글을 삭제할 수 있습니다.');
	        }
	    }
		
		function deletePost(bno){
			$.ajax({
				type : "POST",
				url: "/Board/QABoarddelete?bno=" + bno,
				success: function(response){
					location.href = '/Board/QABoard';
				}
			})
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
