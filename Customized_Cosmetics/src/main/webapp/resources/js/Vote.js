jQuery('.mm-prev-btn').hide();
	var x;
	var count;
	var current;
	var percent;
	var barPercent1; // 게이지 1
	var barPercent2; // 게이지 2
	var barPercent3; // 게이지 3
	var barPercent4; // 게이지 4
	
	var z = [];
	init();
	getCurrentSlide();
	goToNext();
	goToPrev();
	getCount();
	// checkStatus();
	// buttonConfig();
	buildStatus();
	deliverStatus();
	submitData();
	goBack();
	function init() {
		
		jQuery('.mm-survey-container .mm-survey-page').each(function() {
			var item;
			var page;
			item = jQuery(this);
			page = item.data('page');
			item.addClass('mm-page-'+page);
			//item.html(page);
		});

	}
jQuery(document).ready(function () {

  // 엔터 키 이벤트 추가
  jQuery(document).on("keydown", function (event) {
    if (event.key === "Enter") {
      event.preventDefault();

      // 현재 슬라이드가 통과되지 않았다면 실행하지 않음
      if (!jQuery(".active").hasClass("pass")) {
        return;
      }

      // 마지막 슬라이드가 아니라면 "다음" 버튼 기능 실행
      if (!jQuery(".mm-page-" + count).hasClass("active")) {
        jQuery('.mm-next-btn').click(); // 다음 버튼 클릭을 트리거합니다.
      }
      // 마지막 슬라이드라면 "완료" 버튼을 클릭
      else if (jQuery(".mm-finish-btn.active").length) {
        submitData();
      }
    }
  });

});

	function getCount() {

		count = jQuery('.mm-survey-page').length; //<div class="mm-survey-page" data-page=""> 데이터페이지를 카운트 한다. 
		return count;

	}



	function goToNext() { // 다음버튼

		jQuery('.mm-next-btn').on('click', function() {
			goToSlide(x);
			getCount();
			current = x + 1;
			var g = current/count;
			buildProgress(g);
			var y = (count + 1);
			getButtons();
			jQuery('.mm-survey-page').removeClass('active');
			jQuery('.mm-page-'+current).addClass('active');
			getCurrentSlide();
			checkStatus();
			if( jQuery('.mm-page-'+count).hasClass('active') ){
				if( jQuery('.mm-page-'+count).hasClass('pass') ) {
					jQuery('.mm-finish-btn').addClass('active');
				}
				else {
					jQuery('.mm-page-'+count+' .mm-survery-content .mm-survey-item').on('click', function() {
						jQuery('.mm-finish-btn').addClass('active');
					});
				}
			}
			else {
				jQuery('.mm-finish-btn').removeClass('active');
				if( jQuery('.mm-page-'+current).hasClass('pass') ) {
					jQuery('.mm-survey-container').addClass('good');
					jQuery('.mm-survey').addClass('okay');
				}
				else {
					jQuery('.mm-survey-container').removeClass('good');
					jQuery('.mm-survey').removeClass('okay');
				}
			}
			buttonConfig();
		});
	}
	function goToPrev() { // 이전버튼
		jQuery('.mm-prev-btn').on('click', function() {
			goToSlide(x);
			getCount();			
			current = (x - 1);
			var g = current/count;
			buildProgress(g);
			var y = count;
			getButtons();
			jQuery('.mm-survey-page').removeClass('active');
			jQuery('.mm-page-'+current).addClass('active');
			getCurrentSlide();
			checkStatus();
			jQuery('.mm-finish-btn').removeClass('active');
			if( jQuery('.mm-page-'+current).hasClass('pass') ) {
				jQuery('.mm-survey-container').addClass('good');
				jQuery('.mm-survey').addClass('okay');
			}
			else {
				jQuery('.mm-survey-container').removeClass('good');
				jQuery('.mm-survey').removeClass('okay');
			}
			buttonConfig();
		});
	}
	function buildProgress(g) { // 진행도 게이지
		if(g > 1){
			g = g - 1;
		}
		else if (g === 0) {
			g = 1;
		}
		g = g * 100;
		jQuery('.mm-survey-progress-bar').css({ 'width' : g+'%' });
	}
	function goToSlide(x) {
		return x;
	}
	function getCurrentSlide() {
		jQuery('.mm-survey-page').each(function() {
			var item;
			item = jQuery(this);
			if( jQuery(item).hasClass('active') ) {
				x = item.data('page');
			}
			else {
				
			}
			return x;
		});
	}
	function getButtons() { //버튼 숨김
		if(current === 0) {
			current = y;
		}
		if(current === count) {
			jQuery('.mm-next-btn').hide();
		}
		else if(current === 1) {
			jQuery('.mm-prev-btn').hide();
		}
		else {
			jQuery('.mm-next-btn').show();
			jQuery('.mm-prev-btn').show();
		}
	}
	jQuery('.mm-survey-q li input').each(function() {
		var item;
		item = jQuery(this);
		jQuery(item).on('click', function() {
			if( jQuery('input:checked').length > 0 ) {
		    	// console.log(item.val());
		    	jQuery('label').parent().removeClass('active');
		    	item.closest( 'li' ).addClass('active');
			}
			else {
				//
			}
		});
	});
	percent = (x/count) * 100;
	jQuery('.mm-survey-progress-bar').css({ 'width' : percent+'%' });
	function checkStatus() {
		jQuery('.mm-survery-content .mm-survey-item').on('click', function() {
			var item;
			item = jQuery(this);
			item.closest('.mm-survey-page').addClass('pass');
		});
	}
	function buildStatus() {
		jQuery('.mm-survery-content .mm-survey-item').on('click', function() {
			var item;
			item = jQuery(this);
			item.addClass('bingo');
			item.closest('.mm-survey-page').addClass('pass');
			jQuery('.mm-survey-container').addClass('good');
		});
	}
	function deliverStatus() {
		jQuery('.mm-survey-item').on('click', function() {
			if( jQuery('.mm-survey-container').hasClass('good') ){
				jQuery('.mm-survey').addClass('okay');
			}
			else {
				jQuery('.mm-survey').removeClass('okay');	
			}
			buttonConfig();
		});
	}
	function lastPage() {
		if( jQuery('.mm-next-btn').hasClass('cool') ) {
			alert('cool');
		}
	}
	function buttonConfig() {
		if( jQuery('.mm-survey').hasClass('okay') ) {
			jQuery('.mm-next-btn button').prop('disabled', false);
		}
		else {
			jQuery('.mm-next-btn button').prop('disabled', true);
		}
	}
	function submitData() {
		jQuery('.mm-finish-btn').on('click', function() {
			collectData();
			jQuery('.mm-survey-bottom').slideUp();
			jQuery('.mm-survey-results').slideDown();
			jQuery('.mm-survey-results2').slideDown();
			
		});
	}
	function collectData() {
		
		var map = {};
		var ax = ['0','1','2','3','4','5'];
		var answer = '';
		var total = 0;
		var ttl = [0,0,0,0];
		var g; // 설명문
		var c = 0;
		jQuery('.mm-survey-item input:checked').each(function(index, val) {
			var item;
			var data;
			var name;
			var n;
			item = jQuery(this);
			data = item.val();
			name = item.data('item');
			n = parseInt(data);
			total += n;
			map[name] = data;
		});
		
		
		jQuery('.mm-survey-results2-container .mm-survey-results-type1').before('');
		jQuery('.mm-survey-results2-container .mm-survey-results-type2').before('');
		jQuery('.mm-survey-results2-container .mm-survey-results-type3').before('');
		jQuery('.mm-survey-results2-container .mm-survey-results-type4').before('');
		
		
		
		jQuery('.mm-survey-results2-container .mm-survey-results-picture').html('');
		jQuery('.mm-survey-results2-container .mm-survey-results2-list2').html('');
		
		

		
		
		/*jQuery('.mm-survey-results-container .mm-survey-resultsImage').html('');*/
		
		// 1번문제 1_11번 문제까지
		for (i = 1; i < 12; i++) {
			//answer += map[i] + '<br>';
			for(f =1; f<=5; f++){
				if( map[i] === ax[f]) {
					ttl[0] += f;
					if(f == 5){
						ttl[0] -= 2.5; // 5번 선택 시 5-2.5 = 2.5점 적용   
					}
				}
				else {	
					continue;
					}
				}
		}
		var skintype = [];
		if(ttl[0] <= 26){ // 26점 이하 시 건성피부
			skintype[0] = 'D';
			//p = 'incorrect';
			//g = '건성 - 피지 분비량과 수분 보유량 모두 적어 거칠고 각질과 주름이 잘 생기는 타입'; 
			jQuery('.mm-survey-results-type1').html('<div class ="bar" data-text="건성"></div>');
		}
		else if(ttl[0] > 26){// 26첨 초과 시 지성피부
			skintype[0] = 'O';
			//p='correct';
			//g = '지성 - 피지 분비량이 많아 번들거리고 여드름이 자주 생기는 타입'; 
			jQuery('.mm-survey-results-type1').html('<div class="bar" data-text="지성"></div>');
		}
		var barPercent1 = ttl[0] * 2.04  ; // 바 퍼센티지
		jQuery('.bar-graph-one .bar-one .bar').css({ 'width' : barPercent1+'%' });	
		//jQuery('.mm-survey-results-list').append('<li class="mm-survey-results-item '+p+'"><span class="mm-item-number">'+skintype[0]+'</span><span class="mm-item-info">'+g+'</span></li>');	
		
	////////////////////////////////////////////
	
		//2번문제 2_18번 문제까지
		for (i = 12; i < 30; i++) {
			//var t = {};
			//var m = {};
			//answer += map[i] + '<br>';
			for(f =1; f<=5; f++){
				if( map[i] === ax[f]) {
					//g = map[i];
					ttl[1] += f;
					if(f == 5){
						ttl[1] -= 2.5; // 해결할 부분 소수점 적용 안됨    
					}
				}
				else {	
					continue;
					}
				}
		}
		if(ttl[1] <= 29){ //29점 이하 시 저항성 피부
			skintype[1] = 'R'
			//p='incorrect';
			//g = '저항성 - 피부 장벽이 견고해 외부적인 스트레스에 대해 견디는 힘이 강한 타입'; 
			jQuery('.mm-survey-results-type2').html('<div class ="bar" data-text="저항성"></div>');
		}
		else if(ttl[1] > 29){ //29점 초과 시 민검성 피부
			skintype[1] = 'S'
			//p='correct';
			//g = '민감성 - 피부가 얇고 섬세해 외부 자극에 쉽게 반응하는 타입';  
			jQuery('.mm-survey-results-type2').html('<div class ="bar" data-text="민감성"></div>');
		}
		
		barPercent2 = ttl[1] * 1.25  ; // 바 퍼센티지
		jQuery('.bar-graph-one .bar-two .bar').css({ 'width' : barPercent2+'%' });	
		//jQuery('.mm-survey-results-list').append('<li class="mm-survey-results-item '+p+'"><span class="mm-item-number">'+skintype[1]+'</span><span class="mm-item-info">'+g+'</span></li>');
		
		//////////////////////////////////////////////////////////////////
		
	
		//3번문제 3_10번 문제까지
		for (i = 30; i < 40; i++) {
			//var t = {};
			//var m = {};
			//answer += map[i] + '<br>';
			for(f =1; f<=5; f++){
				if( map[i] === ax[f]) {
					//g = map[i];
					ttl[2] += f;
					if(f == 5){
						ttl[2] -= 2.5; 
					}
				}
				else {	
					continue;
					}
				}
		}
		if(ttl[2] <= 30){ //29점 이하 시 저항성 피부
			skintype[2] = 'P'
			//p='incorrect';
			//g = '색소침착 - 멜라닌 활성도가 높아 기미, 주근깨 혹은 잡티 등 눈에 보이는 색소가 많은 타입'; 
			jQuery('.mm-survey-results-type3').html('<div class ="bar" data-text="색소침착"></div>');
		}
		else if(ttl[2] > 30){ //29점 초과 시 민검성 피부
			skintype[2] = 'N'
			//p='correct';
			//g = '비색소성 - 멜라닌 활성도가 낮아 눈에 보이는 색소가 적은 타입';  
			jQuery('.mm-survey-results-type3').html('<div class ="bar" data-text="비색소성"></div>');
		}
		//jQuery('.mm-survey-results-list').append('<div class="mm-survey-results-item '+p+'"><span class="mm-item-number">'+skintype[2]+'</span><span class="mm-item-info">'+g+'</span></div>');
		
		barPercent3 = ttl[2] * 2.25  ; // 바 퍼센티지
		jQuery('.bar-graph-one .bar-three .bar').css({ 'width' : barPercent3+'%' });	
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		//4번문제 4_20번 문제까지
		for (i = 40; i < 60; i++) {
			//var t = {};
			//var m = {};
			//answer += map[i] + '<br>';
			for(f =1; f<=5; f++){
				if( map[i] === ax[f]) {
					//g = map[i];
					ttl[3] += f;
					if(f == 5){
						ttl[3] -= 2.5;
					}
				}
				else {	
					continue;
					}
				}
		}
		if(ttl[3] <= 40){ //40점 이하 시 탄력 있는 피부
			skintype[3] = 'T'
			//p='correct';
			//g = '탱탱함 - 피부 결이 고르고 주름이 적어 탄력이 있는 타입'; 	
			jQuery('.mm-survey-results-type4').html('<div class ="bar" data-text="탱탱함"></div>');	
		}
		else if(ttl[3] > 40){ //40점 초과 시 주름에 취약한 피부 
			skintype[3] = 'W'
			//p='incorrect';
			//g = '주름짐 - 피부 결이 고르지 않고 주름이 많은 타입';  
			jQuery('.mm-survey-results-type4').html('<div class ="bar" data-text="주름짐"></div>');
		}
		//jQuery('.mm-survey-results-list').append('<li class="mm-survey-results-item '+p+'"><span class="mm-item-number">'+skintype[3]+'</span><span class="mm-item-info">'+g+'</span></li>');
		barPercent4 = ttl[3] * 1.125  ; // 바 퍼센티지
		jQuery('.bar-graph-one .bar-four .bar').css({ 'width' : barPercent4+'%' });	
		
		var skintype2 = skintype[0] + skintype[1] + skintype[2] + skintype[3]
		jQuery('.mm-survey-results-score').html('당신의 피부타입은 : ' +  skintype2); //results[0] + results[1] + results[2] + results[3] // skintype[0] + skintype[1] + skintype[2] + skintype[3]
		jQuery('.mm-survey-results2-score').html(skintype2);
		jQuery('.mm-survey-results-picture').append('<div class="col-lg-5"><img src="../resources/images/피부타입-'+skintype2+'.PNG" class="radius_Img border_Img"></div>');
		
		
		
		
		switch(skintype2)
		{
			case 'DRNT':
				jQuery('.mm-survey-results2-list2').html('피부고민이 거의 없는 워너비 피부타입으로 대부분의 화장품에 민감하지 않지만, 건성이기 때문에 피지조절 제품은 피하는게 좋습니다. 호호바 오일등으로 보습에만 신경써주면 피부관리 문제없겠습니다. ');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img">');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;
			case 'DRNW':
				jQuery('.mm-survey-results2-list2').html('신진대사가 활발한 30대 초까지는 피부 걱정없지만, 피지가 급격히 줄어드는 30대 후반부터는 주름이 증가할 수 있기 때문에 보습과 주름에 신경을 써주어야 합니다. 잘자고 잘먹는 생활습관을 일정하게 유지시켜 노화예방에 힘써야 하는 피부 ');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img">');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;
			case 'DRPT':
				jQuery('.mm-survey-results2-list2').html('민감한 피부는 아니나 계절에 변화에 따라 피부가 건조해지면서 각질이 올라오러나 가려움이 유발될 수 있다. 자외선에 의해 색소침착 및 피부트러블이 생기기 쉬우니 자외선 차단에 신경을 써야합니다. 보습/ 자외선차단/ 미백에 주안점을 두고 제품을 선정하는것이 좋습니다. ');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진1.PNG" width="600" hight="900" class="radius_Img border_Img">');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;	
			case 'DRPW':
				jQuery('.mm-survey-results2-list2').html('건조한 피부로 주름도 잘생기기 때문에 이마와 눈가의 주름에 유의해야합니다. 특히 겨울철에는 피부의 건조가 더 악화되기 때문에 보습관리를 잘 해주어야 하는데요, 사우나 등의 사용은 피하고 실내에 가습기를 틀어 적절한 습도를 유지하는게 좋습니다. 보습 /미백 / 펩타이드등으로 제품 선정하는 것이 좋습니다. ');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img">');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;
				
				
			case 'DSNT':
				jQuery('.mm-survey-results2-list2').html('민감성에만 주안점을 두고 유효성분이 함유된 제품을 바를때 기초케어를 충분히 하고 적용하고 제품군수를 늘리기보다 줄이는게 더 좋습니다. ');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img">');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;
			case 'DSNW':
				jQuery('.mm-survey-results2-list2').html('피부가 얇고 각질이 많아 피부결이 거칠고 민감한 타입으로 피부장벽관리가 가장 중요합니다. 피부에 자극을 주는 행동을 최소화하고 보습을 충분히 주어 각질을 잠재울수 있는 제품을 사용하는게 좋습니다. 제품군으로는 토너패드, 팩등을 이용하면 좋을것으로 보입니다. ');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img" >');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;
			case 'DSPT':
				jQuery('.mm-survey-results2-list2').html('건성이면서 민감성의 경우 유효성분 사용에 주의해야합니다. 기초케어를 튼튼히 하고 난후 유효성분제품을 발라 자극을 주지않는점에 주안점을 두어 루틴을 설계하시면 됩니다. ');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img">');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;
			case 'DSPW':
				jQuery('.mm-survey-results2-list2').html('민감하면서 색소침착이 있고. 주름까지 있는 종합선물세트로 피부관리에 어려움을 느끼는 피부 타입입니다. 더 좋게 하기보다 덜 나쁘게 하는데 초점을 두어 자외선 차단제를 꼼꼼하게 바르고 저자극 성분으로 구성된 제품사용, 그리고 보습 및 진정, 그리고 저자극에 포커스된 제품위주로 선정하는것이 좋습니다. ');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img">');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;
				
				
			case 'ORNT':
				jQuery('.mm-survey-results2-list2').html('BHA 가 포함된 클렌징제품으로 피지와 좁쌀을 적절히 관리한다면 좋은 피부상태를 유지할 수 있습니다. ');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img" >');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;	
			case 'ORNW':
				jQuery('.mm-survey-results2-list2').html('주름생성을 유의하여 피부에 자극을 주는행위를 자제하고 EGF, 레티놀등 항노화에 초점을 맞춰 제품을 선정합니다. ');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img">');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;	
			case 'ORPT':
				jQuery('.mm-survey-results2-list2').html('피지분비를 적절히 관리하고 색소침착만 잘 관리하면 건강한 피부상태를 유지할 수 있는 피부타입입니다. 클렌징제품으로 피지를 잘 세정해주면 자극없이 관리 가능합니다. BHA 가 포함된 클렌징 제품으로 관리하면 피지 및 좁쌀케어가 가능하며 자외선 차단제품과 미백으로 관리하면 좋은 피부상태를 유지할 수 있습니다. ');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img">');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;
			case 'ORPW':
				jQuery('.mm-survey-results2-list2').html('피부 트러블과 자외선등에 의해 색소침착과 주름등의 생성이 잘되기 때문에 항노화에 신경써야 합니다. 강력한 항산화성분과 미백기능성 제품, EGF 등 유효성분을 적극 활용하여 피부 관리가 가능합니다. ');
 				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img">');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;
				
				
			case 'OSNT':
				jQuery('.mm-survey-results2-list2').html('여드름으로 인한 염증과 홍조가 나타날 수 있으므로 수분을 공급하면서 여드름 관리를 해줄수 있는 제품을 선택합니다. 티트리와 BHA, 그리고 병풀성분이 포함된 토너로 토너팩을 해주면 관리가능합니다. ');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img">');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;
			case 'OSNW':
				jQuery('.mm-survey-results2-list2').html('여드름으로 인한 염증과 홍조가 나타날 수 있으므로 수분을 공급하면서 여드름 관리를 해줄수 있는 제품을 선택합니다. 티트리와 BHA, 그리고 병풀성분이 포함된 토너로 토너팩을 해주면 관리가능합니다. 피부컨디션이 좋을때 EGF, 레티놀등의 주름 유효성분을 함께 사용합니다.');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img">');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;
			case 'OSPT':
				jQuery('.mm-survey-results2-list2').html('피지 분비가 많아 피부가 번들거리고 눈주위 다크서클이나 여드름 피부 색소침착등이 잘 발생할 수 있습니다. 민감성이기 때문에 약산성 BHA 클렌징폼을 사용하여 관리해주면 저자극으로 관리가능하며 자외선 차단제와 미백기능성 성분을 선택시 피부 자극이 적은걸로 선택해야 합니다. ');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img">');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;			
			case 'OSPW':
				jQuery('.mm-survey-results2-list2').html('자극에 대해 민감한 피부타입이므로 염증관리에 유의해야합니다. BHA 나 티트리등 유효성분의 함량이 낮은 제품으로 빈도를 가끔 사용하면서 내 피부의 저항성을 확인해본후 서서히 함량과 빈도를 올려야 합니다. 피부에 자극을 줄수 있는 요인을 차단하고, 효율적인 루틴을 찾아 적용해야합니다. ');
				jQuery('.mm-survey-results-picture2').html('<img src="../resources/images/사진2.PNG" width="600" hight="900" class="radius_Img border_Img">');
				jQuery('.mm-survey-results-button').html('<div class="btn btn-primary" href="#!">상품 상세보기</div>');
				break;			
		}
		
		
		
		
	}
	function goBack() {
		jQuery('.mm-back-btn').on('click', function() {
			jQuery('.mm-survey-bottom').slideDown();
			jQuery('.mm-survey-results').slideUp();
			jQuery('.mm-survey-results2').slideUp();
			
		});
	}
	
	
