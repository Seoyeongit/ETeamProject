<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
    	<jsp:include page="../favicon.jsp"></jsp:include>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>파트너 페이지</title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/css/partner.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/resources/js/partner_page.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.js"></script>
        <style>
        	.part-pro-img{
        		margin-left:7%;
        		margin-bottom:5%;
        	}
        	input#file-upload-button{
        		background-color:white;
        	}
        </style>
    </head>
    <body id="page-top">
    	<%@ include file="/WEB-INF/views/nav2.jsp" %>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark part-nav" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="../partner/partnerMain">
                <span class="d-block d-lg-none">${partners.part_name }</span>
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="../partner/display?fileName=${partners.img }" alt="..." /></span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/partner/modifyyy">정보 수정</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/partner/careDiaryList">돌봄 일지 목록</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/partnerreviewlist/${partners.part_id}">별점 및 리뷰보기</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/partner/getReserve">예약 일정 관리</a></li>
                </ul>
            </div>
        </nav>
        <!-- Page Content-->
        <h2>회원 정보 수정</h2>
    <p>사이트 이용에 필요한 정보들을 입력합니다.</p>
	<c:choose>
		<c:when test="${empty partners.part_img }">
		<form action="/partner/partImgIns" method="POST" entype="multipart/form-data">
		</c:when>
		<c:otherwise>
		<form action="/partner/partImgUpd" method="POST" entype="multipart/form-data">	
		</c:otherwise>
	</c:choose>
		<br> <br>

		<div>
			<div class="img-up" id="uploadResult"></div>
			<img class="part-pro-img" src="../partner/display?fileName=${partners.img }"/>
			<label class="input-file-button" for="part_img"></label> 
			<input type="file" id="part_img" name="part_img" value="이미지 선택"><br>
		</div>
		
		
    <div class="container-sm text-bg-light">
        <div class="info">
            <div class="">
                <label for="part_id" class="form-label" >아이디</label>
                <input type="text" class="form-control" id="part_id" value="${partners.part_id}" name="part_id" readonly="readonly">
            </div>
        </div>

        <div class="mb-3 row">
            <div class="col-sm-4">
                <label for="inputPassword" class="col-form-label">비밀번호</label>
                <div class="col-sm-10">
				<input type="password" class="form-control" id="part_pw" name="part_pw" value="${partners.part_pw }">
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
                <label for="part_name" class="col-form-label">이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="part_name" value="${partners.part_name}" name="part_name">
                </div>
            </div>
            <div class="col-sm-4">
                <label for="part_nick" class="col-form-label">닉네임</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="part_nick" value="${partners.part_nick}" name="part_nick">
                </div>
            </div>
        </div>

        <div class="info">
            <div class="">
                <label for="part_phnumber" class="form-label" >전화번호</label>
                <input type="text" class="form-control" id="part_phnumber" value="${partners.part_phnumber}" name="part_phnumber">
            </div>
        </div>

        <div class="info">
            <div class="">
                <label for="exampleFormControlInput1" class="form-label" >주소</label>
                <p>현재주소 : ${partners.part_add}</p>
                <input type="text"class="form-control" id="sample6_postcode" readonly="readonly" placeholder="우편번호">
                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" class="form-control"  id="sample6_address" readonly="readonly" placeholder="주소"><br>
                <input type="text" class="form-control"  id="sample6_detailAddress" placeholder="상세주소"><br>
                <input type="hidden" id="result_partAdd" value="${partners.part_add}" name="part_add">
            </div>
        </div>
        <div class="mb-3 row">
        		<div class="col-sm-4">
        			<label for="self_infor" class="col-form-label">자기소개</label><textarea id="self_infor" cols="161.8" rows="10" class="infor-box">${partners.self_infor }</textarea></div>
        </div>
    </div>
    <div class="cal-12">
        &nbsp;&nbsp;<input type="button" value="수정하기" id="edituserInfo">
        <input type="button" value="돌아가기" id="backMainPage">
    </div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
