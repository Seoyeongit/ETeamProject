<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<head>
<style type="text/css">
body {
	margin-top: 80px;
}

.slide {
	min-width: 520px;
	min-height: 270px;
	max-width: 520px;
	max-height: 270px;
	display: flex;
	flex-direction: column-reverse;
}

#map {
	position: relative;
	width: 80%;
}

.slide>.carousel-inner {
	width: 100%;
	height: 100%;
}

.slide .carousel-item {
	width: 100%;
	height: 100%;
}

.slide .carousel-item>* {
	width: 100%;
	height: 100%;
}

.carousel-inner img {
	width: 100%;
	height: 100%;
}

.hover-div-bk {
	display: none;
	width: inherit;
	height: 100%;
	background-color: black;
	position: absolute;
	z-index: 100;
}

#register_wark {
	position: absolute;
	top: 45%;
	left: 40%;
	display: none;
	z-index: 200;
	background-color: #474747;
	color: #fff;
	border: 0;
	border-radius: 5px;
	padding: 8px;
}

.drragle-after {
	display: block;
	width: inherit;
	height: 100%;
	background-color: black;
	position: absolute;
	opacity: 0.2;
	z-index: 100;
}

.last-item-box {
	text-align: center;
	padding-top: 70px;
	background-color: hsl(210, 8%, 90%);
}

.hello-user {
	border-top-right-radius: 15px;
	border-top-left-radius: 15px;
	padding: 10px 30px 10px;
	background: #ffdc7e;
	box-sizing: content-box;
	margin-bottom: 20px;
}

.hello-user .hello-user-txt {
	font-size: 18px;
	font-weight: 600;
	color: #474747;
	margin-bottom: 0;
}

.pet-info-title {
	border-top-right-radius: 0.25rem;
	border-top-left-radius: 0.25rem;
	padding: 10px;
	background: #ffa95f;
	font-weight: 600;
	color: #474747;
}

.pet-work .pet-work-title {
	padding: 10px;
	background-color: #ffceab;
	width: 100%;
	font-weight: 600;
	color: #474747;
}

.team-list {
	border-top-right-radius: 0 !important;
	border-top-left-radius: 0 !important;
}

.user-statisticData-box {
	width: 100%;
	display: flex;
	flex-direction: column;
}

.user-statisticData-header {
	padding: 10px 30px 10px;
	background: #918d9b;
	box-sizing: content-box;
}

.user-sign-txt {
	font-size: 18px;
	font-weight: 600;
	color: #fff;
	margin-bottom: 0;
}

.user_statisticData-body {
	display: flex;
	border-bottom: 1px solid #dbdbdb;
}

.user_statisticData-body>div {
	width: 100%;
	padding: 0 30px 0 30px;
	margin-top: 30px;
	margin-bottom: 30px;
	text-align: center;
	display: grid;
}

.user_statisticData-body>div:not (:last-child ){
	border-right: 1px solid #dbdbdb;
	border-width: 40%;
}

.data-key {
	font-size: 15px;
	font-weight: 500;
	color: #505050;
}

.data-value {
	color: #918d9b;
	font-weight: 600;
}

[class="data-value"]:not (.data-part .data-value ){
	font-size: 30px;
}

#part-img {
	margin-bottom: 10px;
}

#part-img img {
	width: 50px;
	height: 50px;
	border-radius: 50px;
}

.pet_upd_btn {
	border: 1px solid #f9a825;
	color: #f9a825;
}

.pet_upd_btn:horver {
	color: #f9a825;
}

.pet_reg_btn {
	background-color: #f9a825;
	color: #fff;
}

.data-value-null {
	font-size: 30px;
	color: #918d9b;
	font-weight: 600;
}

.data-value span {
	display: inline-block;
	background: #4b6dff;
	border-radius: 50px;
	width: 25px;
	height: 25px;
	color: #fff;
}
</style>
</head>

	<div class="hello-user">
		<p class="hello-user-txt">안녕하세요 ${member.user_nick }님 반갑습니다.</p>
	</div>
	
	
	<div class="d-flex pb-5" id="pet-info-container">

		<div id="slide"
			class="flex-fill pet-profile shadow-myinfo carousel slide"
			data-bs-touch="false" data-bs-interval="false">
			<div class="carousel-inner">

				<c:forEach items="${userPet}" var="userPet" varStatus="status">

					<c:choose>
						<c:when test="${status.first }">
							<div class="carousel-item active">
						</c:when>
						<c:otherwise>
							<div class="carousel-item">
						</c:otherwise>
					</c:choose>

					<div
						class="d-flex team-list position-relative overflow-hidden rounded">
						<div class="flex-fill col-md-auto">
							<c:choose>
								<c:when test="${not empty userPet.img}">
									<img alt="" src="../myInfo/display?fileName=${userPet.img }">
								</c:when>
								<c:otherwise>
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/myInfo/noImage.png">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="flex-fill content float-right p-4">
							<h5 class="title mb-0">${userPet.name }
								<c:choose>
									<c:when test="${userPet.gender eq 'm'.charAt(0) }">♂️</c:when>
									<c:when test="${userPet.gender eq 'f'.charAt(0) }">♀️</c:when>
								</c:choose>
								<p class="text-muted mt-3">나이 : ${userPet.age }살</p>

								<a
									href="${pageContext.request.contextPath}/myInfo/my-petView?id=${userPet.id}"
									onclick="window.open(this.href, '_blank', 'width=500, height=800'); return false;">
									<input type="button" class="btn pet_upd_btn" id="update_pet"
									value="정보수정하기">
								</a>
						</div>
					</div>
			</div>
			</c:forEach>

			<div class="carousel-item">
				<div class="last-item-box">
					<p>다른 반려동물을 등록하시겠습니까?</p>
					<a href="${pageContext.request.contextPath}/myInfo/my-petView"
						onclick="window.open(this.href, '_blank', 'width=500, height=800'); return false;">
						<input type="button" id="register_pet" class="btn pet_reg_btn"
						value="펫등록하기">
					</a>

				</div>
			</div>


		</div>
		<div class="pet-info-title">${member.user_nick }님의반려동물</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#slide" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#slide" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>