const quotes = [
  {
    "quote": "좋은 스킨케어는 평생의 약속입니다.",
    "source": "-조지아 루이스-"
  },
  {
    "quote": "아름다운 피부에는 기적이 아니라 헌신이 필요합니다.",
    "source": "-에르노 라즐로-"
  },
  {
    "quote": "미소는 모든 소녀가 입을 수 있는 최고의 메이크업입니다.",
    "source": "-마릴린 먼로-"
  },
  {
    "quote": "피부관리는, 먹을만큼 좋아야 한다!",
    "source": "-조안나 런시먼-"
  },
  {
    "quote": "건강한 피부는 하루아침에 만들어지는 것이 아니다.",
    "source": "-켈시 발레리니-"
  },
  {
    "quote": "자고, 물을 마시고, 피부를 치료하십시오.",
    "source": "-조지아 루이스-"
  },
  {
    "quote": "내면에서 자신을 돌보면 당신의 아름다움이 피부에 빛날 것입니다.",
    "source": "-자나 엘스톤-"
  },
  {
    "quote": "건강한 피부는 전반적인 건강의 반영입니다.",
    "source": "-무라드 박사-"
  },
]

function randomQuote(){
  let random = quotes[Math.floor(Math.random() * quotes.length)];
  quotation.innerText = `"${random.quote}"`;
  source.innerText = random.source;
}	

setInterval(randomQuote(),2000);
