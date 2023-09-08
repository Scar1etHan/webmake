<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title></title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../../../resources/css/k-result2-styles.css" rel="stylesheet" />
	        <style>
	        .product {
	          width: 80%;
			 display: flex;
			 align-items: center;
		      justify-content: space-between;
			}
			.product-text{
			 /* border:1px solid black; */
			 width: 400px;
			 height: auto;
			}
			.container{
			margin: 20px;
			}
	        </style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
google.charts.load('current', {'packages': ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
// 데이터 선언 및 초기화
	var data = google.visualization.arrayToDataTable([
    	['Name', 'Value'],
        ['Item 1', 20],
        ['Item 2', 40],
        ['Item 3', 45],
        ['Item 4', 100]
     ]);

      // 옵션 설정
     var options = {
         title: 'Example Bar Chart (Horizontal)',
         hAxis: {
         title: 'Value',
         minValue: 0
         },
         vAxis: {
         title: 'Name'
         },
         bars: 'horizontal'
         };
         // 차트를 생성하고, HTML 태그에 그려주기
         var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
         chart.draw(data, options);
        }
    </script>
      </head>
    <body>
    <jsp:include page="/WEB-INF/views/Interface/header.jsp"/>
    <center>
    
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
        	<br>
        	<h2 align="center">000님의 피부진단 결과</h2>
             <hr>   
            <div>
             	<div id="chart_div" style="width: 900px; height: 400px;"></div>
             	
            </div>
            <hr>
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-5"><img src="../images/피부타입-DRNT.PNG" class="img" alt="image"></div>
                <div class="col-lg-7">
                    <h3 class="font-weight-light">나의 피부타입 ?</h3>
                    <p>DRPT 건성/저항/색소/탄력 
							민감한 피부는 아니나 계절에 변화에 따라 피부가 건조해지면서 각질이 올라오러나 가려움이 유발될 수 있다. 
							자외선에 의해 색소침착 및 피부트러블이 생기기 쉬우니 자외선 차단에 신경을 써야합니다.
							보습/ 자외선차단/ 미백에 주안점을 두고 제품을 선정하는것이 좋습니다.</p>
                   
                </div>
            </div>
            <!-- 추천 제품 -->
            <div >
            <hr>
                <h2 >000고객님 맞춤상품</h2>
                   <div class="product1">
                      <img src="../images/사진13.PNG" width="200" hight="350" class="img" alt="image">
                           <p class="product-text" >Lorem iaaaaa aaaaaaaaa a aaaa aaaaa a aaa a a aaaaaaaaaaaaaaaa aaaaaaaaa aaaaaaaaaaa aaaaaa a
                            a aaaaaaaa a aaaaaa aaaaa psum dolor sit amet, consectetur adipisici
                            ng elit.Rem magni quas ex numquam, maxime minus quam molestias corporis
                             quod, ea minima accusamus.<p>
                        	<a class="btn btn-primary" href="#!">상품 상세보기</a>
                        	
                        	<div>
                        </div>
                    </div>
                </div>
            <!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">"좋은 스킨케어는 평생의 약속입니다."  - 조지아 루이스</p></div>
            </div>
            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5">
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                             <h2 class="card-title">추천</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">추천</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod tenetur ex natus at dolorem enim! Nesciunt pariatur voluptatem sunt quam eaque, vel, non in id dolore voluptates quos eligendi labore.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">추천</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- Footer-->
        <div id="footer"></div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    	</center>
    	<jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
    </body>
<script src="../../../resources/js/jquery.min.js"></script>
<script src="../../../resources/js/popper.min.js"></script>
<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jquery-3.0.0.min.js"></script>
<script src="../../../resources/js/plugin.js"></script>
</html>
