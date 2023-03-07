<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Forpets</title>
        <!-- Favicon-->
        <jsp:include page="./favicon.jsp"></jsp:include>
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet" />
<style>
    .dropdown:hover .dropdown-menu {
   		display: block;
   		margin-top: 0;
	}
	.dropdown-item:hover, .dropdown-item:focus {
	  color: #8bda8b;
	  background-color: white;
	}
	.dropdown-item.active, .dropdown-item:active {
	  color: #8bda8b;
	  background-color: white;
	}
	.cbtn {
		font-size: 11px; 
		font-weight: 500; 
		 background-color: white; 
		 border-color: #19CE60; 
		 color: #19CE60;
		--bs-btn-padding-y: 0rem; 
		--bs-btn-padding-x: 0.5rem; 
		border-radius: 40px;                   		
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
	
	.note{
	font-size: 14px;
    color: #999;
    font-weight: 500;
	} 
</style>
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#main"><img src="${pageContext.request.contextPath}/resources/assets/img/logo_gr.png" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                    	<div class="dropdown">
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Service/service">서비스</a></li>
	                        	<ul class="dropdown-menu">
		                        	<li class="dropdown-item nav-item"><span style="font-size:15px;"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/normal">- 기본</a></span></li>
		                    		<li class="dropdown-item nav-item"><span style="font-size:15px;"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/work">- 산책</a></span></li>
	    	                		<li class="dropdown-item nav-item"><span style="font-size:15px;"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/pickup">- 픽업</a></span></li>
	                        	</ul>
                        </div>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/communitylist">소모임</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/partnerlist">펫트너</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/customerMain">고객센터</a></li>
                       
                        <c:choose>
                        <c:when test="${role eq 'partners' }">
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/partner/partnerMain">펫트너 페이지</a></li>
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
                        </c:when>
                        
                        <c:when test="${role eq 'admin' }">
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Admin/main">관리자 페이지</a></li>
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
                        </c:when>
                        
                        <c:when test="${member.user_id eq '' || member.user_id eq null}">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/loginMain">로그인</a></li>
                        </c:when>
                        
                        <c:otherwise>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/myInfo/main">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
                        </c:otherwise>
                        </c:choose>
                   
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container d-flex">
                <div class="masthead-subheading col-6">당신과 아이의 시간이<br><br> 함께 행복하기를 응원합니다.</div>
                <div class="col-6 align-self-center forpets-slide">
                	<div style="position:absolute;">
                    	<img src="${pageContext.request.contextPath}/resources/assets/img/mainback.png" style="width:700px; height:500px; z-index:5;">
                    </div>
                    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel" style="position:absolute; padding-top:137px; padding-left:128px;">
		              	<div class="carousel-inner">
		                  	<div class="carousel-item active" data-bs-interval="2000">
		                      	<img class="d-block" style="width:550px; height:283px;" src="${pageContext.request.contextPath}/resources/assets/dog-normal.jpg" alt="First slide">
		                  	</div>
		                    <div class="carousel-item" data-bs-interval="2000">
		                      	<img class="d-block" style="width:550px; height:283px;" src="${pageContext.request.contextPath}/resources/assets/dog-walking.jpg" alt="Second slide">
		                    </div>
		                    <div class="carousel-item" data-bs-interval="2000">
		                       	<img class="d-block" style="width:550px; height:283px;" src="${pageContext.request.contextPath}/resources/assets/dog-pickup.png" alt="Third slide">
		                    </div>
		                 </div>
              		</div>
                    <div style="position:relative;">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/mainimg2.png" style="width:700px; z-index:10;">
                    </div>
                     
                </div>
            </div> 
        </header>
        <!-- Services-->
        <section class="page-section" id="service" style="margin-bottom:5%;">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Services</h2>
                    <h3 class="section-subheading text-muted">ForPets에서는 이런 서비스를 제공합니다.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <img src="${pageContext.request.contextPath}/resources/assets/free-icon-dog-6381349.png" alt="산책 아이콘" style="width:80%" height="80%">
                        </span>
                        <h4 class="my-3">산책</h4>
                        <div class="text-muted">바쁜 당신과 혼자 남겨지는 당신의 아이.</div>
                        <div class="text-muted">ForPets가 해결 해드리겠습니다. 평소 자주 다니던</div>
                        <div class="text-muted">친숙한 산책 경로로 기분좋은 산책을 맡겨보세요</div>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <img src="${pageContext.request.contextPath}/resources/assets/free-icon-hospital-5217248.png" alt="병원 아이콘" style="width: 80%" height="80%">
                        </span>
                        <h4 class="my-3">병원 방문</h4>
                        <p class="text-muted">언제 아플지 모르는 우리 아이. 평일엔 시간을 내지 못하는 당신을 위해 ForPets에서 대신 병원 방문 , 진료, 치료 과정 하나하나 실시간으로 남겨드립니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <img src="${pageContext.request.contextPath}/resources/assets/free-icon-speech-bubble-1078011.png" alt="대화 아이콘" style="width: 80%" height="80%">
                        </span>
                        <h4 class="my-3">소모임</h4>
                        <p class="text-muted">당신과 비슷한 걱정, 고민을 가진 사람들과 대화하며 위로받고 타인의 아이도 구경하고 당신의 아이를 자랑하는 소모임 커뮤니티를 이용해보세요.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- 소모임 게시판 -->
        <section class="page-section bg-light" style="padding-bottom:10%;" id="community">
            <div class="container">
                <div class="text-center" style="padding-top:30px;">
                    <h2 class="section-heading text-uppercase">소모임</h2>
                    <h3 class="section-subheading text-muted">다른 아이들의 하루와 당신의 아이의 하루를 공유해보세요.</h3>
                </div>
                <div class="container-rapper">
					<c:forEach items="${communityList }" var="community" end="5">
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
						                    			<a href="viewcommunityboard/${ community.c_code}/${scode.s_svcode}" 
						                    				style="text-decoration: none; color: #666666;">${community.c_title }</a>
						                    			<c:set var="loop_flag" value="true" />
						                    		</c:when>
			    								</c:choose>
					                    	</c:if>
				                    	</c:forEach>
				                    	<c:if test="${not loop_flag }">
				                    		<a href="viewcommunityboard/${ community.c_code}" style="text-decoration: none; color: #666666;">${community.c_title }</a>
				                    	</c:if>
		
					                    
					                    	<c:if test="${community.c_date eq min ||  community.c_date eq oneDayAfterStr}">
					                    		<span class="badge text-light rounded-pill" style="font-size:0.5em; background-color:#0080ff;">new</span>
					                    	</c:if>
				                    	</h5>

				                   
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
                
            </div>
        </section>
        
        
        
        
        <!-- review-->
	 <section class="page-section" id="review">
            <div class="main-live-revi">
        		<div class="text-center">
                    <h2 class="section-heading text-uppercase mb-4 " style="color:white;">실시간 포펫츠 후기</h2>
                </div>
        		<div class="card-wrap">
				 <c:forEach items="${reviewList}" var="review">
                    <div class="card">
                        <div class="review-content">
                            <div class="reviewer-wrap">
                                <div class="reviewer-img">
                                    <img src="${pageContext.request.contextPath}/resources/assets/img/commu/catcomm2.jpg">
                                </div>
                            </div>
                            <div class="review-text">
                                <div>
                                    <div class="review-simple-starRating">
                                        <div>
                                           	${review.r_title }
                                        </div>
                                        <div>
                                        	<c:choose>
                                        		<c:when test="${review.star_rating eq 5}">⭐⭐⭐⭐⭐</c:when>
                                        		<c:when test="${review.star_rating eq 4}">⭐⭐⭐⭐</c:when>
                                        	</c:choose>
                                        </div>
                                    </div>
                                    <p>${review.r_content }</p>
                                </div>
                            </div>
                        </div>
                    </div>
                 </c:forEach>
        
                </div>
        
            </div>
        </section>
       
        
        <!-- Footer-->
        <footer class="footer py-4" style="background-color: #dcdcdc;">
            <div class="container">
                <!-- <div class="row align-items-center"> -->
                    <div class="col-lg-4 text-lg-start">ForPets E조 프로젝트</div><br>
                    <div class="col-sm-4" style="font-size: 14px">
                        <a class="link-dark text-decoration-none me-3" href="#!">연은비</a>
                        <a class="link-dark text-decoration-none me-3" href="#!">이서연</a>
                        <a class="link-dark text-decoration-none me-3" href="#!">이도은</a>
                        <a class="link-dark text-decoration-none me-3" href="#!">임동진</a>
                        <a class="link-dark text-decoration-none me-3" href="#!">최지혁</a>
                        <a class="link-dark text-decoration-none me-3" href="#!">정영현</a>
                    </div>
                </div>
          <!--   </div> -->
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
