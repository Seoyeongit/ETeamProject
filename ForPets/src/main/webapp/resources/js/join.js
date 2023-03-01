/**
 * 회원가입 js
 */

//controller로 가는 path 전역변수
var pathname = "/" + window.location.pathname.split("/")[1];
var origin = window.location.origin;
const contextPath = origin + pathname;

var chkPw = false;

//비밀번호패턴확인
function checkPttn(target) {
    var pattern = new RegExp(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/);
    chkPw = pattern.test($(target).val());

    if (chkPw == false) {
        if ($(target).siblings().hasClass('css-1voj95g')) {
            $(target).siblings('.css-1voj95g').text("비밀번호는 영문, 숫자를 포함하여 8자 이상이어야 합니다.");
            return false;
        } else {
            $(target).parents().eq(0).addClass('_2Zb2k');
            $(target).parents()[0].appendChild($('<div>').addClass('css-1voj95g').text('비밀번호는 영문, 숫자를 포함하여 8자 이상이어야 합니다.')[0]);
            return false;
        }
    } else {
        return true;
    }
}

let pwCheck = false;

//비밀번호체크확인
function checkPw(target) {
    if ($(target).val() !== $('#user_pw').val()) {
        if ($(target).siblings().hasClass('css-1voj95g')) {
            $(target).siblings('.css-1voj95g').text("입력하신 비밀번호와 다릅니다.");
            return false;
        } else {
            $(target).parents().eq(0).addClass('_2Zb2k');
            $(target).parents()[0].appendChild($('<div>').addClass('css-1voj95g').text('입력하신 비밀번호와 다릅니다.')[0]);
            return false;
        }
    } else {
        pwCheck = true;
        return true;
    }

}


$(".int-area .col_2 input").focus(function () {
    $(this).parents().eq(0).siblings('.col_1').addClass('focus');
    $(this).parents().eq(0).addClass('focus');
    $(this).addClass('focus');
});


//null값 체크
$(".int-area .col_2 input").on('blur', function () {
    if ($(this).val() == null || $(this).val() == '') {
        if ($(this).siblings().hasClass('css-1voj95g')) {
            $(this).parents().eq(0).siblings('.col_1').removeClass('focus');
            $(this).parents().eq(0).removeClass('focus');
            return;
        }
        $(this).parents().eq(0).siblings('.col_1').removeClass('focus');
        $(this).parents().eq(0).removeClass('focus');
        $(this).parents().eq(0).addClass('_2Zb2k');
        if ($(this).attr("id") === 'pwCheck') {
            $(this).parents()[0].appendChild($('<div>').addClass('css-1voj95g').text('확인을 위해 비밀번호를 한 번 더 입력해주세요.')[0]);
        } else {
            $(this).parents()[0].appendChild($('<div>').addClass('css-1voj95g').text('필수항목입니다.')[0]);
        }

    } else if ($(this).attr('name') === 'user_pw' && checkPttn($(this)) == true || $(this).attr("id") === 'pwCheck' && checkPw($(this)) == true) {
        $(this).parents().eq(0).removeClass('_2Zb2k');
        $(this).siblings().remove('.css-1voj95g');
    } else if ($(this).attr('name') === 'user_pw' && checkPttn($(this)) == false || $(this).attr("id") === 'pwCheck' && checkPw($(this)) == false) {
        return;
    }
    else {
        $(this).parents().eq(0).removeClass('_2Zb2k');
        $(this).siblings().remove('.css-1voj95g');
    }
});




// 휴대폰 번호 패턴
const autoHyphen = function (target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}

//휴대폰 번호 인증
let code2 = "";

$("#phoneChk").on("click", function () {
    const phone = $("#phone").val();
    const $this = $(this); // $(this)를 변수 $this에 저장
    $.ajax({
        type: "GET",
        url: contextPath + "/member/phoneCheck?phone=" + phone,
        cache: false,
        success: function (data) {
            if (data == "error") {
                $this.parents()[0].appendChild($('<div>').addClass('css-1voj95g').text('휴대폰 번호가 올바르지 않습니다.')[0]);
                $("#phone").attr("autofocus", true);
            } else {
                $this.parents()[0].appendChild($('<div>').addClass('css-1voj95g').text('인증번호 발송이 완료되었습니다.')[0]);
                $("#phone2").attr("disabled", false);
                $("#phone").attr("readonly", true);
                code2 = data;
            }
        }
    });
});



