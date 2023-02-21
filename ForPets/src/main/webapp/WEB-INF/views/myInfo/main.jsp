<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/myInfo_main.css" rel="stylesheet" />
	
	<title>마이페이지</title>
	
	<jsp:include page="../favicon.jsp"></jsp:include>
	
	
	<style type="text/css">
	   .node {
        position: absolute;
        background-image: url(<c:out value="${pageContext.request.contextPath}"/>/resources/assets/img/marker/sign-info-64.png);
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

    .icon {
        position: absolute;
        left: 6px;
        top: 9px;
        width: 48px;
        height: 48px;
        background-image: url(<c:out value="${pageContext.request.contextPath}"/>/resources/assets/img/marker/sign-info-48.png);
    }

    .balloon {
        position: absolute;
        width: 60px;
        height: 60px;
        background-image: url(<c:out value="${pageContext.request.contextPath}"/>/resources/assets/img/marker/balloon.png);
        -ms-transform-origin: 50% 34px;
        -webkit-transform-origin: 50% 34px;
        transform-origin: 50% 34px;
    }
    
    #edit-user-info:hover{
    	cursor: pointer;
    	color : red;
    }
    
    a input[id=register_wark]{
    	margin : 1em;
    	float: right;
    }
	</style>
</head>
<body>

	<div><jsp:include page="../nav.jsp"/> </div>
	
    <div class="container">
        <div class="col-md-12">
            <div class="top-breadcrumb">
                <div>안녕하세요 ${member.user_nick}(${member.user_id })님</div>
        </div>

        <div class="row">
            <div class="col-lg-3 ">
                <div class="card left-profile-card">

                    <div class="card-body">

                        <div class="text-center">

                            <h3>${member.user_nick}(${member.user_id })님</h3>
                            <a id="edit-user-info"><p>회원정보수정</p></a>
                        </div>

                        <div class="personal-info">
                        </div>

                    </div>
                </div>
            </div>


            <div class="col-lg-9 right-content">
                <div class="card right-profile-card">
                    <div class="card-body p-5" id="my-message-sibal">


                        <p class="pb-3"><strong>마이페이지</strong></p>

					    <div class="d-flex pb-5">
					
					        <div id="slide" class="flex-fill pet-profile shadow-myinfo carousel slide" data-bs-touch="false"
					            data-bs-interval="false">
					            <div class="carousel-inner">
					            	
					            	<c:forEach items="${userPet}" var="userPet" varStatus="status">
					            	
					            	<c:choose>
					            	<c:when test="${status.first }"><div class="carousel-item active"></c:when>
					            	<c:otherwise><div class="carousel-item"></c:otherwise>
					                </c:choose>
									
					                    <div class="d-flex team-list position-relative overflow-hidden rounded">
					                        <div class="flex-fill col-md-auto">
					                            <c:choose>
					                                <c:when test="${not empty userPet.img}">
					                                    <img alt="" src="../myInfo/display?fileName=${userPet.img }">
					                                </c:when>
					                            </c:choose>
					                        </div>
					                        <div class="flex-fill content float-right p-4">
					                            <h5 class="title mb-0">${userPet.name }
					                                <c:choose>
					                                    <c:when test="${userPet.gender eq 'm'.charAt(0) }">♂️</c:when>
					                                    <c:when test="${userPet.gender eq 'f'.charAt(0) }">♀️</c:when>
					                                </c:choose>
					                                <p class="text-muted mt-3">나이 : ${userPet.age }살</p>
					
					                                <a href="${pageContext.request.contextPath}/myInfo/my-petView?id=${userPet.id}"
					                                  onclick="window.open(this.href, '_blank', 'width=500, height=800'); return false;">
					                                  <input type="button" id="register_pet" value="정보수정하기"></a>
					                        </div>
					                    </div>
					                </div>
					                </c:forEach>
					                
					                <div class="carousel-item">
               						 <div>
               						 	<a href="${pageContext.request.contextPath}/myInfo/my-petView"
					                    onclick="window.open(this.href, '_blank', 'width=500, height=800'); return false;">
					                    <input type="button" id="register_pet" value="펫등록하기"></a>
               						 
               						 </div>
            						</div>
					                
					                
					            </div>
					            <button class="carousel-control-prev" type="button" data-bs-target="#slide" data-bs-slide="prev">
					                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					                <span class="visually-hidden">Previous</span>
					            </button>
					            <button class="carousel-control-next" type="button" data-bs-target="#slide" data-bs-slide="next">
					                <span class="carousel-control-next-icon" aria-hidden="true"></span>
					                <span class="visually-hidden">Next</span>
					            </button>
					        </div>
					
					        <div class="flex-fill col-md-auto pet-work rounded shadow-myinfo" id="map" style="width: 100%; background-color: rgb(249, 249, 249);"></div>
					
					
					
					    </div>

							                            
                            <c:choose>
                            <c:when test="${empty petWork[0].x}">
                                <a href="${pageContext.request.contextPath}/myInfo/create-roadMap"
                                    onclick="window.open(this.href, '_blank', 'width=500, height=800'); return false;">
                                    <input type="button" id="register_wark" value="산책로 등록하기"></a>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/myInfo/create-roadMap"
                                    onclick="window.open(this.href, '_blank', 'width=500, height=800'); return false;">
                                    <input type="button" id="register_wark" value="산책로 수정하기"></a>
                            </c:otherwise>
                       		 </c:choose>


                        <hr>

                        <div class="my-service">
                            <p><strong>나의 서비스</strong></p>
                            <table class="container">
                                <tr>
                                    <td><a href="../myInfo/check-reservation">예약확인</a></td>
                                    <td><a href="../myInfo/viewCare">돌봄일지</a></td>
                                </tr>
                                <tr>
                                    <td>파트너와채팅</td>
                                    <td> <a href="${pageContext.request.contextPath}/myInfo/review"
                                    onclick="window.open(this.href, '_blank', 'width=620, height=700'); return false;">
                                    	후기작성하기</a></td>
                                </tr>
                            </table>
                        </div>

                        <hr>

                        <div class="my-action">
                            <p><strong>나의 활동</strong></p>
                            <table class="container">
                                <tr>
                                    <td><a href="../Notice/noticeBoard">공지사항</a></td>
                                    <td><a href="${pageContext.request.contextPath}/customer.do">고객센터</a></td>
                                </tr>
                            </table>
                        </div>
                        
                       


                    </div>
                </div>
            </div>
        </div>
    </div>
    </main>
    <div id="footer">
    	<jsp:include page="../footer.jsp"></jsp:include>
    </div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=037898d01be77d2487543d1d6ea4c210&libraries=services,drawing"></script>
	<script type="text/javascript">
	
	//회원정보수정페이지로 넘어갑니다.
	$("#edit-user-info").click(function(){
		var _this = $(this);
		var liurl = "../myInfo/edit-Profile";
		$("card-body p-5").html('');
		
		$.ajax({
			type : 'POST',
			url : liurl,
			dataType : 'html',
			success : function(data){
				console.log(data);
				$("#my-message-sibal").html(data);
			},
			error : function(result) {
				alert(result);
			}
		});
		
	});
	
	
	/**
	 * AbstractOverlay를 상속받을 객체를 선언합니다.
	 */
	function TooltipMarker(position, tooltipText) {
	    this.position = position;
	    var node = this.node = document.createElement('div');
	    node.className = 'node';

	    var tooltip = document.createElement('div');
	    tooltip.className = 'tooltip',

	    tooltip.appendChild(document.createTextNode(tooltipText));
	    node.appendChild(tooltip);
	    
	    // 툴팁 엘리먼트에 마우스 인터렉션에 따라 보임/숨김 기능을 하도록 이벤트를 등록합니다.
	    node.onmouseover = function() {
	        tooltip.style.display = 'block';
	    };
	    node.onmouseout = function() {
	        tooltip.style.display = 'none';
	    };
	}

	// AbstractOverlay 상속. 프로토타입 체인을 연결합니다.
	TooltipMarker.prototype = new kakao.maps.AbstractOverlay;

	// AbstractOverlay의 필수 구현 메소드.
	// setMap(map)을 호출했을 경우에 수행됩니다.
	// AbstractOverlay의 getPanels() 메소드로 MapPanel 객체를 가져오고
	// 거기에서 오버레이 레이어를 얻어 생성자에서 만든 엘리먼트를 자식 노드로 넣어줍니다.
	TooltipMarker.prototype.onAdd = function() {
	    var panel = this.getPanels().overlayLayer;
	    panel.appendChild(this.node);
	};

	// AbstractOverlay의 필수 구현 메소드.
	// setMap(null)을 호출했을 경우에 수행됩니다.
	// 생성자에서 만든 엘리먼트를 오버레이 레이어에서 제거합니다.
	TooltipMarker.prototype.onRemove = function() {
	    this.node.parentNode.removeChild(this.node);
	};

	// AbstractOverlay의 필수 구현 메소드.
	// 지도의 속성 값들이 변화할 때마다 호출됩니다. (zoom, center, mapType)
	// 엘리먼트의 위치를 재조정 해 주어야 합니다.
	TooltipMarker.prototype.draw = function() {
	    // 화면 좌표와 지도의 좌표를 매핑시켜주는 projection객체
	    var projection = this.getProjection();
	    
	    // overlayLayer는 지도와 함께 움직이는 layer이므로
	    // 지도 내부의 위치를 반영해주는 pointFromCoords를 사용합니다.
	    var point = projection.pointFromCoords(this.position);

	    // 내부 엘리먼트의 크기를 얻어서
	    var width = this.node.offsetWidth;
	    var height = this.node.offsetHeight;

	    // 해당 위치의 정중앙에 위치하도록 top, left를 지정합니다.
	    this.node.style.left = (point.x - width/2) + "px";
	    this.node.style.top = (point.y - height/2) + "px";
	};

	// 좌표를 반환하는 메소드
	TooltipMarker.prototype.getPosition = function() {
	    return this.position;
	};

	/**
	 * 지도 영역 외부에 존재하는 마커를 추적하는 기능을 가진 객체입니다.
	 * 클리핑 알고리즘을 사용하여 tracker의 좌표를 구하고 있습니다.
	 */
	function MarkerTracker(map, target) {
	    // 클리핑을 위한 outcode
	    var OUTCODE = {
	        INSIDE: 0, // 0b0000
	        TOP: 8, //0b1000
	        RIGHT: 2, // 0b0010
	        BOTTOM: 4, // 0b0100
	        LEFT: 1 // 0b0001
	    };
	    
	    // viewport 영역을 구하기 위한 buffer값
	    // target의 크기가 60x60 이므로 
	    // 여기서는 지도 bounds에서 상하좌우 30px의 여분을 가진 bounds를 구하기 위해 사용합니다.
	    var BOUNDS_BUFFER = 30;
	    
	    // 클리핑 알고리즘으로 tracker의 좌표를 구하기 위한 buffer값
	    // 지도 bounds를 기준으로 상하좌우 buffer값 만큼 축소한 내부 사각형을 구하게 됩니다.
	    // 그리고 그 사각형으로 target위치와 지도 중심 사이의 선을 클리핑 합니다.
	    // 여기서는 tracker의 크기를 고려하여 40px로 잡습니다.
	    var CLIP_BUFFER = 40;

	    // trakcer 엘리먼트
	    var tracker = document.createElement('div');
	    tracker.className = 'tracker';

	    // 내부 아이콘
	    var icon = document.createElement('div');
	    icon.className = 'icon';

	    // 외부에 있는 target의 위치에 따라 회전하는 말풍선 모양의 엘리먼트
	    var balloon = document.createElement('div');
	    balloon.className = 'balloon';

	    tracker.appendChild(balloon);
	    tracker.appendChild(icon);

	    map.getNode().appendChild(tracker);

	    // traker를 클릭하면 target의 위치를 지도 중심으로 지정합니다.
	    tracker.onclick = function() {
	        map.setCenter(target.getPosition());
	        setVisible(false);
	    };

	    // target의 위치를 추적하는 함수
	    function tracking() {
	        var proj = map.getProjection();
	        
	        // 지도의 영역을 구합니다.
	        var bounds = map.getBounds();
	        
	        // 지도의 영역을 기준으로 확장된 영역을 구합니다.
	        var extBounds = extendBounds(bounds, proj);

	        // target이 확장된 영역에 속하는지 판단하고
	        if (extBounds.contain(target.getPosition())) {
	            // 속하면 tracker를 숨깁니다.
	            setVisible(false);
	        } else {
	            // target이 영역 밖에 있으면 계산을 시작합니다.
	            

	            // 지도 bounds를 기준으로 클리핑할 top, right, bottom, left를 재계산합니다.
	            //
	            //  +-------------------------+
	            //  | Map Bounds              |
	            //  |   +-----------------+   |
	            //  |   | Clipping Rect   |   |
	            //  |   |                 |   |
	            //  |   |        *       (A)  |     A
	            //  |   |                 |   |
	            //  |   |                 |   |
	            //  |   +----(B)---------(C)  |
	            //  |                         |
	            //  +-------------------------+
	            //
	            //        B
	            //
	            //                                       C
	            // * 은 지도의 중심,
	            // A, B, C가 TooltipMarker의 위치,
	            // (A), (B), (C)는 각 TooltipMarker에 대응하는 tracker입니다.
	            // 지도 중심과 각 TooltipMarker를 연결하는 선분이 있다고 가정할 때,
	            // 그 선분과 Clipping Rect와 만나는 지점의 좌표를 구해서
	            // tracker의 위치(top, left)값을 지정해주려고 합니다.
	            // tracker 자체의 크기가 있기 때문에 원래 지도 영역보다 안쪽의 가상 영역을 그려
	            // 클리핑된 지점을 tracker의 위치로 사용합니다.
	            // 실제 tracker의 position은 화면 좌표가 될 것이므로 
	            // 계산을 위해 좌표 변환 메소드를 사용하여 모두 화면 좌표로 변환시킵니다.
	            
	            // TooltipMarker의 위치
	            var pos = proj.containerPointFromCoords(target.getPosition());
	            
	            // 지도 중심의 위치
	            var center = proj.containerPointFromCoords(map.getCenter());

	            // 현재 보이는 지도의 영역의 남서쪽 화면 좌표
	            var sw = proj.containerPointFromCoords(bounds.getSouthWest());
	            
	            // 현재 보이는 지도의 영역의 북동쪽 화면 좌표
	            var ne = proj.containerPointFromCoords(bounds.getNorthEast());
	            
	            // 클리핑할 가상의 내부 영역을 만듭니다.
	            var top = ne.y + CLIP_BUFFER;
	            var right = ne.x - CLIP_BUFFER;
	            var bottom = sw.y - CLIP_BUFFER;
	            var left = sw.x + CLIP_BUFFER;

	            // 계산된 모든 좌표를 클리핑 로직에 넣어 좌표를 얻습니다.
	            var clipPosition = getClipPosition(top, right, bottom, left, center, pos);
	            
	            // 클리핑된 좌표를 tracker의 위치로 사용합니다.
	            tracker.style.top = clipPosition.y + 'px';
	            tracker.style.left = clipPosition.x + 'px';

	            // 말풍선의 회전각을 얻습니다.
	            var angle = getAngle(center, pos);
	            
	            // 회전각을 CSS transform을 사용하여 지정합니다.
	            // 브라우저 종류에따라 표현되지 않을 수도 있습니다.
	            // https://caniuse.com/#feat=transforms2d
	            balloon.style.cssText +=
	                '-ms-transform: rotate(' + angle + 'deg);' +
	                '-webkit-transform: rotate(' + angle + 'deg);' +
	                'transform: rotate(' + angle + 'deg);';

	            // target이 영역 밖에 있을 경우 tracker를 노출합니다.
	            setVisible(true);
	        }
	    }

	    // 상하좌우로 BOUNDS_BUFFER(30px)만큼 bounds를 확장 하는 함수
	    //
	    //  +-----------------------------+
	    //  |              ^              |
	    //  |              |              |
	    //  |     +-----------------+     |
	    //  |     |                 |     |
	    //  |     |                 |     |
	    //  |  <- |    Map Bounds   | ->  |
	    //  |     |                 |     |
	    //  |     |                 |     |
	    //  |     +-----------------+     |
	    //  |              |              |
	    //  |              v              |
	    //  +-----------------------------+
	    //  
	    // 여기서는 TooltipMaker가 완전히 안보이게 되는 시점의 영역을 구하기 위해서 사용됩니다.
	    // TooltipMarker는 60x60 의 크기를 가지고 있기 때문에 
	    // 지도에서 완전히 사라지려면 지도 영역을 상하좌우 30px만큼 더 드래그해야 합니다.
	    // 이 함수는 현재 보이는 지도 bounds에서 상하좌우 30px만큼 확장한 bounds를 리턴합니다.
	    // 이 확장된 영역은 TooltipMarker가 화면에서 보이는지를 판단하는 영역으로 사용됩니다.
	    function extendBounds(bounds, proj) {
	        // 주어진 bounds는 지도 좌표 정보로 표현되어 있습니다.
	        // 이것을 BOUNDS_BUFFER 픽셀 만큼 확장하기 위해서는
	        // 픽셀 단위인 화면 좌표로 변환해야 합니다.
	        var sw = proj.pointFromCoords(bounds.getSouthWest());
	        var ne = proj.pointFromCoords(bounds.getNorthEast());

	        // 확장을 위해 각 좌표에 BOUNDS_BUFFER가 가진 수치만큼 더하거나 빼줍니다.
	        sw.x -= BOUNDS_BUFFER;
	        sw.y += BOUNDS_BUFFER;

	        ne.x += BOUNDS_BUFFER;
	        ne.y -= BOUNDS_BUFFER;

	        // 그리고나서 다시 지도 좌표로 변환한 extBounds를 리턴합니다.
	        // extBounds는 기존의 bounds에서 상하좌우 30px만큼 확장된 영역 객체입니다.  
	        return new kakao.maps.LatLngBounds(
	                        proj.coordsFromPoint(sw),proj.coordsFromPoint(ne));
	        
	    }


	    // Cohen–Sutherland clipping algorithm
	    // 자세한 내용은 아래 위키에서...
	    // https://en.wikipedia.org/wiki/Cohen%E2%80%93Sutherland_algorithm
	    function getClipPosition(top, right, bottom, left, inner, outer) {
	        function calcOutcode(x, y) {
	            var outcode = OUTCODE.INSIDE;

	            if (x < left) {
	                outcode |= OUTCODE.LEFT;
	            } else if (x > right) {
	                outcode |= OUTCODE.RIGHT;
	            }

	            if (y < top) {
	                outcode |= OUTCODE.TOP;
	            } else if (y > bottom) {
	                outcode |= OUTCODE.BOTTOM;
	            }

	            return outcode;
	        }

	        var ix = inner.x;
	        var iy = inner.y;
	        var ox = outer.x;
	        var oy = outer.y;

	        var code = calcOutcode(ox, oy);

	        while(true) {
	            if (!code) {
	                break;
	            }

	            if (code & OUTCODE.TOP) {
	                ox = ox + (ix - ox) / (iy - oy) * (top - oy);
	                oy = top;
	            } else if (code & OUTCODE.RIGHT) {
	                oy = oy + (iy - oy) / (ix - ox) * (right - ox);        
	                ox = right;
	            } else if (code & OUTCODE.BOTTOM) {
	                ox = ox + (ix - ox) / (iy - oy) * (bottom - oy);
	                oy = bottom;
	            } else if (code & OUTCODE.LEFT) {
	                oy = oy + (iy - oy) / (ix - ox) * (left - ox);     
	                ox = left;
	            }

	            code = calcOutcode(ox, oy);
	        }

	        return {x: ox, y: oy};
	    }

	    // 말풍선의 회전각을 구하기 위한 함수
	    // 말풍선의 anchor가 TooltipMarker가 있는 방향을 바라보도록 회전시킬 각을 구합니다.
	    function getAngle(center, target) {
	        var dx = target.x - center.x;
	        var dy = center.y - target.y ;
	        var deg = Math.atan2( dy , dx ) * 180 / Math.PI; 

	        return ((-deg + 360) % 360 | 0) + 90;
	    }
	    
	    // tracker의 보임/숨김을 지정하는 함수
	    function setVisible(visible) {
	        tracker.style.display = visible ? 'block' : 'none';
	    }
	    
	    // Map 객체의 'zoom_start' 이벤트 핸들러
	    function hideTracker() {
	        setVisible(false);
	    }
	    
	    // target의 추적을 실행합니다.
	    this.run = function() {
	        kakao.maps.event.addListener(map, 'zoom_start', hideTracker);
	        kakao.maps.event.addListener(map, 'zoom_changed', tracking);
	        kakao.maps.event.addListener(map, 'center_changed', tracking);
	        tracking();
	    };
	    
	    // target의 추적을 중지합니다.
	    this.stop = function() {
	        kakao.maps.event.removeListener(map, 'zoom_start', hideTracker);
	        kakao.maps.event.removeListener(map, 'zoom_changed', tracking);
	        kakao.maps.event.removeListener(map, 'center_changed', tracking);
	        setVisible(false);
	    };
	}


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
		
		
		var dkpos1 = new kakao.maps.LatLng(<c:out value="${petWork[0].x}"/>, <c:out value="${petWork[0].y}"/>);
		
		
		
		var marker1 = new TooltipMarker(dkpos1, '산책로마커');
		marker1.setMap(map);
		
		var markerTracker1 = new MarkerTracker(map, marker1);
		markerTracker1.run();
		
		</c:when>
		</c:choose>
		
		$("#register_wark").click(function(){
			
			var userId = '<c:out value="${member.user_id}"/>';
		
			$.ajax({
				url : "../myInfo/modify-roadMap",
				type : "GET",
				data : {
					userId : userId
				},
				success:function(data){
					console.log(data);
				},
				error:function(){
					console.log("update실패");
				}
			});
		});
	</script>
</body>
</html>