<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 조회</title>
	<style>
		.inputArea { margin:10px 0; }
		select { width:100px; }
		label { display:inline-block; width:70px; padding:5px; }
		label[for='gdsDes'] { display:block; }
		input { width:150px; }
		textarea#gdsDes { width:400px; height:180px; }
		
		.oriImg {width:500px; height:auto;}
		.thumbImg{}
	</style>
	   <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
   <%@ include file="interface.jsp" %>

		<form role="form" method="post" autocomplete="off">
		<input type="hidden" name="n" value="${goods.gdsNum}"/>
		<div class="inputArea">   
		   <label>1차 분류</label>
		   <span class="category1">           
		   <label>2차 분류</label>
		   <span class="category2">${goods.cateCode} 
		</div>
		
		<div class="inputArea">
		   <label for="gdsName">상품명</label>
		   <span>${goods.gdsName} 
		</div>
		
		<div class="inputArea">
		   <label for="gdsPrice">상품가격</label>
		   <span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/> 
		</div>
		
		<div class="inputArea">
		   <label for="gdsStock">상품수량</label>
		   <span>${goods.gdsStock} 
		</div>
		
		<div class="inputArea">
		   <label for="gdsDes">상품소개</label>
		   <span>${goods.gdsDes} 
		</div>
		
		<h1>이미지경로 <c:url value="${goods.gdsImg}" /></h1>
		<div class="inputArea">
			 <label for="gdsImg">이미지</label>
				 <p>원본 이미지</p>
			  <img src="<c:url value="${goods.gdsImg}" />" />
				 <p>썸네일</p>
			 <img src="${goods.gdsThumbImg}" class="thumbImg" />
		</div>
		
		<div class="inputArea">
			   <button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
			   <button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
		   
		   <script>
			    var formObj = $("form[role='form']");
			    
			    /* 수정버튼 */
			    $("#modify_Btn").click(function(){
			     formObj.attr("action", "/Admin/modifyProduct");
			     formObj.attr("method", "get")
			     formObj.submit();
			    });
			    
			    /* 삭제버튼  */
			    $("#delete_Btn").click(function(){
			    	 
			     var con = confirm("정말로 삭제하시겠습니까?");
			    	 
			     if(con) {      
			     formObj.attr("action", "/Admin/deleteProduct");
			      formObj.submit();
			       }
			     });
		   </script>
		</div>
		
		</form>
		
			<script>
				// 컨트롤러에서 데이터 받기
				var jsonData = JSON.parse('${category}');
				console.log(jsonData);
				
				var cate1Arr = new Array();
				var cate1Obj = new Object();
				
				// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
				for(var i = 0; i < jsonData.length; i++) {
				 
				 if(jsonData[i].level == "1") {
				  cate1Obj = new Object();  //초기화
				  cate1Obj.cateCode = jsonData[i].cateCode;
				  cate1Obj.cateName = jsonData[i].cateName;
				  cate1Arr.push(cate1Obj);
				 }
				}
				
				// 1차 분류 셀렉트 박스에 데이터 삽입
				var cate1Select = $("select.category1")
				
				for(var i = 0; i < cate1Arr.length; i++) {
				 cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
				      + cate1Arr[i].cateName + "</option>"); 
				}
				
				$(document).on("change", "select.category1", function(){

					 var cate2Arr = new Array();
					 var cate2Obj = new Object();
					 
					 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
					 for(var i = 0; i < jsonData.length; i++) {
					  
					  if(jsonData[i].level == "2") {
					   cate2Obj = new Object();  //초기화
					   cate2Obj.cateCode = jsonData[i].cateCode;
					   cate2Obj.cateName = jsonData[i].cateName;
					   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
					   
					   cate2Arr.push(cate2Obj);
					  }
					 }
					 
					 var cate2Select = $("select.category2");

					 for(var i = 0; i < cate2Arr.length; i++) {
					   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
					        + cate2Arr[i].cateName + "</option>");
					 } 
					});
			</script>
</body>
</html>