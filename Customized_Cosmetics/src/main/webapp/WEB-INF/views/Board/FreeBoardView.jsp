<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="mvc.test.controller.domain.freeBoardVO"%>
<%@page import="mvc.test.board.dao.freeBoardDAO"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	

<title>freeBoardView</title>
</head>
<style>
.test{
	 position:relative;
	 top:5%;
	 padding-top:150px;
	 padding-bottom:10%;
}
</style>
<body>
	<!-- 상단 navbar -->
	<%@include file="../Interface/header.jsp" %>
	<div class="row">
		<div class="col-xs-2 col-md-2"></div>
		<div class="col-xs-8 col-md-8">
			<h2 class="text-center">게시글 보기</h2>
			<p>&nbsp;</p>
			<div class="table table-responsive">
				<table class="table">
				
					<tr>
						<th class="success">글번호</th>
						<td>${dto.bno}</td>
						<th class="success">조회수</th>
						<td>${dto.viewcnt}</td>
					</tr>


					<tr>
						<th class="success">작성자</th>
						<td>${dto.writer}</td>
						<th class="success">작성일</th>
						<td><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</tr>

					<tr>
						<th class="success">제목</th>
						<td colspan="3">${dto.title}</td>
					</tr>

					<tr>
						<th class="success">글 내용</th>
						<td colspan="3">${dto.content}</td>
					</tr>

					<tr>
						<td colspan="4" style="text-align:right">
						<c:if test="${login.userName == dto.writer}">
					            <input type="button" class="btn btn-warning" value="수정하기" onclick="location.href='FreeBoardUpdate?bno=${dto.bno}'">
					            <input type="button" class="btn btn-danger" value="삭제하기" onclick="location.href='delete?bno=${dto.bno}'">
					    </c:if>
						<input type="button" class="btn btn-primary" value="목록보기" onclick="location.href='FreeBoard'">
						</td>
					</tr>
				</table>
			</div>

		</div>
	</div>
			<!-- 댓글 영역 -->
	<div class="box box-warning" style="margin-bottom:17%">
    <div class="container box-header with-border">
        <a class="link-black text-lg"><i class="fa fa-pencil margin-r-5"></i> 댓글 쓰기</a>
    </div>
    <div class="container box-body">
        <c:if test="${not empty login}">
            <form style="margin-bottom:10%">
                <div class="form-group">
                    <textarea class="form-control" id="newReplyText" rows="3" placeholder="댓글내용..."style="resize: none"></textarea>
                </div>
                <div class="col-sm-2" hidden>
                    <input class="form-control" id="newReplyWriter" type="text" value="${login.userId}" readonly>
                </div>
                <button type="button" class="btn btn-default btn-block replyAddBtn">
                    <i class="fa fa-save"></i> 댓글 저장
                </button>
            </form>
        </c:if>
        <c:if test="${empty login}">
            <a href="${path}/Member/login" class="btn btn-default btn-block" role="button">
                <i class="fa fa-edit"></i> 로그인 한 사용자만 댓글 등록이 가능합니다.
            </a>
        </c:if>
    </div>
</div>
			<!-- 댓글영역 끝 -->
	<%@include file="../Interface/footer.jsp" %>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"	crossorigin="anonymous"></script>
	<script src="../../../resources/js/jquery.min.js"></script>
    <script src="../../../resources/js/popper.min.js"></script>
    <script src="../../../resources/js/bootstrap.bundle.min.js"></script>
    <script src="../../../resources/js/jquery-3.0.0.min.js"></script>
    <script src="../../../resources/js/plugin.js"></script>
</body>
</html>