var addr = ''; // 주소 변수
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    $('#edituserInfo').click(function(){
    	if(addr !== '' ){
    	addr += ' ' + $("#sample6_address").val();
    	addr += ' ' + $("#sample6_detailAddress").val();
        $("#result_partAdd").val(addr);
    	}
    	
    	if($('input[name=part_pw]').val()!==$('input[id=pwChk]').val()){
    		alert("암호가 일치하지 않습니다 한번더 확인해주세요.");
    		return false;
    	}
    	
    	$.ajax({
    		url:"../partner/modifyyy",
    		data : {
    			part_id:$("#part_id").val(),
    			part_pw:$("#part_pw").val(),
    			self_infor:$("#self_infor").val(),
    			part_nick:$("#part_nick").val(),
    			part_phnumber:$("#part_phnumber").val(),
    			part_add:$("#result_partAdd").val(),
    			self_infor:$("#self_infor").val(),
    			img:$("#imgSrc").val()
    			
    		},
    		dataType : "text",
    		type : "POST",
    		success : function(result){
    			alert("회원정보수정 성공했습니다.")
    			location.reload();								
			},
			error : function(result){
				console.log(result);
				
				alert("오류가났습니다..");
			}
    	});    	
    });
    
	$("div #backMainPage").on("click",function(){
		location.replace('../partner/partnerMain');
	});
	
	
	
	
	
	
	$('form').submit(function(){
		
		$.ajax({
			url:"../partner/partImgIns",
			dataType:text,
			type:'POST',
			data : {
				img : $('#imgSrc').val(),
				part_id : $('#part_id').val(),
			},
			success : function(){
				alert("등록되었습니다.")
				opener.parent.location.reload();
				window.close();
			},
			error : function(){
				alert("등록에 실패했습니다.")
				location.reload();
			}
		});
	});


	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e) {
		
		/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		}

		let formData = new FormData();
		let fileInput = $("input[id='part_img']");
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];

		if (!fileCheck(fileObj.name, fileObj.size)) {
			$("input[id='part_img']").val("");
			return false;
		}

		formData.append("uploadFile", fileObj);

		$.ajax({
			url : '../partner/my-partnerImgUpload',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(result) {
				console.log(result);
				showUploadImage(result);
			},
			error : function(result) {
				alert("이미지 파일이 아닙니다.");
			}
		});
	});

	/* 이미지 출력 */
	function showUploadImage(result) {
		if (!result || result.length == 0) {
			return
		}

		let uploadResult = $("#uploadResult");
		
		let str = "";
		
		//이미지 경로
		let imgSrc = result.img;
		//'upload'부터 문자열 끝까지 일치하는 정규식 패턴
		let regex =/^[A-Z]:.*\\upload/;
		let str1 = imgSrc.replace(regex,'');
		console.log(str1);
		
		
		let fileCallPath = encodeURIComponent(str1);

		console.log(fileCallPath);

		str += "<div id='result_card'>";
		str += "<img src=../partner/display?fileName=" + fileCallPath + ">";
		str += "<div class = 'imgDeleteBtn' data-file='"+fileCallPath+"'>x</div>";
		str += "<input type='text' name='img' id='imgSrc' value='"+fileCallPath+"'>";
		str += "</div>";

		uploadResult.html(str);
	}
	
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		deleteFile();
	})
	
	
	/* 파일 삭제 메서드  */
	function deleteFile(){
		let targetFile = $(".imgDeleteBtn").data("file");
		let targetDiv = $("#result_card");
		
		$.ajax({
			url : '../partner/delete',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.");
			}
		});
	}
	

	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB

	function fileCheck(fileName, fileSize) {
		if (fileSize >= maxSize) {
			alert("파일 크기가 너무 큽니다 다른 이미지를 선택해주세요");
			return false;
		}
		if (!regex.test(fileName)) {
			alert("이미지는 jpg,png만 업로드 가능합니다.");
			return false;
		}
		return true;
	}
</script>
 <br>
</body>
</html>