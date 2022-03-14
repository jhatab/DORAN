<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">

	<div class="mypage_btn">
		<input type="button" id="category" class="category" value="관심 주제" />
		<input type="button" id="group" class="group" value="가입 그룹" />
		<input type="button" id="user" class="user" value="회원 정보" />
	</div>

	<div class="mypage_wrap">
		<!-- 유저 정보 -->
		<div id="userInfo">
			<c:choose>
				<c:when test="${member.profileImg == null or member.profileImg == ''}">
					<img src="/images/chatbot.png" />
				</c:when>
				<c:otherwise>
					<img src="${member.profileImg}">
				</c:otherwise>
			</c:choose>
			<span>${member.nickname}님 환영합니다.</span>
		</div>
		<!-- 관심 주제 -->
		<div id="categoryList">
			<span>${member.nickname}님의 관심 주제를 선택해주세요. 최대 5개까지 선택이 가능합니다.</span>
			<div>
				<c:forEach items="${categoryList}" var="cList">
						<input type="checkbox" id="categoryId${cList.categoryId}" name="categoryId" value="${cList.categoryName}" />
						<label for="categoryId${cList.categoryId}">${cList.categoryName}</label>
				</c:forEach>
			</div>
			<button class="enrollBtn">확인</button>
		</div>
		<!--가입 그룹  -->
		<div id="groupList">
			<ul>
				<c:forEach items="${userGroupList}" var="gList">
					<li>
						<c:choose>
							<c:when test="${gList.groupImagePath == null or gList.groupImagePath == ''}">
								<img src="/images/group_image_file/basic.png">
							</c:when>
							<c:otherwise>
								<img src="${gList.groupImagePath}">
							</c:otherwise>
						</c:choose>
						<span class="groupName">${gList.groupName}</span>
						<span class="groupEnter">
							<a href="/group/home?groupId=${gList.groupId}">방문하기</a>
						</span>
					</li>
				</c:forEach>
			</ul>
		</div>
		<!-- 회원 정보 수정 -->
		<div id="userList">
			<form id="user_form" method="post" enctype="multipart/form-data">
				<div class="login_box">
					<div class="input_box">
						<div class="userImg_wrap">
							<c:if test="${member.profileImg!= null and member.profileImg != ''}">
								<div class="userImage">
									<img src="${member.profileImg}">
									<input type="hidden" name="profileImg" class="profileImg" value="${member.profileImg}" readonly>
									<span onClick="imageRemove()">삭제</span>
								</div>
							</c:if>
							<label for="file" class="input_file" style="display: none;">
								<img src="/images/photo.png" alt="프로필 이미지 선택">
							</label>
							<input type="file" name="file" id="file" accept="image/*">
							<div class="fileView_wrap" style="display: none;">
								<img class="fileView" src="#" alt="이미지 미리보기">
								<span onClick="removeFileFunc()">삭제</span>
							</div>
						</div>

						<h3>아이디</h3>
						<input class="input_content input_id" type="text" name="uid" value="${member.uid}" readonly/>

						<h3>비밀번호</h3>
						<input class="input_content input_pw" type="password" name="upass" value="${member.upass}" placeholder="비밀번호를 입력해주세요"/>
						<div class="input_result">
							<span class="pw_result_2">영문 대소문자/숫자 조합 (4자~10자 입력)</span> <span class="pw_final_ck">비밀번호를 입력해주세요.</span>
						</div>

						<h3>비밀번호 확인</h3>
						<input class="input_content input_pwck" type="password" placeholder="비밀번호를 한번 더 입력해주세요" />
						<div class="input_result">
							<span class="pwck_result_2">비밀번호가 일치하지 않습니다.</span> <span class="pwck_final_ck">비밀번호를 다시 입력해주세요.</span>
						</div>

						<h3>이름</h3>
						<input class="input_content input_name" type="text" name="name" value="${member.name}" placeholder="이름을 입력해주세요" />
						<div class="input_result">
							<span class="name_final_ck">이름을 입력해주세요.</span>
						</div>

						<h3>닉네임</h3>
						<input class="input_content input_nick" type="text" name="nickname" value="${member.nickname}" placeholder="닉네임을 입력해주세요" />
						<div class="input_result">
							<span class="nick_result_2">닉네임이 이미 존재합니다.</span> <span class="nick_final_ck">닉네임을 입력해주세요.</span>
						</div>

						<h3>생년월일</h3>
						<input class="input_content input_birth" type="text" name="birthDate" value="${member.birthDate}" placeholder="생년월일을 입력해주세요" autocomplete="off" />
						<div class="input_result">
							<span class="birth_final_ck">생년월일을 입력해주세요.</span>
						</div>

						<h3>성별</h3>
						<select name="gender">
							<option value="0" <c:if test="${member.gender == 0}">selected</c:if>>공개 안 함</option>
							<option value="1" <c:if test="${member.gender == 1}">selected</c:if>>남자</option>
							<option value="2" <c:if test="${member.gender == 2}">selected</c:if>>여자</option>
						</select>

						<h3>이메일</h3>
						<input class="input_content input_email" type="email" name="email" value="${member.email}" placeholder="이메일을 입력해주세요" />
						<div class="input_result">
							<span class="email_result_2">이메일을 형식이 올바르지 않습니다.</span> <span class="email_final_ck">이메일을 입력해주세요.</span>
						</div>

						<h3>주소</h3>
						<input class="input_content input_address" type="text" name="address" value="${member.address}" placeholder="주소를 입력해주세요" readonly="readonly" onclick="execution_daum_address()" onkeyup="if(window.event.keyCode==13){execution_daum_address()}" />
					</div>

					<div class="sign_btn">
						<button type="button" class="updateBtn">수정하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>

