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
		  <a href="/Board/EventBoardview?bno=${item.bno}">${item.title}</a>
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

<!--  -->     
<c:if test="${page.prev}">
 <span>[<a href="/Board/listPageSearch?num=${page.startPageNum - 1}${page.searchTypekeyword}">이전</a> ]</span>
</c:if>

		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		 	<span>
	 
	  	<c:if test="${select != num}">
	  	 	<a href="/Board/listPageSearch?num=${num}${page.searchTypekeyword}">${num}</a>
	  	</c:if>    
	  
	 	 <c:if test="${select == num}">
	  	 	<b>${num}</b>
	 	 </c:if>
	    
	 	</span>
	</c:forEach>

<c:if test="${page.next}">
 	<span>[ <a href="/Board/listPageSearch?num=${page.endPageNum + 1}${page.searchTypekeyword}">다음</a> ]</span>
</c:if>

<!-- 페이징 + 검색 추가   -->
<div>
  <select name="searchType" >
     <option value="title" <c:if test="${searchType eq 'title'}">selected</c:if>>제목</option>
        <option value="content" <c:if test="${searchType eq 'content'}">selected</c:if>>내용</option>
     <option value="title_content" <c:if test="${searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
     <option value="writer" <c:if test="${searchType eq 'writer'}">selected</c:if>>작성자</option>
  </select>
  
  <input type="text" name="keyword"  value="${keyword}" />
  
  <button type="button" id="searchBtn">검색</button>
 </div>
 
 <!--  -->
 
 <script>
 document.getElementById("searchBtn").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;
  
  location.href = "/Board/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
  
  console.log(searchType)
  console.log(keyword)	
 };
 
</script>
     
   </div>
   <jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
   <!-- Javascript files-->
   


<script src="../../../resources/js/jquery.min.js"></script>
<script src="../../../resources/js/popper.min.js"></script>
<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
<script src="../../../resources/js/plugin.js"></script>

</body>
</html>