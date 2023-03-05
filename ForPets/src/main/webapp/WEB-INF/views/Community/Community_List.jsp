<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta charset="UTF-8">
<title>community list</title>
<jsp:include page="/WEB-INF/views/nav.jsp"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
</script>
<style>
	body{
	    background: #F5F5F5;
	    margin-top:100px;
	}
	
	.list {
		width: auto;
		margin-bottom: 100px;
	}
	
	.container-rapper {
	    display: flex;
	    grid-gap: 27px;
	    gap: 27px;
	    flex-wrap: wrap;
	    justify-content: center;
	    max-width: 1400px;
	    margin-left : 120px;
	    margin-right : 120px;
	    
	}
	
	.page-content {
	display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 20px 20px 0;
    width: 300px;
    height: 240px;
    background: #fff;
    border: 2px solid #d1d1d1;
    border-radius: 30px;
    position: relative;
    cursor: pointer;
    transition: .2s ease-in;
    
}

	.btn {
  	background-color: #19CE60;
  	color : white;
 
}

	.btn:hover {
	background-color: green;
	color : white;
	}
	
	.note{
	font-size: 14px;
    color: #999;
    font-weight: 500;
	}   
	
	.d-flex {
	    grid-gap: 5px;
	}
	
	.cbtn {
		font-size: 11px; 
		font-weight: 500; 
		background-color: #19CE60; 
		color: white; 
		--bs-btn-padding-y: 0rem; 
		--bs-btn-padding-x: 0.5rem; 
		border-radius: 40px;
			                    		
	}
	
	a {
		text-decoration: none;
	 	color: #666666;
	}
</style>

</head>
<body>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="min"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
<!-- 하루  -->
<c:set var="oneDayAfter" value="<%=new Date(new Date().getTime() - 60*60*24*1000*1)%>"/>
<fmt:formatDate value="${oneDayAfter}" pattern="yyyy-MM-dd" var="oneDayAfterStr"/>


	<h1 style="text-align: center;">소모임 목록</h1>

<c:choose>
	<c:when test="${member.user_id != null}">
		<h5 style="text-align: center;">원하는 소모임을 찾아보세요 ! 
			<a href="getcommunity"><input type="button" class="btn btn-sm btn-block" value="글 작성하러 가기"></a></h5>
	</c:when>
	<c:otherwise>
		<p style="text-align: center;">비회원은 열람만 가능합니다. 회원이시라면, <a href="${pageContext.request.contextPath}/member/login">로그인 하러가기</a> 회원이 아니시라면? <a href="${pageContext.request.contextPath}/member/join">회원가입 하러 가기</a></p>
	</c:otherwise>
</c:choose>
	
		<br>
		
	<div class="bg" style="justify-content: center;">
	<form action="communitylist" method="post" class="list">
		


		<div class="container-rapper">
			<c:forEach items="${communityList }" var="community">
				<input type="hidden" name ="c_code" value="${community.c_code }">
				<div class="page-content note-has-grid p-4 col-sm-4">
		            <div class="tab-content bg-transparent ">
		                <div id="note-full-container" class="note-has-grid row">
		                    <div class="single-note-item all-category">
		                    	<div class="d-flex flex-row">
		                    	<h5 class="note-title text-truncate">
		                    	
		                    	<c:set var="loop_flag" value="false" />
			                    <c:forEach items="${svcode }" var="scode">
			                    	<c:if test="${not loop_flag }">
				                    	<c:choose>
				                    		<c:when test="${community.c_code eq scode.s_code}">
				                    			<a href="viewcommunityboard/${ community.c_code}/${scode.s_svcode}">${community.c_title }</a>
				                    			<c:set var="loop_flag" value="true" />
				                    		</c:when>
	    								</c:choose>
			                    	</c:if>
		                    	</c:forEach>
		                    	<c:if test="${not loop_flag }">
		                    		<a href="viewcommunityboard/${ community.c_code}">${community.c_title }</a>
		                    	</c:if>

			                    
			                    	<c:if test="${community.c_date eq min ||  community.c_date eq oneDayAfterStr}">
			                    		<span class="badge text-light rounded-pill" style="font-size:0.5em; background-color:#0080ff;">new</span>
			                    	</c:if>
		                    	</h5>
								
								<c:forEach items="${svcode }" var="scode">
		                    		<c:choose>
			                    		<c:when test="${community.c_code eq scode.s_code }">
			                    			<a><input type="button" class="btn btn-sm btn-block cbtn" value="설문지" onclick="click_sv();" 
			                    					style="margin-top: 3px; background-color: white; border-color: #19CE60; color: #19CE60;"></a>
			          						<script>
								   				function click_sv() {
								   			 		var user = '${member.user_id}';
									   					if( user == '') {
									   						alert('로그인을 해주세요 !');
									   						window.location.href="${pageContext.request.contextPath}/member/login";			
									   					} else {
									   						window.location.href="${pageContext.request.contextPath}/surveyboard.do/${scode.s_svcode}";		
									   					} 
								   					}
											 </script>	
											</c:when>		
    								</c:choose>
		                    	</c:forEach> 
		                    	

		                   
		                    	</div> 
		                    	 <h5 class="note">작성날짜 | ${community.c_date }</h5>
		                    	
		                    	
        		 				<br><hr>
          						<p class="note-date font-11 text-muted">작성자 | ${community.user_id }
          						<c:choose>	
          							<c:when test="${community.c_pet eq 'cat' }">
          								<span class="badge text-light rounded-pill" style="font-size:0.5em; background-color:#8977ad;">고양이</span>
          							</c:when>
          							<c:otherwise>
          								<span class="badge text-light rounded-pill" style="font-size:0.5em; background-color:#6989bb;">강아지</span>
          							</c:otherwise>
          						</c:choose></p>


			             	</div>
			            </div>
                </div>
            </div>
          </c:forEach>
        </div>
  	</form>
  </div>

		
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
