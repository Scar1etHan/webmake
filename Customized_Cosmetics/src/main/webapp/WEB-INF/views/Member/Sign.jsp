<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 화면 샘플 - Bootstrap</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- 주소지API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- jQuery -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
body {
	min-height: 100vh;
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>

<body>

	<div class="container">
	 <a href="/" class="logo">
        <h3 class="blind" style="text-align: center; position: relative; top: 30px;">AMUCOMPONY</h3>
      </a>
		<div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto">
                <h4 class="mb-3" style="text-align: center">회원가입</h4>
                <form name="sign" class="validation-form" novalidate method="post" action="${path}/Member/insert">
                    <!-- 이름, 나이, 성별 입력 부분 -->
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="name">이름</label>
                            <input type="text" class="form-control" id="userName" name="userName"
                            	value="${vo.user_name}"  placeholder="이름" required>
                            <div class="invalid-feedback">이름을 입력해주세요.</div>
                            <div id="nameMessage"></div>
                        </div>
                        <div class="col-md-3 offset-md-1 mb-3">
                            <label for="name">나이</label>
                            <input type="text" class="form-control" id="userAge" name="userAge" 
                            	value="${vo.user_age}" placeholder="나이" required>
                            <div class="invalid-feedback">나이를 입력해주세요.</div>
                            <div id="ageMessage"></div>
                        </div>
                       <div class="col-md-3 offset-md-1 mb-3">
                            <label for="sex">성별</label>
                            <%-- <input type="text" class="form-control" id="user_sex" name="user_sex"
                            	value="${vo.user_sex}" required readonly> --%>
                            <select id="userSex" name="userSex" class="form-control" required">
                               <option value="">성별선택</option>
                               <option value="남자">남자</option>
      						   <option value="여자">여자</option>
                            </select>
                            <div id="sexMessage"></div>
                        </div>
					</div>

                    <!-- 아이디 입력 부분 -->
                    <div class="row">
                        <div class="col-md-9 mb-3">
                            <label for="name">아이디</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="userId" name="userId" 
                                	value="${vo.user_id}" placeholder="아이디(영문+숫자구성 4~15자)" required>
                                <div class="input-group-append">
                                    <button class="btn btn-outline-primary ml-2" id="idCheckButton" type="button">중복확인</button>
                                </div>
                            </div>
                            <div class="invalid-feedback">아이디를 입력해주세요.</div>
                            <div id="idCheckMessage"></div>
                        </div>
                    </div>

                    <!-- 비밀번호, 비밀번호 확인 입력 부분 -->
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label for="password">비밀번호</label>
                            <input type="password" class="form-control" id="userPw" name="userPw" 
                            	value="${vo.user_pw}" placeholder="비밀번호(영문+숫자구성 4~15자)" required>
                            <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label for="confirmPassword">비밀번호 확인</label>
                            <input type="password" class="form-control" id="confirmPassword" placeholder="비밀번호확인" required>
                            <div class="invalid-feedback">비밀번호를 확인해주세요.</div>
                            <div id="passwordMessage"></div>
                        </div>
                    </div>
                    
                    <!-- 전화번호 입력 부분 -->
					<div class="row">
                        <div class="col-md-9 mb-3">
                            <label for="name">전화번호</label>
                            <input type="text" class="form-control" id="userCell" name="userCell" 
                            	value="${vo.user_phone}"placeholder="전화번호" required>
                            <div class="invalid-feedback">전화번호를 입력해주세요.</div>
                            <div id="phoneMessage"></div>
                        </div>
                    </div>

                    <!-- 이메일 입력 부분 -->
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label for="email">이메일</label>
                            <input type="email" class="form-control" id="userEmail" name="userEmail" 
                            	value="${vo.user_email}" placeholder="your@email.com" required>
                            <div class="invalid-feedback">이메일을 입력해주세요.</div>
                            <div id="emailMessage"></div>
                        </div>
                    </div>

                    <!-- 주소 입력 부분 -->
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label for="address">주소</label>
                            <div class="input-group">
					            <input type="text" class="form-control mb-3" id="userAddr1" name="userAddr1" 
					            	value="${vo.user_Addr1}" placeholder="우편번호" size="10" required readonly>
					            <input type="button" class="btn btn-outline-primary" onclick="findAddr()" value="우편번호 찾기" style="margin-left: 5px;">
					        </div>
                            <input type="text" class="form-control mb-3" id="userAddr2" name="userAddr2" 
                            	value="${vo.user_Addr2}" placeholder="도로명주소" size="60" required readonly>
                            <input type="hidden" id="addr" placeholder="지번주소" size="60">
                            <span id="guide" style="color: #999; display: none"></span>
                            <input type="text" class="form-control mb-3" id="userAddr3" name="userAddr3" 
                            	value="${vo.user_Addr3}" placeholder="상세주소" size="60" required>
                            <input type="hidden" id="sample4_extraAddress" placeholder="참고항목" size="60">
                            <input type="hidden" id="sample4_engAddress" placeholder="영문주소" size="60">
                            <div class="invalid-feedback">주소를 입력해주세요.</div>
                        </div>
                    </div>

                    <hr class="mb-4">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="aggrement" required>
                        <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
                    </div>
                    <div class="mb-4"></div>
                    <button class="btn btn-primary btn-lg btn-block" type="submit">가입완료</button>
                </form>
            </div>
        </div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 회원가입 창</p>
		</footer>
	</div>
	
	<!-- 아이디 중복체크 및 유효성 검사 -->
<script>

	var idCheckDone = false; 	// 아이디 중복 확인 여부
	var passwordMatch = false; 	// 비밀번호 일치 확인 여부
	var namecheck = false;		// 이름 유효성 검사
	var agecheck = false;		// 나이 유효성 검사
	var emailcheck = false;		// 이메일 유효성 검사
	var phonecheck = false;		// 전화번호 유효성 검사
	var sexcheck = false;		// 성별 유효성 검사
	
	const nameRegex = /^[가-힣]{2,5}$/;										// 이름 유효성 검사
	const userIdRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,15}$/;			// 아이디 유효성 검사
	const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,15}$/; 		// 비밀번호 유효성 검사
	const ageRegex = /^(?:100|[1-9]\d?)$/; 									// 나이 유효성 검사 (1~100)
	const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; 	// 이메일 유효성 검사
	const phoneRegex = /^\d{11}$/; 											// 전화번호 유효성 검사 (숫자로만 이루어진 11자리)
	
	// 이름,아이디,비밀번호 유효성 검사 함수
	function isNameValid(name) {
 		 return nameRegex.test(name);
	}
	
    function isUserIdValid(userId) {
        return userIdRegex.test(userId);
    }
    
    function isPasswordValid(password) {
        return passwordRegex.test(password);
    }
    
    function isAgeValid(age) {
        return ageRegex.test(age);
    }
    
    function isEmailValid(email) {
        return emailRegex.test(email);
    }
    
    function isPhoneValid(phone) {
    	return phoneRegex.test(phone);
    }

    //	유효성 체크 (이름)
    function checkNameValid() {
	    const userName = document.getElementById("userName");
	    const nameMessage = document.getElementById("nameMessage");
	
	    let nameValid = isNameValid(userName.value);
	    if (!nameValid) {
	        nameMessage.style.color = "red";
	        nameMessage.textContent = "한글 2~5글자 입력";
	        namecheck = false;
	    } else {
	        nameMessage.textContent = "";
	        namecheck = true;
	    }
	}
    //	이벤트 리스너 (이름)
    document.getElementById("userName").addEventListener("input", checkNameValid);
    
    //	유효성 체크 (나이)
    function checkAgeValid() {
        const userAge = document.getElementById("userAge");
        const ageMessage = document.getElementById("ageMessage"); // 나이 메시지를 위한 span 요소 생성

        let ageValid = isAgeValid(userAge.value);
        if (!ageValid) {
            ageMessage.style.color = "red";
            ageMessage.textContent = "1~100 입력";
            agecheck = false;
        } else {
            ageMessage.textContent = "";
            agecheck = true;
        }
    }
    //	이벤트 리스너 (나이)
    document.getElementById("userAge").addEventListener("input", checkAgeValid);
    
    // 유효성 체크 (성별)
    function checkSexValid(){
    	const userSex = document.getElementById("userSex");
    	const sexMessage = document.getElementById("sexMessage");
    	if(userSex.value == "남자" || userSex.value == "여자"){
    		sexcheck = true;
    		sexMessage.textContent = ""
    	} else{
    		sexMessage.style.color = "red";
    		sexMessage.textContent = "성별 선택"
    		sexcheck = false;
    	}
    }
    //	이벤트 리스너 (성별)
    document.getElementById("userSex").addEventListener("change", checkSexValid);
    
    //	유효성 체크 (이메일)
    function checkEmailValid() {
        const userEmail = document.getElementById("userEmail");
        const emailMessage = document.getElementById("emailMessage"); // 이메일 메시지를 위한 span 요소 생성

        let emailValid = isEmailValid(userEmail.value);
        if (!emailValid) {
            emailMessage.style.color = "red";
            emailMessage.textContent = "이메일 형식이 올바르지 않습니다.";
            emailcheck = false;
        } else {
            emailMessage.textContent = "";
            emailcheck = true;
        }
    }

    //	이벤트 리스너 (이메일)
    document.getElementById("userEmail").addEventListener("input", checkEmailValid);
    
    //	유효성 체크 (전화번호)
    function checkPhoneValid() {
        const userCell = document.getElementById("userCell");
        const phoneMessage = document.getElementById("phoneMessage");

        let phoneValid = isPhoneValid(userCell.value);
        if (!phoneValid) {
            phoneMessage.style.color = "red";
            phoneMessage.textContent = "전화번호는 숫자로만 이루어진 11자리여야 합니다.";
            phonecheck = false;
        } else {
            phoneMessage.textContent = "";
            phonecheck = true;
        }
    }
    
    //	이벤트 리스너 (전화번호)
    document.getElementById("userCell").addEventListener("input", checkPhoneValid);





    // 아이디 중복 체크
	$(document).ready(function() {
    	
        $("#idCheckButton").click(function() {
            var userId = $("#userId").val();

            if (userId === "") {
                alert("아이디를 입력해주세요.");
                return;
            }
            
            if (!isUserIdValid(userId)) {
                $("#idCheckMessage").css("color", "red").text("아이디는 최소 4자 이상, 최대 15자 이하의 영문과 숫자로만 구성되어야 합니다.");
                idCheckDone = false; // 중복 확인 미완료
                return;
            }
            console.log("Requested user id:", userId);

            $.ajax({
                url: "/Member/checkUserId",
                type: "POST",
                data: { "userId": userId },
                success: function(data) {
                	
                    console.log("Server response:", data);
                    
                    if (data === "available") {
                        $("#idCheckMessage").css("color", "green").text("사용 가능한 아이디입니다.");
                        idCheckDone = true; // 중복 확인 완료
                    } else {
                        $("#idCheckMessage").css("color", "red").text("이미 사용중인 아이디입니다.");
                        idCheckDone = false; // 중복 확인 미완료
                    }
                }
            });
        });
    });
