<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<%@include file="../Interface/header.jsp" %>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center" style="padding-top:50px">게시글 수정</h2><p>&nbsp;</p>
        <form action="update" method="POST">
            <div class="table table-responsive"> 
            <table class="table table-striped">
            <tr>
                <td class="danger">작성자</td>
                <td><input class="form-control" name="writer" value="${dto.writer}"readonly>${dto.writer}</td>
                <td class="danger"><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td></td>
            </tr>
            <tr>
                <td class="danger">제목</td>
                <td colspan="3"><input type="text"  class="form-control" name="title">${dto.title}</td>
            </tr>
             
            <tr>
                <td class="danger">글내용</td>
                <td colspan="3"><textarea name="content" class="form-control">${dto.content}</textarea></td>
            </tr>
             
            <tr>  
                <td colspan="4" class="text-center" style="padding-bottom:24%">
                	<input type="hidden" name="bno" value="${dto.bno}">
                    <input type="submit" value="글수정" class="btn btn-warning">
                    <input type="button" class="btn btn-primary" onclick="location.href='FreeBoard'" value="전체글보기">
                </td>
            </tr>
          </table>
         
     
            </div>
        </form>   
    </div>
</div>
 <%@include file="../Interface/footer.jsp" %>
 
 
<script>
	CKEDITOR.replace('content', {
	         
	    width:'100%',
	    height:'350'
	         
	});
 
</script>
	<script src="../../../resources/js/jquery.min.js"></script>
    <script src="../../../resources/js/popper.min.js"></script>
    <script src="../../../resources/js/bootstrap.bundle.min.js"></script>
    <script src="../../../resources/js/jquery-3.0.0.min.js"></script>
    <script src="../../../resources/js/plugin.js"></script>
    <!-- sidebar -->
    <script src="../../../resources/js/custom.js"></script>
</body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"	crossorigin="anonymous"></script>
</html>