<!-- script -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	/* 탭 메뉴 */
	$(document).ready(function() {
		$("#userInfo").show();
		$("#categoryList").hide();
		$("#groupList").hide();
		$("#userList").hide();

		$("#category").click(function() {
			$("#userInfo").hide();
			$("#categoryList").show();
			$("#groupList").hide();
			$("#userList").hide();

			$(".category").addClass("active");
			$(".group").removeClass("active");
			$(".user").removeClass("active");
		});

		$("#group").click(function() {
			$("#userInfo").hide();
			$("#categoryList").hide();
			$("#groupList").show();
			$("#userList").hide();

			$(".category").removeClass("active");
			$(".group").addClass("active");
			$(".user").removeClass("active");
		});

		$("#user").click(function() {
			$("#userInfo").hide();
			$("#categoryList").hide();
			$("#groupList").hide();
			$("#userList").show();

			$(".category").removeClass("active");
			$(".group").removeClass("active");
			$(".user").addClass("active");
		});
	});
	
	/* ========== 회원정보 수정 ========== */
	
	/* 유효성 검사 */
	var pwCheck = false;		// 비밀번호
	var pwFmCheck = true;		// 비밀번호 형식 확인
	var pwckCheck = false;		// 비밀번호 확인
	var pwckcorCheck = false	// 비밀번호 확인 일치 확인
	var nameCheck = false;		// 이름
	var nickCheck = false;		// 닉네임
	var nickCkCheck = true;		// 닉네임 중복 검사
	var emailCheck = false;		// 이메일
	var emailFmCheck = true;	// 이메일 형식 확인
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
					if(nickname != '${member.nickname}') {
						$('.nick_result_2').css("display", "inline-block");
						$('.nick_final_ck').css("display", "none");
						nickCkCheck = false;
					}
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
	
	/* 이름 */
	$('.input_name').on("propertychange change keyup paste input", function() {
		var name = $(".input_name").val();
		
		if(name != ''){
			$('.name_final_ck').css("display", "none");
		} else {
			$('.name_final_ck').css("display", "inline-block");
			nameCheck = false;
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
	
	/* ========== 회원정보 수정 버튼 ========== */
	
	$(".updateBtn").click(function(){
		var pw = $('.input_pw').val();			// 비밀번호 입력란
		var pwck = $('.input_pwck').val();		// 비밀번호 확인 입력란
        var name = $('.input_name').val();		// 이름 입력란
        var nickname = $('.input_nick').val();	// 닉네임 입력란
        var email = $('.input_email').val();	// 이메일 입력란
        var birth = $('.input_birth').val();	// 생년월일 입력란
        var addr = $('.input_address').val();	// 주소 입력란
        
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
		if(pwCheck && pwFmCheck && pwckCheck && pwckcorCheck && nameCheck && nickCheck && nickCkCheck && emailCheck && emailFmCheck && birthCheck && addressCheck ){
			alert("수정이 완료되었습니다. 다시 로그인 해주세요.");
 			$("#user_form").attr("action", "/user/update.do");
	 		$("#user_form").submit();
		}
		
		return false;
    });
	
	/* ========== 이미지 미리보기 ========== */
	$(document).ready(function() {
		if("${member.profileImg}" == "") {
			document.querySelector(".input_file").style.display = '';
		}
	});
	
	function readImage(input) {
		if (input.files && input.files[0]) {
			const reader = new FileReader()

			reader.onload = function (e) {
				document.querySelector(".fileView").src = e.target.result;
				document.querySelector(".fileView_wrap").style.display = '';
				document.querySelector(".input_file").style.display = 'none';
			}
			reader.readAsDataURL(input.files[0])
		}
	}

	const inputImage = document.getElementById("file")
	inputImage.addEventListener("change", e => {
		if (inputImage.value.length == 0) {
			document.querySelector(".fileView_wrap").style.display = 'none';
			document.querySelector(".input_file").style.display = '';
		} else {
			readImage(e.target)
		}
	});

	/* 첨부파일 삭제 */
	function removeFileFunc() {
		inputImage.value = "";
		document.querySelector(".fileView_wrap").style.display = 'none';
		document.querySelector(".input_file").style.display = '';
	}
	
	function imageRemove() {
		document.querySelector(".input_file").style.display = '';
		document.querySelector(".userImage").style.display = 'none';
		document.querySelector(".profileImg").value = '';
	}
</script>