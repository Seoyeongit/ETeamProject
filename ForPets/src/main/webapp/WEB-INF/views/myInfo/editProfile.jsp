<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    <head>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    	<style type="text/css">
    		.adit-form-box{
    			width:50%;
    			margin-left: auto;
    			margin-right: auto;
    			display: flex;
    			flex-direction: column;
    		}
    		
    		.form-control:disabled, .form-control[readonly] {
			    background-color: transparent;
			    opacity: 1;
			}
    		
    		.adit-form-box>h2{
    			text-align: center;
    		}
    		
    		.adit-form-content{
    			display: flex;
    			flex-direction: column;
    		}
    		
    		.adit-form-bottom{
    			text-align: center;
    		}
    		
    		.address-info{
    		}
    		
    		.address-info-head{
				display: flex;
				flex-direction: row-reverse;
    		}
    		
    		.info-box:not(:first-child) {
				margin-top: 10px;
			}
			
			.pw-info,.name-info{
				display: flex;
				flex-direction: row;
				grid-gap: 21px;
			}
			
			.pw-info >*, .name-info >*{
				width: 100%;
			}
			
			#find-address{
				margin-right: 15px;
			}
			
			.phnumber{
				display: flex;
				flex-direction: row;
				grid-gap : 10px;
				align-items: center;
			}
			
			
			
			/*제이쿼리 detepicker css적용 */
			
			.ui-state-default, .ui-widget-content .ui-state-default,
			 .ui-widget-header .ui-state-default, .ui-button,
			  html .ui-button.ui-state-disabled:hover,
			   html .ui-button.ui-state-disabled:active{
				border: 0;
				background-color: transparent;
				border-radius:5px;
				padding:5px;
				padding-top : 3px;
				padding-bottom : 3px;
				text-align: center;
				transition:background-color 0.1s;
			}
			
			.ui-state-default:hover{
				
				background-color: #8bda8b;
				color: #fff;
			}
			
			.ui-state-active, .ui-widget-content .ui-state-active,
			 .ui-widget-header .ui-state-active,
			  a.ui-button:active,
			   .ui-button:active, .ui-button.ui-state-active:hover {
			    font-weight:700;
			    color: #8bda8b;
			}
			
			.ui-widget-header {
			    border: 0;
			    background-color: transparent;
			    color: #333333;
			    font-weight: bold;
			    font-size: 17px;
			}
			
			.ui-datepicker th{
				font-weight: 400;
				font-size: 14px;
				color : #8d8d8d;
			}
			
			.ui-widget-content{
				padding : 8px;
			}
			
			.ui-widget-content{
				font-family: 'Spoqa Han Sans Neo', 'sans-serif';
				box-sizing: content-box !important;
				width: max-content;
			}
			
			.ui-datepicker table {
			    width: 68%;
			    box-sizing: inherit;
			    font-size: 15px;
			    border-collapse: collapse;
			    margin-right: auto;
			    margin-left: auto;
			    text-align: center;
			}
			
			.ui-datepicker .ui-datepicker-prev, .ui-datepicker .ui-datepicker-next {
			    position: absolute;
			    top: 2px;
			    width: 1.8em;
			    height: 1.8em;
			 }
			 
			 .address-info>div:not(:first-child){
			 	margin-bottom : 1em;
			 }

    		
    	</style>
    </head>

  <div class="adit-form-box">   
    <h2>회원 정보 수정</h2>
    <p style="text-align: center;">사이트 이용에 필요한 정보들을 입력합니다.</p>
