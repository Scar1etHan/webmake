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
                                                    '<div class="col-9">댓글 작성자 : ' + reply.replyer + '</div>' +
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
	<div class="fixed-top">
		<jsp:include page="/WEB-INF/views/Interface/header.jsp" />
	</div>
	<article style="background-color: white">
		<div class="container mt-5">
			<h2 class="text-center mb-4" style="padding-top: 30px">글내용 보기</h2>
			<form>
				<table class="table table-bordered">
					<tr>
						<th class="bg-light" width="125">글번호</th>
						<td width="125">"${QAread.bno}"</td>
						<th class="bg-light" width="125">조회수</th>
						<td width="125">"${QAread.viewCnt}"</td>
					</tr>
					<tr>
						<th class="bg-light" width="125">작성자</th>
						<td width="125">"${QAread.writer}"</td>
						<th class="bg-light" width="125">작성일</th>
						<td width="125"><fmt:formatDate value="${QAread.regDate}" pattern="yy-MM-dd a HH:mm"/></td>
					</tr>
					<tr>
						<th class="bg-light" width="125">글제목</th>
						<td colspan="3">"${QAread.title}"</td>
					</tr>
					<tr>
						<th class="bg-light" width="125">글내용</th>
						<td colspan="3"> <pre>"${QAread.content}"</pre></td>
					</tr>
					<tr>
						<td colspan="4" class="bg-light text-end">
						<input type="button" class="btn btn-primary me-2" value="글수정"
							onclick="location.href='QABoardrewrite?bno=${QAread.bno}'"> 
						<%-- <input type="button" class="btn btn-danger me-2" value="글삭제" onclick="deletePost('${QAread.bno}')"> --%>
						<input type="button" class="btn btn-danger me-2" value="글삭제"
							onclick="location.href='QABoarddelete?bno=${QAread.bno}'"> 
						<!-- <input type="button" class="btn btn-primary me-2" value="답글쓰기"
							onclick="location.href='BoardComment.jsp'"> --> 
						<input type="button" class="btn btn-primary" value="글목록"
							onclick="location.href='QABoard'">
						</td>
					</tr>
				</table>
			</form>

			<!-- 댓글 영역 -->
			<h2 style="margin-top: 50px">댓글 목록</h2>
			<div id="commentSection"></div>
			<!-- 댓글영역 끝 -->
			
			<!-- Comments Form -->
			<div class="card my-4">
				<h5 class="card-header">댓글 쓰기</h5>
				<div class="card-body">
					<form name="comment-form" action="/reply/write" method="post"
						autocomplete="off">
						<div class="form-group">
							작성자 : <input type="text" name="replyer" required /> <input
								type="hidden" name="bno" value="${QAread.bno}" />
							<textarea name="replycontent" class="form-control" rows="3"
								required></textarea>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</article>
	<!-- 하단영역(footer) -->
	<jsp:include page="/WEB-INF/views/Interface/footer.jsp" />
	
	<script>
	function deletePost(bno) {
		  if (confirm('게시물을 삭제하시겠습니까?')) {
			  
		    };
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
