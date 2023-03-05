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

</style>

<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${pageContext.request.contextPath}/resources/css/partner.css"
	rel="stylesheet" />
</head>
<body>

	<div style=" flex: 0 0 auto;"><jsp:include page="../nav.jsp" />
	</div>

	<div class="" id="main_content">

		<div class="navbar navbar-expand-lg navbar-dark part-nav" id="sideNav" style="width: 20.8rem;">
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
					<li class="nav-item"><a class="nav-link js-scroll-trigger" id="edit-user-info">회원탈퇴</a></li>
				</ul>
			</div>
		</div>


		<main class="main" id="main">
			<div class="card-body p-5" id="my-message-sibal">
			</div>
		</main>

	</div>
	
	
	<div id="footer">
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=037898d01be77d2487543d1d6ea4c210&libraries=services,drawing"></script>
	<script type="text/javascript">
	
	
		function display(data){
			window.scrollTo(0,0);
			$("#my-message-sibal").html(data);
		};
	
		window.onload = function() {
			var liurl = "../myInfo/getPetInfo";
			$.ajax({
				type : 'POST',
				url : liurl,
				dataType : 'html',
				success : function(data) {
					$("#my-message-sibal").html(data);
				},
				error : function(result) {
					alert(result);
				}

			});
		};

		//회원정보수정페이지로 넘어갑니다.
		$("#edit-user-info").click(function() {
			var liurl = "../myInfo/edit-Profile";
			var newUrl = 'http://localhost:8000/biz/myInfo/edit-Profile';

			$.ajax({
				type : 'POST',
				url : liurl,
				dataType : 'html',
				success : function(data) {
					window.history.pushState({}, '', newUrl);
					display(data);
				},
				error : function(result) {
					alert(result);
				}
			});

		});

		//예약정보확인페이지로 넘어갑니다.
		$('#check-user-reserve').click(function() {
			var liurl = "../myInfo/check-reservation";
			var newUrl = 'http://localhost:8000/biz/myInfo/check-reservation';

			$.ajax({
				type : 'POST',
				url : liurl,
				dataType : 'html',
				success : function(data) {
					console.log(data);
					window.history.pushState({}, '', newUrl);
					display(data);
				},
				error : function(result) {
					alert(result);
				}
			});
		});
		

		//돌봄일지 페이지로 넘어갑니다.
		$('#check-user-careDiary').click(function() {
			var liurl = "../myInfo/viewCare";
			var newUrl = 'http://localhost:8000/biz/myInfo/viewCare';


			$.ajax({
				type : 'POST',
				url : liurl,
				dataType : 'html',
				success : function(data) {
					window.history.pushState({}, '', newUrl);
					display(data);
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
					window.history.pushState({}, '', newUrl);
					display(data);
				},
				error : function(result) {
					alert(result);
				}
			});
		}
		
		//리뷰페이지로 넘어갑니다.
		$("#write-review").click(function() {
			var liurl = "../myInfo/review";
			var newUrl = 'http://localhost:8000/biz/myInfo/review';

			$.ajax({
				type : 'POST',
				url : liurl,
				dataType : 'html',
				success : function(data) {
					window.history.pushState({}, '', newUrl);
					display(data);
				},
				error : function(result) {
					alert(result);
				}
			});

		});
		
		//나의소모임페이지로 넘어갑니다.
		$("#get-myCommu").click(function() {
			var liurl = "../myInfo/viewMycommuMain";
			var newUrl = 'http://localhost:8000/biz/myInfo/getMyCommu';

			$.ajax({
				type : 'POST',
				url : liurl,
				dataType : 'html',
				success : function(data) {
					window.history.pushState({}, '', newUrl);
					display(data);
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