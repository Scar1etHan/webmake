<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <!-- basic -->
   <meta charset="utf-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1" />
   <title>부트스트랩</title>
   <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">   
	$(document).ready( function() {
		$("#header").load("../Interface/header.jsp");
		$("#footer").load("../Interface/footer.jsp");
         
});
</script>
</head>
<body>
<!--header section start -->
	<div id="header"></div>
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
         <tr>
            <th scope="row">1</th>
            <td><a href="#">글내용1</a></td>
            <td>글작성자1</td>
            <td>작성일1</td>
            <td>조회수1</td>
         </tr>
         <tr>
            <th scope="row">2</th>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
            <td>조회수2</td>
         </tr>
         <tr>
            <th scope="row">3</th>
            <td colspan="2">Larry Bird</td>
            <td>@twitter</td>
            <td>조회수3</td>
         </tr>
         
      </tbody>
      </table>
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
      <div class="d-grid gap-2 d-md-flex justify-content-md-end">
         <a href="FreeBoardwrite.jsp" class="btn btn-primary">글쓰기</a>
      </div>
      </nav>
   </div>
   <div id="footer" style="margin-top:5%;"></div>
   <!-- Javascript files-->
<script src="../js/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery-3.0.0.min.js"></script>
<script src="../js/plugin.js"></script>

</body>
</html>