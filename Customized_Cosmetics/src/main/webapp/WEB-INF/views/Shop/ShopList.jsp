<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<!-- basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
<title>Insert title here</title>
<style>
.container{
width:1100px;
}

.card {
  width:250px;
  flex: 0 0 200px; /* 카드가 확장되지 않고, 200px의 고정 너비를 가짐 */
  margin-right: 10px; /* 카드 간 간격 */
}
		
.product-list { 
  display: flex;  /* 로우를 플렉스 박스로 설정 */
  flex-wrap: wrap; /* 로우에 모든 자식 요소가 옆으로 나열되도록 허용 */
}

.card-img-top{ /* 이미지 */
	/* border: 3px solid black; */
	width:180px;
	hight: 120px;
	text-align: center; /* 이미지 정렬을 위한 text-align 추가 */
    margin: auto; /* 이미지의 가운데 정렬을 위한 margin: auto 추가 */
    padding-top:20px; 
}

.input-group{
	margin-bottom: 10px;
}

button {
	 background-color: #FFFF66;
     color: black;
     border-radius: 5px;
     border:none;
 }
 
 button:hover{
 	background-color: #99ff99;
 }
 
</style>
</head>
<body>
<!--header section start -->
	<jsp:include page="/WEB-INF/views/Interface/header.jsp"/>
  <!-- header section end -->
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
        <div id="header" style="position: relative; bottom: 20px;"></div>
        <hr> <br>
       
         <div class="container">
           <div class="input-group">
      <input type="text" class="form-control" placeholder="검색어를 입력해주세요">
      <button class="btn btn-light" type="submit">
        <i class="fas fa-search"></i>
        
      </button>
      
    </div>
    
    <!-- 상품 자동추가 제이쿼리적용 -->
          <div class="product-list">
      <tbody>
    <c:forEach items="${list}" var="list">
  		<div class="col mb-5">
            <div class="card h-100">
              <!-- Product image-->
             
              <img
                class="card-img-top  "
                src="${list.gdsThumbImg}"
                alt="image"/>     
              <!-- Product details-->
              <div class="card-body p-4">
                <div class="text-center">
                  <!-- Product name-->
                  <hr>
                  <h5 class="fw-bolder">
                  <a href="/ShopList/view?n=${list.gdsNum}">${list.gdsName}</a>
                  </h5>
                  <!-- Product price-->
                 ${list.gdsPrice}원
                </div>
              </div>
              <!-- Product actions-->
              <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                <div class="text-center">
                  <!-- <a class="btn btn-outline-dark mt-auto" href="#"
                    >상세보기</a
                  > -->
                  <a class="addCart_btn" href="/Shop/ItemShow?n=${list.gdsNum}">상세보기</a>
                        &nbsp;&nbsp;
                
                  <!-- 추가  -->         
                  <p class="addToCart">
 				<button type="button" class="addCart_btn">카트에 담기</button>
               <script>
					  $(".addCart_btn").click(function(){
					   var gdsNum = $("#gdsNum").val();
					   var cartStock = $(".numBox").val();

					   var data = {
					     gdsNum : ${list.gdsNum}
					     /* cartStock : cartStock  재고 */ 
					     };
					   
					   $.ajax({
					    url : "/Shop/ShopList/addCart",
					    type : "post",
					    data: { 'chbox[]': checkedValues },
					    success : function(result){
					     alert("카트 담기 성공");
					     $(".numBox").val("1");
					    },
					    error : function(){
					     alert("카트 담기 실패");
					    }
					    // Cart.jsp 페이지 로드
					    window.location.href = '/Shop/ShopList/cartList.jsp';
					    });
					  });
					 </script>
           
					</p>
					
                <!--  -->
                </div>
              </div>
            </div>
          </div>
       </c:forEach>
       
            
          </div>
          <br> <a href="/Shop/ShopList/cartList" name=add>장바구니</a>
        <br><br>
  	</tbody>
   </div>
     <!--  -->
      
      
        <nav aria-label="Page navigation example">
      
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
      <!--header section start -->
	<jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
  <!-- header section end -->
  </body>
  <!-- Javascript files-->
  
<script src="../../../resources/js/jquery.min.js"></script>
<!-- <script src="../../../resources/js/popper.min.js"></script> -->
<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
<script src="../../../resources/js/plugin.js"></script>
  </html>