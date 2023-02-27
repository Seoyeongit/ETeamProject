<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/partner_review/star.css" rel="stylesheet">
<style>
body {
	padding-top: 100px;
}

.filter-result .job-box {
	-webkit-box-shadow: 0 1px 3px 0 #dbdbdb;
	box-shadow: 0 1px 3px 0 #dbdbdb;
	border-radius: 10px;
	padding: 10px 35px;
}

ul {
	list-style: none;
}

.list-disk li {
	list-style: none;
	margin-bottom: 12px;
}

.list-disk li:last-child {
	margin-bottom: 0;
}

#review-header{
	width: 100%;
}

#review-modal{
	padding: 45px;
}

.modal-header .btn-close{
	position: absolute;
	top:10px;
	right: 10px;
	height: 40px;
}

.textLengthWrap{
	position: absolute;
	bottom: 25px;
	right: 60px;
	display: flex;
	overflow: hidden;
}

.textLengthWrap p{
	margin : 0;
}

textarea{
	width: 100%;
	padding : 9px 15px 25px 15px;
}

.job-box .img-holder {
	height: 65px;
	width: 65px;
	background-color: #4e63d7;
	background-image: -webkit-gradient(linear, left top, right top, from(rgba(78, 99, 215, 0.9
		)), to(#5a85dd));
	background-image: linear-gradient(to right, rgba(78, 99, 215, 0.9) 0%,
		#5a85dd 100%);
	font-family: "Open Sans", sans-serif;
	color: #fff;
	font-size: 22px;
	font-weight: 700;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	border-radius: 65px;
}

@media ( min-width : 992px) {
	.job-overview {
		position: -webkit-sticky;
		position: sticky;
		top: 70px;
	}
}

.job-content ul li {
	font-weight: 600;
	opacity: 0.75;
	border-bottom: 1px solid #ccc;
	padding: 10px 5px;
}

@media ( min-width : 768px) {
	.job-content ul li {
		border-bottom: 0;
		padding: 0;
	}
}

.job-content ul li i {
	font-size: 20px;
	position: relative;
	top: 1px;
}

.mb-30 {
	margin-bottom: 30px;
	
	
	
}

.section-title button{
	min-width: 200px;
	border: 1px solid #19CE60;
	color : #19CE60;
}

.section-title button:hover{
	background-color: #19ce6167;
	border: 1px solid #19CE60;
	color : #19CE60;
}

.section-title button:focus {
	outline: 4px solid #19CE60;
}

.section-title button:active {
	outline: 4px solid #19CE60;
}

.modal-backdrop{
	 --bs-backdrop-opacity: 0.1;
}

.modal-footer{
	border-top: none;
}


</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-10 mx-auto mb-4">
				<div class="section-title text-center ">
					<button class="btn btn-outline-primary" id="write-my-review">리뷰쓰기</button>
					<button class="btn btn-outline-primary" id="view-my-review">내가 작성한 리뷰</button>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-10 mx-auto">
				<div class="career-search mb-60">
					<div class="filter-result"></div>
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			var liurl = "../myInfo/getCptReserve";
			$.ajax({
				type : 'POST',
				url : liurl,
				dataType : 'html',
				success : function(data) {
					$(".filter-result").html(data);
				},
				error : function(result) {
					alert(result);
				}

			});
		});
		
		
		
		$('#write-my-review').click(function() {
			var liurl = "../myInfo/getCptReserve";
			var newUrl = 'http://localhost:8000/biz/myInfo/review';
			$.ajax({
				type : 'POST',
				url : liurl,
				dataType : 'html',
				success : function(data) {
					window.history.pushState({}, '', newUrl);
					$(".filter-result").html(data);
				},
				error : function(result) {
					alert(result);
				}

			});
		});
		
		$('#view-my-review').click(function(){
			var liurl = "../myInfo/getwrittenReview";
			var newUrl = 'http://localhost:8000/biz/myInfo/review-written';
			$.ajax({
				type : 'POST',
				url : liurl,
				dataType : 'html',
				success : function(data) {
					window.history.pushState({}, '', newUrl);
					$(".filter-result").html(data);
				},
				error : function(result) {
					alert(result);
				}
			});
		});
		
	
	</script>
</body>
</html>