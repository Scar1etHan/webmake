<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 만들기 진행중</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
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
</style>
<script src="../../../resources/js/paginationjs/paginate.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
	<div class="fixed-top">
		<jsp:include page="/WEB-INF/views/Interface/header.jsp" />
	</div>
	<!-- main section start -->
	<div class="container"
		style="margin-top: 100px; background-color: white; padding-bottom: 30px; border: 1px solid #ccc">
		<h1
			style="text-align: center; margin-top: 50px; padding-top: 50px; padding-bottom: 50px;">자주
			묻는 질문</h1>
		<div class="accordion" id="faqAccordion">
			<div class="accordion-item">
				<h2 class="accordion-header" id="faqHeading1">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#faqCollapse1"
						aria-expanded="false" aria-controls="faqCollapse1">질문 1 :
						화장품 용량은 얼마나 되나요?</button>
				</h2>
				<div id="faqCollapse1" class="accordion-collapse collapse"
					aria-labelledby="faqHeading1" data-bs-parent="#faqAccordion">
					<div class="accordion-body" style="background-color: skyblue;">↳ 답변 1 : 
						토너 80ml+샷 20ml, 에센스와 크림 40ml+샷10ml로 4:1의 비율로 토출되는 용기입니다.
						아이엔넥크림 - 50g 용기입니다.</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="faqHeading2">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#faqCollapse2"
						aria-expanded="false" aria-controls="faqCollapse2">질문 2 :
						제품에 침전물이 있는거 같습니다</button>
				</h2>
				<div id="faqCollapse2" class="accordion-collapse collapse"
					aria-labelledby="faqHeading2" data-bs-parent="#faqAccordion">
					<div class="accordion-body" style="background-color: skyblue;">↳
						답변 2 : 천연유래추출물 원료이므로 약간의 침전물과 응집이 생길 수 있으나 흔들어 사용하시면 됩니다.</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="faqHeading2">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#faqCollapse3"
						aria-expanded="false" aria-controls="faqCollapse3">질문 3 :
						구매 후 반품이 가능한 가요?</button>
				</h2>
				<div id="faqCollapse3" class="accordion-collapse collapse"
					aria-labelledby="faqHeading3" data-bs-parent="#faqAccordion">
					<div class="accordion-body" style="background-color: skyblue;">↳
						답변 3 : 본 상품을 사용전에 샘플을 보내 미리 체험을 하게 해드리고 있으며, 제품을 받았다 하더라도 개봉하지않고 단순 변심은 택배비 지불하시면 반품은 가능하나
						개봉후에는 반품이 불가합니다.</div>
				</div>
			</div>
		</div>

		<h1 class="text-center mt-5 mb-4" style="padding-top: 50px;">문의게시판</h1>
		<div class="text-right mb-3" style="margin-bottom: 10px;">
			<button class="btn btn-success float-end" onclick="location.href='QABoardwrite'">글작성</button>
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
		
	    <table class="myTable table table-hover" style="margin:0 auto">
		<!-- <table class="table table-striped table-bordered table-hover"> -->
				<tr>
					<th style="width: 5%;">번호</th>
					<th style="width: 35%;">제목</th>
					<th style="width: 15%;">작성자</th>
					<th style="width: 15%;">날짜</th>
					<th style="width: 10%;">조회수</th>
				</tr>
			<tbody>
				<c:forEach items="${list}" var="qalist">
					<tr>
						<td>${qalist.bno}</td>
						<td><a href="${path}/Board/QABoardview?bno=${qalist.bno}">${qalist.title}</a></td>
						<td>${qalist.writer}</td>
						<td>
						  <fmt:formatDate value="${qalist.regDate}" pattern="yy-MM-dd a HH:mm"/>
						</td>
						<td>${qalist.viewCnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- 하단영역(footer) -->
	<jsp:include page="/WEB-INF/views/Interface/footer.jsp" />

	<script>
	    let options = {
	        numberPerPage:5, 
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
