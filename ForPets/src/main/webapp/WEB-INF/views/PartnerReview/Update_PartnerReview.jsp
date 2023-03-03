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
<title>리뷰 수정하기</title>
<link href="${pageContext.request.contextPath}/resources/css/partner_review/star.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<jsp:include page="/WEB-INF/views/nav.jsp"/>
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
	<h1 style="text-align: center;">파트너 리뷰 수정 </h1>

	<div class="content_guide">
	
	<form action="../updatepartreview" class="mb-3" name="myform" id="myform" method="post" >
		<input type="hidden" name="pr_num" value="${prboard.pr_num }">
		<input type="hidden" name="part_id" value="${prboard.part_id }">
		<input type="hidden" name="user_id">
		<div class = "title_board">
			<h4 class="sep"> 제목 : <input class="title_area" type="text" name="pr_title" value="${prboard.pr_title }"> </h4>
		</div>
				
		<hr>
		
				<fieldset>
					<span class="text-bold" style="color: #808080"> 파트너 별점을 선택해주세요</span>
					<input type="radio" name="pr_avg" value="5" id="rate5"><label
						for="rate5">★</label>
					<input type="radio" name="pr_avg" value="4" id="rate4"><label
						for="rate4">★</label>
					<input type="radio" name="pr_avg" value="3" id="rate3"><label
						for="rate3">★</label>
					<input type="radio" name="pr_avg" value="2" id="rate2"><label
						for="rate2">★</label>
					<input type="radio" name="pr_avg" value="1" id="rate1"><label
						for="rate1">★</label>
				</fieldset>
				<script type="text/javascript">
						$('input#rate${prboard.pr_avg}').prop("checked", true);
				</script>
		
		<hr>
		
		<div style="margin-left:25px; text-align:center; color:#808080;">
			<a>내용을 수정 해 주세요.</a><br>
		</div>
		
			
			<textarea class="text_area" name="pr_content">${prboard.pr_content }</textarea>


		<div class="buttons">
				<input type="submit" value="수정하기" class="btn" style="background-color:#19CE60; color:white ">
				<a href="../partnerreviewlist"><input type="reset" value="취소" class="btn" style="background-color:#19CE60; color:white "></a>
		</div>
	</form>
	
	</div>
	

	

<%@ include file="/WEB-INF/views/footer.jsp" %>



</body>
</html>