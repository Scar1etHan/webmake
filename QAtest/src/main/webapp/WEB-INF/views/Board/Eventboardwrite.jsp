<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
   <style>
      /* 컨테이너의 넓이를 70%로 조정 */
      .container {
        width: 50%;
        margin: 0 auto; /* 가운데 정렬을 위해 추가 */
      }
    </style>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">   
	$(document).ready( function() {
		$("#header").load("../Interface/header.jsp");
		$("#footer").load("../Interface/footer.jsp");
         
	});
	</script>
  </head>
  <body >
  <div id="header"></div>
    <article>
        <div class="container" role="main">
            <div class="mb-3">
            <br>
            <br>
                <label for="boardTitle"><b>제목</b></label>
                <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력해 주세요">
            </div>
            <p>
   			  <div class="mb-3">
                <label for="boardHash"><b>해시태그</b></label>
                <input type="text" class="form-control" id="Hash" name="Hash" placeholder="#해시태그">
            </div>
            <p>
            <div class="mb-3">
                <label for="reg_id"><b>작성자</b></label>
                <input type="text" class="form-control" id="reg_id" name="regId"  value="" readonly>
            </div>
            <p>
            <div class="mb-3">
                <label for="boardContent"><b>내용</b></label>
                <textarea class="form-control" rows="5" id="boardContent" name="boardContent" placeholder="내용을 입력해 주세요"></textarea>
            </div>
            <br>
            
            <div>
                <button onclick="registerAction()" type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
                <button onclick="location.href='/'" type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
            </div>
        </div>
    </article>
    <div id="footer" style="margin-top:10%"></div>
  </body>
<script src="../js/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery-3.0.0.min.js"></script>
<script src="../js/plugin.js"></script>
</html>
