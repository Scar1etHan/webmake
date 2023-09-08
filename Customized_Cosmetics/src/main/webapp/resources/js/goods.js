/*!     
        jquery.picZoomer.js
        v 1.0
        David
        http://www.CodingSerf.com
*/

//돋보기 컨트롤
;(function($){
	$.fn.picZoomer = function(options){
		var opts = $.extend({}, $.fn.picZoomer.defaults, options), 
			$this = this,
			$picBD = $('<div class="picZoomer-pic-wp"></div>').css({'width':opts.picWidth+'px', 'height':opts.picHeight+'px'}).appendTo($this),
			$pic = $this.children('img').addClass('picZoomer-pic').appendTo($picBD),
			$cursor = $('<div class="picZoomer-cursor"><i class="f-is picZoomCursor-ico"></i></div>').appendTo($picBD),
			cursorSizeHalf = {w:$cursor.width()/2 ,h:$cursor.height()/2},
			$zoomWP = $('<div class="picZoomer-zoom-wp"><img src="" alt="" class="picZoomer-zoom-pic"></div>').appendTo($this),
			$zoomPic = $zoomWP.find('.picZoomer-zoom-pic'),
			picBDOffset = {x:$picBD.offset().left,y:$picBD.offset().top};

		
		opts.zoomWidth = opts.zoomWidth||opts.picWidth;
		opts.zoomHeight = opts.zoomHeight||opts.picHeight;
		var zoomWPSizeHalf = {w:opts.zoomWidth/2 ,h:opts.zoomHeight/2};

		//줌 컨테이너 크기 초기화 
		$zoomWP.css({'width':opts.zoomWidth+'px', 'height':opts.zoomHeight+'px'});
		$zoomWP.css(opts.zoomerPosition || {top: 0, left: opts.picWidth+30+'px'});
		//확대 이미지 크기 초기화
		$zoomPic.css({'width':opts.picWidth*opts.scale+'px', 'height':opts.picHeight*opts.scale+'px'});

		//초기화 이벤트
		$picBD.on('mouseenter',function(event){
			$cursor.show();
			$zoomWP.show();
			$zoomPic.attr('src',$pic.attr('src'))
		}).on('mouseleave',function(event){
			$cursor.hide();
			$zoomWP.hide();
		}).on('mousemove', function(event){
			var x = event.pageX-picBDOffset.x,
				y = event.pageY-picBDOffset.y;

			$cursor.css({'left':x-cursorSizeHalf.w+'px', 'top':y-cursorSizeHalf.h+'px'});
			$zoomPic.css({'left':-(x*opts.scale-zoomWPSizeHalf.w)+'px', 'top':-(y*opts.scale-zoomWPSizeHalf.h)+'px'});

		});
		return $this;

	};
	$.fn.picZoomer.defaults = {
        picHeight: 460,
		scale: 2.5,
		zoomerPosition: {top: '0', left: '380px'},

		zoomWidth: 400,
		zoomHeight: 460
	};
})(jQuery); 



$(document).ready(function () {
     $('.picZoomer').picZoomer();
    $('.piclist li').on('click', function (event) {
        var $pic = $(this).find('img');
        $('.picZoomer-pic').attr('src', $pic.attr('src'));
    });
   
  var owl = $('#recent_post');
              owl.owlCarousel({
                margin:20,
                dots:false,
                nav: true,
                navText: [
                  "<i class='fa fa-chevron-left'></i>",
                  "<i class='fa fa-chevron-right'></i>"
                ],
                autoplay: true,
                autoplayHoverPause: true,
                responsive: {
                  0: {
                    items: 2
                  },
                  600: {
                    items:3
                  },
                  1000: {
                    items:5
                  },
                  1200: {
                    items:4
                  }
                }
  });    
  
        $('.decrease_').click(function () {
            decreaseValue(this);
        });
        $('.increase_').click(function () {
            increaseValue(this);
        });
        function increaseValue(_this) {
            var value = parseInt($(_this).siblings('input#number').val(), 10);
            value = isNaN(value) ? 0 : value;
            value++;
            $(_this).siblings('input#number').val(value);
        }

        function decreaseValue(_this) {
            var value = parseInt($(_this).siblings('input#number').val(), 10);
            value = isNaN(value) ? 0 : value;
            value < 1 ? value = 1 : '';
            value--;
            $(_this).siblings('input#number').val(value);
        }
    });
    


    

var itemPrice = parseInt(document.getElementById('itemPrice').innerText);
var itemQuantity = document.getElementById('itemQuantity');
var totalPrice = document.getElementById('totalPrice');

function increaseQuantity() {
    itemQuantity.innerText = parseInt(itemQuantity.innerText) + 1;
    updateTotalPrice();
}

function decreaseQuantity() {
    var currentQuantity = parseInt(itemQuantity.innerText);
    if (currentQuantity > 1) {
        itemQuantity.innerText = currentQuantity - 1;
        updateTotalPrice();
    }
}

function updateTotalPrice() {
    totalPrice.innerText = parseInt(itemQuantity.innerText) * itemPrice;
}




var IMP = window.IMP;
IMP.init("imp80136682"); // 예: imp00000000

	
    function requestPay() {
	    // IMP.request_pay(param, callback) 결제창 호출
	    IMP.request_pay({ // param
	        pg: "kakaopay",
	        pay_method: "card",
	        merchant_uid: 'merchant_' + new Date().getTime(),
	        name: pName.innerText,
	        amount: totalPrice.innerText,
	        buyer_email: "gildong@gmail.com",
	        buyer_name: "홍길동",
	        buyer_tel: "010-4242-4242",
	        buyer_addr: "서울특별시 강남구 신사동",
	        buyer_postcode: "01181"
	    }, function (rsp) { // callback
	 		if (rsp.success) {
	            // 결제 성공 시 로직
	            alert("성공");
	            // 전달할 데이터 객체 생성
	            var data = {
	                order_Total: totalPrice.innerText // 결제 금액
	            };
	
	            // 결제 정보를 Controller에 전달
	            $.ajax({
	                type: "POST",
	                url: '/Shop/payment',
	                data: JSON.stringify(data), // 데이터를 json 타입으로 변환하여 전달
	                contentType: 'application/json', // contentType을 json 타입으로 지정
	                success: function (response) {
	                    console.log("성공: ", response);
	                },
	                error: function (xhr, status, error) {
	                    console.log("실패: ", error);
	                },
	            });
	
	        } else {
	            // 결제 실패 시 로직
	            alert("실패");
	        }
	    });
	}
    

