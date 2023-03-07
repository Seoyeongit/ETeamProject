<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물등록하기</title>﻿
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
﻿
<style type="text/css">
h3{
	    text-align: center;
	    font-weight: 800;
}


#result_card img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}

#result_card {
	position: relative;
}

.imgDeleteBtn {
	position: absolute;
	top: 0;
    right: 14%;
	background-color: #c8c8c8;
	color: white;
	font-weight: 900;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	line-height: 26px;
	text-align: center;
	border: none;
	display: block;
	cursor: pointer;
}

#image-container{
	width: 300px;
	height: 300px;
	background-color: gray;
	border-radius: 50%;
	background-size: cover;
	background-position: center;
	margin-left: auto;
    margin-right: auto;
    background-image: url("https://i.ibb.co/NWPMVPk/no-image-pet.png");
}

#uploadResult{
	    position: relative;
}

#pet_img{
	display: none;
}

.form-box{
	margin-left: 30px;
	margin-right: 30px;
}

.form-box>div, hr{
	margin-bottom: 20px;
	margin-top: 20px;
}

hr{
	border:1px solid #eeeeee;
    margin-top: 34px;
	
}

.petInfo-flex-box{
	display: flex;
	align-items: center;
}

.radio-box{
	margin-left: auto;
	display :flex;
	grid-gap : 5px;
}

.text-box{
	margin-left: auto;
}

input[type=text]{
	border: 0;
	border-bottom: 1px solid #cdcdcd;
	padding-bottom : 5px;
	text-align: right;
	width : 269px;
    font-size: 1em;
    transition-timing-function: ease;
    transition : border-bottom 0.5s;
}

input[type=text]:focus{
	outline: none;
	border-bottom: 1px solid #2bff97;
	font-weight: 600;
}


.pet_info_detail{
	text-align: center;
	height: max-content;
	display: flex;
	align-items: center;
	justify-content: space-evenly;
	
}


.radio-box label, .pet_info_detail label{
	display: flex;
	font-size: lem;
	font-weight: 500;
	align-items: center;
}


.radio-box input[type=radio], .pet_info_detail input[type=radio]{
	margin-right: 7px;
    width: 2.5em;
    height: 2.5em;
	border : 1px solid white;
	cursor : pointer;
	outline: none;
	appearance : none;
	border-radius: 50%;
	background-image: url("https://i.ibb.co/mJx6R3k/check-off.png");
	background-size: cover;
	transition : background-image 0.5s;
	transition-timing-function: ease-out;
}

.radio-box input[type=radio]:checked, .pet_info_detail input[type=radio]:checked{
	background-image: url("https://i.ibb.co/LCvYrJZ/check-on.png");
}

.radio-box input[type=radio]:checked + span, .pet_info_detail input[type=radio]:checked+span {
  color: #2bff97;
  font-weight: 600;
}


.petInfo-flex-box>label:first-child{
	font-weight: 600;
}


.form-box:nth-child(11)>label{
	width: 100%;
    display: block;
    text-align: center;
    font-weight: 600;	
}

input[type=submit]{
    width: 100%;
    padding: 14px;
    border-radius: 14px;
    background-color: #ffefe4;
    margin-top: 1em;
    color: #ff7d23;
    border: 1px solid #ff7d23;
    font-weight: 600;
    font-size: 18px;
    letter-spacing: 1px;
    cursor: pointer;
    transition : all 0.5s;
	transition-timing-function: ease-out;
}

#admin-msg{
	display:block;
	color : gray;
	font-size: 13px;
	text-align: center;
}

input[type=submit]:hover{
	background-color: #ffe2ce;
	color: #f57013;
}

