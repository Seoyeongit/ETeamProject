<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/juso.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pet_partner.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	.forpets-service-reserve{
		color : #8bda8b;
		font-size : 2rem;
		padding-top : 10px;
		padding-bottom : 30px;
	}
</style>

<script>
function choice_service(this_id) {
	var id = this_id;
	var add = "#" + id + "_add";
	var choice = "#" + id + "_choice";
	var check = $(choice).is('[checked]');
	console.log("id : " + id);
	console.log("add : " + add);
	console.log("check : " + check);
	if(check) {
		$("#"+id).css("background-color","#F5F5F5");
		$("#"+id).css("color","black");
		$(add).remove();
		$(choice).attr('checked', false);
	}
	else {
		$("#"+id).css("background-color","#8bda8b");
		$("#"+id).css("color","white");
		$(choice).attr('checked', true);
		getPickupAddPopUp(add);
	}
}

$(document).ready(function(){
	$("#set_pet").hide();
	$("#set_partner").hide();
	$("#set_addService").hide();
});

function showPetWorkPopUp() {
	var url = "http://localhost:8000/biz/findPetWork";
	var name = "showPetWork"
	var option = "width = 540, height = 440, top = 100, left = 200, location = no";
	window.open(url, name, option);
}
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
	                    	<li class="nav-item"><span style="font-size:15px;"><a class="nav-link js-scroll-trigger active" href="${pageContext.request.contextPath}/Service/work">- 산책</a></span></li>
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
						<div class="col-lg-12">
							<div class="col-lg-3 forpets-service-reserve">
								<span><b>산책</b></span>
							</div>
						</div>
						<form action="getService" method="post">
							<input type="hidden" value="${member.user_id }" name="user_id">
							<input type="hidden" id="pet_id" name="pet_id">
							<input type="hidden" value="2" name="s_num">
							<input type="hidden" id="part_id" name="part_id">
							
							<!-- 추가 서비스 부분 -->
							<div id="set_addService">
								<input type="checkbox" id="shower_choice" name="s_num" value="6">
								<input type="checkbox" id="training_choice" name="s_num" value="7">
							</div>
							
							<h5><b>반려동물 정보</b></h5>
							<!-- Card with an image on left -->
							<div class="card mb-3 col-6" id="set_pet">
								<div class="row g-0">
									<div class="col-md-4">
										<img width="100%" id="pet_img" name="pet_img">
									</div>
									<div class="col-8 row">
										<div class="card-body align-self-center">
											<h5 class="card-title" id="pet_info_title"></h5>
											<p class="card-text" id="pet_info"></p>
											<input type="button" value="산책로보기" onclick="showPetWorkPopUp()">
										</div>
									</div>
								</div>
							</div><!-- End Card with an image on left -->
							<br>
							<input type="button" value="선택" onclick="getPetListPopUp()">
							
							<hr>
							
							<div class="mb-3 row">
					            <div class="col-sm-6">
					            	<h5><b>추가 서비스</b></h5>
					            	<div class="row">
						                <div class="col-sm-5 flex-fill">
											<input type="button" id="shower" class="form-control add_service btn" 
											style="background-color : #F5F5F5;" onclick="choice_service(this.id)" value="샤워">
						                </div>
						                <div class="col-sm-5 flex-fill">
						                    <input type="button" id="training" class="form-control add_service btn"
						                    style="background-color : #F5F5F5;" onclick="choice_service(this.id)" value="훈련">
						                </div>
						            </div>
					            </div>
					            <div class="col-sm-6">
					                <h5><b>요청사항</b></h5>
					                <div class="col-sm-12">
										<input type="text" class="form-control" name="reserve_request" >
					                </div>
					            </div>
					        </div>
							
							<hr>
							
							<div class="mb-3 row">
					            <div class="col-sm-6">
					            	<h5><b>날짜</b></h5>
					                <div class="col-sm-12">
										<input type="date" id="date" class="form-control" name="reserve_day">
					                </div>
					            </div>
					            <div class="col-sm-6">
					                <h5><b>시간</b></h5>
					                <div class="col-sm-12">
										<select name="reserve_time" class="form-select">
											<%
												for(int i=12;i<=20;i++) {
											%>
												<option value="<%=i%>:00&#32;&#126;&#32;<%=i+2%>:00"><%=i%>:00&#32;&#126;&#32;<%=i+2%>:00</option>
											<%
												}
											%>
										</select>
					                </div>
					            </div>
					        </div>
					        
					        <hr>
					        
					        <div class="mb-3 row">
					            <h5><b>주소</b></h5>
					            <div class="col-sm-12 pb-1">
					            	<div class="col-sm-12">
					                	<input type="text" id="sample6_address" name="address" placeholder="주소"  class="form-control" readonly size="45">
					            	</div>
					            </div>
					            <div class="col-sm-6">
					            	<div class="col-sm-12">
					                	<input type="text" id="sample6_detailAddress" name="detailAddress"  class="form-control" placeholder="상세주소">
					            	</div>
					            </div>
					            <div class="col-sm-6">
					            	<div class="col-sm-12">
					                	<input type="text" id="sample6_extraAddress" placeholder="참고항목"  class="form-control" readonly>
					            	</div>
					            </div>
					        </div>
					        <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기">
							
							<hr>

							<h5><b>파트너 정보</b></h5>
							<!-- Card with an image on left -->
							<div class="card mb-3 col-6" id="set_partner">
								<div class="row g-0">
									<div class="col-md-4">
										<img width="100%" id="part_img" name="part_img">
									</div>
									<div class="col-8 row">
										<div class="card-body align-self-center">
											<h5 class="card-title" id="part_info_title"></h5>
											<p class="card-text" id="part_info"></p>
										</div>
									</div>
								</div>
							</div><!-- End Card with an image on left -->
							<br>
							<input type="button" value="파트너선택" onclick="getPartnerListPopUp()">
							
							<hr>
							
							<div class="col-12">
								<input type="button" value="다음" onclick="reserveMake()" style="float:right;">
							</div>
						</form>
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