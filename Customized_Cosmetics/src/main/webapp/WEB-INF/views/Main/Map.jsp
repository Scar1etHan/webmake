<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <!-- basic -->
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <script defer src="../../../resources/js/Map.js"></script>
   <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD1aoZOK-RkcyObjKMWGNavJ3JJ8EogDmE&callback=initMap"></script>
   <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<!--header section start -->
	<jsp:include page="/WEB-INF/views/Interface/header.jsp"/>
  <!-- header section end -->
   <!-- map_section-->
   <div class="Map_scroll">
      <ul class="about" style="text-align: center">
      <li class="tit" style="font-weight: bolder; font-size: 20px;">찾아오시는 길</li>
      </ul>
   </div>
   <dl style="text-align: center">
      <dt>주소</dt>
      <dd>서울시 강남구 테헤란로 1길 10, 세경빌딩 3층</dd>
      <dd>2호선 강남역 11번 출구,도보 2분거리</dd>
      <dd>11번 출구,우측으로 돌아 -> KB국민은행 건물 골목 진입 - 10m직진 후 -> 3층</dd>
   </dl>
   <div
      id="map"
      style="width: 60%; height: 500px; margin: 0 auto; margin-top: 10px; margin-bottom: 50px;"
   ></div>
   <!-- footer_section -->
   <jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
</body>
   <!-- Javascript files-->
<script src="../../../resources/js/jquery.min.js"></script>
<script src="../../../resources/js/popper.min.js"></script>
<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
<script src="../../../resources/js/plugin.js"></script>
   <script src="../../../resources/js/custom.js"></script>
</html>