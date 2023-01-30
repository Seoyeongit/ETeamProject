<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
    <div>
        <header>
        <h3>안녕하세요 ${userPet.voU.user_nick}님 <a href="#">로그아웃</a></h3>
        </header>
    </div>
    <div>
        <aside>
            <div>
                <div>${userPet.voU.user_nick}님(${userPet.voU.user_id})</div>
                 <a href="../myInfo/edit-Profile"><div>회원정보수정</div></a>
            </div>
        </aside>
        <main>
            <div>
                <p>마이페이지</p>
                <div>
                    <div>
                    	<c:choose>
                    		<c:when test="${not empty userPet.img}">
								<div><img alt="" src="../myInfo/display?fileName=${userPet.img }"></div>                    			
                    		</c:when>
                    	</c:choose>
                    	
                    	
                    	<p>${userPet.voU.user_nick}님의 애완동물 : ${userPet.name}
                    	<c:choose >
                    		<c:when test="${userPet.type eq '강아지' }"><text>🐶</text></c:when>
                    		<c:when test="${userPet.type eq '고양이' }"><text>😺</text></c:when>
                    	</c:choose></p>
                        <a href="${pageContext.request.contextPath}/myInfo/my-petView" 
                        onclick="window.open(this.href, '_blank', 'width=500, height=800'); return false;">
                        <input type="button" id="register_pet" value="반려동물 등록하기" ></a>
                    </div>
                    <div>
                    	<div id="map" style="width: 500px; height: 400px;"></div>
                    	<c:choose>
                    	<c:when test="${empty petWork[0].x}">
                    	<a href="${pageContext.request.contextPath}/myInfo/create-roadMap" 
                        onclick="window.open(this.href, '_blank', 'width=500, height=800'); return false;">
                        <input type="button" id="register_wark" value="산책로 등록하기"></a>
                        </c:when>
                        <c:otherwise>
                        <a href="${pageContext.request.contextPath}/myInfo/modify-roadMap" 
                        onclick="window.open(this.href, '_blank', 'width=500, height=800'); return false;">
                        <input type="button" id="register_wark" value="산책로 수정하기"></a>
                        </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <hr>
                <p>나의서비스</p>
                <div>
                    <a href="../myInfo/check-reservation"><div>예약확인</div></a>
                    <a href=""><div>돌봄일지</div></a>
                    <a href=""><div>파트너와 1:1채팅하기</div></a>
                    <a href=""><div>후기작성</div></a>
                </div>
                <p>나의활동</p>
                <div>
                    <a href=""></a><div>고객센터</div></a>
                </div>
            </div>
        </main>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=037898d01be77d2487543d1d6ea4c210&libraries=services,drawing"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 유저의주소값을 가져온다
		var userAdd = '<c:out value="${userPet.voU.user_add}"/>';

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
		
		// 다각형을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 다각형을 표시합니다
		var polygonPath = [
			
			<c:forEach items="${petWork }" var="work">
		    new kakao.maps.LatLng(<c:out value="${work.x}"/>, <c:out value="${work.y}"/>),
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
		
		
	
	
	</script>
</body>
</html>