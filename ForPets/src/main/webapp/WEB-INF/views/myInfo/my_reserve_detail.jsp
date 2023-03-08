<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/resources/css/myInfo_main.css"
	rel="stylesheet" />
<title>마이페이지</title>
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
	.back-bt {
		margin-bottom:5%;
		background-color:white;
		border:1px solid rgb(128,128,128, 0.7);
	}
</style>

<style type="text/css">

body{
	margin: 0 !important;
    padding: 0 !important;
    height: 100%;
	display: flex;
	flex-direction: column;
}

.node {
	position: absolute;
	background-image: url(< c : out value = "${pageContext.request.contextPath}"/ >/ resources
		/ assets/ img/ marker/ sign-info-64.png);
	cursor: pointer;
	width: 64px;
	height: 64px;
}

.tooltip {
	background-color: #fff;
	position: absolute;
	border: 2px solid #333;
	font-size: 25px;
	font-weight: bold;
	padding: 3px 5px 0;
	left: 65px;
	top: 14px;
	border-radius: 5px;
	white-space: nowrap;
	display: none;
}

.tracker {
	position: absolute;
	margin: -35px 0 0 -30px;
	display: none;
	cursor: pointer;
	z-index: 3;
}

a:hover {
	cursor: pointer;
	color: red;
}

a input[id=register_wark] {
	margin: 1em;
	float: right;
}

.navbar_forpets {
	position: absolute;
	-webkit-user-select:none;
	-moz-user-select:none;
	-ms-user-select:none;
	user-select:none
}

.navbar-nav li p{
	color : #51945b;
	font-weight: 700;
	margin-bottom: 0;

}

#sideNav{
	position: static !important;
	display: block;
	padding-top: 50px;
	min-height : 100vh !important;
	max-height: 100% !important;
}

.footer {
  flex: 0 0 auto;
  width: 100%;
  bottom: 0;
  left: 0;	
  text-align: center;
  font-size: 0.9rem;
  font-family: "Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
}

.main{
	width: 100%;
}

#sideNav{
	display: block !important;
	position: relative !important;
}

#main_content{
	display: flex;
    margin-top: 70px;
}

@media (min-width: 992px){
	#sideNav {
			min-height : 100vh !important;
			max-height: 100% !important;
	}
 }

</style>

<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${pageContext.request.contextPath}/resources/css/partner.css"
	rel="stylesheet" />
</head>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div style=" flex: 0 0 auto;"><jsp:include page="../nav.jsp" />
	</div>

	<div class="" id="main_content">

		<div class="navbar navbar-expand-lg navbar-dark part-nav" id="sideNav" style="width: 20.8rem; min-height: 100vh; max-height: 100%;">
			<div class="collapse navbar-collapse navbar_forpets"
				id="navbarResponsive">
				<ul class="navbar-nav">
					<li><p>나의서비스</p></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" id="check-user-reserve">예약확인</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" id="check-user-careDiary">돌봄일지</a></li>
					<li><br></li>
					<li><p>나의활동</p></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" id="get-myCommu">나의소모임</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" id="write-review">나의후기</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="../customerBoard.do">1:1문의</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="../myCustBoard">문의내역</a></li>
					<li><br></li>
					<li><p>나의정보</p></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" id="edit-user-info">회원정보수정</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" id="cust-user-info">회원탈퇴</a></li>
				</ul>
			</div>
		</div>


		<main class="main" id="main">
			<div class="card-body p-5" id="my-message-sibal">
				<div class="row align-items-top">
					<div class="col-lg-10">
						<form action="reserveInsert" method="post">
							<div class="col-12 row">
								<div class="col-sm-6">
									<h5><b>반려동물 정보</b></h5>
									<!-- Card with an image on left -->
									<div class="card mb-3">
										<div class="row g-0">
											<div class="col-md-4">
												<img style="width:100%; height:200px;" src="../myInfo/display?fileName=${pet_info.img }" id="pet_img" name="pet_img">
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
									<h5><b>펫트너 정보</b></h5>
									<div class="card mb-3">
										<div class="row g-0">
											<div class="col-md-4">
												<img style="width:100%; height:200px;" src="../partner/display?fileName=${part_info.img }" id="part_img" name="part_img">
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
											<c:choose>
												<c:when test="${pa_List != null }">
													<span>&#32;&#32;&#32;-&#32;${pa_List[vs.index] }</span><br>
												</c:when>
											</c:choose>
										</c:forEach>
					                </div>
					            </div>
					            <div class="col-sm-6">
					                <h5><b>금액</b></h5>
					                <div class="col-sm-12">
										<c:forEach items="${servList }" var="serv">
											<span>${serv.s_price }원</span><br>
											<c:choose>
												<c:when test="${pa_List != null }">
													<br>
												</c:when>
											</c:choose>
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

							<hr>
						</form>
					</div>
				</div>
			</div>
		</main>

	</div>
	
	
	<div id="footer">
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
	
	
</body>
</html>