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

	.pt_guide {
		float : left;
	}
	
	.ptinfo {
		text-align: center;
		margin-top : 30px;
		margin-bottom : 30px;
		border-right : black;
	}
	
	.review_guide {
		float: right;
	}

	.review_list {
		text-align: -webkit-center;
		margin-top : 30px;
		margin-bottom : 30px;
	}
</style>
<script>
/* 		function ans(name) {
			var data1 = $(name).data("value");
			alert(data1);
			
		 	$.ajax ({
				url: '../answerboard.do/${add}',
				method: "GET",
				data: { 'user_id' : data1 },
				success: function (data) {
					$.each(data, function (key, value) {
						 alert(value); 
					})
					alert("성공햇읍니당");
				},
				error :  function() {
					alert("실패오ㅛㅇ");
				}
			});	 
		} 
		*/
		
		
	
		
</script>
<meta charset="UTF-8">
<title>Answer list</title>
</head>
<body>
	<h1 style="text-align: center;">설문지 답변 목록</h1>
	
	<div class="content_guide">
		
     <div class="row">
     <div class="pt_guide col-4">
	<div class="ptinfo"  >
		<h3>답변자 목록</h3>
		
			<ul style="text-align: center;">
			<c:forEach items="${answerList }" var="ans">
				<li><a href="${pageContext.request.contextPath}/answerboard.do/${add }/${ ans}">${ ans}님의 답변입니다.</a></li>
			</c:forEach>
			</ul>
		</div>
		</div>
	
	
	<div class="review_guide col-8">
	<div class="review_list" style="border-left: solid 1.5px #D3D3D3; margin-left:-30px;">
		

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
								 <input type="text" name="${sur2.sc_ascode }" style="border-under: solid 1px black" readonly>
					
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
								<input type="time" name="${sur2.sc_ascode }" readonly>
					</c:when>
					
				    <c:when test="${sur.sd_type eq 'schedule' }">
							  	<input type="hidden" name="${sur2.sc_order }" value="${sur2.sc_ascode }">
								<input type="date" name="${sur2.sc_ascode }" readonly>
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