<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>피부진단</title>
 	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<link href="../css/Vote.css" rel="stylesheet">
	<script async src="../js/Vote.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">   
		$(document).ready( function() {
			$("#header").load("../Interface/header.jsp");
			$("#footer").load("../Interface/footer.jsp");
	});
	</script>
</head>
<body>

	
	 <!-- 중앙 묶음asd -->
	  <div id="header"></div>


 <div class="p-5 "></div>

	
	<div class="container">
		<div class="col-sm-12">
			<div class="mm-survey">

				<div class="mm-survey-progress">
					<div class="mm-survey-progress-bar mm-progress"></div>
				</div>

				<div class="mm-survey-results">
					<div class="mm-survey-results-container">
						<h4 class="mm-survey-results-score"></h4>
						<ul class="mm-survey-results-list"></ul>
					</div>
					<div class="mm-survey-results-controller">
						<div class="mm-back-btn">
							<button>뒤로</button>
						</div>
					</div>
				</div>

				<div class="mm-survey-bottom">
					<div class="mm-survey-container">
					
						<!-- 원본
						<div class="mm-survey-page active" data-page="1">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>1.클렌징 후에 아무것도 바르지 않고 2~3시간 이후 밝은 빛 아래 거울에서 이마와 볼이 어떻게 보이고 느껴집니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio01" data-item="1" name="radio1" value="1" />
									<label for="radio01"><span></span><p>1.매우 거칠고, 버석거리고 각질이 들떠 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio02" data-item="1" name="radio1" value="2" />
									<label for="radio02"><span></span><p>2.당깁니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio03" data-item="1" name="radio1" value="3" />
									<label for="radio03"><span></span><p>3.당기지 않고 건조해 보이지 않고 번들거리지 않습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio04" data-item="1" name="radio1" value="4" />
									<label for="radio04"><span></span><p>4.밝은 빛에 반사되는 듯이 번들거립니다.</p></label>
								</div>
							</div>
						</div> 
						-->

						<div class="mm-survey-page active" data-page="1">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>1-1.클렌징 후에 아무것도 바르지 않고 2~3시간 이후 밝은 빛 아래 거울에서 이마와 볼이 어떻게 보이고 느껴집니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio01" data-item="1" name="radio1" value="1" />
									<label for="radio01"><span></span><p>1.매우 거칠고, 버석거리고 각질이 들떠 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio02" data-item="1" name="radio1" value="2" />
									<label for="radio02"><span></span><p>2.당깁니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio03" data-item="1" name="radio1" value="3" />
									<label for="radio03"><span></span><p>3.당기지 않고 건조해 보이지 않고 번들거리지 않습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio04" data-item="1" name="radio1" value="4" />
									<label for="radio04"><span></span><p>4.밝은 빛에 반사되는 듯이 번들거립니다.</p></label>
								</div>
							</div>
							</div>
							<div class="mm-survey-page" data-page="2">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>1-2.사진을 찍었을 때, 피부가 번들거립니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio05" data-item="2" name="radio2" value="1" />
									<label for="radio05"><span></span><p>1.결코 그렇지 않습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio06" data-item="2" name="radio2" value="2" />
									<label for="radio06"><span></span><p>2.때때로 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio07" data-item="2" name="radio2" value="3" />
									<label for="radio07"><span></span><p>3.자주 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio08" data-item="2" name="radio2" value="4" />
									<label for="radio08"><span></span><p>4.항상 그렇습니다.</p></label>
								</div>
							</div>
							</div>
							<div class="mm-survey-page" data-page="3">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>1-3.질문지 메이크업 파운데이션(파운더는 안 바른 상태)을 바른 지 2~3시간 후에 메이크업 상태가 어떻습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio09" data-item="3" name="radio3" value="1" />
									<label for="radio09"><span></span><p>1.약간 들떠 보이고 주름진 부분이 나타납니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio10" data-item="3" name="radio3" value="2" />
									<label for="radio10"><span></span><p>2.부드러워 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio11" data-item="3" name="radio3" value="3" />
									<label for="radio11"><span></span><p>3.번들거립니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio12" data-item="3" name="radio3" value="4" />
									<label for="radio12"><span></span><p>4.고정이 안 되고 번들거립니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio13" data-item="3" name="radio3" value="5" />
									<label for="radio13"><span></span><p>5.페이셜 파운데이션을 바르지 않습니다.</p></label>
								</div>
							</div>
							</div>
							<div class="mm-survey-page" data-page="4">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>1-4.건조할 때 모이스처라이저를 바르지 않으면 피부가 어떠합니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio14" data-item="4" name="radio4" value="1" />
									<label for="radio14"><span></span><p>1.건조하고 갈라질 것 같습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio15" data-item="4" name="radio4" value="2" />
									<label for="radio15"><span></span><p>2.당김을 느낍니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio16" data-item="4" name="radio4" value="3" />
									<label for="radio16"><span></span><p>3.정상적입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio17" data-item="4" name="radio4" value="4" />
									<label for="radio17"><span></span><p>4.번들거리고 모이스처라이저가 필요 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio18" data-item="4" name="radio4" value="5" />
									<label for="radio18"><span></span><p>5.잘모르겠습니다.</p></label>
								</div>
							</div>
							</div>
							<div class="mm-survey-page" data-page="5">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>1-5.확대경으로 보았을 때, 모공이 많고 사이즈가 커 보입니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio19" data-item="5" name="radio5" value="1" />
									<label for="radio19"><span></span><p>1.아니오</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio20" data-item="5" name="radio5" value="2" />
									<label for="radio20"><span></span><p>2.이마와 코가 두드러져 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio21" data-item="5" name="radio5" value="3" />
									<label for="radio21"><span></span><p>3.많이 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio22" data-item="5" name="radio5" value="4" />
									<label for="radio22"><span></span><p>4.엄청 많이 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio23" data-item="5" name="radio5" value="5" />
									<label for="radio23"><span></span><p>5.잘모르겠습니다.</p></label>
								</div>
							</div>
							</div>
							<div class="mm-survey-page" data-page="6">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>1-6.평소 당신의 피부 타입을 어떻게 생각하고 계십니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio24" data-item="6" name="radio6" value="1" />
									<label for="radio24"><span></span><p>1.건성</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio25" data-item="6" name="radio6" value="2" />
									<label for="radio25"><span></span><p>2.중성</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio26" data-item="6" name="radio6" value="3" />
									<label for="radio26"><span></span><p>3.복합</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio27" data-item="6" name="radio6" value="4" />
									<label for="radio27"><span></span><p>4.지성</p></label>
								</div>
							</div>
							</div>
							<div class="mm-survey-page" data-page="7">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>1-7.거품이 많이 나는 비누를 사용할 때 피부의 상태는 어떠합니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio28" data-item="7" name="radio7" value="1" />
									<label for="radio28"><span></span><p>1.건조하고 갈라집니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio29" data-item="7" name="radio7" value="2" />
									<label for="radio29"><span></span><p>2.약간 건조하고 갈라지지는 않습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio30" data-item="7" name="radio7" value="3" />
									<label for="radio30"><span></span><p>3.정상적입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio31" data-item="7" name="radio7" value="4" />
									<label for="radio31"><span></span><p>4.금방 유분기가 올라옵니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio32" data-item="7" name="radio7" value="5" />
									<label for="radio32"><span></span><p>5.비누나 거품이 나는 클렌저를 사용하지 않습니다.(그 이유가 피부가 건조해져서 그렇다면 1번을 선택하십시오.)</p></label>
								</div>
							</div>
							</div>
							<div class="mm-survey-page" data-page="8">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>1-8.모이스처라이저를 안 발랐을 때 피부가 당기는 느낌이 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio33" data-item="8" name="radio8" value="1" />
									<label for="radio33"><span></span><p>1.항상 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio34" data-item="8" name="radio8" value="2" />
									<label for="radio34"><span></span><p>2.때때로 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio35" data-item="8" name="radio8" value="3" />
									<label for="radio35"><span></span><p>3.거의 그렇지 않습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio36" data-item="8" name="radio8" value="4" />
									<label for="radio36"><span></span><p>4.결코 그렇지 않습니다.</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="9">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>1-9.화이트헤드나 블랙헤드가 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio37" data-item="9" name="radio8" value="1" />
									<label for="radio37"><span></span><p>1.항상 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio38" data-item="9" name="radio8" value="2" />
									<label for="radio38"><span></span><p>2.때때로 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio39" data-item="9" name="radio8" value="3" />
									<label for="radio39"><span></span><p>3.거의 그렇지 않습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio40" data-item="9" name="radio8" value="4" />
									<label for="radio40"><span></span><p>4.결코 그렇지 않습니다.</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="10">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>1-10.이마와 코 부위가 번들거리는 느낌이 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio41" data-item="10" name="radio10" value="1" />
									<label for="radio41"><span></span><p>1.항상 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio42" data-item="10" name="radio10" value="2" />
									<label for="radio42"><span></span><p>2.때때로 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio43" data-item="10" name="radio10" value="3" />
									<label for="radio43"><span></span><p>3.거의 그렇지 않습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio44" data-item="10" name="radio10" value="4" />
									<label for="radio44"><span></span><p>4.결코 그렇지 않습니다.</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="11">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>1-11.모이스처라이저를 바르고 2~3시간 후 볼 부위의 피부 상태는 어떻습니까? </p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio45" data-item="11" name="radio11" value="1" />
									<label for="radio45"><span></span><p>1.항상 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio46" data-item="11" name="radio11" value="2" />
									<label for="radio46"><span></span><p>2.때때로 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio47" data-item="11" name="radio11" value="3" />
									<label for="radio47"><span></span><p>3.거의 그렇지 않습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio48" data-item="11" name="radio11" value="4" />
									<label for="radio48"><span></span><p>4.결코 그렇지 않습니다.</p></label>
								</div>
							</div>
						</div> 								
						<div class="mm-survey-page" data-page="12">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-1.얼굴에 붉은 여드름이 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio49" data-item="12" name="radio12" value="1" />
									<label for="radio49"><span></span><p>1.결코 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio50" data-item="12" name="radio12" value="2" />
									<label for="radio50"><span></span><p>2.거의 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio51" data-item="12" name="radio12" value="3" />
									<label for="radio51"><span></span><p>3.최소 달에서 한 번 정도 나타납니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio52" data-item="12" name="radio12" value="4" />
									<label for="radio52"><span></span><p>4.최소 주에 한 번 정도 나타납니다..</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="13">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-2.클렌저, 토너, 모이스처라이저를 비롯한 화장품을 피부에 적용했을 떄 발진이나, 가렵고 쏘는 듯한 증상이 나타납니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio53" data-item="13" name="radio13" value="1" />
									<label for="radio53"><span></span><p>1.결코 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio54" data-item="13" name="radio13" value="2" />
									<label for="radio54"><span></span><p>2.거의 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio55" data-item="13" name="radio13" value="3" />
									<label for="radio55"><span></span><p>3.자주 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio56" data-item="13" name="radio13" value="4" />
									<label for="radio56"><span></span><p>4.항상 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio57" data-item="13" name="radio13" value="5" />
									<label for="radio57"><span></span><p>5.제품을 바르지 않습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="14">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-3.여드름이나 로사시아로 진단받은 적이 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio58" data-item="14" name="radio14" value="1" />
									<label for="radio58"><span></span><p>1.아니오.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio59" data-item="14" name="radio14" value="2" />
									<label for="radio59"><span></span><p>2.다른 사람들이 볼때 그렇다고 합니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio60" data-item="14" name="radio14" value="3" />
									<label for="radio60"><span></span><p>3.네, 약간 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio61" data-item="14" name="radio14" value="4" />
									<label for="radio61"><span></span><p>4.네, 심각한 정도입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio62" data-item="14" name="radio14" value="5" />
									<label for="radio62"><span></span><p>5.모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="15">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-4.액세서리를 하면 피부에 무언가 얼마나 자주 올라옵니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio63" data-item="15" name="radio15" value="1" />
									<label for="radio63"><span></span><p>1.결코 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio64" data-item="15" name="radio15" value="2" />
									<label for="radio64"><span></span><p>2.거의 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio65" data-item="15" name="radio15" value="3" />
									<label for="radio65"><span></span><p>3.자주 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio66" data-item="15" name="radio15" value="4" />
									<label for="radio66"><span></span><p>4.항상 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio67" data-item="15" name="radio15" value="5" />
									<label for="radio67"><span></span><p>5.잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="16">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-5.자외선 차단제 사용 후 피부가 가렵거나 붉게 타는 듯한 느낌, 여드름이 올라온 적이 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio68" data-item="16" name="radio16" value="1" />
									<label for="radio68"><span></span><p>1.결코 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio69" data-item="16" name="radio16" value="2" />
									<label for="radio69"><span></span><p>2.거의 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio70" data-item="16" name="radio16" value="3" />
									<label for="radio70"><span></span><p>3.자주 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio71" data-item="16" name="radio16" value="4" />
									<label for="radio71"><span></span><p>4.항상 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio72" data-item="16" name="radio16" value="5" />
									<label for="radio72"><span></span><p>5.잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="17">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-6.아토피, 습진 또는 접촉성 피부염으로 진단받은 적이 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio73" data-item="17" name="radio17" value="1" />
									<label for="radio73"><span></span><p>1.아니오</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio74" data-item="17" name="radio17" value="2" />
									<label for="radio74"><span></span><p>2.다른 사람들이 볼 때 그렇다고 합니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio75" data-item="17" name="radio17" value="3" />
									<label for="radio75"><span></span><p>3.네, 약간 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio76" data-item="17" name="radio17" value="4" />
									<label for="radio76"><span></span><p>4.네, 심각한 정도입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio77" data-item="17" name="radio17" value="5" />
									<label for="radio77"><span></span><p>5.모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="18">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-7.반지를 꼈던 자리에 붉게 발진이 나타납니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio78" data-item="18" name="radio18" value="1" />
									<label for="radio78"><span></span><p>1.결코 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio79" data-item="18" name="radio18" value="2" />
									<label for="radio79"><span></span><p>2.거의 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio80" data-item="18" name="radio18" value="3" />
									<label for="radio80"><span></span><p>3.자주 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio81" data-item="18" name="radio18" value="4" />
									<label for="radio81"><span></span><p>4.항상 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio82" data-item="18" name="radio18" value="5" />
									<label for="radio82"><span></span><p>5.반지를 끼지 않습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="19">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-8.향이 강한 화장품 사용 후 피부가 간지럽거나 건조하고 뒤집어진 적이 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio83" data-item="19" name="radio19" value="1" />
									<label for="radio83"><span></span><p>1.결코 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio84" data-item="19" name="radio19" value="2" />
									<label for="radio84"><span></span><p>2.거의 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio85" data-item="19" name="radio19" value="3" />
									<label for="radio85"><span></span><p>3.자주 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio86" data-item="19" name="radio19" value="4" />
									<label for="radio86"><span></span><p>4.항상 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio87" data-item="19" name="radio19" value="5" />
									<label for="radio87"><span></span><p>5.위와 같은 타입의 제품을 사용하지 않습니다.(그 이유가 위의 현상 때문이라면 1번을 체크해주세요)</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="20">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-9.여행 시 호텔에서 제공되는 화장품을 사용하고 나서 문제가 없었습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio88" data-item="20" name="radio20" value="1" />
									<label for="radio88"><span></span><p>1.결코 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio89" data-item="20" name="radio20" value="2" />
									<label for="radio89"><span></span><p>2.거의 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio90" data-item="20" name="radio20" value="3" />
									<label for="radio90"><span></span><p>3.피부가 간지럽고 붉어지고 또는 무언가 올라옵니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio91" data-item="20" name="radio20" value="4" />
									<label for="radio91"><span></span><p>4.사용하지 않습니다. 과거에 문제를 겪었기 때문입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio92" data-item="20" name="radio20" value="5" />
									<label for="radio92"><span></span><p>5.평소 쓰는 제품을 가지고 다녀서 잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="21">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-10.가족 중에 아토피, 습진, 알레르기, 천식을 가지고 있는 사람이 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio93" data-item="21" name="radio21" value="1" />
									<label for="radio93"><span></span><p>1.없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio94" data-item="21" name="radio21" value="2" />
									<label for="radio94"><span></span><p>2.한 명 정도 있습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio95" data-item="21" name="radio21" value="3" />
									<label for="radio95"><span></span><p>3.여러명 있습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio96" data-item="21" name="radio21" value="4" />
									<label for="radio96"><span></span><p>4.많습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio97" data-item="21" name="radio21" value="5" />
									<label for="radio97"><span></span><p>5.잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="22">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-11.향기나는 세제나 정전기 방지제를 사용한 옷을 입을 때 어떻습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio98" data-item="22" name="radio22" value="1" />
									<label for="radio98"><span></span><p>1.괜찮습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio99" data-item="22" name="radio22" value="2" />
									<label for="radio99"><span></span><p>2.약간 드라이합니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio100" data-item="22" name="radio22" value="3" />
									<label for="radio100"><span></span><p>3.가렵습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio101" data-item="22" name="radio22" value="4" />
									<label for="radio101"><span></span><p>4.가렵고 무언가 올라옵니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio102" data-item="22" name="radio22" value="5" />
									<label for="radio102"><span></span><p>5.사용하지 않거나 잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="23">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-12.운동, 스트레스, 감정 변화 등으로 얼굴과 목이 얼마나 자주 붉어집니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio103" data-item="23" name="radio23" value="1" />
									<label for="radio103"><span></span><p>1.결코 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio104" data-item="23" name="radio23" value="2" />
									<label for="radio104"><span></span><p>2.때떄로 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio105" data-item="23" name="radio23" value="3" />
									<label for="radio105"><span></span><p>3.자주 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio106" data-item="23" name="radio23" value="4" />
									<label for="radio106"><span></span><p>4.항상 그렇습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="24">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-13.술을 마시면 피부가 붉어지거나 타는 듯한 느낌이 얼마나 자주 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio107" data-item="24" name="radio24" value="1" />
									<label for="radio107"><span></span><p>1.결코 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio108" data-item="24" name="radio24" value="2" />
									<label for="radio108"><span></span><p>2.때때로 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio109" data-item="24" name="radio24" value="3" />
									<label for="radio109"><span></span><p>3.자주 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio110" data-item="24" name="radio24" value="4" />
									<label for="radio110"><span></span><p>4.항상 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio111" data-item="24" name="radio24" value="5" />
									<label for="radio111"><span></span><p>5.음주를 하지 않습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="25">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-14.매운 음식이나 뜨거운 음식을 먹으면 피부가 붉어지거나 달아오르는 느낌이 얼마나 자주 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio112" data-item="25" name="radio25" value="1" />
									<label for="radio112"><span></span><p>1.결코 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio113" data-item="25" name="radio25" value="2" />
									<label for="radio113"><span></span><p>2.때때로 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio114" data-item="25" name="radio25" value="3" />
									<label for="radio114"><span></span><p>3.자주 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio115" data-item="25" name="radio25" value="4" />
									<label for="radio115"><span></span><p>4.항상 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio116" data-item="25" name="radio25" value="5" />
									<label for="radio116"><span></span><p>5.매운 음식을 먹지 않습니다.(그 이유가 위의 현상 때문이라면 1번을 체그해주세요.)</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="26">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-15.얼굴과 특히 코 주변에 눈에 띄는 붉음증이나 혈관 확장된 부분이 얼마나 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio117" data-item="26" name="radio26" value="1" />
									<label for="radio117"><span></span><p>1.결코 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio118" data-item="26" name="radio26" value="2" />
									<label for="radio118"><span></span><p>2.거의 없습니다.(코를 포함해서 1~3부분)</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio119" data-item="26" name="radio26" value="3" />
									<label for="radio119"><span></span><p>3.약간 있습니다.(코를 포함해서 4~6부분)</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio120" data-item="26" name="radio26" value="4" />
									<label for="radio120"><span></span><p>4.항상 그렇습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="27">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-16.사진 찍을 때 얼굴이 붉습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio121" data-item="27" name="radio27" value="1" />
									<label for="radio121"><span></span><p>1.결코 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio122" data-item="27" name="radio27" value="2" />
									<label for="radio122"><span></span><p>2.때때로 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio123" data-item="27" name="radio27" value="3" />
									<label for="radio123"><span></span><p>3.자주 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio124" data-item="27" name="radio27" value="4" />
									<label for="radio124"><span></span><p>4.항상 그렇습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="28">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-17.실제로 선번을 입지 않았는데도 그렇게 보여집니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio125" data-item="28" name="radio28" value="1" />
									<label for="radio125"><span></span><p>1.결코 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio126" data-item="28" name="radio28" value="2" />
									<label for="radio126"><span></span><p>2.때때로 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio127" data-item="28" name="radio28" value="3" />
									<label for="radio127"><span></span><p>3.자주 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio128" data-item="28" name="radio28" value="4" />
									<label for="radio128"><span></span><p>4.항상 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio129" data-item="28" name="radio28" value="5" />
									<label for="radio129"><span></span><p>5.항상 선번을 입습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="29">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>2-18.스킨케어 및 메이크업 제품으로 피부가 가렵거나, 붓거나, 붉어지는 증상을 가지고 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio130" data-item="29" name="radio29" value="1" />
									<label for="radio130"><span></span><p>1.결코 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio131" data-item="29" name="radio29" value="2" />
									<label for="radio131"><span></span><p>2.때때로 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio132" data-item="29" name="radio29" value="3" />
									<label for="radio132"><span></span><p>3.자주 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio133" data-item="29" name="radio29" value="4" />
									<label for="radio133"><span></span><p>4.항상 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio134" data-item="29" name="radio29" value="5" />
									<label for="radio134"><span></span><p>5.제품을 사용하지 않는다.(그 이유가 위의 현상 때문이라면 4번을 체크해주세요)</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="30">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>3-1. 여드름이나 피부 속으로 파고드는 인그로운 헤어가 발생한 후에 다크스팟이 생깁니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio135" data-item="30" name="radio30" value="1" />
									<label for="radio135"><span></span><p>1.없거나 본 적이 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio136" data-item="30" name="radio30" value="2" />
									<label for="radio136"><span></span><p>2.때때로 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio137" data-item="30" name="radio30" value="3" />
									<label for="radio137"><span></span><p>3.자주 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio138" data-item="30" name="radio30" value="4" />
									<label for="radio138"><span></span><p>4.항상 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio139" data-item="30" name="radio30" value="5" />
									<label for="radio139"><span></span><p>5.여드름이나 인그로운 헤어가 없습니다.</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="31">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>3-2. 무언가에 베이거나 상처가 생기고 난 후, 어둡거나 붉은 기가 얼마나 오래도록 남아있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio140" data-item="31" name="radio31" value="1" />
									<label for="radio140"><span></span><p>1.없거나 본 적 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio141" data-item="31" name="radio31" value="2" />
									<label for="radio141"><span></span><p>2.1주 정도 남아있습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio142" data-item="31" name="radio31" value="3" />
									<label for="radio142"><span></span><p>3.몇 주 정도 남아있습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio143" data-item="31" name="radio31" value="4" />
									<label for="radio143"><span></span><p>4.여러 달 남아있습니다.</p></label>
								</div>
							</div>
						</div>  
						
						<div class="mm-survey-page" data-page="32">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>3-3. 임신이나 피임약 복용, 호르몬 대체요법 시 과하게 색소침착 된 부분이 얼마나 많이 있었습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio144" data-item="32" name="radio32" value="1" />
									<label for="radio144"><span></span><p>1.없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio145" data-item="32" name="radio32" value="2" />
									<label for="radio145"><span></span><p>2.한 구역 있습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio146" data-item="32" name="radio32" value="3" />
									<label for="radio146"><span></span><p>3.여러 구역 있습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio147" data-item="32" name="radio32" value="4" />
									<label for="radio147"><span></span><p>4.엄청 많습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio148" data-item="32" name="radio32" value="5" />
									<label for="radio148"><span></span><p>5.본인에게 해당이 되지 않습니다.(남성이거나 임신 및 피임약, 호르몬 대체요법을 경험한 적이 없다.)</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="33">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>3-4. 윗입술이나 양 볼에 어두운 부분이 있습니까? 또는 과거 있었던 적이 있어 시술 등으로 제거했습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio149" data-item="33" name="radio33" value="1" />
									<label for="radio149"><span></span><p>1.없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio150" data-item="33" name="radio33" value="2" />
									<label for="radio150"><span></span><p>2.잘 모르겠습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio151" data-item="33" name="radio33" value="3" />
									<label for="radio151"><span></span><p>3.약간 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio152" data-item="33" name="radio33" value="4" />
									<label for="radio152"><span></span><p>4.여러 부분 보입니다.</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="34">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>3-5. 햇빛을 오래 쬐면 피부 위에 있는 어두운 부분들이 더 심해집니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio153" data-item="34" name="radio34" value="1" />
									<label for="radio153"><span></span><p>1.어두운 패치 부위가 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio154" data-item="34" name="radio34" value="2" />
									<label for="radio154"><span></span><p>2.잘 모르겠습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio155" data-item="34" name="radio34" value="3" />
									<label for="radio155"><span></span><p>3.약간 심해집니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio156" data-item="34" name="radio34" value="4" />
									<label for="radio156"><span></span><p>4.많이 심해집니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio157" data-item="34" name="radio34" value="5" />
									<label for="radio157"><span></span><p>5.선크림을 매일 바르고 가급적 햇빛을 보지 않습니다.(그 이유가 위의 현상 때문이라면 4번을 체크해주세요.)</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="35">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>3-6. 기미, 좀 옅거나 어두운 갈색 또는 회색의 스팟이 있다고 진단받은 적이 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio158" data-item="35" name="radio35" value="1" />
									<label for="radio158"><span></span><p>1.없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio159" data-item="35" name="radio35" value="2" />
									<label for="radio159"><span></span><p>2.그런 적이 있지만, 지금은 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio160" data-item="35" name="radio35" value="3" />
									<label for="radio160"><span></span><p>3.지금도 있습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio161" data-item="35" name="radio35" value="4" />
									<label for="radio161"><span></span><p>4.심각하게 많습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio162" data-item="35" name="radio35" value="5" />
									<label for="radio162"><span></span><p>5.잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="36">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>3-7. 얼굴, 가슴, 등 또는 팔에 작은 갈색의 스팟들을 가지고 있거나 가졌던 적이 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio163" data-item="36" name="radio36" value="1" />
									<label for="radio163"><span></span><p>1.없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio164" data-item="36" name="radio36" value="2" />
									<label for="radio164"><span></span><p>2.약간 있습니다(1~5개).</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio165" data-item="36" name="radio36" value="3" />
									<label for="radio165"><span></span><p>3.많이 있습니다(6~15개).</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio166" data-item="36" name="radio36" value="4" />
									<label for="radio166"><span></span><p>4.엄청 많습니다(16개 이상).</p></label>
								</div>
							</div>
						</div>   
						<div class="mm-survey-page" data-page="37">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>3-8. 몇 달 만에 처음으로 햇빛에 노출되었을 때 피부는 어떻습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio167" data-item="37" name="radio37" value="1" />
									<label for="radio167"><span></span><p>1.빨갛게 변합니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio168" data-item="37" name="radio37" value="2" />
									<label for="radio168"><span></span><p>2.붉게 변하고 나서 어두워집니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio169" data-item="37" name="radio37" value="3" />
									<label for="radio169"><span></span><p>3.점점 어두워집니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio170" data-item="37" name="radio37" value="4" />
									<label for="radio170"><span></span><p>4.피부가 검거나 검게 변했다는 것을 잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="38">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>3-9. 몇 일 동안 지속적으로 햇볕을 본다면 무슨 일이 일어납니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio171" data-item="38" name="radio38" value="1" />
									<label for="radio171"><span></span><p>1.선번과 물집이 나타나나 피부 색은 변화하지 않습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio172" data-item="38" name="radio38" value="2" />
									<label for="radio172"><span></span><p>2.피부가 좀 더 어두워집니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio173" data-item="38" name="radio38" value="3" />
									<label for="radio173"><span></span><p>3.피부가 많이 어두워집니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio174" data-item="38" name="radio38" value="4" />
									<label for="radio174"><span></span><p>4.피부가 이미 검은 편입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio175" data-item="38" name="radio38" value="5" />
									<label for="radio175"><span></span><p>5.잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="39">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>3-10. 염색을 하지 않았을 때 원래 머리색은 무슨 색 입니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio176" data-item="39" name="radio39" value="1" />
									<label for="radio176"><span></span><p>1.없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio177" data-item="39" name="radio39" value="2" />
									<label for="radio177"><span></span><p>2.그런 적이 있지만, 지금은 없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio178" data-item="39" name="radio39" value="3" />
									<label for="radio178"><span></span><p>3.지금도 있습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio179" data-item="39" name="radio39" value="4" />
									<label for="radio179"><span></span><p>4.심각하게 많습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio180" data-item="39" name="radio39" value="5" />
									<label for="radio180"><span></span><p>5.잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="40">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-1. 얼굴에 주름이 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio181" data-item="40" name="radio40" value="1" />
									<label for="radio181"><span></span><p>1.아니오, 웃거나 찡그리거나 눈썹을 들어올려도 주름이 생기지 않습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio182" data-item="40" name="radio40" value="2" />
									<label for="radio182"><span></span><p>2.표정을 지을때만 생깁니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio183" data-item="40" name="radio40" value="3" />
									<label for="radio183"><span></span><p>3.표정을 지을 때도 생기고 표정을 짓지 않아도 주름이 있습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio184" data-item="40" name="radio40" value="4" />
									<label for="radio184"><span></span><p>4.별다른 표정을 짓고 있지 않아도 주름이 많이 있습니다.</p></label>
								</div>
							</div>
						</div>     
						<div class="mm-survey-page" data-page="41">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-2. 당신의 어머니의 피부나이는 얼마로 보이십니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio185" data-item="41" name="radio41" value="1" />
									<label for="radio185"><span></span><p>1.나이보다 5~10년 어려보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio186" data-item="41" name="radio41" value="2" />
									<label for="radio186"><span></span><p>2.나이 그대로 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio187" data-item="41" name="radio41" value="3" />
									<label for="radio187"><span></span><p>3.5년정도 더 나이 들어 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio188" data-item="41" name="radio41" value="4" />
									<label for="radio188"><span></span><p>4.5년 이상 더 나이 들어보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio189" data-item="41" name="radio41" value="5" />
									<label for="radio189"><span></span><p>5.잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="42">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-3. 당신의 아버지의 피부 나이는 얼마로 보입니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio190" data-item="42" name="radio42" value="1" />
									<label for="radio190"><span></span><p>1.나이보다 5~10년 어려보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio191" data-item="42" name="radio42" value="2" />
									<label for="radio191"><span></span><p>2.나이 그대로 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio192" data-item="42" name="radio42" value="3" />
									<label for="radio192"><span></span><p>3.5년정도 더 나이 들어 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio193" data-item="42" name="radio42" value="4" />
									<label for="radio193"><span></span><p>4.5년 이상 더 나이 들어보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio194" data-item="42" name="radio42" value="5" />
									<label for="radio194"><span></span><p>5.잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="43">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-4. 당신의 외할머니 피부 나이는 얼마로 보이십니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio195" data-item="43" name="radio43" value="1" />
									<label for="radio195"><span></span><p>1.나이보다 5~10년 어려보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio196" data-item="43" name="radio43" value="2" />
									<label for="radio196"><span></span><p>2.나이 그대로 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio197" data-item="43" name="radio43" value="3" />
									<label for="radio197"><span></span><p>3.5년정도 더 나이 들어 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio198" data-item="43" name="radio43" value="4" />
									<label for="radio198"><span></span><p>4.5년 이상 더 나이 들어보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio199" data-item="43" name="radio43" value="5" />
									<label for="radio199"><span></span><p>5.잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="44">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-5. 당신의 외할아버지 피부 나이는 얼마로 보이십니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio200" data-item="44" name="radio44" value="1" />
									<label for="radio200"><span></span><p>1.나이보다 5~10년 어려보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio201" data-item="44" name="radio44" value="2" />
									<label for="radio201"><span></span><p>2.나이 그대로 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio202" data-item="44" name="radio44" value="3" />
									<label for="radio202"><span></span><p>3.5년정도 더 나이 들어 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio203" data-item="44" name="radio44" value="4" />
									<label for="radio203"><span></span><p>4.5년 이상 더 나이 들어보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio204" data-item="44" name="radio44" value="5" />
									<label for="radio204"><span></span><p>5.잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="45">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-6. 당신의 친할머니 피부 나이는 얼마로 보이십니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio205" data-item="45" name="radio45" value="1" />
									<label for="radio205"><span></span><p>1.나이보다 5~10년 어려보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio206" data-item="45" name="radio45" value="2" />
									<label for="radio206"><span></span><p>2.나이 그대로 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio207" data-item="45" name="radio45" value="3" />
									<label for="radio207"><span></span><p>3.5년정도 더 나이 들어 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio208" data-item="45" name="radio45" value="4" />
									<label for="radio208"><span></span><p>4.5년 이상 더 나이 들어보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio209" data-item="45" name="radio45" value="5" />
									<label for="radio209"><span></span><p>5.잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="46">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-7. 당신의 친할아버지 피부 나이는 얼마로 보이십니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio210" data-item="46" name="radio46" value="1" />
									<label for="radio210"><span></span><p>1.나이보다 5~10년 어려보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio211" data-item="46" name="radio46" value="2" />
									<label for="radio211"><span></span><p>2.나이 그대로 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio212" data-item="46" name="radio46" value="3" />
									<label for="radio212"><span></span><p>3.5년정도 더 나이 들어 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio213" data-item="46" name="radio46" value="4" />
									<label for="radio213"><span></span><p>4.5년 이상 더 나이 들어보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio214" data-item="46" name="radio46" value="5" />
									<label for="radio214"><span></span><p>5.잘 모르겠습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="47">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-8. 살면서 2주 이상 피부를 태닝 했던 적이 있습니까? 만약 했다면 얼마나 반복했습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio215" data-item="47" name="radio47" value="1" />
									<label for="radio215"><span></span><p>1.없습니다</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio216" data-item="47" name="radio47" value="2" />
									<label for="radio216"><span></span><p>2.1~5년 정도 반복했습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio217" data-item="47" name="radio47" value="3" />
									<label for="radio217"><span></span><p>3.5~10년 정도 반복했습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio218" data-item="47" name="radio47" value="4" />
									<label for="radio218"><span></span><p>4.10년 이상 반복했습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="48">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-9. 계절에 따라서 2주 이상 태닝 프로그램을 진행한 적이 있습니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio219" data-item="48" name="radio48" value="1" />
									<label for="radio219"><span></span><p>1.없습니다</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio220" data-item="48" name="radio48" value="2" />
									<label for="radio220"><span></span><p>2.1~5년 정도 반복했습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio221" data-item="48" name="radio48" value="3" />
									<label for="radio221"><span></span><p>3.5~10년 정도 반복했습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio222" data-item="48" name="radio48" value="4" />
									<label for="radio222"><span></span><p>4.10년 이상 반복했습니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="49">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-10. 거주지를 기준으로 하루에 얼마나 많이 태양에 노출됩니까?</p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio223" data-item="49" name="radio49" value="1" />
									<label for="radio223"><span></span><p>1.거의 없습니다. 대부분 실내에 머물고 햇빛을 많이 보는 곳이 아닙니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio224" data-item="49" name="radio49" value="2" />
									<label for="radio224"><span></span><p>2.약간 그렇습니다. 햇빛이 강하지는 않으나 일반적으로 해를 보고 삽니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio225" data-item="49" name="radio49" value="3" />
									<label for="radio225"><span></span><p>3.적당히 그렇습니다. 꽤 햇빛 노출되어 지냅니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio226" data-item="49" name="radio49" value="4" />
									<label for="radio226"><span></span><p>4.꽤 많습니다. 적도 인근 국가로 햇빛이 쨍쨍한 지역에 삽니다.</p></label>
								</div>
							</div>
						</div> 
						<div class="mm-survey-page" data-page="50">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-11.본인은 겉보기에 나이가 어느 정도 되어 보입니까? </p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio227" data-item="50" name="radio50" value="1" />
									<label for="radio227"><span></span><p>1.나이보다 1~5년정도 젊어 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio228" data-item="50" name="radio50" value="2" />
									<label for="radio228"><span></span><p>2.나이 그대로 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio229" data-item="50" name="radio50" value="3" />
									<label for="radio229"><span></span><p>3.5년 정도 더 나이 들어보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio230" data-item="50" name="radio50" value="4" />
									<label for="radio230"><span></span><p>4.5년 이상 더 나이 들어 보입니다.</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="51">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-12. 최근 5년동안 실외 스포츠나 활동 등으로 피부를 햇빛에 오래도록 노출한 적이 있습니까? </p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio231" data-item="51" name="radio51" value="1" />
									<label for="radio231"><span></span><p>1.나이보다 1~5년정도 젊어 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio232" data-item="51" name="radio51" value="2" />
									<label for="radio232"><span></span><p>2.나이 그대로 보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio233" data-item="51" name="radio51" value="3" />
									<label for="radio233"><span></span><p>3.5년 정도 더 나이 들어보입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio234" data-item="51" name="radio51" value="4" />
									<label for="radio234"><span></span><p>4.5년 이상 더 나이 들어 보입니다.</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="52">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-13. 태닝을 받는다면 얼마나 자주 방문합니까? </p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio235" data-item="52" name="radio52" value="1" />
									<label for="radio235"><span></span><p>1.없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio236" data-item="52" name="radio52" value="2" />
									<label for="radio236"><span></span><p>2.1~5번 정도 방문합니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio237" data-item="52" name="radio52" value="3" />
									<label for="radio237"><span></span><p>3.5~10번 정도 방문합니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio238" data-item="52" name="radio52" value="4" />
									<label for="radio238"><span></span><p>4.상당히 많이 방문합니다.</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="53">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-14. 살면서 흡연한 경험이 있습니까? 만약 흡연자라면 얼마나 자주 담배를 핍니까? 혹은 담배 피는 환경에 얼마나 자주 노출 되어 있습니까? </p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio239" data-item="53" name="radio53" value="1" />
									<label for="radio239"><span></span><p>1.없습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio240" data-item="53" name="radio53" value="2" />
									<label for="radio240"><span></span><p>2.몇 보루 정도 폈습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio241" data-item="53" name="radio53" value="3" />
									<label for="radio241"><span></span><p>3.여러 보루 폈습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio242" data-item="53" name="radio53" value="4" />
									<label for="radio242"><span></span><p>4.매일 담배를 핍니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio243" data-item="53" name="radio53" value="5" />
									<label for="radio243"><span></span><p>5.훕연은 하지 않지만 흡연자와 같은 환경에 살고 있습니다.</p></label>
								</div>
							</div>
						</div>
						<div class="mm-survey-page" data-page="54">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-15. 거주하는 곳의 공기 오염도는 어떻습니까? </p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio244" data-item="54" name="radio54" value="1" />
									<label for="radio244"><span></span><p>1.맑고 깨끗합니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio245" data-item="54" name="radio54" value="2" />
									<label for="radio245"><span></span><p>2.맑고 깨끗한 때도 있고 그렇지 않을 때도 있습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio246" data-item="54" name="radio54" value="3" />
									<label for="radio246"><span></span><p>3.약간 오염되어 있습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio247" data-item="54" name="radio54" value="4" />
									<label for="radio247"><span></span><p>4.공기 오염이 심합니다.</p></label>
								</div>				
							</div>
						</div>
						<div class="mm-survey-page" data-page="55">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-16.레티놀, 레틴-A, 디페린과 같은 비타민 페이셜 크림을 얼마나 오래 사용하셨나요? </p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio248" data-item="55" name="radio55" value="1" />
									<label for="radio248"><span></span><p>1.수년 동안 꾸준히 사용했습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio249" data-item="55" name="radio55" value="2" />
									<label for="radio249"><span></span><p>2.때때로 그렇습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio250" data-item="55" name="radio55" value="3" />
									<label for="radio250"><span></span><p>3.어렸을 때 여드름으로 인해 사용한 적 있습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio251" data-item="55" name="radio55" value="4" />
									<label for="radio251"><span></span><p>4.없습니다.</p></label>
								</div>				
							</div>
						</div>
						<div class="mm-survey-page" data-page="56">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-17. 평소 과일과 채소를 얼마나 자주 드십니까? </p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio252" data-item="56" name="radio56" value="1" />
									<label for="radio252"><span></span><p>1.매일 먹습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio253" data-item="56" name="radio56" value="2" />
									<label for="radio253"><span></span><p>2.하루에 한번 먹습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio254" data-item="56" name="radio56" value="3" />
									<label for="radio254"><span></span><p>3.때때로 챙겨 먹습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio255" data-item="56" name="radio56" value="4" />
									<label for="radio255"><span></span><p>4.아예 먹지 않습니다.</p></label>
								</div>				
							</div>
						</div>
						<div class="mm-survey-page" data-page="57">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-18. 하루 먹는 것 중에서 과일과 채소가 차지하는 비율은 얼마나 됩니까? </p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio256" data-item="57" name="radio57" value="1" />
									<label for="radio256"><span></span><p>1.75~100%</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio257" data-item="57" name="radio57" value="2" />
									<label for="radio257"><span></span><p>2.25~75%</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio258" data-item="57" name="radio57" value="3" />
									<label for="radio258"><span></span><p>3.10~15%</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio259" data-item="57" name="radio57" value="4" />
									<label for="radio259"><span></span><p>4.0~10%</p></label>
								</div>				
							</div>
						</div>
						<div class="mm-survey-page" data-page="58">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-19. 본인의 피부색은 어떻습니까? </p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio260" data-item="58" name="radio58" value="1" />
									<label for="radio260"><span></span><p>1.어둡습니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio261" data-item="58" name="radio58" value="2" />
									<label for="radio261"><span></span><p>2.중간 톤입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio262" data-item="58" name="radio58" value="3" />
									<label for="radio262"><span></span><p>3.밝은 톤입니다.</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio263" data-item="58" name="radio58" value="4" />
									<label for="radio263"><span></span><p>4.매우 밝은 톤입니다.</p></label>
								</div>				
							</div>
						</div>
						<div class="mm-survey-page" data-page="59">
							<div class="mm-survery-content">
								<div class="mm-survey-question">
									<p>4-20. 당신의 인종은 어떻게 됩니까? </p>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio264" data-item="59" name="radio59" value="1" />
									<label for="radio264"><span></span><p>1.아프리칸, 아메리칸</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio265" data-item="59" name="radio59" value="2" />
									<label for="radio265"><span></span><p>2.아시안</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio266" data-item="59" name="radio59" value="3" />
									<label for="radio266"><span></span><p>3.라틴</p></label>
								</div>
								<div class="mm-survey-item">
									<input type="radio" id="radio267" data-item="59" name="radio59" value="4" />
									<label for="radio267"><span></span><p>4.코카시언</p></label>
								</div>				
							</div>
						</div>
						
					</div>


					<div class="mm-survey-controller">
						<div class="mm-prev-btn">
							<button>이전</button>
						</div>
						<div class="mm-next-btn">
							<button disabled="true">다음</button>
						</div>
						<div class="mm-finish-btn">
							<button>결과</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	






<div class="p-5 "></div>
<div class="p-5 "></div>

<div class="b-example-divider"></div>  <!-- 하단바 -->

<div id="footer"></div>

</div>
</body>
   <!-- Javascript files-->
<script src="../js/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery-3.0.0.min.js"></script>
<script src="../js/plugin.js"></script>
</html>