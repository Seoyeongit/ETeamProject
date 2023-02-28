<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<jsp:include page="/WEB-INF/views/nav.jsp"/>
<jsp:include page="/WEB-INF/views/favicon.jsp" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>

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
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<title>Community board</title>

<meta charset="UTF-8">

<title>Community board</title>
</head>
<body style= "background: #f9f9f9;">
<br><br><br>


	<h1 style="text-align: center;">소모임 상세보기</h1>
	<h4 style="text-align: center;">소모임을 찾고, 설문지를 작성하세요!</h4>
	<br>
 		<div class="content_guide">
			<div class = "title_board">
				<p class="title_area">${communityboard.c_title }</p>
					<div class="info">
						<p class="writer"> <b>${communityboard.user_id }</b> | ${communityboard.c_date }</p>
		 			</div>
		 			
		 			<hr><br>

		 		
		 		<div class="text_area" style="white-space:pre;">${communityboard.c_content }</div>
		 		
		 		<br><br>

		<div class="buttons"> 		
			<a href="../updatecommunity/${communityboard.c_code }"><input class="btn" style="background-color:#19CE60; color:white;" type="button" value="수정"></a>
			<a href="../deletecommunity/${communityboard.c_code }"><input class="btn" style="background-color:#19CE60; color:white;" type="button" value="삭제"></a>
			<a href="../communitylist"><input class="btn" style="background-color:#19CE60; color:white;" type="button" value="목록으로"></a>		
		</div>
		</div>
		</div>
		
		<br><br>
		
		<div class="comment_area">
		<c:forEach items="${getdat }" var="gd">
			
	
		<form name="frm${gd.d_num }" method="post">
			<input type="hidden" name="d_code" value="${gd.d_code }">
			<input type="hidden" name="d_num" value="${gd.d_num }" id ="d_num">
			
				
					<p><b>${gd.user_id }</b> | ${gd.d_date }</p> 
					<p id="${gd.d_num }"><a>${gd.d_content }</a></p>
			

			<a id="b${gd.d_num }"><input type="button" value="수정" onclick="update(${gd.d_num})" style="border: none; background-color:transparent; float:right;" ></a>
			<input type="submit" value="삭제" onclick="javascript : frm${gd.d_num }.action='../deletedat';" style="border: none; background-color:transparent; float:right;">

		</form>
		<br>
		<hr>
		</c:forEach>
		
	
 		<script>
 			
 			function update(data) {
 				$('#'+data).children().remove();
 				$('#'+data).append('<input type="text" name="d_content" class="comment_board">');
 				$('#b'+data).children().remove();
 				$('#b'+data).append("<input type='submit' value='수정' style='border: none; background-color:transparent; float:right;' onclick='javascript : frm"+data+".action=\"../updatedat\";'>");
 				/* $('#b'+data).attr("onclick", "updatedat("+data+")"); */
 			}
 			
 			function updatedat(data) {
 				/* alert(data);
 				var frm = "frm" + data;
 				alert(frm);  */
 	/* 
 				document.getElementById("frm"+data).action = "../updatedat.do"; */
 				document.getElementById('frm'+data+'').submit();
 			}
 			
 			
 		
			
			
		</script> 
   
	</div>
	
	<div class="comment">
	<form action="../insertcomdat" method="post">
		<input type="hidden" name="d_code" value="${communityboard.c_code }">
		<input type="hidden" name="user_id">

				<textarea class="comment_board" name="d_content" style="" placeholder="댓글을 입력해 주세요."></textarea>
				<input type="submit" value="댓글 작성하기" class="btn" style="background-color:#19CE60; color:white; float:right;">

	</form>
	</div>


	

	
		
	<br><br>
		

	
<%@ include file="/WEB-INF/views/footer.jsp" %>	
</body>
</html>