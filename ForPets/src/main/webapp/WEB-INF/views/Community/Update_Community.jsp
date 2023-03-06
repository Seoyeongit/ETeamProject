<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/favicon.jsp" />
<meta charset="UTF-8">
<title>글 수정하기</title>
<jsp:include page="/WEB-INF/views/nav.jsp"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
	body {
		 margin-top:100px;
		 background-color:#f9f9f9;
	}

	
	.content_guide {
		/* position: absolute; */
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    width: 100%;
	    max-width: 1000px;
	    min-height: 100%;
	    margin: auto;
	    background-color: #fff;
	    border: solid #e8e8e8;
	    /* border-width: 0 1px; */
	    -webkit-box-sizing: content-box;
	    box-sizing: content-box;
	    margin-bottom: 240px;
	}
	
	.title_board {
		max-width: 886px;
		position: relative;
	    padding-top: 15px;
	}
	
	.sep {
		margin-left: 30px;
		font-size :  16px;
		color: #808080;
	}
	
	hr {
 	 background: #d3d3d3;
	 height:1px;
	 border: 0;
	 padding-right: 100px; 
	 padding-left: 100px;
	 margin-right: 80px;
     margin-left: 80px;
	}
	
	.title_area {
		border:none; 
		text-align:center; 
		width: 800px; 
		height:100px; 
		padding-right: 30px; 
		padding-left: 30px;  
		text-align: left;
		font-size: 2em;
	}
	
	.text_area {
		border: solid 1px;
		border-color: #F5F5F5;
	    text-align: center;
		margin-left : 100px;
	    margin-right : 100px;
	    margin-top : 20px;
	    margin-bottom: 50px;
	    width: 800px;
	    padding-right: 30px;
	    padding-left: 30px;
	    text-align: left;
	    height: 500px;
	}
	
	.btn {
  	background-color: #19CE60;
  	color : #19CE60;
 
	}

	.btn:hover {
	background-color: green;
	color : white;
	}
	
	.buttons {
	text-align: center
	}

</style>
</head>
<body>




	<h1 style="text-align: center;">소모임 수정</h1>


 	
	<form action="../updateboard.do" method="post" >
		<div class="content_guide">
			<input type="hidden" name="c_code" value="${communityboard.c_code }">
			<div class = "title_board">
				<h4 class="sep"> 제목 : <input class="title_area" type="text" name="c_title" value="${communityboard.c_title }"></h4>
			</div>
			
			<hr>
				<select name="c_pet" id="c_pet">
							<option value="">-- 동물을 선택해 주세요. --</option>
							<option value="dog">강아지</option>
							<option value="cat">고양이</option>
				</select>
				<script>
					$("#c_pet").val("${communityboard.c_pet}").prop("selected", true);				
				</script>
				
				<div style="margin-left:25px; text-align:center; color:#808080;">
					<a>내용을 수정 해 주세요.</a><br>
				</div>
		
				
				<textarea class="text_area" name="c_content" >${communityboard.c_content }</textarea>
			
			<div class="buttons">
				<input type="submit" value="수정하기" class="btn" style="background-color:#19CE60; color:white ">
				<a href="../communitylist"><input type="reset" value="취소" class="btn" style="background-color:#19CE60; color:white "></a>
			</div>
			<br>
		</div>
	</form>


<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>