</style>
</head>
<body>
	<h3>반려동물등록하기</h3>
	<p style="text-align: center;">포펫츠의 서비스를 이용하시려면<br>반려동물등록을 부탁드립니다.<br></p>
	<hr>
		<br> <br>
		<div>
			<div id="uploadResult">
			<label class="input-file-button" for="pet_img">
				<div id="image-container"></div>
			</label> 
			</div>
			<input type="file" id="pet_img"><br>
		</div>

		<br> <br> 
	<div class="form-box">
	
		<span id="admin-msg">필수기입사항은 없으니 모르는 부분은 넘어가셔도 됩니다.</span>
	
		<div class="petInfo-flex-box">
		<label>반려동물</label> 
			<div class="radio-box">
				<label for="pet_type_dog" style="width: 96px;">
					<input type="radio" name="type" value="dog" id="pet_type_dog"/><span>강아지</span>
				</label>
				
				<label for="pet_type_cat">
					<input type="radio" name="type" value="cat" id="pet_type_cat"/><span>고양이</span>
				</label>
			</div>
		</div>	
	
	
		<div class="petInfo-flex-box">
			<label>성별</label> 
			<div class="radio-box">
				<label for="pet_gender_f" style="width: 96px;">
					<input type="radio" name="gender" value="f" id="pet_gender_f"/><span>여아</span>
				</label>
				
				<label for="pet_gender_m" style="width: 93px;">
					<input type="radio" name="gender" value="m" id="pet_gender_m"/><span>남아</span>
				</label>
			</div>
		</div>
		
		<div class="petInfo-flex-box">
		<label>중성화</label> 
			<div class="radio-box">
				<label for="pet_IsNeutered_Y"  style="width: 95px;">
					<input type="radio" name="isNeutered" value="Y" id="pet_IsNeutered_Y"/><span>했음</span>
				</label>
				
				<label for="pet_IsNeutered_N">
					<input type="radio" name="isNeutered" value="N" id="pet_IsNeutered_N"/><span>안했음</span>
				</label>
			</div>
		</div>
		<div class="petInfo-flex-box">
		<label>동물등록</label> 
			<div class="radio-box">
				<label for="pet_license_in" style="width: 96px;">
					<input type="radio" name="license" value="IN" id="pet_license_in"/><span>내장칩</span>
				</label>
				
				<label for="pet_license_out">
					<input type="radio" name="license" value="OUT" id="pet_license_out"/><span>외장칩</span>
				</label>
			</div>
		</div>
		
		<hr>

		
		<div class="petInfo-flex-box">
			<label for="pet_name">이름</label>
			<div class="text-box">
				<input type="text" name="name" id="pet_name"><br>
			</div>
		</div>
		
		
		<div class="petInfo-flex-box">
			<label for="type_detail">품종</label> 		
			<div class="text-box">
				<input type="text" name="type_detail" id="type_detail"><br>
			</div>
		</div>
		
		<div class="petInfo-flex-box">
			<label for="pet_age">나이</label>
			<div class="text-box">
				<input type="text" name="age" id="pet_age"><br>
			</div>
		</div>
		
		<div class="petInfo-flex-box">
			<label for="pet_weight">무게</label>
			<div class="text-box" style="position: relative;">
				<input type="text" name="weight" id="pet_weight" style="width: 250px;">kg<br>
			</div>
		</div>
		
		<hr>
		<br>
		<label for="pet_type">낯선사람을 보면 어떻게 반응하나요?</label> 
			<div class="pet_info_detail">
				<label for="pet_reaction_like">
					<input type="radio" name="social" value="like" id="pet_reaction_like"/><span>좋아해요</span>
				</label>
				
				<label for="pet_social_fear">
					<input type="radio" name="social" value="afraid" id="pet_reaction_afraid"/><span>무서워해요</span>
				</label>
				<label for="pet_social_bad">
					<input type="radio" name="social" value="angry" id="pet_reaction_angry"/><span>물어요</span>
				</label>
			</div>
			<br>
		<label for="pet_type">예방접종을 완료하셨나요?</label> 
			<div class="pet_info_detail">
				<label for="pet_isVaccin_N">
					<input type="radio" name="isVaccin" value="N" id="pet_isVaccin_N"/><span>아니오</span>
				</label>
				
				<label for="pet_isVaccin_Y">
					<input type="radio" name="isVaccin" value="Y" id="pet_isVaccin_Y"/><span>네</span>
				</label>
			</div>
			
		
		
		<input type="hidden" name="user_id" value="${member.user_id}" id="user_id">
		<input type="hidden" name="img" value="" id="pet_img_src">
		
		<div style="text-align: center;">
			<input type="submit" value="제출하기">
		</div>
	</div>


	<script type="text/javascript">
	$('#pet_type_cat').on('click',function(){
		$('label[for=type_detail]').text('묘종').animate({opacity: 1}, 1000);
	})
	
	$('#pet_type_dog').on('click',function(){
		$('label[for=type_detail]').text('견종').animate({opacity: 1}, 1000);
	})
	
	
		$('input[type=submit]').on('click',function(){
			

			$.ajax({
				url:"../myInfo/my-petReg",
				type:'POST',
				data : {
					user_id : $('#user_id').val(),
					
					type : $('input[name=type]:checked').val(),
					
					name : $('#pet_name').val(),
					
					img : $('#pet_img_src').val(),
					
					age : $('#pet_age').val(),
					
					gender : $('input[name=gender]:checked').val(),
					
					weight : $('#pet_weight').val(),
					
					type_detail : $('#type_detail').val(),
					
					isNeutered : $('input[name=isNeutered]:checked').val(),
					 
					license : $('input[name=license]:checked').val(),
					
					social : $('input[name=social]:checked').val(),
					
					isVaccin : $('input[name=isVaccin]:checked').val()
				},
				success : function(result){
					if(result === 'success'){
						alert("등록되었습니다.")
						opener.parent.location.reload();
						window.close();
					}else{
						alert("등록에 실패했습니다.");
						location.reload();
					}
									},
				error : function(){
					alert(result);
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
			let fileInput = $("input[id='pet_img']");
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];

			if (!fileCheck(fileObj.name, fileObj.size)) {
				$("input[id='pet_img']").val("");
				return false;
			}

			formData.append("uploadFile", fileObj);

			$.ajax({
				url : '../myInfo/my-petImgUpload',
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
			
			//이미지소스를 가져옵니다.
			let imgSrc = result.img;
			
			let resultSrc = imgSrc.replace(/^.*[\\\/]upload/, "");

			let uploadResult = $("#uploadResult");
			let str = "";
			let btn ="";

			let fileCallPath = encodeURIComponent(resultSrc.replace(/\\/g, '/'));

			console.log("===>"+fileCallPath);
			
			
			$('#pet_img_src').val(fileCallPath);
			
			btn += "<div class = 'imgDeleteBtn' data-file='"+fileCallPath+"'>x</div>";
			
			$('#image-container').css('background-image','url("../myInfo/display?fileName='+fileCallPath+'")');
			
			$('#uploadResult').append(btn);
			$(uploadResult).append(str);
			
		}
		
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
			deleteFile();
			$('#image-container').css('background-image','url("https://i.ibb.co/NWPMVPk/no-image-pet.png")');
			$('#pet_img_src').val('');
			$(this).remove();
		})
		
		
		/* 파일 삭제 메서드  */
		function deleteFile(){
			let targetFile = $(".imgDeleteBtn").data("file");
			let targetDiv = $("#result_card");
			
			$.ajax({
				url : '../myInfo/delete',
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
</body>
</html>