<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
<!--header section start -->
	<jsp:include page="/WEB-INF/views/Interface/header.jsp"/>
  <!-- header section end -->
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
    <div>
 <c:forEach begin="1" end="${pageNum}" var="num">
    <span>
     <a href="/board/listPage?num=${num}">${num}</a>
  </span>
 </c:forEach>
</div>
<!--  -->


      <nav aria-label="Page navigation example">
      <div class="input-group mb-3 w-50 offset-md-3" style="margin-top: 100px;">
         <input type="text" class="form-control" placeholder="검색" aria-label="검색" aria-describedby="button-addon2" />
         <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
      </div>
      <ul class="pagination justify-content-center">
         <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            </a>
	
         </li>
         
         <li class="page-item"><a class="page-link" href="#">1</a></li>
         <li class="page-item"><a class="page-link" href="#">2</a></li>
         <li class="page-item"><a class="page-link" href="#">3</a></li>
         <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            </a>
         </li>
      </ul>

		
      </nav>
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