<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

p,
span {
  margin: 0;
}

a {
  color: black;
}

img {
  display: block;
  width: 80%;
  height: 100px;
  margin: auto;
}

.cart {
  width: 80%;
  margin: auto;
  padding: 30px;
}

.cart ul {
  background-color: whitesmoke;
  padding: 30px;
  margin-bottom: 50px;
  border: whitesmoke solid 1px;
  border-radius: 5px;
  font-size: 13px;
  font-weight: 300;
}

.cart ul :first-child {
  color: limegreen;
}

table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 100%;
  font-size: 14px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 12px;
}

td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
}

.cart__list__detail :nth-child(3) {
  vertical-align: top;
}

.cart__list__detail :nth-child(3) a {
  font-size: 12px;
}

.cart__list__detail :nth-child(3) p {
  margin-top: 6px;
  font-weight: bold;
}

.cart__list__smartstore {
  font-size: 12px;
  color: gray;
}

.cart__list__option {
  vertical-align: top;
  padding: 20px;
}

.cart__list__option p {
  margin-bottom: 25px;
  position: relative;
}

.cart__list__option p::after {
  content: "";
  width: 90%;
  height: 1px;
  background-color: lightgrey;
  left: 0px;
  top: 25px;
  position: absolute;
}

.cart__list__optionbtn {
  background-color: white;
  font-size: 10px;
  border: lightgrey solid 1px;
  padding: 7px;
}

.cart__list__detail :nth-child(4),
.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  border-left: 2px solid whitesmoke;
}

.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  text-align: center;
}

.cart__list__detail :nth-child(5) button {
  background-color: limegreen;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

.price {
  font-weight: bold;
}

.cart__mainbtns {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
}

.cart__bigorderbtn {
  width: 200px;
  height: 50px;
  font-size: 16px;
  margin: auto;
  border-radius: 5px;
}

.cart__bigorderbtn.left {
  background-color: white;
  border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
  background-color: limegreen;
  color: white;
  border: none;
}

.cart__bigorderbtn.right:hover,
	.cart__list__orderbtn:hover {
	  background-color: lime;
	  color: white;
	}


</style>
<script type="text/javascript">

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/Interface/header.jsp" />
		<script type="text/javascript">
		window.onload = function() {
		    var allCheck = document.getElementById("allCheck");
		    allCheck.addEventListener('change', function() {
		        var checkboxes = document.querySelectorAll('input[type=checkbox]');
		        for (var checkbox of checkboxes) {
		            checkbox.checked = this.checked;
		        }
		    });
		}
		</script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			    $('.delete_btn').click(function() {
			        $('input[type=checkbox]:checked').each(function() {
			            var cartNum = $(this).val();
			            // AJAX 요청을 사용하여 서버에 삭제할 항목의 cartNum 전송
			            // $.post('/deleteCart', {cartNum: cartNum}, function(data) {
			            //     console.log(data);
			            // });
			        });
			    });
			});
		</script>

	  <section class="cart">
        <div class="cart__information">
        <h3 align="center">장바구니</h3>
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
        <table class="cart__list">
            <form>
                <thead>
                    <tr>
                  
                        <td>
                        	 <div class="allCheck">
                       		 <input type="checkbox" name="allCheck" id="allCheck" />
                        	 <label for="allCheck"/> 
                        </td>
                    
				  
                        <td colspan="2">상품정보</td>
                        <td>옵션</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${cartList}" var="cartList">
                    <tr class="cart__list__detail">
                        <td style="width: 2%;">
                      	  <input type="checkbox" value="${cartList.cartNum}">
                      	</td>
                        <td style="width: 13%;">
                            <img src="${cartList.gdsThumbImg}" alt="img">
                        </td>
                        <td style="width: 27%;"><a href="#">상품명 : ${cartList.gdsName}</a><span class="cart__list__smartstore"> 스마트스토어</span>
                            <p>상품 주문 수량: ${cartList.cartStock}</p>
                            <span class=" price"><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /></span>
                        </td>
                        <td class="cart__list__option" style="width: 27%;">
                            <p>상품 주문 수량: ${cartList.cartStock}</p>
                            <button class="cart__list__optionbtn">주문조건 추가/변경</button>
                        </td>
                        <td style="width: 15%;"><span class="price">최종 가격 : <fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" /></span><br>
                            <button class="cart__list__orderbtn">주문하기</button>
                        </td>
                        <td style="width: 15%;">무료</td>
                    </tr> 
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                 	
  					 </div> 
                    </tr>
                </tfoot>
            </form>
        </table>

        <div class="delBtn">
        <button type="button" class="delete_btn">삭제</button>
        
     <script>
		$(document).ready(function() {
		    $('.delete_btn').click(function() {
		        var confirm_val = confirm("정말 삭제하시겠습니까?");
		        
		        if(confirm_val) {
		            var checkArr = [];
		            
		            $('input[type=checkbox]:checked').each(function() {
		                var cartNum = $(this).val();
		                if (!isNaN(cartNum)) { // 유효한 숫자인지 확인
		                    checkArr.push(parseInt(cartNum));
		                }
		            });
		            
		            $.ajax({
		                url: '/Shop/cartList/deleteCart',
		                type: 'POST',
		                data: { chbox : checkArr },
		                dataType: 'json',
		                success: function(result) {
		                    if(result == 1) location.reload();
		                   
		                    else alert('삭제 실패');
		                },
		                error: function(request, status, error) {
		                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		                    alert('서버 통신 중 오류가 발생했습니다.');
		                }
		            });
		        }
		    });
		});
		</script>

        
<!--          <a class="btn-outline-primary " href="Shop/Cart">
                  <button> 담기 </button></a> -->
             
             <a class="cart__bigorderbtn right" href="Shop/Cart">
             <button>쇼핑 계속하기</button></a>
          
            <button class="cart__bigorderbtn right">주문하기</button>


        </div>
    </section>
    <jsp:include page="/WEB-INF/views/Interface/footer.jsp" />
</body>
	
</html>