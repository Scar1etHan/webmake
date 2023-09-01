jQuery('.mm-prev-btn').hide();

	var x;
	var count;
	var current;
	var percent;
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
  // ... 기존 코드 ...

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

  // ... 기존 코드 ...
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
		});
	}

	function collectData() {
		
		var map = {};
		var ax = ['0','1','2','3','4','5'];
		var answer = '';
		var total = 0;
		var ttl = 0;
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

		jQuery('.mm-survey-results-container .mm-survey-results-list').html('');
		// 1번문제 1_11번 문제까지
		for (i = 1; i <= 11; i++) {
			answer += map[i] + '<br>';
			for(f =1; f<=5; f++){
				if( map[i] === ax[f]) {
					ttl += f;
					if(f == 5){
						ttl -= 2.5; // 5번 선택 시 5-2.5 = 2.5점 적용   
					}
				}
				else {	
					continue;
					}
				}
		}
		
		var skintype = [];
		if(ttl <= 26){ // 26점 이하 시 건성피부
			skintype[0] = 'D';
			p = 'incorrect';
			g = '건성 - 피지 분비량과 수분 보유량 모두 적어 거칠고 각질과 주름이 잘 생기는 타입'; 
		}
		else if(ttl > 26){// 26첨 초과 시 지성피부
			skintype[0] = 'O';
			p='correct';
			g = '지성 - 피지 분비량이 많아 번들거리고 여드름이 자주 생기는 타입'; 
		}
		
		jQuery('.mm-survey-results-list').append('<li class="mm-survey-results-item '+p+'"><span class="mm-item-number">'+skintype[0]+'</span><span class="mm-item-info">'+g+'</span></li>');
		ttl = 0;
		
		
		
		//2번문제 2_18번 문제까지
		for (i = 12; i <= 29; i++) {
			//var t = {};
			//var m = {};
			answer += map[i] + '<br>';
			for(f =1; f<=5; f++){
				if( map[i] === ax[f]) {
					//g = map[i];
					ttl += f;
					if(f == 5){
						ttl -= 2.5; // 해결할 부분 소수점 적용 안됨    
					}
				}
				else {	
					continue;
					}
				}
		}
		if(ttl <= 29){ //29점 이하 시 저항성 피부
			skintype[1] = 'R'
			p='incorrect';
			g = '저항성 - 피부 장벽이 견고해 외부적인 스트레스에 대해 견디는 힘이 강한 타입'; 
		}
		else if(ttl > 29){ //29점 초과 시 민검성 피부
			skintype[1] = 'S'
			p='correct';
			g = '민감성 - 피부가 얇고 섬세해 외부 자극에 쉽게 반응하는 타입';  
		}
		jQuery('.mm-survey-results-list').append('<li class="mm-survey-results-item '+p+'"><span class="mm-item-number">'+skintype[1]+'</span><span class="mm-item-info">'+g+'</span></li>');
		ttl = 0;
		
		//3번문제 3_10번 문제까지
		for (i = 30; i <= 38; i++) {
			//var t = {};
			//var m = {};
			answer += map[i] + '<br>';
			for(f =1; f<=5; f++){
				if( map[i] === ax[f]) {
					//g = map[i];
					ttl += f;
					if(f == 5){
						ttl -= 2.5; // 해결할 부분 소수점 적용 안됨    
					}
				}
				else {	
					continue;
					}
				}
		}
		if(ttl <= 30){ //29점 이하 시 저항성 피부
			skintype[2] = 'P'
			p='incorrect';
			g = '색소침착 - 멜라닌 활성도가 높아 기미, 주근깨 혹은 잡티 등 눈에 보이는 색소가 많은 타입'; 
		}
		else if(ttl > 30){ //29점 초과 시 민검성 피부
			skintype[2] = 'N'
			p='correct';
			g = '비색소성 - 멜라닌 활성도가 낮아 눈에 보이는 색소가 적은 타입';  
		}
		jQuery('.mm-survey-results-list').append('<li class="mm-survey-results-item '+p+'"><span class="mm-item-number">'+skintype[2]+'</span><span class="mm-item-info">'+g+'</span></li>');
		ttl = 0;
		
		
		
		//4번문제 4_20번 문제까지
		for (i = 39; i <= 59; i++) {
			//var t = {};
			//var m = {};
			answer += map[i] + '<br>';
			for(f =1; f<=5; f++){
				if( map[i] === ax[f]) {
					//g = map[i];
					ttl += f;
					if(f == 5){
						ttl -= 2.5; // 해결할 부분 소수점 적용 안됨    
					}
				}
				else {	
					continue;
					}
				}
		}
		if(ttl <= 40){ //40점 이하 시 탄력 있는 피부
			skintype[3] = 'T'
			p='correct';
			g = '탱탱함 - 피부 결이 고르고 주름이 적어 탄력이 있는 타입'; 
		}
		else if(ttl > 40){ //40점 초과 시 주름에 취약한 피부 
			skintype[3] = 'W'
			p='incorrect';
			g = '주름짐 - 피부 결이 고르지 않고 주름이 많은 타입';  
		}
		jQuery('.mm-survey-results-list').append('<li class="mm-survey-results-item '+p+'"><span class="mm-item-number">'+skintype[3]+'</span><span class="mm-item-info">'+g+'</span></li>');
		ttl = 0;

		var results;
		results = skintype;
		jQuery('.mm-survey-results-score').html('당신의 피부타입은 : ' + results[0] + results[1] + results[2] + results[3]);

	}

	function goBack() {
		jQuery('.mm-back-btn').on('click', function() {
			jQuery('.mm-survey-bottom').slideDown();
			jQuery('.mm-survey-results').slideUp();
		});
	}