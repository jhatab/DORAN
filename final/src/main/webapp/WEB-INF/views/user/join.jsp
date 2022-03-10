<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	.id_result_2, .nick_result_2, .pw_result_2, .pwck_result_2, .email_result_2 {
		color: red;
		display: none;
	}
	.id_final_ck, .pw_final_ck, .pwck_final_ck, .name_final_ck, .nick_final_ck, .email_final_ck, .birth_final_ck, .addr_final_ck {
		color: red;
		display: none;
	}
</style>

<h1>회원가입</h1>

<form id="join_form" method="post" enctype="multipart/form-data">
	<label for="file" class="input_file">이미지 선택</label>
	<input type="file" name="file" id="file" accept="image/*">
	
	<div>
		<input type="text" name="uid" class="input_id" placeholder="아이디">
		<span class="id_result_2">아이디가 이미 존재합니다.</span>
		<span class="id_final_ck">아이디를 입력해주세요.</span>
	</div>

	<div>
		<input type="password" name="upass" class="input_pw" placeholder="비밀번호">
		<span class="pw_result_2">영문 대소문자/숫자 조합 (4자~10자 입력)</span>
		<span class="pw_final_ck">비밀번호를 입력해주세요.</span>
	</div>

	<div>
		<input type="password" class="input_pwck" placeholder="비밀번호 확인">
		<span class="pwck_result_2">비밀번호가 일치하지 않습니다.</span>
		<span class="pwck_final_ck">비밀번호를 다시 입력해주세요.</span>
	</div>

	<div>
		<input type="text" name="name" class="input_name" placeholder="이름">
		<span class="name_final_ck">이름을 입력해주세요.</span>
	</div>

	<div>
		<input type="text" name="nickname" class="input_nick" placeholder="닉네임">
		<span class="nick_result_2">닉네임이 이미 존재합니다.</span>
		<span class="nick_final_ck">닉네임을 입력해주세요.</span>
	</div>

	<div>
		<input type="email" name="email" class="input_email" placeholder="이메일">
		<span class="email_result_2">이메일을 형식이 올바르지 않습니다.</span>
		<span class="email_final_ck">이메일을 입력해주세요.</span>
	</div>

	<div>
		<input type="text" name="birthDate" class="input_birth" placeholder="생년월일" readonly>
		<span class="birth_final_ck">생년월일을 입력해주세요.</span>
	</div>

	<div>
		<label>
			<input type="radio" name="gender" value="0" checked="checked">공개 안 함
		</label>
		<label>
			<input type="radio" name="gender" value="1">여성
		</label>
		<label>
			<input type="radio" name="gender" value="2">남성
		</label>
	</div>

	<div>
		<input type="text" name="address" class="input_address" placeholder="주소" readonly="readonly" onclick="execution_daum_address()">
		<span class="addr_final_ck">주소를 입력해주세요.</span>
	</div>

	<button type="button" class="joinBtn">가입하기</button>
</form>

