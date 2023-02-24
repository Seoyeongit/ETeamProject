<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/Tip/tip.css" rel="stylesheet" />
<style>
	#main_content {
		display : table;
		width : 100%;
	}
	#sideNav, #main {
		display : table-cell;
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

</style>
<script>
$(document).ready(function(){
	$("#Service_normal_notice").hide();
	$("#Service_walk_notice").hide();
	$("#Service_pickup_notice").hide();
	
	$("#Service_normal").hover(function(){
		$("#Service_walk_notice").hide();
		$("#Service_pickup_notice").hide();
		$("#Service_normal_notice").show();
	});

	$("#Service_walk").hover(function(){
		$("#Service_normal_notice").hide();
		$("#Service_pickup_notice").hide();
		$("#Service_walk_notice").show();
	});

	$("#Service_pickup").hover(function(){
		$("#Service_walk_notice").hide();
		$("#Service_normal_notice").hide();
		$("#Service_pickup_notice").show();
	});
});
</script>
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
				<div class="row align-items-top">
					<div class="col-lg-12 d-flex justify-content-center">
						<div class="col-lg-3" id="Service_normal">
							<a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/normal">
								<div class="card">
	            					<img height="200px;" src="${pageContext.request.contextPath}/resources/assets/dog-normal.jpg" alt="normal" class="card-img-top">
	            					<div class="card-body">
	              						<h5 class="card-title">기본돌봄</h5>
	            					</div>
	          					</div><!-- End Card with an image on top -->
	          				</a>
						</div>
						
						<div class="col-lg-1">
						</div>
						
						<div class="col-lg-3" id="Service_walk">
							<a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/work">
								<div class="card">
	            					<img height="200px;" src="${pageContext.request.contextPath}/resources/assets/dog-walking.jpg" alt="walking" class="card-img-top">
	            					<div class="card-body">
	              						<h5 class="card-title">산책돌봄</h5>
	            					</div>
	          					</div><!-- End Card with an image on top -->
							</a>
						</div>
						
						<div class="col-lg-1">
						</div>
						
						<div class="col-lg-3" id="Service_pickup">
							<a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/pickup">
								<div class="card">
	            					<img height="200px;" src="${pageContext.request.contextPath}/resources/assets/dog-pickup.png" alt="pickup" class="card-img-top">
	            					<div class="card-body">
	              						<h5 class="card-title">픽업돌봄</h5>
	            					</div>
	          					</div><!-- End Card with an image on top -->
							</a>
						</div>
					</div>
					
					<div class="col-lg-12 pt-5 text-center">
						<div class="col-lg-12" id="Service_normal_notice">
							<p>기본 돌봄은 블라블라블라</p>
							<p>기본 돌봄은 블라블라블라</p>
							<p>기본 돌봄은 블라블라블라</p>
						</div>
						
						<div class="col-lg-12" id="Service_walk_notice">
							<p>산책 돌봄은 블라블라블라</p>
							<p>산책 돌봄은 블라블라블라</p>
							<p>산책 돌봄은 블라블라블라</p>
						</div>
						
						<div class="col-lg-12" id="Service_pickup_notice">
							<p>픽업 돌봄은 블라블라블라</p>
							<p>픽업 돌봄은 블라블라블라</p>
							<p>픽업 돌봄은 블라블라블라</p>
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