<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community list</title>
<jsp:include page="/WEB-INF/views/nav.jsp"/>
<jsp:include page="../favicon.jsp"/>
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
    height: 340px;
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
</style>
</head>
<body>


	<h1 style="text-align: center;">소모임 목록</h1>
	<h5 style="text-align: center;">원하는 소모임을 찾아보세요 ! <a href="getcommunity"><input type="button" class="btn btn-sm btn-block" value="글 작성하러 가기"></a></h5>
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
		                    	<h5 class="note-title text-truncate"><a href="viewcommunityboard/${ community.c_code}">${community.c_title }</a></h5>
		                    		
		                    		<c:set var="now" value="<%=new java.util.Date()%>" />
		                    		<c:set var="min"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>  
		                    	 <h5 class="note">작성날짜 | ${community.c_date }</h5>
		                    	
		                    	<c:forEach items="${svcode }" var="scode">
		                    	<c:choose>
		                    		<c:when test="${community.c_code eq scode.s_code}"><a href="${pageContext.request.contextPath}/surveyboard.do/${scode.s_svcode}"><input type="button" class="btn btn-sm btn-block" value="설문지"></a></c:when>
		                    	</c:choose>
		                    	</c:forEach>           		
		                  		  
		                  		   <br><br><br><hr>
		                    			<p class="note-date font-11 text-muted">작성자 | ${community.user_id }</p>
	

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