<!-- script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	/* 유효성 검사 */
	var idCheck = false;		// 아이디
	var idCkCheck = false;		// 아이디 중복 검사
	var pwCheck = false;		// 비밀번호
	var pwFmCheck = false;		// 비밀번호 형식 확인
	var pwckCheck = false;		// 비밀번호 확인
	var pwckcorCheck = false	// 비밀번호 확인 일치 확인
	var nameCheck = false;		// 이름
	var nickCheck = false;		// 닉네임
	var nickCkCheck = false;	// 닉네임 중복 검사
	var emailCheck = false;		// 이메일
	var emailFmCheck = false;	// 이메일 형식 확인
	var birthCheck = false;		// 생년월일
	var addressCheck = false;	// 주소
	
	/* 아이디 중복검사 */
	$('.input_id').on("propertychange change keyup paste input", function() {
		var uid = $('.input_id').val();
		var data = {uid : uid};

		$.ajax({
			type : "post",
			url : "/user/idCheck",
			data : data,
			success : function(result) {
				if(uid == '') {
					$('.id_final_ck').css("display", "inline-block");
					$('.id_result_2').css("display", "none");
					return false;
				}
				if (result != 'fail') {
					$('.id_result_2').css("display", "none");
					$('.id_final_ck').css("display", "none");
					idCkCheck = true;
				} else {
					$('.id_result_2').css("display", "inline-block");
					$('.id_final_ck').css("display", "none");
					idCkCheck = false;
				}
			}
		});
	});
	
	/* 닉네임 중복검사 */
	$('.input_nick').on("propertychange change keyup paste input", function() {
		var nickname = $('.input_nick').val();
		var data = {nickname : nickname};

		$.ajax({
			type : "post",
			url : "/user/nickCheck",
			data : data,
			success : function(result) {
				if(nickname == '') {
					$('.nick_final_ck').css("display", "inline-block");
					$('.nick_result_2').css("display", "none");
					return false;
				}
				if (result != 'fail') {
					$('.nick_result_2').css("display", "none");
					$('.nick_final_ck').css("display", "none");
					nickCkCheck = true;
				} else {
					$('.nick_result_2').css("display", "inline-block");
					$('.nick_final_ck').css("display", "none");
					nickCkCheck = false;
				}
			}
		});
	});
	
	/* 비밀번호 형식 체크 */
	function pwFormCheck(pw) {
		var form = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,10}$/;
		return form.test(pw);
	}
	
	$('.input_pw').on("propertychange change keyup paste input", function() {
		var pw = $(".input_pw").val();
		
		if(pwFormCheck(pw)){
			$('.pw_result_2').css("display", "none");
			pwFmCheck = true;
		} else {
			$('.pw_result_2').css("display", "inline-block");
			$('.pw_final_ck').css('display','none');
			pwFmCheck = false;
		return false;
		}
	});
	
	/* 비밀번호 확인 */
	$('.input_pwck').on("propertychange change keyup paste input", function() {
		var pw = $('.input_pw').val();
		var pwck = $('.input_pwck').val();
		$('.pwck_final_ck').css('display', 'none');
		
		if(pw == pwck) {
			$('.pwck_result_2').css('display','none');
			pwckcorCheck = true;
		} else {
			$('.pwck_result_2').css('display','inline-block');
			pwckcorCheck = false;
		}
	});
	
	/* 이메일 형식 체크 */
	function mailFormCheck(email) {
		var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return form.test(email);
	}
	
	$('.input_email').on("propertychange change keyup paste input", function() {
		var email = $(".input_email").val();
		
		if(mailFormCheck(email)){
			$('.email_result_2').css("display", "none");
			emailFmCheck = true;
		} else {
			$('.email_result_2').css("display", "inline-block");
			$('.email_final_ck').css('display','none');
			emailFmCheck = false;
		return false;
		}
	});
	
	/* 생년월일 선택 */
	$(function () {
		$(".input_birth").datepicker({
			dateFormat: 'yy-mm-dd',
			prevText: '',
			nextText: '',
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			showMonthAfterYear: true,
			changeYear: true,
			changeMonth: true,
			maxDate: "0D",
			yearRange: "c-100:c+0",
		});
	});
	
	/* 주소 입력 */
	function execution_daum_address() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';		// 주소 변수
				var extraAddr = '';	// 참고항목 변수

				if (data.userSelectedType === 'R') {	// 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else {								// 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				
				// 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 주소변수 문자열과 참고항목 문자열 합치기
						addr += extraAddr;
				} else {
					addr += ' ';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$(".input_address").val(addr);
			}
		}).open();
	}
	
	/* ========== 회원가입 버튼 ========== */
	
	$(".joinBtn").click(function(){
		var id = $('.input_id').val();			// 아이디 입력란
		var pw = $('.input_pw').val();			// 비밀번호 입력란
		var pwck = $('.input_pwck').val();		// 비밀번호 확인 입력란
        var name = $('.input_name').val();		// 이름 입력란
        var nickname = $('.input_nick').val();	// 닉네임 입력란
        var email = $('.input_email').val();	// 이메일 입력란
        var birth = $('.input_birth').val();	// 생년월일 입력란
        var addr = $('.input_address').val();	// 주소 입력란
        
        /* 아이디 유효성 검사 */
		if(id == "") {
			$('.id_final_ck').css('display','inline-block');
			$('.id_result_2').css('display', 'none');
			idCheck = false;
		} else {
			$('.id_final_ck').css('display', 'none');
			idCheck = true;
		}
        
		/* 비밀번호 유효성 검사 */
		if(pw == "") {
			$('.pw_final_ck').css('display','inline-block');
			$('.pw_result_2').css('display','none');
			pwCheck = false;
		} else {
			$('.pw_final_ck').css('display', 'none');
			pwCheck = true;
		}
		
		/* 비밀번호 확인 유효성 검사 */
		if(pwck == "") {
			$('.pwck_final_ck').css('display','inline-block');
			$('.pwck_result_2').css('display', 'none');
			pwckCheck = false;
		} else {
			$('.pwck_final_ck').css('display', 'none');
			pwckCheck = true;
		}
		
		/* 이름 유효성 검사 */
		if(name == "") {
			$('.name_final_ck').css('display','inline-block');
			nameCheck = false;
		} else {
			$('.name_final_ck').css('display', 'none');
			nameCheck = true;
		}
		
		/* 닉네임 유효성 검사 */
		if(nickname == "") {
			$('.nick_final_ck').css('display','inline-block');
			$('.nick_result_2').css('display', 'none');
			nickCheck = false;
		} else {
			$('.nick_final_ck').css('display', 'none');
			nickCheck = true;
		}
		
		/* 이메일 유효성 검사 */
		if(email == "") {
			$('.email_final_ck').css('display','inline-block');
			$('.email_result_2').css('display', 'none');
			emailCheck = false;
		} else {
			$('.email_final_ck').css('display', 'none');
			emailCheck = true;
		}
		
		/* 생년월일 유효성 검사 */
		if(birth == "") {
			$('.birth_final_ck').css('display','inline-block');
			birthCheck = false;
		} else {
			$('.birth_final_ck').css('display', 'none');
			birthCheck = true;
		}
		
		/* 주소 유효성 검사 */
		if(addr == "") {
			$('.addr_final_ck').css('display','inline-block');
			addressCheck = false;
		} else {
			$('.addr_final_ck').css('display', 'none');
			addressCheck = true;
		}
		
		/* 최종 유효성 검사 */
		if(idCheck && idCkCheck && pwCheck && pwFmCheck && pwckCheck && pwckcorCheck && nameCheck && nickCheck && nickCkCheck && emailCheck && emailFmCheck && birthCheck && addressCheck ){
 			$("#join_form").attr("action", "/user/join.do");
	 		$("#join_form").submit();
		}
		
		return false;
		
    });
</script>
