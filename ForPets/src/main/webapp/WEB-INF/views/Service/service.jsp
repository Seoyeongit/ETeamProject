<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Forpets 서비스</title>
<link href="${pageContext.request.contextPath}/resources/css/Tip/tip.css" rel="stylesheet" />
<style>
	#main_content {
		display : table;
		width : 100%;
	}
	#sideNav, #main {
		display : table-cell;
	}
	main {
		padding-left : 50px;
	}
	#footer_div {
		position : relative;
		z-index : 900;
	}
	.navbar_forpets{
		padding-top : 9rem;
		position : absolute;
	}
	.footer {
		text-align : center; !important;
	}
	.service-forpets{
		margin-bottom : 5%;
	}
</style>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="main_content">
		
		<nav class="navbar navbar-expand-lg navbar-dark part-nav" id="sideNav">
            <div class="collapse navbar-collapse navbar_forpets" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/choice">서비스 예약</a></li>
                    	<ul class="navbar-nav">
                    		<li class="nav-item"><span style="font-size:15px;"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/normal">- 기본</a></span></li>
	                    	<li class="nav-item"><span style="font-size:15px;"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/work">- 산책</a></span></li>
    	                	<li class="nav-item"><span style="font-size:15px;"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/pickup">- 픽업</a></span></li>
                    	</ul>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/FindHospital/findHospital">근처 병원 찾기</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Tip/getTipList">팁 게시판</a></li>
                </ul>
            </div>
		</nav>
		
		<main id="main" class="main">
			<section class="section">
				<div class="row align-items-top" style="margin-left:10%;">
					<!-- Service 소개 Start -->
					<div class="col-lg-12 row">
						<div class="col-md-12">
							<h4 class="my-3"><b>돌봄 서비스</b></h4>
							<div class="text-muted my-3">포펫츠에서 제공하는 서비스 입니다.</div>
						</div>
						
						<!-- 방문 -->
						<div class="col-md-12 row service-forpets">
							<div class="col-md-5" style="float:left;">
		                        <div class="col-12">
		                            <img class="img-thumbnail rounded-circle" src="${pageContext.request.contextPath}/resources/assets/dog-normal.jpg" alt="normal" style="width: 80%; height: 200px;">
		                        </div>
		                    </div>
		                    <div class="col-md-5 align-self-center">
			                    <div>
			                        <h4 class="my-3">기본</h4>
			                        <div class="text-muted">바쁜 당신과 혼자 남겨지는 당신의 아이.</div>
			                        <div class="text-muted">ForPets가 해결 해드리겠습니다.</div>
			                        <div class="text-muted">믿을 수 있는 파트너가 함께 합니다.</div>
			                    </div>
		                    </div>
	                    </div>
	                    
	                    <!-- 산책 -->
	                    <div class="col-md-12 row service-forpets">
							<div class="col-md-5 align-self-center">
			                    <div style="float:left;">
			                        <h4 class="my-3">산책</h4>
			                        <div class="text-muted">바쁜 당신과 혼자 남겨지는 당신의 아이.</div>
			                        <div class="text-muted">ForPets가 해결 해드리겠습니다.</div>
			                        <div class="text-muted">친숙한 산책 경로로 기분 좋은 산책을 맡겨보세요.</div>
			                    </div>
		                    </div>
							<div class="col-md-5">
		                        <div class="col-12">
		                            <img class="img-thumbnail rounded-circle" src="${pageContext.request.contextPath}/resources/assets/dog-walking.jpg" alt="walking" style="width:80%; height: 200px;">
		                        </div>
		                    </div>
	                    </div>
						
						<!-- 픽업 -->
	                    <div class="col-md-12 row service-forpets">
							<div class="col-md-5" style="float:left;">
		                        <div class="col-12">
		                            <img class="img-thumbnail rounded-circle" src="${pageContext.request.contextPath}/resources/assets/dog-pickup.png" alt="pickup" style="width: 80%; height: 200px;">
		                        </div>
		                    </div>
		                    <div class="col-md-5 align-self-center">
			                    <div>
			                        <h4 class="my-3">병원</h4>
	                        		<p class="text-muted">언제 아플지 모르는 우리 아이. 평일엔 시간을 내지 못하는 당신을 위해 ForPets에서 대신 병원 방문 , 진료, 치료 과정 하나하나 실시간으로 남겨드립니다.</p>
			                    </div>
		                    </div>
	                    </div>
	                    
					</div><!-- Service 소개 End -->
					
					<div class="col-lg-12 row service-forpets">
						<div class="col-md-12">
							<h4 class="my-3"><b>근처 병원 검색</b></h4>
	                        <div class="text-muted my-3">소중한 내 아이가 아플 때, 근처에 있는 병원을 빠르게 검색해보세요.</div>
	                        <span class="col-md-12">
	                            <img src="${pageContext.request.contextPath}/resources/assets/map_img.JPG" alt="지도 이미지" style="width: 80%" height="80%">
	                        </span>
	                    </div>
					</div>
					
					<div class="col-lg-12 row">
						<div class="col-md-12">
							<h4 class="my-3"><b>반려인을 위한 정보</b></h4>
							<div class="text-muted my-3">반려인을 위한 정보를 동영상을 통해 알아보세요.</div>
	                        <span class="col-md-12">
	                            <img src="${pageContext.request.contextPath}/resources/assets/Tip.JPG" alt="팁 사진" style="width: 80%" height="80%">
	                        </span>
	                        
	                    </div>
					</div>
					
				</div>
			</section>
		</main><!-- End #main -->
	</div>
	<div id="footer_div" style="background-color : white;">
		<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>