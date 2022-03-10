<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container">
	<div class="login_wrapper">
		<div class="login">
			<div class="login_logo">
				<img class="login_logo_img" src="/images/logo.png" />
			</div>
			<div class="login_box">
				<form id="loginForm" method="post" action="/user/login.do">
					<div class="input_box">
						<h3>아이디</h3>
						<input type="text" id="id_input" class="id_input" name="uid" placeholder="아이디를 입력해주세요">
						<h3>비밀번호</h3>
						<input type="password" class="pw_input" name="upass" placeholder="비밀번호를 입력해주세요">
					</div>

					<div class="find_btn">
						<span>아이디 찾기&nbsp;</span> <span>/&nbsp;</span> <span>비밀번호 찾기</span>
					</div>
					<div class="sign_btn">
						<input type="submit" class="login_button" value="로그인">
					</div>
				</form>
				<div class="sign_up">
					<span>아직 계정이 없으신가요?&nbsp;</span> <span>&nbsp;회원 가입</span>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- script -->
<script>
</script>
