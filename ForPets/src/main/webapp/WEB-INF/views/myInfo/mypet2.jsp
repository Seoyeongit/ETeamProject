<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물등록하기</title> ﻿
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
﻿
<style type="text/css">
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
	right: 5%;
	background-color: #99cc99;
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
</style>
</head>
<body>
	<h3>반려동물등록하기</h3>
	<hr>
	<div>케어서비스를 이용하려면 반려동물을 등록해 주세요</div>
	
		<br> <br>

		<div>
			<div id="uploadResult"></div>
			<label class="input-file-button" for="pet_img">이미지업로드</label> 
			<input type="file" id="pet_img"><br>
		</div>

		<br> <br> 
		
		
				<label for="pet_type">고객님의 반려동물은 무슨동물 인가요?</label> 
			<div>
			<input type="radio" name="gender" value="f" id="pet_gender"/>강아지예요 
			<input type="radio" name="gender" value="m" id="pet_gender"/>고양이예요<br>
			</div>
		<label for="pet_type">반려동물의 성별을 알려주세요!</label> 
			<div>
			<input type="radio" name="gender" value="f" id="pet_gender"/>여아예요 
			<input type="radio" name="gender" value="m" id="pet_gender"/>남아예요<br>
			</div>
		<label for="pet_type">반려동물은 중성화를 했나요?</label> 
			<div>
			<input type="radio" name="gender" value="f" id="pet_gender"/>네 했어요 
			<input type="radio" name="gender" value="m" id="pet_gender"/>안했어요<br>
			</div>
		<hr>
		<label for="pet_name">이름을 적어주세요</label> 
		<input type="text" name="name" id="pet_name" value="${userPet.name}"><br>

		<label for="pet_age">나이는 어떻게 되나요</label> 
		<input type="text" name="age" id="pet_age" value="${userPet.age}"><br> 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<label for="pet_name">이름</label> <input
			type="text" name="name" id="pet_name"><br>

		<label for="pet_age">나이</label> 
		<input type="text" name="age" id="pet_age"><br> 
		
		<label for="pet_type">종류</label> 
		<select name="type" id="pet_type">
			<option value="dog">강아지</option>
			<option value="cat">고양이</option>
			<option value="mouse">햄스터</option>
			<option value="other">기타</option>
		</select><br> 
		
		<label for="pet_gender">성별</label> 
		<input type="radio" name="gender" value="f" id="pet_gender"/>여자
		<input type="radio" name="gender" value="m" id="pet_gender"/>남자<br>
		
		<input type="hidden" name="user_id" id="user_id" value="${member.user_id}">
		<input type="submit" value="제출하기">


	<script type="text/javascript">
	$('input[type=submit]').on('click',function(){
			
			$.ajax({
				url:"../myInfo/my-petReg",
				type:'POST',
				data : {
					img : $('#imgSrc').val(),
					name : $('#pet_name').val(),
					age : $('#pet_age').val(),
					type : $('#pet_type').val(),
					gender : $('#pet_gender').val(),
					user_id : $('#user_id').val(),
				},
				success :function(result){
					if(result === 'success'){
						alert("등록되었습니다.")
						opener.parent.location.reload();
						window.close();
					}else{
						alert("등록에 실패했습니다.");
						location.reload();
					}
				},
				error : function(result){
					alert(result)
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
					alert(result);
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

			let fileCallPath = encodeURIComponent(resultSrc.replace(/\\/g, '/'));

			console.log("===>"+fileCallPath);

			str += "<div id='result_card'>";
			str += "<img src=../myInfo/display?fileName=" + fileCallPath + ">";
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