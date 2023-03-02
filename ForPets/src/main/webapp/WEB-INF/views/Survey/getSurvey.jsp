<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/nav.jsp"/>
<jsp:include page="/WEB-INF/views/favicon.jsp" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<style>
	body{
	    background: #F5F5F5;
	    margin-top:100px;
	}

	.content_guide {
		/* position: absolute; */
	  	margin-top: 100px;
	    width: 100%;
	    max-width: 1000px;
	    min-height: 100%;
	    margin: auto;
	    background-color: #fff;
	    border: solid #e8e8e8;
	    /* border-width: 0 1px; */
	    -webkit-box-sizing: content-box;
	    box-sizing: content-box;
	    margin-bottom: 100px;
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
		margin-bottom: 100px;
	}
	
	.btn {
  	background-color: #19CE60;
  	color : white;
 	float: center;
	}

	.btn:hover {
	background-color: green;
	color : white;
	}
	


	
</style>
<meta charset="UTF-8">
<title>설문지 상세보기</title>
</head>
<body>
	
	<div class="content_guide">
	<h1  style="text-align: center; margin-top: 40px; margin-bottom: 40px;">${surveyboard3.s_title }</h1>
	
	<div class="text_area">
	<form action="../insertanswer.do" method="post">
	<input type="hidden" name="sd_svcode" value="${surveyboard3.s_svcode }">

		
		<c:forEach items="${surveyboard }" var="sur" >

				<h5><b>Q. ${sur.sd_title }</b></h5>
						
		<c:forEach items="${surveyboard2 }" var="sur2">
		<c:choose>
			<c:when test="${sur.sd_order eq sur2.sc_order }">
		
				<c:choose>
					<c:when test="${sur.sd_type eq 'ju' }">
						
								 <input type="hidden" name="${sur2.sc_order }" value="${sur2.sc_ascode }">
								 <input type="text" name="${sur2.sc_ascode }" style="border-under: solid 1px black">
					
					</c:when>
						
					<c:when test="${sur.sd_type eq 'gaek' }">
						 	<input type="radio" name="${sur2.sc_order }" value="${sur2.sc_ascode }">${sur2.sc_answer }
							<input type="hidden" name="${sur2.sc_ascode }" value="${sur2.sc_answer }">
					</c:when>
					
					<c:when test="${sur.sd_type eq 'check' }">
							 	<input type="checkbox" name="${sur2.sc_order }" value="${sur2.sc_ascode }">${sur2.sc_answer } 
							 	<input type="hidden" name="${sur2.sc_ascode }" value="${sur2.sc_answer }">
					</c:when>
					
					<c:when test="${sur.sd_type eq 'time' }">
							  	<input type="hidden" name="${sur2.sc_order }" value="${sur2.sc_ascode }">
								<input type="time" name="${sur2.sc_ascode }">
					</c:when>
					
				    <c:when test="${sur.sd_type eq 'schedule' }">
							  	<input type="hidden" name="${sur2.sc_order }" value="${sur2.sc_ascode }">
								<input type="date" name="${sur2.sc_ascode }">
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
		</c:forEach>
		<br><br>
		</c:forEach>
		
	
	<input type="submit" class="btn btn-lg btn-block" value="제출하기">
	</form>
	</div>
	</div>

	<%@ include file="/WEB-INF/views/footer.jsp" %>	
</body>
</html>