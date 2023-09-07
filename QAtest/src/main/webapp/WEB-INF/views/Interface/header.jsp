<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>Giftshop</title>
<!-- bootstrap css -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/style.css">
<!-- Responsive-->
<link rel="stylesheet" href="../../../resources/css/responsive.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
</head>
<body>
	<!--header section start -->
	<div class="header_section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6 col-lg-2">
					<span style="font-size: 33px; cursor: pointer; color: #ffffff;"
						onclick="openNav()"><img
						src="../../../resources/images/toggle-menu.png"
						class="toggle_menu"></span>
				</div>
				<div class="col-sm-6 col-lg-2">
					<div class="logo">
						<a href="/"><img src="../../../resources/images/ccLogo.PNG"></a>
					</div>
				</div>
				<div class="col-sm-7">
					<div class="menu_text font-weight-bold">
						<ul>
							<li><a href="../Test/Vote.jsp">피부진단</a></li>
							<li><a href="../Shop/Shop">쇼핑몰</a></li>
							<li><a href="../Main/Map">찾아오시는 길</a></li>
							<li class="nav-item dropdown"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">커뮤티니</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="../Board/FreeBoard.jsp">자유게시판</a>
									<a class="dropdown-item" href="../Board/QABoard">문의게시판</a> 
									<a class="dropdown-item" href="../Board/EventBoard.jsp">이벤트게시판</a>
									<a class="dropdown-item" href="../Board/ReviewBoard">리뷰게시판</a>
									<a class="dropdown-item" href="../Board/NoticeBoard.jsp">공지사항</a>
								</div></li>
							<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">전체 목록</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="../Member/MemberList">전체회원목록</a> 
									<a class="dropdown-item" href="../Shop/Orderlist">전체주문목록</a>
								</div>
							</li>
							<c:choose>
							    <c:when test="${empty sessionScope.loginUser}">
							        <!-- 로그인이 안된 경우 -->
							        <div class="login">
							            <span id="login_l">ㅣ</span>&nbsp;&nbsp;
							            <a href="../Member/Signcheck">회원가입</a>
							        </div>
							        <div class="login">
							            <a href="../Member/login">로그인 &nbsp;</a>
							        </div>
							    </c:when>
							    <c:otherwise>
								    <!-- 로그인된 경우 -->
								    <div class="login" style="color: white">
								    	<a href="../Member/MemberInfo?user_id=${sessionScope.loginUser.user_id}" style="color:white">내정보</a>&nbsp;&nbsp; |&nbsp;&nbsp;
								        <a href="../Shop/Orderboard" style="color:white">주문목록</a>&nbsp;&nbsp; |&nbsp;&nbsp;
								        ${sessionScope.loginUser.user_id}님 환영합니다!&nbsp;&nbsp; |&nbsp;&nbsp;
								        <a href="../Member/logout" style="color: white">로그아웃</a>
								    </div>  
								</c:otherwise> 
							</c:choose>

							<div id="myNav" class="overlay">
								<a href="javascript:void(0)" class="closebtn"
									onclick="closeNav()">&times;</a>
								<div class="overlay-content">
									<a href="/">Home</a> <a href="../Test/Vote.jsp">피부진단</a> <a
										href="../Shop/Shop.jsp">쇼핑몰</a> <a href="../Main/Map">찾아오시는
										길</a> <a href="#" class="dropdown-toggle" data-toggle="dropdown">커뮤티니</a>
									<div class="dropdown-menu overlay-content"
										style="opacity: 0.2;">
										<a class="dropdown-item" href="../Board/FreeBoard.jsp">자유게시판</a>
										<a class="dropdown-item" href="../Board/QABoard">문의게시판</a> <a
											class="dropdown-item" href="../Board/EventBoard.jsp">이벤트게시판</a>
										<a class="dropdown-item" href="../Board/ReviewBoard">리뷰게시판</a>
										<a class="dropdown-item" href="../Board/NoticeBoard.jsp">공지사항</a>
									</div>
									<a href="#">회원 수정</a>
								</div>
							</div>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- header section end -->
</body>
<!-- Javascript files-->
<script src="../../../resources/js/jquery.min.js"></script>
<script src="../../../resources/js/popper.min.js"></script>
<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
<script src="../../../resources/js/plugin.js"></script>
<!-- sidebar -->
<script src="../../../resources/js/custom.js"></script>
<script>
         function openNav() {
            document.getElementById("myNav").style.width = "100%";
         }
         function closeNav() {
            document.getElementById("myNav").style.width = "0%";
         }
      </script>
</html>