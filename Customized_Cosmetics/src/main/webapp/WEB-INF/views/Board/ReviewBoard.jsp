<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <!-- basic -->
   <meta charset="utf-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1" />
   <title>리뷰 게시판</title>
   
   <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<!--header section start -->
	<jsp:include page="/WEB-INF/views/Interface/header.jsp"/>
  <!-- header section end -->
   <div class="container w-75" style="display: inline-block; margin-top: 100px; position: relative; left: 16%;">
      <h1 style="font-size:40px; font-weight: bold;">리뷰 게시판</h1><p>
      <table class="table table-striped table-hover border 1px">  
      <thead>
         <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성일</th>
            <th scope="col">작성자</th>
            <th scope="col">조회수</th>
         </tr>
      </thead>
      <tbody>
        <c:forEach items="${list}" var="item">
		 <tr>
		  <td>${item.bno}</td>
		  <td>
		  <a href="/Board/ReviewBoardview?bno=${item.bno}">${item.title}</a>
		  </td>
		  <td>
		  	<fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
		  </td>
		  <td>${item.writer}</td>
		  <td>${item.viewCnt}</td>
		 </tr>
		</c:forEach>
      </tbody>
      </table>
      <nav aria-label="Page navigation example">
      <div class="input-group mb-3 w-50 offset-md-3" style="margin-top: 100px;">
      	 <select name="searchType" class="w-25">
      	 	<option value="title" <c:if test="${searchType eq 'title'}">selected</c:if>>제목</option>
      	 	<option value="content" <c:if test="${searchType eq 'content'}">selected</c:if>>내용</option>
      	 	<option value="title_content" <c:if test="${searchType eq 'title_content'}">selected</c:if>>제목 + 내용</option>
      	 	<option value="writer" <c:if test="${searchType eq 'writer'}">selected</c:if>>작성자</option>
      	 </select>
         <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="검색" aria-label="검색" aria-describedby="button-addon2" />
         <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
      </div>
      <ul class="pagination justify-content-center">
      
      <c:if test="${page.prev}">
      	<li class="page-item">
            <a class="page-link" href="/Board/ReviewBoard?num=${page.startPageNum - 1}${page.searchTypeKeyword}" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            </a>
         </li>
      </c:if>
         
         <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
         	<li class="page-item"><a class="page-link" href="/Board/ReviewBoard?num=${num}${page.searchTypeKeyword}">${num}</a></li>
         </c:forEach>
         
      <c:if test="${page.next}">
      	<li class="page-item">
            <a class="page-link" href="/Board/ReviewBoard?num=${page.endPageNum + 1}${page.searchTypeKeyword}" aria-label="Previous">
            <span aria-hidden="true">&raquo;</span>
            </a>
         </li>
      </c:if>
      </ul>
      <div class="d-grid gap-2 d-md-flex justify-content-md-end">
         <a href="ReviewBoardwrite" class="btn btn-primary">글쓰기</a>
      </div>
      </nav>
   </div>
   <jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
   
   
<script>
	document.getElementById("button-addon2").onclick = function () {
	   
	 let searchType = document.getElementsByName("searchType")[0].value;
	 let keyword =  document.getElementsByName("keyword")[0].value;
	 
	 location.href = "/Board/ReviewBoard?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
</script>
   <!-- Javascript files-->
<script src="../../../resources/js/jquery.min.js"></script>
<script src="../../../resources/js/popper.min.js"></script>
<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
<script src="../../../resources/js/plugin.js"></script>

</body>
</html>