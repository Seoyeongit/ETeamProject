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
	
	.svinput {
		border-left-width:0;
		border-right-width:0;
		border-top-width:0;
		border-bottom-width:0.5px;
		font-size : 15px;
		width:780px;
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
						/* alert(value); 
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
     <div class="pt_guide col-3">
	<div class="ptinfo">
		<h3 style="text-align: center;">답변자 목록</h3>
	
		<ul>
			<c:forEach items="${answerList }" var="ans">
				<c:choose>
					<c:when test="${ans eq nowid}">
						<li>${ ans}님의 답변입니다.</li>
					</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath}/answerboard.do/${add }/${ ans}">${ ans}님의 답변입니다.</a></li>
				</c:otherwise>
				</c:choose> 
			</c:forEach>
		</ul>
		</div>
		</div>
	
	
	<div class="review_guide col-8">
	<div class="review_list" style="text-align: left;">
		
	<h4> ${user_id } 님이 답변한 설문입니다. </h4> <br>

	<h5>${answerboard3.s_title }</h5>
 	<input type="hidden" name="sd_svcode" value="${answerboard3.s_svcode }">

	
		<c:forEach items="${answerboard }" var="ans" >
			
				<br> <h5>Q. ${ans.sd_title } </h5>
						
			<c:forEach items="${answerboard2 }" var="ans2">
			
				<c:choose>
					<c:when test="${ans.sd_order eq ans2.sc_order }">
						<c:choose>
							<c:when test="${ans.sd_type eq 'ju' }">
								
									<c:forEach items="${answerboard4 }" var="ans4">
										<c:choose>
											<c:when test="${ ans2.sc_order eq ans4.sa_order}">
												
													 <input type="text" name="${ans2.sc_ascode }" value="${ans4.sa_content }" class="svinput" readonly><br>
												 
									 		</c:when>
									 	</c:choose>	
									 </c:forEach>
								
							</c:when>	
							
					<c:when test="${ans.sd_type eq 'gaek' }">
						
							<c:forEach items="${answerboard4 }" var="ans4">
								<c:choose>
									<c:when test="${ ans2.sc_order eq ans4.sa_order and ans2.sc_ascode eq ans4.sa_ascode}">
										<input type="radio" name="${ans2.sc_order }" value="${ans2.sc_ascode }" checked onclick="return(false);">${ans4.sa_content }
							 		</c:when>
							 		<c:when  test="${ ans2.sc_order eq ans4.sa_order }">
							 				<input type="radio" name="${ans2.sc_order }" value="${ans2.sc_ascode }" onclick="return(false);">${ans2.sc_answer }<br>
							 		</c:when>
							 	</c:choose>	
							 </c:forEach>							 

					</c:when>
					
					<c:when test="${ans.sd_type eq 'check' }">
					
							 	<input type="checkbox" name="${ans2.sc_order }" id="${ans2.sc_ascode }" onclick="return(false);">${ans2.sc_answer }<br>
							
						<c:forEach items="${answerboard4 }" var="ans4">
								<c:choose>
									<c:when test="${ ans2.sc_order eq ans4.sa_order and ans2.sc_ascode eq ans4.sa_ascode}">
										<script>
											// $('input[value=${ans2.sc_ascode }]').is(":checked") == true;
											 $("input#${ans2.sc_ascode}").prop("checked", true);
										</script>
							 		</c:when>
							 	</c:choose>	
							</c:forEach>
						
					</c:when>
					
					<c:when test="${ans.sd_type eq 'time' }">
					
							<c:forEach items="${answerboard4 }" var="ans4">
								<c:choose>
									<c:when test="${ ans2.sc_order eq ans4.sa_order}">
										
											<input type="time" name="${ans2.sc_ascode }" value="${ans4.sa_content }" class="svinput" readonly><br>
										
								 	</c:when>
								</c:choose>	
							</c:forEach>
						
					</c:when>
					
				    <c:when test="${ans.sd_type eq 'schedule' }">
						
							 <c:forEach items="${answerboard4 }" var="ans4">
								<c:choose>
									<c:when test="${ ans2.sc_order eq ans4.sa_order}">
										
											<input type="date" name="${ans2.sc_ascode }" value="${ans4.sa_content }" class="svinput" readonly><br>
										
								 	</c:when>
								</c:choose>	
							</c:forEach>
					
					</c:when>
					
				</c:choose>
			</c:when>
		</c:choose>

		</c:forEach>
		
		</c:forEach>


		
	</div>
	</div>
		</div>	
	</div>
	
<%@ include file="/WEB-INF/views/footer.jsp" %>		
</body>
</html>