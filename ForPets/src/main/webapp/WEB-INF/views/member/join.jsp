<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<title>회원가입</title>
</head>

<body>

	<section class="join-form-wrap">
	
	<a><img src="${pageContext.request.contextPath}/resources/assets/img/logo_gr.png"></a>

	<form method="post" action="../member/join" id="join-form">
	
		<div id="form-body">
			<div class="form-title">
				<h1>회원가입</h1>
				<p class="subTx"><strong>*</strong>필수 입력 정보입니다.</p>
			</div>

				<div class="int-area">
					<div class="col_1">
						<label id="int-label">아이디</label>
						<i class="icon required" aria-hidden="hidde">*</i>
					</div>
					<div class="col_2">
						<input class="join-input-area" type="text" name="user_id" id="user_id" pattern="^([a-z0-9_]){6,20}$" autocomplete="off" required="required" maxlength="20"> 
						<button type="button" id="check-id">아이디 중복확인</button>
					</div>
				</div>
				
				<div class="int-area">
					<div class="col_1">
						<label id="int-label">패스워드</label>
						<i class="icon required" aria-hidden="hidde">*</i>
					</div>
					<div class="col_2">
						<input type="password" name="user_pw" id="user_pw" autocomplete="off" onInput="checkPttn(this)" required="required" > 
					</div>
				</div>

				<div class="int-area">
					<div class="col_1">
						<label id="int-label">패스워드 확인</label>
						<i class="icon required" aria-hidden="hidde">*</i>
					</div>
					<div class="col_2" class="pwCheck">
						<input type="password" id="pwCheck" autocomplete="off" required="required" onInput="checkPw(this)" >
					</div>
				</div>

				<div class="int-area">
					<div class="col_1">
						<label id="int-label">이름</label>
						<i class="icon required" aria-hidden="hidde">*</i>
					</div>
					<div class="col_2">
						<input type="text" name="user_name" id="user_name" autocomplete="off" required="required"> 
					</div>
				</div>

				<div class="int-area">
					<div class="col_1">
						<label id="int-label">닉네임</label>
						<i class="icon required" aria-hidden="hidde">*</i>
					</div>
					<div class="col_2">
 						<input type="text" name="user_nick" id="user_nick" autocomplete="off" required="required">
					</div>
				</div>

				<div class="int-area">
					<div class="col_1">
						<label id="int-label">휴대폰 번호</label>
						<i class="icon required" aria-hidden="hidde">*</i>
					</div>
					<div class="col_2">
						<input type="text" id="phone" name="phnumber" oninput="autoHyphen(this)" maxlength="13" required="required">
						<button type="button" id="phoneChk" class="doubleChk btn btn-primary">인증번호 전송</button>
					</div>
				</div>

				<div class="int-area">
					<div class="col_1">
						<label id="int-label">인증번호입력</label>
						<i class="icon required" aria-hidden="hidde">*</i>
					</div>
					<div class="col_2">
						<input type="text" id="phone2" name="userPhone2" title="인증번호 입력" disabled required="required" />
						<button type="button" class="btn btn-primary" id="phoneChk2" class="doubleChk">본인인증</button>
						<input type="hidden" id="phoneDoubleChk" />
					</div>
				</div>

			</div>
			
							
				
		<div id="form-body">
				<div class="checkbox-group">
					<div class="allChkBtn">
						<label for="check_all">전체동의 선택항목에 대한 동의 포함</label>
						<input id="check_all" type="checkbox">
					</div>
					<hr>
					<div>
						<label for="check_1"><stong>[필수] </stong>회원 약관에 동의합니다.</label>
						<input id="check_1"" class="normal" type="checkbox">
					</div>
					<div>
						<label for="check_2"><stong>[필수] </stong>개인정보 약관에 동의합니다.</label>
						<input id="check_2" class="normal" type="checkbox">
					</div>
				</div>
		</div>
		
		<div id="form-bottom" class="btn-wrap">
				<div class="btn-area">
					<button class="facebook" type="submit" onclick="checkSummit(); return false;">회원가입</button>
				</div>

				<div class="btn-area">
					<button class="default" type="button" onclick="location.href='../member/loginMain'">로그인으로 돌아가기</button>
				</div>
		</div>
				
	</form>
	</section>
	<!-- 회원가입 js -->
	<script src="${pageContext.request.contextPath}/resources/js/join.js"></script>
</body>
</html>