</script>

	<!-- 비밀번호 일치 확인-->
<script>

    function checkPasswordMatch() {
        const password = document.getElementById("userPw");
        const confirmPassword = document.getElementById("confirmPassword");
        const passwordMessage = document.getElementById("passwordMessage");

        let passwordValid = isPasswordValid(password.value);
        if (!passwordValid) {
            passwordMessage.style.color = "red";
            passwordMessage.textContent = "비밀번호는 영어와 숫자를 포함하여 최소 4자 이상, 최대 15자 이하이어야 합니다.";
            passwordMatch = false;
            return;
        }
        
        if (password.value !== confirmPassword.value) {
            passwordMessage.style.color = "red";
            passwordMessage.textContent = "비밀번호 입력값이 다릅니다.";
            passwordMatch = false;
        } else {
            passwordMessage.style.color = "green";
            passwordMessage.textContent = "비밀번호가 일치합니다.";
            passwordMatch = true;
        }
    }

    // 이벤트 리스너 등록
    
    document.getElementById("userPw").addEventListener("input", checkPasswordMatch);
    document.getElementById("confirmPassword").addEventListener("input", checkPasswordMatch);
    
</script>

	<!-- 회원 가입 버튼 -->
	<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
        	
            
        	// 아이디 중복 확인 및 비밀번호 확인 여부 검사 추가
        	if (!idCheckDone) {
        		alert("아이디 중복 확인을 진행해주세요.");
        		event.preventDefault();
        		event.stopPropagation();
        	} else if (!passwordMatch) {
        		alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
        		event.preventDefault();
        		event.stopPropagation();
        	} else if(!namecheck || !agecheck || !emailcheck || !phonecheck || !sexcheck){ 
        		alert("모든 항목을 올바르게 입력");
        		event.preventDefault();
        		event.stopPropagation();
        	} else if (form.checkValidity() === false) {
            	event.preventDefault();
            	event.stopPropagation();
          	}

          	form.classList.add('was-validated');
        }, false);
      });
    }, false);
