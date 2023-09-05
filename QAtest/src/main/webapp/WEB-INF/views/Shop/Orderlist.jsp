<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 주문 목록</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	
<!-- 페이징 처리 -->
<link rel="stylesheet" href="../../../resources/css/paginationcss/paginate.css">
<link rel="stylesheet" href="../../../resources/css/paginationcss/ligne.css">

<style>
.table-hover>tbody>tr:hover {
	background-color: skyblue;
}
.pagination-container {
    justify-content: center;
    margin-top: 20px; /* 필요한 여백 조정 */
}
.myTable {
    border-collapse: collapse; /* 핵심: 테두리 합치기 */
    width: 100%;
    border: 1px solid #ddd; /* 테두리 선 */
    text-align:center;
    margin:0 auto;
  }

  .myTable th, .myTable td {
    border: 1px solid #ddd; /* 내부 선 */
    padding: 8px;
    vertical-align: middle; /* 상하 중앙 정렬 추가 */
  }

  .myTable th {
    background-color: #f2f2f2;
  }

  .myTable tr:hover {
    background-color: #f5f5f5;
  }
</style>
<script src="../../../resources/js/paginationjs/paginate.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
	
	<div class="fixed-top">
		<jsp:include page="/WEB-INF/views/Interface/header.jsp" />
	</div>
	
	<!-- main section start -->
	<div class="container" style="margin-top: 100px; background-color: white; padding-bottom: 30px; border: 1px solid #ccc">
		<h1 class="text-center mt-5 mb-4" style="padding-top: 50px;">주문 목록</h1>
		<div class="text-right mb-3" style="margin-bottom: 10px;">
<!-- 			<button class="btn btn-success float-end"
				onclick="location.href='QABoardwrite'">글작성</button> -->
			<div class="panel col-md-8">
				<div class="body">
					<div class="input-group">
						<label for="searchBox"><h2>검색 : </h2></label>
						<input type="search" id="searchBox" placeholder="검색하는 곳"
							style="margin-left:20px;">
					</div>
				</div>
			</div>
		</div>
		
	    <table class="myTable table table-hover">	<!-- 페이징 처리구간 -->
		<!-- <table class="table table-striped table-bordered table-hover"> -->
				<tr>
					<th style="width: 7%;">주문번호</th>
					<th style="width: 10%;">주문자</th>
					<th style="width: 8%;">결제 수단</th>
					<th style="width: 13%;">주문 총액</th>
					<th style="width: 20%;">주문 날짜</th>
					<th style="width: 15%;">배송 상태</th>
					<th style="width: 25%;">배송 결정</th>
				</tr>
			<tbody>
				<c:forEach items="${totallist}" var="ol">
					<tr>
						<td>${ol.order_number}</td>
						<td>${ol.user_id}</td>
						<td>${ol.order_payment}</td>
						<td>${ol.order_total}</td>
						<td>
						  <fmt:formatDate value="${ol.order_date}" pattern="yy-MM-dd a h:mm"/>
						</td>
						<td>${ol.order_deliver}</td>
						<td>
						    <form action="${path}/Shop/OrderModify" method="post">
						        <input type="hidden" name="order_number" value="${ol.order_number}" />
						        <select name="order_deliver">
						            <option value="">배송 상태 선택</option>
						            <option value="배송 준비">배송 준비중</option>
						            <option value="배송 중">배송 중</option>
						            <option value="배송 완료">배송 완료</option>
						        </select>
						        <button type="button" class="delivercheck btn btn-primary">확인</button>
						    </form>
						</td> 
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- 하단영역(footer) -->
	<div style="padding-top:340px">
		<jsp:include page="/WEB-INF/views/Interface/footer.jsp" />
	</div>
	
	<!-- 배송 버튼 유효성 검사 js -->
	<script>
    window.onload = function() {
        let buttons = document.querySelectorAll('.delivercheck');
        
        buttons.forEach(button => {
            button.addEventListener('click', function() {
                var form = this.form;
                var select = form.querySelector('select[name=order_deliver]');
                
                if (select.value === '') {
                    alert('올바른 배송 상태 체크 바람');
                } else {
                    form.submit(); // 폼 제출
                }
            });
        });
    };
</script>
	
	<!-- 페이징 처리 및 검색 js -->
	<script>
	    let options = {
	        numberPerPage:10, 
	        goBar:true, 
	        pageCounter:true,
	    };

	    let filterOptions = {
	        el:'#searchBox' 
	    };

	    paginate.init('.myTable',options,filterOptions);
	    
	    let paginationWrap = document.querySelector('.paginate-wrap');
	    paginationWrap.style.margin = '0 auto';
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<script src="../../../resources/js/jquery.min.js"></script>
	<script src="../../../resources/js/popper.min.js"></script>
	<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
	<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
	<script src="../../../resources/js/plugin.js"></script>
</body>
</html>
