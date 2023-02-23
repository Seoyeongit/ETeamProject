<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<div class="row align-items-top">
					<div class="col-lg-10">
						<h1><b>예약이 완료 되었습니다.</b></h1>
						<div class="col-12 row">
							<div class="col-sm-6">
								<h5><b>반려동물 정보</b></h5>
								<!-- Card with an image on left -->
								<div class="card mb-3">
									<div class="row g-0">
										<div class="col-md-4">
											<img width="100%" src="../myInfo/display?fileName=${pet_info.img }" id="pet_img" name="pet_img">
										</div>
										<div class="col-8 row">
											<div class="card-body align-self-center">
												<h5 class="card-title"><span>${pet_info.name }</span></h5>
												<p class="card-text">
													<span>${pet_info.type }</span><br>
													<span>${pet_info.age }</span>
												</p>
											</div>
										</div>
									</div>
								</div><!-- End Card with an image on left -->
							</div>
							<div class="col-sm-6">
								<h5><b>파트너 정보</b></h5>
								<div class="card mb-3">
									<div class="row g-0">
										<div class="col-md-4">
											<img width="100%" id="part_img" name="part_img">
										</div>
										<div class="col-8 row">
											<div class="card-body align-self-center">
												<h5 class="card-title"><span>${part_info.part_name }</span></h5>
												<p class="card-text"><span></span></p>
											</div>
										</div>
									</div>
								</div><!-- End Card with an image on left -->
							</div>
						</div>
						
						<hr>
						
						<div class="mb-3 row">
				            <div class="col-sm-6">
				            	<h5><b>예약 날짜</b></h5>
				                <div class="col-sm-12">
									<span>${reserve.reserve_day }</span>
				                </div>
				            </div>
				            <div class="col-sm-6">
				                <h5><b>예약 시간</b></h5>
				                <div class="col-sm-12">
									<span>${reserve.reserve_time }</span>
				                </div>
				            </div>
				        </div>
						
						<hr>
						
						<div class="mb-3 row">
				            <div class="col-sm-12">
				            	<h5><b>예약 주소</b></h5>
				                <div class="col-sm-12">
									<span>${reserve.reserve_add }</span>
				                </div>
				            </div>
				        </div>
						
						<hr>
						
						<div class="mb-3 row">
				            <div class="col-sm-6">
				            	<h5><b>예약 서비스</b></h5>
				                <div class="col-sm-12">
				                	<c:forEach items="${servList }" var="serv" varStatus="vs">
										<span><b>${serv.s_name }</b></span><br>
										<span>&#32;&#32;&#32;-&#32;${pa_List[vs.index] }</span><br>
									</c:forEach>
				                </div>
				            </div>
				            <div class="col-sm-6">
				                <h5><b>금액</b></h5>
				                <div class="col-sm-12">
									<c:forEach items="${servList }" var="serv">
										<span>${serv.s_price }원</span><br><br>
									</c:forEach>
				                </div>
				            </div>
				        </div>
				        
				        <hr>
				        
				        <div class="mb-3 row">
				            <div class="col-sm-12">
				            	<h5><b>총 금액</b></h5>
				                <div class="col-sm-12">
									<span>${total_price }원</span>
				                </div>
				            </div>
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