</script>
<script>
    $(document).ready(function() {
        $("form[name='sign']").on("submit", function(e) {
        	if (!idCheckDone) {
        		event.preventDefault();
        		event.stopPropagation();
        	} else if (!passwordMatch) {
        		event.preventDefault();
        		event.stopPropagation();
        	} else if(!namecheck || !agecheck || !emailcheck || !phonecheck || !sexcheck){ 
        		event.preventDefault();
        		event.stopPropagation();
        	} else if (form.checkValidity() === false) {
            	event.preventDefault();
            	event.stopPropagation();
          	}

            var formData = $(this).serialize(); // form 내부의 입력값을 key=value 형태의 문자열로 변환

            $.ajax({
                type: "POST",
                url: "${path}/Member/Sign",
                data: formData,
                success: function(response) {
                    alert('회원 가입이 성공적으로 완료되었습니다.');
                    location.href = "/";  // 메인페이지로 리다이렉트
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                    alert('회원 가입에 실패하였습니다. 다시 시도해주세요.');
                }
            });
            e.preventDefault(); // 기본 submit 동작을 막음
        });
    });
</script>

  
  <!-- 주소지 스크립트 -->
<script>
    function findAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('userAddr1').value = data.zonecode;
                document.getElementById("userAddr2").value = roadAddr;
                document.getElementById("addr").value = data.jibunAddress;
         
                document.getElementById("sample4_engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</body>
</html>