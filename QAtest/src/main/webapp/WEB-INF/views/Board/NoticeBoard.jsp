<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <!-- basic -->
   <meta charset="utf-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1" />
   <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">   
	$(document).ready( function() {
		$("#header").load("../Interface/header.jsp");
		$("#footer").load("../Interface/footer.jsp");
         
});
</script>
</head>
<body>

<div id="header"></div>
	 
	<div class="p-5 "></div> <!-- 여백 -->

	 <div class="container w-75" style="display: inline-block; margin-top: 100px; position: relative; left: 16%;">
      <h4 style="font-size:20px; font-weight: bold;">Notice</h4><p>
      	<div class="p-2 "></div>
      <table class="table table-striped table-hover border 1px">  
      <thead>
         <tr>
            <th scope="col">작성자</th>
            <th scope="col"></th>
            <th scope="col">작성일</th>
            <th scope="col" class = "right">조회수</th>
         </tr>
      </thead>
      <tbody>
         <tr>
            <td>admin</a></td>
            <td>공지사항3</td>
            <td>07/27</td>
            <td>11</td>
         </tr>
         <tr>
            <td>admin</td>
            <td>공지사항2</td>
            <td>05/12</td>
            <td>24</td>
         </tr>
         <tr>
            <td>admin</td>
            <td>공지사항1</td>
            <td>03/23</td>
            <td class= "right">31</td>
         </tr>
      </tbody>
      </table>
      <nav aria-label="Page navigation example">
      <div class="input-group mb-3 w-50 offset-md-3" style="margin-top: 100px;">
         <input type="text" class="form-control" placeholder="검색" aria-label="검색" aria-describedby="button-addon2" />
         <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
      </div>
      <ul class="pagination justify-content-center">
      </ul>
      </nav>
   </div>
   <div class="p-5 "></div> <!-- 여백 -->
	<div class="p-5 "></div>
     <div id="footer"></div>
</body>
   <!-- Javascript files-->
<script src="../js/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery-3.0.0.min.js"></script>
<script src="../js/plugin.js"></script>
</html>