<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<title>ItemShow</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
<link rel="icon" href="images/fevicon.png" type="image/gif" />
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link href="../../../resources/css/goods.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<style>
		div.goods div.goodsInfo p.cartStock button 
							{ font-size:26px; border:none; background:none; }
							
		 section.replyForm { padding:30px 0; }
		 section.replyForm div.input_area { margin:10px 0; }
		 section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px; }
		 section.replyForm button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
		 
		 section.replyList { padding:30px 0; }
		 section.replyList ol { padding:0; margin:0; }
		 section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
		 section.replyList div.userInfo { }
		 section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
		 section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
		 section.replyList div.replyContent { padding:10px; margin:20px 0; }
		 
		 section.replyList div.replyFooter button { font-size:14px; border: 1px solid #999; background:none; margin-right:10px; }
	</style>
	
	<style>/* 모달창 코드  */
	   div.replyModal { position:relative; z-index:1; display:none; }
	   div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
	   div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
	   div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
	   div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
	   div.modalContent button.modal_cancel { margin-left:20px; }
	</style>
	
  <script type="text/javascript">
  function replyList() {
	  
		var gdsNum = ${view.gdsNum};
		$.getJSON("/Shop/ItemShow/replyList" + "?n=" + gdsNum, function(data){
			var str = "";
			
			$(data).each(function(){
				
				console.log(data);
				
				var repDate = new Date(this.repDate);
				repDate = repDate.toLocaleDateString("ko-US")
				
				str += "<li data-repNum='" + this.repNum + "'>" /* "<li data-gdsNum='" + this.gdsNum + "'>" */
					  + "<div class='userInfo'>"
					  + "<span class='userId'>" + this.user_Id + "</span>"
					  + "<span class='date'>" + repDate + "</span>"
					  + "</div>"
					  + "<div class='replyContent'>" + this.repCon + "</div>"
					  
					 + "<div class='replyFooter'>"
					 + "<button type='button' class='modify' data-repNum='" + this.repNum + "'>수정하기</button>"
					 + "<button type='button' class='delete' data-repNum='" + this.repNum + "'>삭제하기</button>"
					 + "</div>"
					  + "</li>";
					  
			});
			
			$("section.replyList ol").html(str);
		});
}
</script>

</head>

<body>

	<jsp:include page="/WEB-INF/views/Interface/header.jsp" />

	<section id="services" class="services section-bg">
		<div class="container-fluid">
			<div class="p-5 "></div>
			<!-- 여백 -->
			<div class="p-5 "></div>
			<div class="row row-sm">
				<div class="col-md-6 _boxzoom">
				
					<!-- 상품번호를 숨김 장바구니에 추가하는 기능과 소감 남기기(댓글) 기능을 이용하기 위해 -->
					<form role="form" method="post">
						<input type="hidden" name="gdsNum" value="${view.gdsNum}" />
					</form>
					<div class="_product-images">
						<div class="picZoomer">
							<img class="my_img" src="${view.gdsImg}" alt="">
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="_product-detail-content">
						<p class="_p-name" id="pName">${view.gdsName}</p>
						<div class="_p-price-box">
							<div class="p-list">
								<h1>
									제품 가격: <span id="itemPrice">${view.gdsPrice}</span>원
								</h1>

								<h2>
									총 가격: <span id="totalPrice">${view.gdsPrice}</span>원
								</h2>
							</div>
							<div class="_p-add-cart">
								<div class="_p-qty">
									<span> 재고 : ${view.gdsStock}</span>
									<br>
									<!-- <button onclick="decreaseQuantity()">-</button>
									<span id="itemQuantity">1</span>
									<button onclick="increaseQuantity()">+</button> -->
								</div>
							</div>
							<div class="_p-features">상품설명 : ${view.gdsDes}</div>

							<ul class="spe_ul"></ul>
							<div class="p-5 "></div>
							<!-- 여백 -->
							
							<p class="cartStock">
							
							<!-- 수량 추가코드  -->
								 <span>구입 수량</span>
								 <button type="button" class="plus">+</button>
								 <input type="number" class="numBox" min="1" max="${view.gdsStock}" value="1" readonly="readonly"/>
								 <button type="button" class="minus">-</button>
					 
								</p>
							
							<div class="_p-qty-and-cart">
								<div class="_p-add-cart">
									<button class="btn-theme btn buy-btn" onclick="requestPay()">
										<i class="fa fa-shopping-cart">바로 구입</i>
									</button>
									
									<a class="btn-theme btn buy-btn" href="/cartList">
									    <i class="fa fa-shopping-cart"></i> 장바구니로
									</a>

								<!-- 장바구니 담기 -->
								 <p class="addToCart">
								 <button type="button" class="addCart_btn">카트에 담기</button>	
									 <script>
										  $(".addCart_btn").click(function(){
										   var gdsNum = $("#gdsNum").val();
										   var cartStock = $(".numBox").val();
										      
										   var data = {
										     gdsNum : gdsNum,
										     cartStock : cartStock
										     };
										   
										   $.ajax({
										    url : "/Shop/ItemShow/addCart",
										    type : "post",
										    data : data,			
										    dataType: 'json',
										    success : function(result){
										    	 console.log(result);
										    	 console.log("result");
										    	if(result == 1) {
										    		alert("카트 담기 성공");
												     $(".numBox").val("1"); 
										    	}  else {
										    		alert("회원만 사용할 수 있습니다.")
										    		$(".numBox").val("1");
										    		
										    	}
										    },
										    error : function(){
										     alert("카트 담기 실패");
										    } 
										  });
									  });
								 </script>
								</p>

									<div class="p-5 "></div>
									<!-- 여백 -->
									<div class="p-1 "></div>
									<input type="hidden" name="pid" value="18" /> <input
										type="hidden" name="price" value="850" /> <input
										type="hidden" name="url" value="" />
								</div>
							</div>

						</div>
					</div>
					
				
				</div>
			</div>
		</div>
	</section>
		 
		 <hr>
		 <!-- 회원 여부 확인 후 소감 쓰기  -->
		<div id="reply">
	   <c:if test="${sessionScope.userId == null }">
	   	 <p>소감을 남기시려면 <a href="../Member/login">로그인</a>해주세요</p>
	   </c:if>
	   
	   <c:if test="${sessionScope.userId != null}">
			 <section class="replyForm">
			   <form role="form" method="post" autocomplete="off" action="ItemShow/registReply">
				   <div class="input_area">
				      <textarea name="repCon" id="repCon"></textarea>
				    </div>
				     
				     <input type="hidden" name="userId" id="userId" value="${sessionScope.userId}">
				     <input type="hidden" name="gdsNum" id="gdsNum" value="${view.gdsNum}">
				     
				   <div class="input_area">
				   	  <button type="button" id="reply_btn">소감 남기기</button>
				
					  <!-- 댓글 작성 -->
				   	  <script>
				   		 $("#reply_btn").click(function(){
						  
						  var formObj = $(".replyForm form[role='form']");
						  /* var gdsNum = $("#gdsNum").val(); */
						  var userId = $("input[name='userId']").val();
						  var gdsNum = $("input[name='gdsNum']").val();
						  var repCon = $("#repCon").val()
						  
						  var data = {
							userId : userId,
						    gdsNum : gdsNum,
						    repCon : repCon
						    };
						  
						  $.ajax({
						   url : "/Shop/ItemShow/registReply",
						   type : "post",
						   data : data,
						   success : function(){
						    replyList();
						    $("#repCon").val("");
						   }
						  });
						 });
					</script>
				   	  
				    </div>
			   </form>
		   </section>
	   </c:if>
	   
<!-- 	   <section class="replyList">
	    <ol>
	     <li>댓글 목록</li>
	       </ol>    
	   </section> -->
	   
			   <section class="replyList">
		 <ol>
	
		  </ol>    
		  <script>
		  		replyList();
		  </script>
		
		<!-- 댓글 수정 -->
		<script type="text/javascript">
			$(document).on("click", ".modify", function(){
			/* 	$(".replyModal").attr("style", "display:block;"); */
			$(".replyModal").fadeIn(200);
			
			var repNum = $(this).attr("data-repNum");
			var repCon = $(this).parent().parent().children(".replyContent").text();
			
			$(".modal_repCon").val(repCon);
			$(".modal_modify_btn").attr("data-repNum", repNum);
			});
		</script>
		
		<!-- 댓글 삭제 -->
		<script>
		
			   $(document).on("click", ".delete", function(){
			    
				var deletConfirm = confirm("정말로 삭제하시겠습니까?");
				
				if(deletConfirm){
				   
			    var data = {repNum : $(this).attr("data-repNum")};
			     
			    $.ajax({
			     url : "/Shop/ItemShow/deleteReply",
			     type : "post",
			     data : data,
			     dataType: 'json',
			     success : function(result){
			       if(result == 1) {
			    	   replyList();
			       } else {
			    	   alert("작성자 본인만 할 수 있습니다.")
			       }
			     },
			     error : function(){
			    	  alert("로그인하셔야합니다.")
			     }
			   });
			 }
		   });
	  </script>
	
		</section>
	   
	</div>
	<section class="sec bg-light">
		<div class="container">
			<div class="row">
				<div class="exp">
					<img src="../../../resources/images/exp.PNG">
				</div>

				<div class="p-5 "></div>
				<!-- 여백 -->


				<div class="col-sm-12 title_bx">
					<h3 class="title">다른 상품</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 list-slider mt-4">
					<div class="owl-carousel common_wd  owl-theme" id="recent_post">
						<div class="item">
							<div class="sq_box shadow">
								<div class="pdis_img">
									<span class="wishlist"> <a alt="Add to Wish List"
										title="Add to Wish List" href="javascript:void(0);"> <i
											class="fa fa-heart"></i></a>
									</span> <a href="#"> <img src="../../../resources/images/1.jpg">
									</a>
								</div>
								<h4 class="mb-1">
									<a href="details.php"> 상품1 </a>
								</h4>
								<div class="price-box mb-2">
									<span class="price"> Price 200 </span> <span
										class="offer-price"> Offer Price 120 </span>
								</div>
								<div class="btn-box text-center">
									<a class="btn btn-sm" href="javascript:void(0);"> <i
										class="fa fa-shopping-cart"></i> Add to Cart
									</a>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="sq_box shadow">
								<div class="pdis_img">
									<span class="wishlist"> <a alt="Add to Wish List"
										title="Add to Wish List" href="javascript:void(0);"> <i
											class="fa fa-heart"></i></a>
									</span> <a href="#"> <img src="../../../resources/images/1.jpg">
									</a>
								</div>
								<h4 class="mb-1">
									<a href="details.php"> 상품2 </a>
								</h4>
								<div class="price-box mb-2">
									<span class="price"> Price 200 </span> <span
										class="offer-price"> Offer Price 120 </span>
								</div>
								<div class="btn-box text-center">
									<a class="btn btn-sm" href="javascript:void(0);"> <i
										class="fa fa-shopping-cart"></i> Add to Cart
									</a>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="sq_box shadow">
								<div class="pdis_img">
									<span class="wishlist"> <a alt="Add to Wish List"
										title="Add to Wish List" href="javascript:void(0);"> <i
											class="fa fa-heart"></i></a>
									</span> <a href="#"> <img src="../../../resources/images/1.jpg">
									</a>
								</div>
								<h4 class="mb-1">
									<a href="#"> 상품3 </a>
								</h4>
								<div class="price-box mb-2">
									<span class="price"> Price <i class="fa fa-inr"></i> 200
									</span> <span class="offer-price"> Offer Price 120 </span>
								</div>
								<div class="btn-box text-center">
									<a class="btn btn-sm" href="javascript:void(0);"> <i
										class="fa fa-shopping-cart"></i> Add to Cart
									</a>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="sq_box shadow">
								<div class="pdis_img">
									<span class="wishlist"> <a alt="Add to Wish List"
										title="Add to Wish List" href="javascript:void(0);"> <i
											class="fa fa-heart"></i></a>
									</span> <a href="#"> <img src="../../../resources/images/1.jpg">
									</a>
								</div>
								<h4 class="mb-1">
									<a href="#"> 상품4 </a>
								</h4>
								<div class="price-box mb-2">
									<span class="price"> Price <i class="fa fa-inr"></i> 200
									</span> <span class="offer-price"> Offer Price <i
										class="fa fa-inr"></i> 120
									</span>
								</div>
								<div class="btn-box text-center">
									<a class="btn btn-sm" href="javascript:void(0);"> <i
										class="fa fa-shopping-cart"></i> Add to Cart
									</a>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="sq_box shadow">
								<div class="pdis_img">
									<span class="wishlist"> <a alt="Add to Wish List"
										title="Add to Wish List" href="javascript:void(0);"> <i
											class="fa fa-heart"></i></a>
									</span> <a href="#"> <img src=".../../../resources/images/1.jpg">
									</a>
								</div>
								<h4 class="mb-1">
									<a href="details.php"> 상품5 </a>
								</h4>
								<div class="price-box mb-2">
									<span class="price"> Price <i class="fa fa-inr"></i> 200
									</span> <span class="offer-price"> Offer Price <i
										class="fa fa-inr"></i> 120
									</span>
								</div>
								<div class="btn-box text-center">
									<a class="btn btn-sm" href="javascript:void(0);"> <i
										class="fa fa-shopping-cart"></i> Add to Cart
									</a>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="sq_box shadow">
								<div class="pdis_img">
									<span class="wishlist"> <a alt="Add to Wish List"
										title="Add to Wish List" href="javascript:void(0);"> <i
											class="fa fa-heart"></i></a>
									</span> <a href="#"> <img src="../../../resources/images/1.jpg">
									</a>
								</div>
								<h4 class="mb-1">
									<a href="details.php"> 상품6 </a>
								</h4>
								<div class="price-box mb-2">
									<span class="price"> Price <i class="fa fa-inr"></i> 200
									</span> <span class="offer-price"> Offer Price <i
										class="fa fa-inr"></i> 120
									</span>
								</div>
								<div class="btn-box text-center">
									<a class="btn btn-sm" href="javascript:void(0);"> <i
										class="fa fa-shopping-cart"></i> Add to Cart
									</a>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="sq_box shadow">
								<div class="pdis_img">
									<span class="wishlist"> <a alt="Add to Wish List"
										title="Add to Wish List" href="javascript:void(0);"> <i
											class="fa fa-heart"></i></a>
									</span> <a href="#"> <img src="../../../resources/images/1.jpg">
									</a>
								</div>
								<h4 class="mb-1">
									<a href="details.php"> 상품7 </a>
								</h4>
								<div class="price-box mb-2">
									<span class="price"> Price <i class="fa fa-inr"></i> 200
									</span> <span class="offer-price"> Offer Price <i
										class="fa fa-inr"></i> 120
									</span>
								</div>
								<div class="btn-box text-center">
									<a class="btn btn-sm" href="javascript:void(0);"> <i
										class="fa fa-shopping-cart"></i> Add to Cart
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="p-5 "></div>
	<!-- 여백 -->
	<div class="p-5 "></div>

	<jsp:include page="/WEB-INF/views/Interface/footer.jsp" />

	<!-- 제이쿼리의 선택자 기능을 이용 -->
	<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/js/jquery.min.js"></script>
	<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
	<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
	<script src="../../../resources/js/plugin.js"></script>
	<script src="../../../resources/js/custom.js"></script>
	<script src="../../../resources/js/goods.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<!-- 댓글 수정 -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script src="../../../resources/js/goods.js"></script>

	<div class="replyModal">
	
	 <div class="modalContent">
	  
	  <div>
	   <textarea class="modal_repCon" name="modal_repCon"></textarea>
	  </div>
	  
	  <div>
	   <button type="button" class="modal_modify_btn">수정</button>
	   <button type="button" class="modal_cancel">취소</button>
	  </div>
	  
	 </div>
	
	 <div class="modalBackground"></div>
	 
	</div>
	
	<script>
		$(".modal_cancel").click(function(){
		/*  $(".replyModal").attr("style", "display:none;"); */
		$(".replyModal").fadeOut(200);
	});
		
		$(".modal_modify_btn").click(function(){
			   var modifyConfirm = confirm("정말로 수정하시겠습니까?");
			   
			   if(modifyConfirm) {
			    var data = {
			       repNum : $(this).attr("data-repNum"),
			       repCon : $(".modal_repCon").val()
			      };  // ReplyVO 형태로 데이터 생성
			    
			    $.ajax({
			     url : "/Shop/ItemShow/modifyReply",
			     type : "post",
			     data : data,
			     dataType: 'json',
			     success : function(result){
			      console.log(result)
			      if(result == 1) {
			       replyList();
			       $(".replyModal").fadeOut(200);
			      } else {
			       alert("작성자 본인만 할 수 있습니다.");         
			      }
			     },
			     error : function(){
			      alert("로그인하셔야합니다.")
			     }
			    });
			   }
			   
			});
</script>
	
</body>
</html>
