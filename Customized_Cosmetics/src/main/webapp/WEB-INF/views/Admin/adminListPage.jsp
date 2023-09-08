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
    <title>이벤트 게시판</title>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>

<body id="page-top">

   <!-- nav -->
   <%@ include file="interface.jsp" %>
   
   <div class="container w-75" style="display: inline-block; margin-top: 100px; position: relative; left: 16%;">
      <h1 style="font-size:40px; font-weight: bold;">이벤트 게시판</h1><p>
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
		  <a href="/Admin/adminEventBoardview?bno=${item.bno}">${item.title}</a>
		  </td>
		  <td>
		  
		  	<fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
		  </td>
		  <td>관리자</td>
		  <td>${item.viewCnt}</td>
		  
		 </tr>
		</c:forEach>
      </tbody>
      
      </table>
  
<!--  -->     
<c:if test="${page.prev}">
 <span>[ <a href="/Admin/adminListPage?num=${page.startPageNum - 1}">이전</a> ]</span>
</c:if>

		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		 	<span>
	 
	  	<c:if test="${select != num}">
	  	 	<a href="/Admin/adminListPage?num=${num}">${num}</a>
	  	</c:if>    
	  
	 	 <c:if test="${select == num}">
	  	 	<b>${num}</b>
	 	 </c:if>
	    
	 	</span>
	</c:forEach>

<c:if test="${page.next}">
 	<span>[ <a href="/Admin/adminListPage?num=${page.endPageNum + 1}">다음</a> ]</span>
</c:if>

 
 <script>

 document.getElementById("searchBtn").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;
  
  location.href = "/Admin/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
  
 };
</script> 
      <div class="d-grid gap-2 d-md-flex justify-content-md-end">
         <a href="adminEventBoardwrite" class="btn btn-primary">글쓰기</a>
      </div>
   </div>

</body>
</html>