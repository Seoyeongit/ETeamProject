/**
 * 회원가입 js
 */

var chkPw = false;

//비밀번호패턴확인
function checkPttn(target){
	var  pattern= new RegExp(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/);
	chkPw = pattern.test($(target).val());
	
	if(chkPw == false){
		if($(".int-area .col_2 div").hasClass('css-1voj95g')){
			$(".css-1voj95g").text("최소 하나의 소문자,하나의 숫자 비밀번호를 최소8자리로 입력해주세요.");
			return false;
		}else{
			$().parents().eq(0).addClass('_2Zb2k');
			$(target).parents()[0].appendChild($('<div>').addClass('css-1voj95g').text('최소 하나의 소문자,하나의 숫자 비밀번호를 최소8자리로 입력해주세요.')[0]);
			return false;
		}
	}else{
		return true;
	}
}



$(".int-area .col_2 input").focus(function(){
	$(this).parents().eq(0).siblings('.col_1').addClass('focus');
	$(this).parents().eq(0).addClass('focus');
	$(this).addClass('focus');
});

//null값 체크
$(".int-area .col_2 input").on('blur',function(){
	if($(this).val() == null || $(this).val() == ''){
		if($(this).siblings().hasClass('css-1voj95g')){
			$(this).parents().eq(0).siblings('.col_1').removeClass('focus');
			$(this).parents().eq(0).removeClass('focus');
			return;
		}
		$(this).parents().eq(0).siblings('.col_1').removeClass('focus');
		$(this).parents().eq(0).removeClass('focus');
		$(this).parents().eq(0).addClass('_2Zb2k');		
		if($(this).attr("id")==='pwCheck'){
			$(this).parents()[0].appendChild($('<div>').addClass('css-1voj95g').text('확인을 위해 비밀번호를 한 번 더 입력해주세요.')[0]);
		}else{
			$(this).parents()[0].appendChild($('<div>').addClass('css-1voj95g').text('필수항목입니다.')[0]);
		}
	
	}else if($(this).attr('name')==='user_pw' && checkPttn($(this))==true){
		$(this).parents().eq(0).removeClass('_2Zb2k');
		$(this).siblings().remove('.css-1voj95g');
	}else if($(this).attr('name')==='user_pw' && checkPttn($(this))==false){
		return;
	}
	else {
		$(this).parents().eq(0).removeClass('_2Zb2k');
		$(this).siblings().remove('.css-1voj95g');
	}
});




// 휴대폰 번호 패턴
const autoHyphen = function(target) {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}

//휴대폰 번호 인증
let code2 = "";
$("#phoneChk").click(function(){
	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
	const phone = $("#phone").val();
	$.ajax({
        type:"GET",
        url:"phoneCheck?phone=" + phone,
        cache : false,
        success:function(data){
        	if(data == "error"){
        		alert("휴대폰 번호가 올바르지 않습니다.")
				$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
				$(".successPhoneChk").css("color","red");
				$("#phone").attr("autofocus",true);
        	}else{	        		
        		$("#phone2").attr("disabled",false);
        		$("#phoneChk2").css("display","inline-block");
        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
        		$(".successPhoneChk").css("color","green");
        		//$("#phone").attr("readonly",true);
        		code2 = data;
        	}
        }
    });
});

//휴대폰 인증번호 대조
$("#phoneChk2").click(function(){
	if($("#phone2").val() == ""){
		$(".successPhoneChk").text("인증번호를 입력하세요.");
	}else if($("#phone2").val() == code2){
		$(".successPhoneChk").text("인증번호가 일치합니다.");
		$(".successPhoneChk").css("color","green");
		$("#phoneDoubleChk").val("true");
		$("#phone2").attr("disabled",true);
	}else{
		$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
		$(".successPhoneChk").css("color","red");
		$("#phoneDoubleChk").val("false");
		$(this).attr("autofocus",true);
	}
});




// 아이디 중복확인
let id_check = false;
	$('#check-id').click(function(){
		const user_id = $('#user_id').val();
		const userData = {"user_id": user_id};
		var pathname = "/" + window.location.pathname.split("/")[1];
		var origin = window.location.origin;
		
		const contextPath = origin + pathname;
		

		$.ajax({
			url: contextPath+"/member/checkId",
			type: "post",
			data: JSON.stringify(userData),
			dataType: "json",
			contentType: "application/json",
			success: function(result){
				if(result == 0) {
					alert("가입이 가능한 아이디입니다.")
					id_check = true;
				} else if(result == 9) {
					alert("통신 오류");
				} else {
					alert("이미 존재하는 아이디입니다.")
				}
			},
			error : function(errorThrown){
				alert("에러임ㅎ");
			}
		});
	});
	

// 비밀번호 확인
function checkSummit(){
	const userPw = $('#user_pw').val();
	const pwCheck = $('#pwCheck').val();
	if(userPw !== pwCheck){
		alert("비밀번호를 확인해주세요");
		return;
	}
	
	if(!($('#member').is(':checked') && $('#individual').is(':checked'))){
		alert("약관에 동의해주세요");
		return;
	} else if(id_check != true){
		alert("아이디 중복 확인해주세요");
		return;
	} else {
		alert("환영합니다");
		$('#join-form').submit();
	}
}