//휴대폰 인증번호 대조
$("#phoneChk2").click(function () {
    if ($("#phone2").val() == "") {
        $(this).parents()[0].appendChild($('<div>').addClass('css-1voj95g').text('인증번호가 입력되지 않았습니다.')[0]);
    } else if ($("#phone2").val() == code2) {
        $(this).parents()[0].appendChild($('<div>').addClass('css-1voj95g').text('인증번호가 일치합니다.')[0]);
        $("#phoneDoubleChk").val("true");
        $("#phone2").attr("disabled", true);
    } else {
        $(this).parents()[0].appendChild($('<div>').addClass('css-1voj95g').text('인증번호가 일치하지 않습니다. 다시 한 번 확인해주시길 바랍니다.')[0]);
        $("#phoneDoubleChk").val("false");
        $(this).attr("autofocus", true);
    }
});



//이용약관 전부체크합니다.
$(".checkbox-group").on("click", "#check_all", function () {
    $(this).parents(".checkbox-group").find("input").prop("checked", $(this).is(":checked"));
});


//이용약관 체크
$(".checkbox-group").on("click", ".normal", function () {
    var is_checked = true;
    $(".checkbox-group .normal").each(function () {
        is_checked = is_checked && $(this).is(":checked");
    });
    $("#check_all").prop("checked", is_checked);
});




// 아이디 중복확인
let id_check = false;
$('#check-id').click(function () {
    const user_id = $('#user_id').val();
    const userData = { "user_id": user_id };
    var pathname = "/" + window.location.pathname.split("/")[1];
    var origin = window.location.origin;

    const contextPath = origin + pathname;


    $.ajax({
        url: contextPath + "/member/checkId",
        type: "post",
        data: JSON.stringify(userData),
        dataType: "json",
        contentType: "application/json",
        success: function (result) {
            if (result == 0) {
                alert("가입이 가능한 아이디입니다.")
                id_check = true;
            } else if (result == 9) {
                alert("통신 오류");
            } else {
                alert("이미 존재하는 아이디입니다.")
            }
        },
        error: function (errorThrown) {
            alert("에러임ㅎ");
        }
    });
});


// 비밀번호 확인
function checkSummit() {
	
	console.log($("#form-body .int-area .col_2 input").val());

    if ($("#form-body .int-area .col_2 input").val() == '' || $("#form-body .int-area .col_2 input").val() == null) {
    	
    	console.log($("#form-body .int-area .col_2 input").val());
        
        $("#form-body .int-area .col_2 input").parents('.col_2').each(function () {
        	
        	$(this).addClass('_2Zb2k');
        	
            if ($(this).children('input').attr("id") === 'pwCheck') {
            	if ($(this).children('div').hasClass('css-1voj95g')) {
                    return;
                }
            	$(this).append($('<div>').addClass('css-1voj95g').text('확인을 위해 비밀번호를 한 번 더 입력해주세요.')); 
            }
            else {  
                if ($(this).children('div').hasClass('css-1voj95g')) {
                    return;
                }
            	$(this).append($('<div>').addClass('css-1voj95g').text('필수항목입니다.')); }
        });
        
        return;
    }


    if (!$('#check_all').is(':checked')) {
        alert("약관에 동의해주세요");
        return;
    } else if (id_check == false) {
        alert("아이디 중복 확인해주세요");
        return;
    } else if (pwCheck == false) {
        alert("비밀번호를 확인해주세요");
        return;
    } else if ($("#phoneDoubleChk").val() == false) {
        alertr("인증번호를 다시 한번 확인해주세요");
        return;
    } else {
        alert("환영합니다");
        $('#join-form').submit();
    }
}
