<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/myInfo_main.css"
	rel="stylesheet" />

<title>마이페이지</title>

<jsp:include page="../favicon.jsp"></jsp:include>


<style type="text/css">
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

.icon {
	position: absolute;
	left: 6px;
	top: 9px;
	width: 48px;
	height: 48px;
	background-image: url(< c : out value = "${pageContext.request.contextPath}"/ >/ resources
		/ assets/ img/ marker/ sign-info-48.png);
}

.balloon {
	position: absolute;
	width: 60px;
	height: 60px;
	background-image: url(< c : out value = "${pageContext.request.contextPath}"/ >/ resources
		/ assets/ img/ marker/ balloon.png);
	-ms-transform-origin: 50% 34px;
	-webkit-transform-origin: 50% 34px;
	transform-origin: 50% 34px;
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
}


</style>

<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${pageContext.request.contextPath}/resources/css/partner.css"
	rel="stylesheet" />
</head>
<body>

	<div><jsp:include page="../nav.jsp" />
	</div>

	<div class="container" id="main_content">

		<div class="navbar navbar-expand-lg navbar-dark part-nav" id="sideNav">
			<div class="collapse navbar-collapse navbar_forpets"
				id="navbarResponsive">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link js-scroll-trigger" id="edit-user-info">회원정보수정</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" id="check-user-reserve">예약확인</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" id="check-user-careDiary">돌봄일지</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" id="write-review">나의후기</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">공지사항</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/customer.do">고객센터</a></li>
				</ul>
			</div>
		</div>


		<main class="main" id="main"> </main>

	</div>
	
	
	<div id="footer">
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=037898d01be77d2487543d1d6ea4c210&libraries=services,drawing"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var liurl = "../myInfo/getPetInfo";
			$.ajax({
				type : 'POST',
				url : liurl,
				dataType : 'html',
				success : function(data) {
					$("#main").html(data);
				},
				error : function(result) {
					alert(result);
				}

			});
		})

		$(window).on('popstate', function() {
			//현재 URL에서 데이터를 가져오는 AJAX를 호출합니다.
			$.ajax({
				url : location.pathname,
				success : function(data) {
					$(".right-profile-card").addClass("card");
					//가져온 데이터를 현재 페이지에 업데이트합니다.
					$("#my-message-sibal").html(data);
				}
			})
		});

		//회원정보수정페이지로 넘어갑니다.
		$("#edit-user-info").click(function() {
			var _this = $(this);
			var liurl = "../myInfo/edit-Profile";
			$("card-body p-5").html('');
			var newUrl = 'http://localhost:8000/biz/myInfo/edit-Profile';

			$.ajax({
				type : 'POST',
				url : liurl,
				dataType : 'html',
				success : function(data) {
					window.history.pushState({}, '', newUrl);
					$("#my-message-sibal").html(data);
				},
				error : function(result) {
					alert(result);
				}
			});

		});

		//예약정보확인페이지로 넘어갑니다.
		$('#check-user-reserve').click(function() {
			var _this = $(this);
			var liurl = "../myInfo/check-reservation";
			var newUrl = 'http://localhost:8000/biz/myInfo/check-reservation';

			$("card-body p-5").html('');

			$.ajax({
				type : 'POST',
				url : liurl,
				dataType : 'html',
				success : function(data) {
					window.history.pushState({}, '', newUrl);
					$("#my-message-sibal").html(data);

				},
				error : function(result) {
					alert(result);
				}
			});
		});
		

		
		

		//돌봄일지 페이지로 넘어갑니다.
		$('#check-user-careDiary').click(function() {
			var _this = $(this);
			var liurl = "../myInfo/viewCare";
			var newUrl = 'http://localhost:8000/biz/myInfo/viewCare';

			$("card-body p-5").html('');

			$.ajax({
				type : 'POST',
				url : liurl,
				dataType : 'html',
				success : function(data) {
					window.history.pushState({}, '', newUrl);
					$("#my-message-sibal").html(data);

				},
				error : function(result) {
					alert(result);
				}
			});
		});

		//특정돌봄일지 페이지로 넘어갑니다.
		function getID(id) {
			var liurl = "../myInfo/my_careDiary_detail";
			var diary_id = id;
			var newUrl = 'http://localhost:8000/biz/myInfo/viewCare_detail';

			$.ajax({
				url : liurl,
				type : "GET",
				data : {
					diary_id : diary_id
				},
				success : function(data) {
					$(".right-profile-card").removeClass("card");
					window.history.pushState({}, '', newUrl);
					$("#my-message-sibal").html(data);
				},
				error : function(result) {
					alert(result);
				}
			});
		}
		
		//리뷰페이지로 넘어갑니다.
		$("#write-review").click(function() {
			var _this = $(this);
			var liurl = "../myInfo/review";
			$("card-body p-5").html('');
			var newUrl = 'http://localhost:8000/biz/myInfo/review';

			$.ajax({
				type : 'POST',
				url : liurl,
				dataType : 'html',
				success : function(data) {
					window.history.pushState({}, '', newUrl);
					$("#my-message-sibal").html(data);
				},
				error : function(result) {
					alert(result);
				}
			});

		});
		

		
		//산책경로수정페이지가 popup창으로 열립니다.
		$("#register_wark").click(function() {

			var userId = '<c:out value="${member.user_id}"/>';

			$.ajax({
				url : "../myInfo/modify-roadMap",
				type : "GET",
				data : {
					userId : userId
				},
				success : function(data) {
					console.log(data);
				},
				error : function() {
					console.log("update실패");
				}
			});
		});
	</script>
</body>
</html>