<form>
    <div class="adit-form-content container-sm text-bg-light">
        <div class="info-box">
            <div class="">
                <label for="user_id" class="form-label" >아이디</label>
                <input type="text" class="form-control" id="user_id" value="${member.user_id}" name="user_id" readonly="readonly"  autocomplete="username">
            </div>
        </div>

        <div class="pw-info info-box" >
            <div >
                <label for="inputPassword">비밀번호</label>
                <div>
				<input type="password" class="form-control" id="user_pw" name="user_pw" value="${member.user_pw }">
                </div>
            </div>
            <div>
                <label for="inputPassword" >비밀번호확인</label>
                <div>
                    <input type="password" class="form-control" id="pwChk" autocomplete="new-password">
                </div>
            </div>
        </div>

        
        <div class="name-info info-box">
            <div>
                <label for="user_name" class="col-form-label">이름</label>
                <div>
                    <input type="text" class="form-control" id="user_name" value="${member.user_name}" name="user_name" autocomplete="off">
                </div>
            </div>
            <div>
                <label for="user_nick" class="col-form-label">닉네임</label>
                <div class=" ">
                    <input type="text" class="form-control" id="user_nick" value="${member.user_nick}" name="user_nick" autocomplete="off">
                </div>
            </div>
        </div>
        
        <div class="info-box">
            <div class="birth">
                <label for="user_phnumber" class="form-label" >생년월일</label>
                <input class="form-control" id="user-birth" placeholder="YYYY-MM-DD" autocomplete="off" value="${member.birth }">
            </div>
        </div>
        

        <div class="info-box">
                <label for="user_phnumber" class="form-label" >전화번호</label>
            <div class="phnumber">
                <input type="text" class="form-control" id="user_phnumber_1" autocomplete="off" value="${fn:substring(member.phnumber ,0,3) }">-
                <input type="text" class="form-control" id="user_phnumber_2" autocomplete="off" value="${fn:substring(member.phnumber ,3,7)}">-
                <input type="text" class="form-control" id="user_phnumber_3" autocomplete="off" value="${fn:substring(member.phnumber ,7,11)}">
            </div>
        </div>

        <div class="address-info info-box">
            <div class="">
                <label for="exampleFormControlInput1" class="form-label" >주소 <span> 현재주소 : ${member.user_add}</span></label>
            </div>
            <div class="address-info-head">
                <input type="text"class="form-control" id="address_input_1" readonly="readonly" placeholder="우편번호">
                <input type="button" onclick="execution_kakao_address()" id="find-address" value="우편번호 찾기"><br>
            </div>
            <div>
                <input type="text" class="form-control"  id="address_input_2" readonly="readonly" placeholder="주소">
            </div>
            <div>
                <input type="text" class="form-control"  id="address_input_3" readonly="readonly" placeholder="상세주소">
                <input type="hidden" id="result_userAdd" value="${member.user_add}" name="user_add">
            </div>
        </div>
    </div>
    <div class="adit-form-bottom ">
        <input type="button" value="수정하기" id="edituserInfo">
        <input type="button" value="돌아가기" id="backMainPage">
    </div>
   </div>
 </form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>



var addr = ''; // 주소 변수

function execution_kakao_address() {

	
    new daum.Postcode({
        oncomplete: function (data) {
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.


            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("#address_input_1").val(data.zonecode);
            $("#address_input_2").val(addr)
            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이도한다.
            $("#address_input_3").attr("readonly", false);
            $("#address_input_3").focus();

            $("#result_userAdd").val(addr);
        	}
    	}).open();
	}
    
    $('.adit-form-bottom #edituserInfo').click(function(){
    	if(addr !== '' ){
    	addr += ' ' + $("#address_input_3").val();
        $("#result_userAdd").val(addr);
    	}
    	
    	
    	if($('input[name=user_pw]').val()!==$('input[id=pwChk]').val()){
    		alert("암호가 일치하지 않습니다 한번더 확인해주세요.");
    		return false;
    	}
    	
    	$.ajax({
    		url:"../myInfo/edit",
    		data : {
    			user_id:$("#user_id").val(),
    			user_pw:$("#user_pw").val(),
    			user_name:$("#user_name").val(),
    			user_nick:$("#user_nick").val(),
    			phnumber:$("#user_phnumber_1").val()+"-"+$("#user_phnumber_2").val()+"-"+$("#user_phnumber_3").val(),
    			user_add:$("#result_userAdd").val(),
    			birthStr:$('#user-birth').val()
    		},
    		dataType : "text",
    		type : "GET",
    		success : function(result){
    			alert("회원정보수정 성공했습니다.")
    			location.replace('../myInfo/main');								
			},
			error : function(result){
				console.log(result);
				
				alert("오류가났습니다..");
			}
    	});    	
    });
    
	$("div #backMainPage").on("click",function(){
		location.replace('../myInfo/main');
	});
	
	$('#user-birth').hover(function(){
		
		$(this).datepicker({
				dateFormat : "yy-mm-dd"
				,prevText:"이전 달"
				,nextText:"다음 달"
				,showMonthAfterYear:true
				,yearSuffix:"년"
				,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
				,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
				,dayNamesMin: ['일','월','화','수','목','금','토']
				,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		}); 
	});
	

 </script>