<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" />
<title>펫트너 로그인</title>
<style>
	.footer {
  text-align: center;
  }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<center>
<button type="button" class="loginimg" onclick="location.href='${pageContext.request.contextPath}/member/loginMain';"></button>
<div class="partlog-tx">펫트너 로그인</div>
<div class="loginform">
  	<div><input type="text" class="idbox" name="part_id" placeholder="아이디"/></div>
    <div class="password-box"><input type="password" class="pwbox" name="part_pw" placeholder="비밀번호"/></div>
    <div class="login-con"><input type="submit" class="loginbox" value="로그인" /></div>
</div>
</center>
<br>
<%@ include file="/WEB-INF/views/footer.jsp" %>

<script>
	$('.loginbox').on('click', function(){
		const partnerData = { 
				part_id : $('input[name=part_id]').val(),
				part_pw : $('input[name=part_pw]').val()
		};
		
		if($('.idbox').val()==null || $('.idbox').val()==''){
			if($('.password-box').children('div').hasClass('error-msg')){ $(this).text('아이디를 입력해주세요.'); return;}
			$('.loginform').children('.password-box').append($('<div>').addClass('error-msg').text('아이디를 입력해주세요.')); 
			$('.idbox').focus();
			return;
		}
		
		else if($('.pwbox').val()==null || $('.pwbox').val()==''){
			if($('.password-box').children('div').hasClass('error-msg')){
				$(this).text('비밀번호를 입력해주세요.');
				return;}
			$('.loginform').children('.password-box').append($('<div>').addClass('error-msg').text('비밀번호를 입력해주세요.')); 
			$('.pwbox').focus();
			return;
		}else{
		$.ajax({
			url:'../partner/login',
			type: "post",
	        data: JSON.stringify(partnerData),
	        dataType: "json",
	        contentType: "application/json",
			success:function(result){
				if(result==1){
					window.location.href="../";
				}else if(result==0){
					if($('.password-box').children('div').hasClass('error-msg')){
						$('.password-box').children('.error-msg').text('아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.입력하신 내용을 다시 확인해주세요.'); 
						return;}
					$('.loginform').children('.password-box').append($('<div>').addClass('error-msg').text('아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.입력하신 내용을 다시 확인해주세요.')); 
					return;
				}else{
					alert("통신오류");
				}
			},
			error:function(reuslt){
				alert('에러임');
			}
		});
	}
	})
</script>
</body>
</html>