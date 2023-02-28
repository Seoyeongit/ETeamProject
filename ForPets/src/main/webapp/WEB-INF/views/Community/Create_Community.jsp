<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/nav.jsp"/>
<jsp:include page="../favicon.jsp"/>
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
	
	.buttons {
		   text-align: center;
	}
	

</style>
<title>make community</title>
</head>
<body style= "background: #f9f9f9;">


	

	<h1 style="text-align: center;">소모임 생성</h1>
	<h5 style="text-align: center;">자신의 소모임을 만들어 보세요</h5>

 	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="date"><fmt:formatDate value="${now}" pattern="yyMMddmmss" /></c:set>
	<c:set var="min"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>  
	<c:set var="c_code" value="c${date }"></c:set>


<form action="insertcommunity" method="post" >
 
 		<div class="content_guide">
			<input type="hidden" value="c${date }" name="c_code">
				<div class = "title_board">
					<input class="title_area" type="text" name="c_title" placeholder="제목">

						
						</div>
						<hr>
						<div style="white-space:pre;"><textarea class="text_area" name="c_content" placeholder="내용을 입력해 주세요."></textarea></div>

			
			<div class="buttons">
			<a href="survey.do/${c_code }"><input type="button" class="btn" value="설문지 만들기" style="background-color:#19CE60; color:white "/></a>
			<input type="submit" value="작성하기" class="btn" style="background-color:#19CE60; color:white ">
			<a href="communitylist"><input type="button" value="취소" class="btn" style="background-color:#19CE60; color:white "></a>
			
			</div>
			</div>
		
	</form>


<br><br><br>
<%@ include file="/WEB-INF/views/footer.jsp" %>	

</body>
</html>