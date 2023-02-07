<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>반려동물산책로등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h3>나의 반려동물 산책로 등록하기</h3>
	<hr>
	<div>산책케어서비스를 이용하시려면 산책로 등록을 해주세요</div>
	<div id ="workBtn">
	<button onclick="selectOverlay('POLYLINE')">산책로지정하기</button>
	</div>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<button id="create" onclick="">등록하기</button>

	<div id="Lat"></div> 
	
	<div id="gabojago"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=037898d01be77d2487543d1d6ea4c210&libraries=services,drawing"></script>
	<script>
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		var i = 0; //좌표배열을 추가할count
		var workX = []; //유저의산책로 좌표x를 담을 배열
		var workY = []; //유저의산책로 좌표y를 담을 배열

		//지도의옵션을 설정합니다.
		mapOption = {
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 3// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 유저의주소값을 가져온다
		var userAdd = '<c:out value="${member.user_add}"/>';

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(userAdd, function (result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

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


				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
				var infowindowPark = new kakao.maps.InfoWindow({ zIndex: 1 });

				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places();

				// 키워드생성합니다.
				var key = userAdd.match(/.+[구,동}]+/g)[0] + '공원';

				// 키워드로 장소를 검색합니다
				ps.keywordSearch(key, placesSearchCB);

				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
					if (status === kakao.maps.services.Status.OK) {

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						// LatLngBounds 객체에 좌표를 추가합니다
						var bounds = new kakao.maps.LatLngBounds();

						for (var i = 0; i < data.length; i++) {
							displayMarker(data[i]);
							bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
						}
					}
				}

				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {

					var imageSrcP = '<c:out value="${pageContext.request.contextPath}"/>/resources/assets/img/marker/marker_park.png', // 마커이미지의 주소입니다    
						imageSizeP = new kakao.maps.Size(64, 59), // 마커이미지의 크기입니다
						imageOptionP = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

					// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					var markerImageP = new kakao.maps.MarkerImage(imageSrcP, imageSizeP, imageOptionP);

					// 마커를 생성하고 지도에 표시합니다
					var marker = new kakao.maps.Marker({
						map: map,
						position: new kakao.maps.LatLng(place.y, place.x),
						image: markerImageP
					});

					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'click', function () {
						// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
						infowindowPark.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
						infowindowPark.open(map, marker);
					});
				}




				//지도에 클릭 이벤트를 등록합니다
				//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
				kakao.maps.event.addListener(map, 'click', function (mouseEvent) {

					// 클릭한 위도, 경도 정보를 가져옵니다 
					var latlng = mouseEvent.latLng;

					var message = latlng.getLat() + "/" + latlng.getLng();

					var resultDiv = document.getElementById('Lat');
					resultDiv.innerHTML = message;


					$("#gabojago").append('<div name="gabojago' + i + '">' + message + '</div>');

					workX[i] = latlng.getLat();
					workY[i] = latlng.getLng();

					console.log(workX);
					console.log(workY);

					i++;

				});

				// 지도에 locadmap을 표시한다.
				map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);
			}
		});

		var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
			map: map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
			drawingMode: [ // Drawing Manager로 제공할 그리기 요소 모드입니다
				kakao.maps.drawing.OverlayType.POLYLINE
			],
			// 사용자에게 제공할 그리기 가이드 툴팁입니다
			// 사용자에게 도형을 그릴때 가이드 툴팁을 표시하도록 설정합니다
			guideTooltip: ['draw'],
			polylineOptions: { // 선 옵션입니다
				draggable: false, // 그린 후 드래그가 가능하도록 설정합니다
				removable: true, // 그린 후 삭제 할 수 있도록 x 버튼이 표시됩니다
				editable: false, // 그린 후 수정할 수 있도록 설정합니다 
				strokeColor: '#ff0000', // 선 색
				hintStrokeStyle: 'dash', // 그리중 마우스를 따라다니는 보조선의 선 스타일
				hintStrokeOpacity: 0.5  // 그리중 마우스를 따라다니는 보조선의 투명도
			}
		};


		// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
		var manager = new kakao.maps.drawing.DrawingManager(options);

		function selectOverlay(type) {
			$("#workBtn").html("<button id='undo' class='disabled' onclick='undo()'>산책로지우기</button>");

			workX.length = 0;
			workY.length = 0;

			// 그리기 중이면 그리기를 취소합니다
			manager.cancel();

			// 클릭한 그리기 요소 타입을 선택합니다
			manager.select(kakao.maps.drawing.OverlayType[type]);
		};
		
		$("#undo").click(function(){
			$("#workBtn").html("<button onclick='selectOverlay(\"POLYLINE\")'>산책로지정하기</button>");
		})

		// undo 버튼 클릭시 호출되는 함수입니다.
		function undo() {
			// 그리기 요소를 이전 상태로 되돌립니다
			manager.undo();

			workX.length = 0;
			workY.length = 0;
		}
		
		//그리기요소를 삭제하면 호출되는 함수입니다.
		manager.addListener('remove', function (e) {
			workX.length = 0;
			workY.length = 0;
			$("#workBtn").html("<button onclick='selectOverlay(\"POLYLINE\")'>산책로지정하기</button>");
		});
		
		$("#create").click(function(){
			
			var userId = '<c:out value="${member.user_id}"/>';
			
			//필터를통해서 empty를 삭제합니다.
			let newWorkX = workX.filter(()=>true);
			let newWorkY = workY.filter(()=>true);
			
			$.ajaxSettings.traditional = true;
			
			$.ajax({
				url : "../myInfo/createWork",
				type : "POST",
				data : {
					listX : newWorkX,
					listY : newWorkY,
					userId : userId
				},
				success:function(data){
					window.close();
					window.location.reload();
				},
				error:function(){
					alert("신규등록실패");
					window.location.reload();
				}
			})
		})
		


	</script>
</body>
</html>