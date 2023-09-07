<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
<center>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
    <%
        request.setCharacterEncoding("UTF-8");
 
        String name = request.getParameter("name");
        //request.getSession().setAttribute("userName", name);
 
        session.setAttribute("login", name);
    %>
    <% if (name == "") {
    %><script>
        alert("로그인을 다시 해주세요");
        history.back();
    </script>
    <%
        } else { %>
    
        <div id="header" style="position: relative; bottom: 20px;"></div>
        
        환영합니다! <%=request.getSession().getAttribute("login")%>님
        <hr>
        <br>
</center>            
            <%
            class Product {
              String name;
              String img;
              int price;
              
              Product(String name, String img, int price) {
                this.name = name;
                this.img = img;
                this.price = price;
              }
            }
            List<Product> productList = Arrays.asList(
                new Product("화장품 이름 작성1", "images/상품.PNG", 21000),
                new Product("화장품 이름 작성2", "images/상품.PNG", 32000),
                new Product("화장품 이름 작성3", "images/상품.PNG", 2500),
                new Product("화장품 이름 작성4", "images/상품.PNG", 21500),
                new Product("화장품 이름 작성1", "images/상품.PNG", 21000),
                new Product("화장품 이름 작성2", "images/상품.PNG", 32000),
                new Product("화장품 이름 작성3", "images/상품.PNG", 22500),
                new Product("화장품 이름 작성4", "images/상품.PNG", 21500),
                new Product("화장품 이름 작성4", "images/상품.PNG", 21500)
            );
          %>
         <div class="container">
           <div class="input-group">
      <input type="text" class="form-control" placeholder="검색어를 입력해주세요">
      <button class="btn btn-light" type="submit">
        <i class="fas fa-search"></i>
        
      </button>
      
    </div>
          <div class="product-list">
            <% for (Product product : productList) { %> 
  		<div class="col mb-5">
            <div class="card h-100">
              <!-- Product image-->
              <img
                class="card-img-top  "
                src="<%= product.img %>"
                alt="image"
              />
              <!-- Product details-->
              <div class="card-body p-4">
                <div class="text-center">
                  <!-- Product name-->
                  <hr>
                  <h5 class="fw-bolder">상품</h5>
                  <!-- Product price-->
                 <%= product.price %>원
                </div>
              </div>
              <!-- Product actions-->
              <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                <div class="text-center">
                  <!-- <a class="btn btn-outline-dark mt-auto" href="#"
                    >상세보기</a
                  > -->
                  <a class="btn-outline-primary " href="#">
                  <button>상세보기</button></a>
                  <a class="btn-outline-primary " href="add.jsp?product=<%= product.name %>">
                  <button>장바구니</button></a>
                </div>
              </div>
            </div>
          </div>
          <%}%>
          </div>
          <br> <a href="checkOut.jsp" name=add>장바구니</a>
        <br><br>
         </div>
        <% }%>
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
      <div id="footer"></div>
  </body>
  <!-- Javascript files-->
<script src="../js/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery-3.0.0.min.js"></script>
<script src="../js/plugin.js"></script>
  </html>