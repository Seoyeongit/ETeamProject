<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <h2>회원 정보 수정</h2>
    <p>사이트 이용에 필요한 정보들을 입력합니다.</p>

    <div class="container-sm text-bg-light">
        <div class="info">
            <div class="">
                <label for="user_id" class="form-label" >아이디</label>
                <input type="text" class="form-control" id="user_id" value="${userInfo.user_id}" name="user_id" readonly="readonly">
            </div>
        </div>

        <div class="mb-3 row">
            <div class="col-sm-4">
                <label for="inputPassword" class="col-form-label">비밀번호</label>
                <div class="col-sm-10">
				<input type="password" class="form-control" id="user_pw" name="user_pw" value="${userInfo.user_pw }">
                </div>
            </div>
            <div class="col-sm-4">
                <label for="inputPassword" class="col-form-label">비밀번호확인</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="pwChk">
                </div>
            </div>
        </div>

        
        <div class="mb-3 row">
            <div class="col-sm-4">
                <label for="user_name" class="col-form-label">이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="user_name" value="${userInfo.user_name}" name="user_name">
                </div>
            </div>
            <div class="col-sm-4">
                <label for="user_nick" class="col-form-label">닉네임</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="user_nick" value="${userInfo.user_nick}" name="user_nick">
                </div>
            </div>
        </div>

        <div class="info">
            <div class="">
                <label for="user_phnumber" class="form-label" >전화번호</label>
                <input type="text" class="form-control" id="user_phnumber" value="${userInfo.phnumber}" name="phnumber">
            </div>
        </div>

        <div class="info">
            <div class="">
                <label for="exampleFormControlInput1" class="form-label" >주소</label>
                <p>현재주소 : ${userInfo.user_add}</p>
                <input type="text"class="form-control" id="address_input_1" readonly="readonly" placeholder="우편번호">
                <input type="button" onclick="execution_kakao_address()" value="우편번호 찾기"><br>
                <input type="text" class="form-control"  id="address_input_2" readonly="readonly" placeholder="주소"><br>
                <input type="text" class="form-control"  id="address_input_3" readonly="readonly" placeholder="상세주소"><br>
                <input type="hidden" id="result_userAdd" value="${userInfo.user_add}" name="user_add">
            </div>
        </div>
    </div>
    <div>
        <input type="button" value="수정하기" id="edituserInfo">
        <input type="button" value="돌아가기" id="backMainPage">
    </div>

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
    
    $('#edituserInfo').click(function(){
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
    			phnumber:Number($("#user_phnumber").val()),
    			user_add:$("#result_userAdd").val()
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

 </script>