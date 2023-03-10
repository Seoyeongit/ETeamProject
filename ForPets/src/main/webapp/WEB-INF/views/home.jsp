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
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Service/service">?????????</a></li>
	                        	<ul class="dropdown-menu">
		                        	<li class="dropdown-item nav-item"><span style="font-size:15px;"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/normal">- ??????</a></span></li>
		                    		<li class="dropdown-item nav-item"><span style="font-size:15px;"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/work">- ??????</a></span></li>
	    	                		<li class="dropdown-item nav-item"><span style="font-size:15px;"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/pickup">- ??????</a></span></li>
	                        	</ul>
                        </div>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/communitylist">?????????</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/partnerlist">?????????</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/customerMain">????????????</a></li>
                       
                        <c:choose>
                        <c:when test="${role eq 'partners' }">
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/partner/partnerMain">????????? ?????????</a></li>
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout">????????????</a></li>
                        </c:when>
                        
                        <c:when test="${role eq 'admin' }">
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Admin/main">????????? ?????????</a></li>
                        	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout">????????????</a></li>
                        </c:when>
                        
                        <c:when test="${member.user_id eq '' || member.user_id eq null}">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/loginMain">?????????</a></li>
                        </c:when>
                        
                        <c:otherwise>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/myInfo/main">???????????????</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout">????????????</a></li>
                        </c:otherwise>
                        </c:choose>
                   
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container d-flex">
                <div class="masthead-subheading col-6">????????? ????????? ?????????<br><br> ?????? ??????????????? ???????????????.</div>
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
                    <h3 class="section-subheading text-muted">ForPets????????? ?????? ???????????? ???????????????.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <img src="${pageContext.request.contextPath}/resources/assets/free-icon-dog-6381349.png" alt="?????? ?????????" style="width:80%" height="80%">
                        </span>
                        <h4 class="my-3">??????</h4>
                        <div class="text-muted">?????? ????????? ?????? ???????????? ????????? ??????.</div>
                        <div class="text-muted">ForPets??? ?????? ?????????????????????. ?????? ?????? ?????????</div>
                        <div class="text-muted">????????? ?????? ????????? ???????????? ????????? ???????????????</div>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <img src="${pageContext.request.contextPath}/resources/assets/free-icon-hospital-5217248.png" alt="?????? ?????????" style="width: 80%" height="80%">
                        </span>
                        <h4 class="my-3">?????? ??????</h4>
                        <p class="text-muted">?????? ????????? ????????? ?????? ??????. ????????? ????????? ?????? ????????? ????????? ?????? ForPets?????? ?????? ?????? ?????? , ??????, ?????? ?????? ???????????? ??????????????? ??????????????????.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <img src="${pageContext.request.contextPath}/resources/assets/free-icon-speech-bubble-1078011.png" alt="?????? ?????????" style="width: 80%" height="80%">
                        </span>
                        <h4 class="my-3">?????????</h4>
                        <p class="text-muted">????????? ????????? ??????, ????????? ?????? ???????????? ???????????? ???????????? ????????? ????????? ???????????? ????????? ????????? ???????????? ????????? ??????????????? ??????????????????.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- ????????? ????????? -->
        <section class="page-section bg-light" style="padding-bottom:10%;" id="community">
            <div class="container">
                <div class="text-center" style="padding-top:30px;">
                    <h2 class="section-heading text-uppercase">?????????</h2>
                    <h3 class="section-subheading text-muted">?????? ???????????? ????????? ????????? ????????? ????????? ??????????????????.</h3>
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
				                    	 <h5 class="note">???????????? | ${community.c_date }</h5>
				                    	
				                    	
		        		 				<br><hr>
		          						<p class="note-date font-11 text-muted">????????? | ${community.user_id }
		          						<c:choose>	
		          							<c:when test="${community.c_pet eq 'cat' }">
		          								<span class="badge text-light rounded-pill" style="font-size:0.5em; background-color:#8977ad;">?????????</span>
		          							</c:when>
		          							<c:otherwise>
		          								<span class="badge text-light rounded-pill" style="font-size:0.5em; background-color:#6989bb;">?????????</span>
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
                    <h2 class="section-heading text-uppercase mb-4 " style="color:white;">????????? ????????? ??????</h2>
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
                                        		<c:when test="${review.star_rating eq 5}">???????????????</c:when>
                                        		<c:when test="${review.star_rating eq 4}">????????????</c:when>
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
                    <div class="col-lg-4 text-lg-start">ForPets E??? ????????????</div><br>
                    <div class="col-sm-4" style="font-size: 14px">
                        <a class="link-dark text-decoration-none me-3" href="#!">?????????</a>
                        <a class="link-dark text-decoration-none me-3" href="#!">?????????</a>
                        <a class="link-dark text-decoration-none me-3" href="#!">?????????</a>
                        <a class="link-dark text-decoration-none me-3" href="#!">?????????</a>
                        <a class="link-dark text-decoration-none me-3" href="#!">?????????</a>
                        <a class="link-dark text-decoration-none me-3" href="#!">?????????</a>
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
