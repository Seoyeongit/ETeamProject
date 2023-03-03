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
  <style>
  	body{
	    background: #F5F5F5;
	    margin-top:100px;
	}
	
	.background {
  	width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    }

  
  .box {
  	width: 1000px;
    height: 274px;
    border: 1px solid #EBEBEB;
    display: flex;
    border-radius: 8px;
    box-shadow: 0px 0px 12px 0px rgb(0 0 0 / 7%);
    position: relative;
    align-items: center;
    margin-top: 20px;
    background-color: white;
  }
  
  .image{
  	width: 433px;
    height: 254px;
    border-radius: 5px;
    margin-left: 10px;
    position: relative;
  }
  
  .text_area {
  	padding: 38px 45px 0 45px;
    height: 100%;
    display: flex;
    flex-grow: 1;
    flex-direction: column;
    justify-content: space-between;    
	justify-content: flex-start;
    align-items: flex-start;

  }
  
  .name {
  	color : black;
  	font-size : 45px;
  	font-weight: 900;
  }
  
  a {
    color: black;
    text-decoration: none;
	
	}
 
  .date {
  	font-size: 14px;
    color: #999;
    font-weight: 500;
  }
  
  .image {
  	width: 433px;
    height: 254px;
    border-radius: 3px;
    object-fit: cover;
  }

  </style>
<title>포펫츠 펫트너즈</title>

</head>

<body>
<div class="background">

	<h1 style="text-align: center;">포펫츠의 펫트너즈를 소개합니다!</h1>
	<h5 style="text-align: center;">원하는 펫트너즈를 클릭하면 리뷰보기로 이동합니다!</h5>
	
       
      
       	  <c:forEach items="${prList }" var="pl">
        	<div class="box">
        		<div class="image">
        			<img src = "${pageContext.request.contextPath}/resources/assets/img/commu/rabbitcomm.webp" style="width: 433px; height: 254px; border-radius: 3px; object-fit: cover;">
        		</div>
        				<div class="text_area note-has-grid">
						
						<div class="name"><a href="partnerreviewlist/${pl.part_id }">${pl.part_name }</a></div>
						<p class="date">펫트너 가입 날짜 | ${pl.data_create }</p>
						<p>${pl.self_infor }</p>
					
						</div>
					
				</div>
				
			</c:forEach>
	</div>
		 
		<br><br>
		
		<%@ include file="/WEB-INF/views/footer.jsp" %>	
				
</body>
</html>