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
<jsp:include page="../favicon.jsp"></jsp:include>
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
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    width: 100%;
    max-width: 1200px;
    min-height: 100%;
    margin: auto;
    background-color: #fff;
    border: solid #e8e8e8;
    /* border-width: 0 1px; */
    -webkit-box-sizing: content-box;
    box-sizing: content-box;
    margin-bottom: 40px;
	}

	.pt_guide {
		float : left;
	}
	
	.ptinfo {
		margin-top : 30px;
		margin-bottom : 30px;
		border-right : black;
	}
	
	.review_guide {
		float: right;
		border-left: solid 1.5px #D3D3D3;
	    margin-top: 20px;
	    margin-bottom: 20px;
	}

	.review_list {
		text-align: -webkit-center;
		margin-top : 30px;
		margin-bottom : 30px;
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
	
	.svinput {
		border-left-width:0;
		border-right-width:0;
		border-top-width:0;
		border-bottom-width:0.5px;
		font-size : 15px;
		width:780px;
	}

</style>
<meta charset="UTF-8">
<title>Answer list</title>
</head>
<body>
	<h1 style="text-align: center;">설문지 답변 목록</h1>
	
	<div class="content_guide">
		
     <div class="row">
     <div class="pt_guide col-3">
	<div class="ptinfo"  >
		<h3 style="text-align: center;">답변자 목록</h3>
		
			<ul>
			<c:forEach items="${answerList }" var="ans">
				<li><a href="${pageContext.request.contextPath}/answerboard.do/${add }/${ ans}">${ ans}님의 답변입니다.</a></li>
			</c:forEach>
			</ul>
			
				<a href="../deletesurvey.do/${add }"><input type="button" class="btn btn-sm btn-block" value="설문지 삭제" style="float: right;"></a>
		</div>
		</div>
		
	
	
	<div class="review_guide col-8">
	<div class="review_list" style="text-align: left;">
		

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
								 <input type="text" name="${sur2.sc_ascode }"  class="svinput"  readonly >
					
					</c:when>
						
					<c:when test="${sur.sd_type eq 'gaek' }">
						 	<input type="radio" name="${sur2.sc_order }" value="${sur2.sc_ascode }" onclick="return(false);">${sur2.sc_answer }
							<input type="hidden" name="${sur2.sc_ascode }" value="${sur2.sc_answer }">
					</c:when>
					
					<c:when test="${sur.sd_type eq 'check' }">
							 	<input type="checkbox" name="${sur2.sc_order }" value="${sur2.sc_ascode }" onclick="return(false);">${sur2.sc_answer } 
							 	<input type="hidden" name="${sur2.sc_ascode }" value="${sur2.sc_answer }">
					</c:when>
					
					<c:when test="${sur.sd_type eq 'time' }">
							  	<input type="hidden" name="${sur2.sc_order }" value="${sur2.sc_ascode }">
								<input type="time" name="${sur2.sc_ascode }" class="svinput" readonly>
					</c:when>
					
				    <c:when test="${sur.sd_type eq 'schedule' }">
							  	<input type="hidden" name="${sur2.sc_order }" value="${sur2.sc_ascode }">
								<input type="date" name="${sur2.sc_ascode }" class="svinput" readonly>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
		</c:forEach>
		<br><br>
		</c:forEach>
		
	
	</form>

	
		
	</div>
	</div>
		</div>	
	</div>
	
<%@ include file="/WEB-INF/views/footer.jsp" %>		
</body>
</html>