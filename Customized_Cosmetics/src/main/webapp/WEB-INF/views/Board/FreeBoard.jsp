<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="ko">
<head>
   <!-- basic -->
   <meta charset="utf-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1" />
   <title>부트스트랩</title>
   <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/nice-select.css">
</head>
<script>
    // **원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
    function list(page){
        location.href="${path}/Board/FreeBoard?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
    }
</script>
<body>
<!--header section start -->
	<%@include file="../Interface/header.jsp" %>
  <!-- header section end -->
  
   <div class="container w-75" style="display: inline-block; margin-top: 100px; position: relative; left: 16%;">
      <h1 style="font-size:40px; font-weight: bold;">자유 게시판</h1><p>
      <table class="table table-striped table-hover border 1px">  
      <thead>
         <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회수</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach var="row" items="${map.list}">
		    <tr>
		        <td>${row.bno}</td>
		        <td><a href="${path}/Board/FreeBoardView?bno=${row.bno}">${row.title}</a></td>
		        <td>${row.writer}</td>
		        <td>
		            <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
		            <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
		        </td>
		        <td>${row.viewcnt}</td>
		    </tr>
    	</c:forEach>
      </tbody>
      </table>
      <nav aria-label="Page navigation example">
      <form name="form1" class="mb-3 w-50 offset-md-4" method="post" action="${path}/Board/FreeBoard">
       <select name="searchOption" class="w-25">
            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
            <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >제목+이름+제목</option>
            <option value="writer" <c:out value="${map.searchOption == 'writer'?'selected':''}"/> >이름</option>
            <option value="content" <c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
            <option value="title" <c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
        </select>
        <input name="keyword" value="${map.keyword}">
        <input type="submit" value="검색">
        </form>
		<br>
		<div align="center">
       	<tr>
            <td colspan="5">
                <!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
                <c:if test="${map.boardPager.curBlock > 1}">
                    <a href="javascript:list('1')">[처음]</a>
                </c:if>
                
                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock > 1}">
                    <a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
                </c:if>
                
                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
                <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
                    <!-- **현재페이지이면 하이퍼링크 제거 -->
                    <c:choose>
                        <c:when test="${num == map.boardPager.curPage}">
                            <span style="color: red">${num}</span>&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:list('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
                    <a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
                </c:if>
                
                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
                    <a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
                </c:if>
            </td>
        </tr>
        </div>
        <br>
        <!-- 레코드 갯수 출력 -->
        <div style="text-align:center">
        ${map.count}개의 게시물이 있습니다.
        </div>
      <div class="d-grid gap-2 d-md-flex justify-content-md-end">
         <a href="FreeBoardWrite" class="btn btn-primary">글쓰기</a>
      </div>
      </nav>
   </div>
   <%@include file="../Interface/footer.jsp" %>
   
   <!-- Javascript files-->
<script src="../../../resources/js/jquery.min.js"></script>
<script src="../../../resources/js/popper.min.js"></script>
<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
<script src="../../../resources/js/plugin.js"></script>

</body>
</html>