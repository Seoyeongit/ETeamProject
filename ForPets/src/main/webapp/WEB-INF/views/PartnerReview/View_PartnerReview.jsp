<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 .canvas {
		max-width: none;
   		min-width: 1046px;
	   	background-color: #f9f9f9; 
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
	}
	
	.info {
		margin: 0 0 -6px;
	    text-align: left;
	    font-size: 14px;
	    line-height: 30px;
	    padding-right: 100px;
    	padding-left: 100px;
	}
	
	.title_board {
		position: relative;
	    padding-top: 20px;
	    padding-bottom: 32px;
	}
	
	hr {
 	 background: #d3d3d3;
	 height:1px;
	 border: 0;
	 padding-right: 100px; 
	 padding-left: 100px;

	}
	
	.title_area {
		border:none; 
		text-align:center; 
		width:1000px; 
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
		height: fit-content;
	}
	
	.comment_area {
		width: 100%;
	    max-width: 1000px;
	    min-height: 100%;
	    margin: auto;
	    padding-right: 100px;
  		padding-left: 100px;
	}
	
	.comment {
		width: 100%;
	    max-width: 1000px;
	    min-height: 100%;
	    margin: auto;
	    padding-right: 100px;
  		padding-left: 100px;
	}
	
	.comment_board{
		position: relative;
	    height: 60px;
    	width: 800px;
    	resize: none;
	}
	
	.btn {
  	background-color: #19CE60;
  	color : white;
 
	}

	.btn:hover {
	background-color: green;
	color : white;
	}
	
	.buttons {
	text-align: center
	}
    

</style>
<link href="${pageContext.request.contextPath}/resources/css/partner_review/star.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<title>PartnerReview board</title>
<jsp:include page="/WEB-INF/views/nav.jsp"/>
<jsp:include page="/WEB-INF/views/favicon.jsp" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</head>
<body>
<br><br><br>
<div class="canvas">
	<h1 style="text-align: center;">파트너 리뷰 상세보기</h1>
	<h5 style="text-align: center;">파트너에 대한 칭찬글이나 평가를 확인해 보세요!</h5>
	
	<div class="content_guide">
		<div class = "title_board">
	<form class="mb-3" name="myform" id="myform" method="post" >
		
		 		<p class="title_area">${prboard.pr_title }</p>
		 		<div class="info">
						<p class="writer"> <b>${prboard.user_id }</b> | ${prboard.pr_date }</p>
		 			</div>		
		 		<hr>
		 		
		 		<p style="text-align: center;">파트너 별점</p>	
					<fieldset>
						<input type="radio" name="pr_avg" value="5" id="rate5" onclick="return(false);"><label
							for="rate1">★</label>
						<input type="radio" name="pr_avg" value="4" id="rate4"  onclick="return(false);"><label
							for="rate2">★</label>
						<input type="radio" name="pr_avg" value="3" id="rate3"  onclick="return(false);"><label
							for="rate3">★</label>
						<input type="radio" name="pr_avg" value="2" id="rate2"  onclick="return(false);"><label
							for="rate4">★</label>
						<input type="radio" name="pr_avg" value="1" id="rate1"  onclick="return(false);"><label
							for="rate5">★</label>
					</fieldset>
					<script type="text/javascript">
						$('input#rate${prboard.pr_avg}').prop("checked", true);
					</script>
				<hr><br>
		 		
		 		<div class="text_area" style="white-space:pre;">${prboard.pr_content }</div>
		 	
		 
	</form>
	</div>
	<div class="buttons"> 
		<a href="../updatepartreview/${prboard.pr_num }"><input type="button" value="수정" class="btn" style="background-color:#19CE60; color:white;"></a>
		<a href="../deletepartreview/${prboard.pr_num}"><input type="button" value="삭제" class="btn" style="background-color:#19CE60; color:white;"></a>		
	</div>
	<br><br>
	</div>
	</div>


</body>
</html>