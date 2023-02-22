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
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>


        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/css/partner.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/resources/css/partner.css"></script>
<jsp:include page="/WEB-INF/views/nav.jsp"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
    body{
    background: #F5F5F5;
    margin-top:20px;
}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid transparent;
    border-radius: 0;
    
}
.card {
    margin-bottom: 30px;
}
.card-body {
    flex: 1 1 auto;
    padding: 1.57rem;
}

 .note-has-grid .nav-link {
     padding: .5rem
 }

 .note-has-grid .single-note-item .card {
     border-radius: 10px;

 }

 .note-has-grid .single-note-item .favourite-note {
     cursor: pointer
 }

 .note-has-grid .single-note-item .side-stick {
     position: absolute;
     width: 3px;
     height: 35px;
     left: 0;
     background-color: rgba(82, 95, 127, .5);

 }

 .note-has-grid .single-note-item.all-category .point {
     color: rgba(82, 95, 127, .5);
    
 }
 
.btn {
  	background-color: #19CE60;
  	color : white;
  	
}
 
</style>
</head>
<body>
<br><br><br>

	<h1>소모임 목록</h1>
	<h5>원하는 소모임을 찾아보세요</h5>
	
	<form action="communitylist" method="post">
		
		<div class="container-rapper container-md row" >
			<c:forEach items="${communityList }" var="community">
				<input type="hidden" name ="c_code" value="${community.c_code }">
				<div class="page-content note-has-grid p-4 col-sm-4">
		            <div class="tab-content bg-transparent ">
		                <div id="note-full-container" class="note-has-grid row" style=" margin: 30px; ">
		                    <div class="single-note-item all-category  border rounded">
		                    	<h5 class="note-title text-truncate"><a href="viewcommunityboard/${ community.c_code}">${community.c_title }</a></h5>
		                    	<c:forEach items="${svcode }" var="scode">
		 
		                    	<c:choose>
		                    		<c:when test="${community.c_code eq scode.s_code}"><a href="${pageContext.request.contextPath}/surveyboard.do/${scode.s_svcode}"><input type="button" class="btn btn-sm btn-block" value="설문지"></a></c:when>
		                    	</c:choose>
		                    	</c:forEach>
		           		
		                  		   <h5 class="note-title text-truncate">${community.c_date }</h5>
		                    			<p class="note-date font-12 text-muted">작성자 : ${community.user_id }</p>
	

			             	</div>
			            </div>
                </div>
            </div>
          </c:forEach>
        </div>
  	</form>

</body>
</html>