</div>
	


	<div class="flex-fill col-md-auto pet-work rounded shadow-myinfo"
		id="map" style="width: 100%; background-color: rgb(249, 249, 249);">

		<div class="hover-div-bk"></div>

		<div style="opacity: 1;">
			<c:choose>
				<c:when test="${empty petWork[0].x}">
					<a href="${pageContext.request.contextPath}/myInfo/create-roadMap"
						onclick="window.open(this.href, '_blank', 'width=500, height=800'); return false;">
						<input type="button" id="register_wark" value="산책로 등록하기">
					</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/myInfo/modify-roadMap"
						onclick="window.open(this.href, '_blank', 'width=500, height=800'); return false;">
						<input type="button" id="register_wark" value="산책로 수정하기">
					</a>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="pet-work-title" style="z-index: 600; position: absolute;">반려동물
			산책로</div>

	</div>
</div>
</div>


<div>
	<div class="user-statisticData-box">
		<div class="user-statisticData-header">
			<p class="user-sign-txt">${member.user_nick }님은포펫츠와
				${data.userJoin }일 함께해주셨어요!</p>
		</div>
	</div>
	<div class="user_statisticData-body">
		<div class="data-part">
			<p class="data-key">자주선택한 펫트너</p>
			<c:choose>
				<c:when
					test="${data.multiPartInfo.part_name ne null || not empty data.multiPartInfo.part_name }">
					<div id="part-img">
						<img src="../partner/display?fileName=${data.multiPartInfo.img}">
					</div>
					<p class="data-value">${data.multiPartInfo.part_name }펫트너님
						<span>${data.cntMultiTime}</span>회
					</p>
				</c:when>
				<c:otherwise>
					<p class="data-value-null">없음</p>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="data-cntpart">
			<p class="data-key">케어서비스를 신청한 횟수</p>
			<p class="data-value">${data.totalServe }회</p>
		</div>

		<div class="data-service">
			<p class="data-key">자주신청한 케어서비스</p>
			<p class="data-value">${data.multiServe}</p>
		</div>

		<div class="cnt-community">
			<p class="data-key">소모임 참여 횟수</p>
			<p class="data-value">${data.communityPrt}회</p>
		</div>

	</div>
</div>




	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=037898d01be77d2487543d1d6ea4c210&libraries=services,drawing"></script>
	<script type="text/javascript">
	
	
	    $("#map").hover(function (event) {
	        $('.hover-div-bk').css({ "display": "block", "opacity": "0.2" });
	        $('#register_wark').css("display", "block");
	    },
	        function () {
	            $('.hover-div-bk').css("display", "none");
	            $('#register_wark').css("display", "none");
	        }
	    )
	    
	     var item = document.getElementById('map');
	
	    item.onmousedown = function (event) {
	        $('.hover-div-bk,#register_wark').fadeOut(1000);
	        function onMouseMove(event) {
	            $('.hover-div-bk,#register_wark').css("display", "none");
	        }
	    };
	    
	    
	    
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	        mapOption = {
	            center: new kakao.maps.LatLng(37.402054, 127.1082099), // 지도의 중심좌표
	            level: 3 // 지도의 확대 레벨
	        };
	
	    var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
	
	    // 주소-좌표 변환 객체를 생성합니다
	    var geocoder = new kakao.maps.services.Geocoder();
	
	    // 유저의주소값을 가져온다
	    var userAdd = '<c:out value="${member.user_add}"/>';
	
	    //지도의옵션을 설정합니다.
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 2// 지도의 확대 레벨
	    };
	
	    // 지도를 생성합니다    
	    var map = new kakao.maps.Map(mapContainer, mapOption);
	
	
	
	    // 주소로 좌표를 검색합니다
	    geocoder.addressSearch(userAdd, function (result, status) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        var imageSrc = '<c:out value="${pageContext.request.contextPath}"/>/resources/assets/img/marker/marker_home.png', // 마커이미지의 주소입니다    
	            imageSize = new kakao.maps.Size(64, 59), // 마커이미지의 크기입니다
	            imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
	        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords,
	            image: markerImage
	        });
	
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	
	
	    });
	
	    <c:choose>
	        <c:when test="${not empty petWork}">
	                          // 다각형을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 다각형을 표시합니다
	            var polygonPath = [
	            <c:forEach items="${petWork }" var="work">
	                new kakao.maps.LatLng(<c:out value="${work.x}" />, <c:out value="${work.y}" />),
	            </c:forEach>
	            ];
	
	
	            // 지도에 표시할 다각형을 생성합니다
	            var polygon = new kakao.maps.Polygon({
	                path:polygonPath, // 그려질 다각형의 좌표 배열입니다
	            strokeWeight: 3, // 선의 두께입니다
	            strokeColor: '#39DE2A', // 선의 색깔입니다
	            strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	            strokeStyle: 'longdash', // 선의 스타일입니다
	            fillColor: '#A2FF99', // 채우기 색깔입니다
	            fillOpacity: 0.7 // 채우기 불투명도 입니다
	                          });
	
	            // 지도에 다각형을 표시합니다
	            polygon.setMap(map);
	
	
	            var dkpos1 = new kakao.maps.LatLng(<c:out value="${petWork[0].x}" />, <c:out value="${petWork[0].y}" />);
	
	        </c:when>
	    </c:choose>
	
	</script>


