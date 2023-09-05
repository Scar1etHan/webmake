<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Giftshop</title>
      <!-- Link Swiper's CSS -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
      <script type="text/javascript">
         document.oncontextmenu = function(){return false;}
      </script>
   </head>
   <body>
 <!--header section start -->
	<jsp:include page="/WEB-INF/views/Interface/header.jsp"/>
  <!-- header section end -->
      <!-- banner section start -->
      <div class="banner_main">        
         <div class="swiper mySwiper">
            <div class="swiper-wrapper">
               <div class="swiper-slide">
                  <div class="banner_section">  
                     <div class="col-md-12">
                        <div class="right_img1"><img src="../../../resources/images/3.jpg"></div>
                        <div class="img-text">다음날, 피부로 느끼는<br>압도적 차이
                           <p class="img-text2">TIME RESPONSE Intensive Renewal Ampoule<br>타임 레스폰스 인텐시브 리뉴얼 엠플</p>
                           <button type="button" class="bt btn btn-outline-light">자세히보기</button>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="swiper-slide">
                  <div class="banner_section">  
                     <div class="col-md-12">
                        <div class="right_img1"><img src="../../../resources/images/1.jpg"></div>
                        <div class="img-text">오직 피부만을 위해 탄생한 AbsoluTea™<br>차원이 다른 안티에이징 솔루션
                           <p class="img-text2">TIME RESPONSE Collection<br>타임 레스폰스 콜렉션</p>
                           <button type="button" class="bt btn btn-outline-light">자세히보기</button>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="swiper-slide">
                  <div class="banner_section">  
                     <div class="col-md-12">
                        <div class="right_img1"><img src="../../../resources/images/2.jpg"></div>
                        <div class="img-text">차나무꽃의 고귀한 에너지로<br>우아하게 빛나는 피부
                           <p class="img-text2">TIME RESPONSE Skin Reserve Serum Mist<br>타임 레스폰스 스킨 리저브 세럼 미스트</p>
                           <button type="button" class="bt btn btn-outline-light">자세히보기</button>
                        </div>
                     </div>
                  </div>
               </div>
               
            </div>
            
         </div>
         <jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
        </div>
      
      <!-- Javascript files-->
      <script src="../../../resources/js/jquery.min.js"></script>
      <script src="../../../resources/js/popper.min.js"></script>
      <script src="../../../resources/js/bootstrap.bundle.min.js"></script>
      <script src="../../../resources/js/jquery-3.0.0.min.js"></script>
      <script src="../../../resources/js/plugin.js"></script>
      <!-- sidebar -->
      <script src="../../../resources/js/custom.js"></script>
      
      <!-- Swiper JS -->
      <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

      <!-- Initialize Swiper -->
      <script>
         var swiper = new Swiper(".mySwiper", {
            centeredSlides: true,
            loop: true,
            autoplay: {
               delay: 2500,
               disableOnInteraction: false,
            },
         });
      </script>
   </body>
</html>
