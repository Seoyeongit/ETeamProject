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
	
	.title_board {
		max-width: 886px;
		position: relative;
	    padding-top: 87px;
	    padding-bottom: 32px;
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
	text-align: center
	}

</style>
<title>make community</title>
<jsp:include page="/WEB-INF/views/nav.jsp"/>
<jsp:include page="/WEB-INF/views/favicon.jsp" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</head>

<body>
<br><br><br>
	<h1 style="text-align: center;">소모임 생성</h1>
	<h5 style="text-align: center;">자신의 소모임을 만들어 보세요</h5>

 	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="date"><fmt:formatDate value="${now}" pattern="yyMMddmmss" /></c:set>
	<c:set var="min"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>  
	<c:set var="c_code" value="c${date }"></c:set>
<%-- 	<c:set var="sv_code" value="s${date}-${c_code}"></c:set> --%>
<%-- 	<!-- count 생성 -->
	<c:set var="c" value='${c+1}'></c:set>
	<c:if test="${c<10}">
		<c:set var="anscodeno" value="od0${j}"></c:set>
	</c:if>
	<c:if test="${c>=10}">
		<c:set var="anscodeno" value="od${j}"></c:set>
	</c:if> --%>

<form action="insertcommunity" method="post" >
 	<div class="canvas">
 		<div class="content_guide">
			<input type="hidden" value="c${date }" name="c_code">
				<div class = "title_board">
					<input class="title_area" type="text" name="c_title" placeholder="제목">
						</div>
						<hr>
						<textarea class="text_area" name="c_content" placeholder="내용을 입력해 주세요."></textarea>
	
			<br>
			<div class="buttons">
			<a href="survey.do/${c_code }"><input type="button" class="btn" value="설문지 만들기" style="background-color:#19CE60; color:white "/></a>
			<input type="submit" value="작성하기" class="btn" style="background-color:#19CE60; color:white ">
			<a href="communitylist"><input type="button" value="취소" class="btn" style="background-color:#19CE60; color:white "></a>
			</div>
	

	</div>
	</div>
	</form>
</body>
</html>