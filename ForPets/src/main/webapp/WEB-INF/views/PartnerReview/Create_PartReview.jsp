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
<title>리뷰 수정 페이지</title>
<jsp:include page="/WEB-INF/views/nav.jsp"/>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/partner_review/star.css" rel="stylesheet">
<style>

	body {
		background: #f9f9f9; 
		margin-top:100px;
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
	    margin-bottom: 40px;
	}
	
	.title_board {
		max-width: 886px;
		position: relative;
	    padding-top: 20px;
	}
	
	hr {
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
		width:1000px; 
		height:100px; 
		padding-right: 100px; 
		padding-left: 100px; 
		font-size: 2.5em; 
		text-align: left;
	}
	
	.text_area {
		border:none; 
		text-align:center; 
		width:1000px; 
		height:100px; 
		padding-right: 100px; 
		padding-left: 100px; 
		font-size: 1.2em; 
		text-align: left; 
		resize: vertical; 
		height: 600px;
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
	text-align: center;
	margin-bottom: 30px;
	}
</style>

</head>
<body>


	<h1 style="text-align: center;">파트너 리뷰 작성 페이지</h1>
	<h5 style="text-align: center;">파트너 평가를 해주세요!</h5>

	<form action="../insertpartreview" class="mb-3" name="myform" id="myform" method="post" >
		<input type="hidden" name="part_id" value="${part_id }">
		<input type="hidden" name="user_id">
	
 		<div class="content_guide">
			<input type="hidden" value="c${date }" name="c_code">
				<div class = "title_board">
					<input class="title_area" type="text" name="pr_title" placeholder="제목" required>
						
						</div>
			
						<hr>

		
				
			<div class="mb-3" name="myform" id="myform" required>
				<fieldset>
					<span class="text-bold">파트너 별점을 선택해주세요</span>
					<input type="radio" name="pr_avg" value="5" id="rate1"><label
						for="rate1">★</label>
					<input type="radio" name="pr_avg" value="4" id="rate2"><label
						for="rate2">★</label>
					<input type="radio" name="pr_avg" value="3" id="rate3"><label
						for="rate3">★</label>
					<input type="radio" name="pr_avg" value="2" id="rate4"><label
						for="rate4">★</label>
					<input type="radio" name="pr_avg" value="1" id="rate5"><label
						for="rate5">★</label>
				</fieldset>
			</div>
			
			<hr>
			
		<div style="white-space:pre;"><textarea class="text_area" name="pr_content" placeholder="내용을 입력해 주세요." required></textarea></div>
		
		
			<div class="buttons">
			<input type="submit" value="작성하기" class="btn" style="background-color:#19CE60; color:white ">
			<a href="partnerlist"><input type="button" value="취소" class="btn" style="background-color:#19CE60; color:white "></a>
			</div>
		
		</div>
	</form>

<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>