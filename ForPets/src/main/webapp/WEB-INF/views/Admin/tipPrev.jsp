<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>TIP BOARD</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/admin/tipPrev.css?ver=1"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	
<style>

.thumb-content {
	height: 150px;
}

</style>	
	
	
</head>
<body>
	<div class="container-xl">
		<div class="row">
			<div class="col-md-11 mx-auto">
				<div id="myCarousel" class="carousel slide" data-ride="carousel"
					data-interval="0">
					<!-- Carousel indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<!-- Wrapper for carousel items -->

					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="row">
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="img-box">
											<img src="${ tipPrev[0].tip_img_url }"
												onclick="location.href='${pageContext.request.contextPath}/Tip/getTip?tip_seq=${ tipPrev[0].tip_seq }'"
												class="img-fluid" alt="">
										</div>
										<div class="thumb-content">
											<h5>${ tipPrev[0].tip_title }</h5>
											<p></p>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="img-box">
											<img src="${ tipPrev[1].tip_img_url }"
												onclick="location.href='getTip?tip_seq=${ tipPrev[1].tip_seq }'"
												class="img-fluid" alt="">
										</div>
										<div class="thumb-content">
											<h5>${ tipPrev[1].tip_title }</h5>
											<p></p>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="img-box">
											<img src="${ tipPrev[2].tip_img_url }"
												onclick="location.href='getTip?tip_seq=${ tipPrev[2].tip_seq }'"
												class="img-fluid" alt="">
										</div>
										<div class="thumb-content">
											<h5>${ tipPrev[2].tip_title }</h5>
											<p></p>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="img-box">
											<img src="${ tipPrev[3].tip_img_url }"
												onclick="location.href='getTip?tip_seq=${ tipPrev[3].tip_seq }'"
												class="img-fluid" alt="">
										</div>
										<div class="thumb-content">
											<h5>${ tipPrev[3].tip_title }</h5>
											<p></p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="row">
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="img-box">
											<img src="${ tipPrev[4].tip_img_url }"
												onclick="location.href='${pageContext.request.contextPath}/Tip/getTip?tip_seq=${ tipPrev[4].tip_seq }'"
												class="img-fluid" alt="">
										</div>
										<div class="thumb-content">
											<h5>${ tipPrev[4].tip_title }</h5>
											<p></p>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="img-box">
											<img src="${ tipPrev[5].tip_img_url }"
												onclick="location.href='getTip?tip_seq=${ tipPrev[5].tip_seq }'"
												class="img-fluid" alt="">
										</div>
										<div class="thumb-content">
											<h5>${ tipPrev[5].tip_title }</h5>
											<p></p>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="img-box">
											<img src="${ tipPrev[6].tip_img_url }"
												onclick="location.href='getTip?tip_seq=${ tipPrev[6].tip_seq }'"
												class="img-fluid" alt="">
										</div>
										<div class="thumb-content">
											<h5>${ tipPrev[6].tip_title }</h5>
											<p></p>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="img-box">
											<img src="${ tipPrev[7].tip_img_url }"
												onclick="location.href='getTip?tip_seq=${ tipPrev[7].tip_seq }'"
												class="img-fluid" alt="">
										</div>
										<div class="thumb-content">
											<h5>${ tipPrev[7].tip_title }</h5>
											<p></p>
										</div>
									</div>
								</div>
							</div>
						</div>
										<div class="carousel-item">
							<div class="row">
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="img-box">
											<img src="${ tipPrev[8].tip_img_url }"
												onclick="location.href='${pageContext.request.contextPath}/Tip/getTip?tip_seq=${ tipPrev[8].tip_seq }'"
												class="img-fluid" alt="">
										</div>
										<div class="thumb-content">
											<h5>${ tipPrev[8].tip_title }</h5>
											<p></p>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="img-box">
											<img src="${ tipPrev[9].tip_img_url }"
												onclick="location.href='getTip?tip_seq=${ tipPrev[9].tip_seq }'"
												class="img-fluid" alt="">
										</div>
										<div class="thumb-content">
											<h5>${ tipPrev[9].tip_title }</h5>
											<p></p>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="img-box">
											<img src="${ tipPrev[10].tip_img_url }"
												onclick="location.href='getTip?tip_seq=${ tipPrev[10].tip_seq }'"
												class="img-fluid" alt="">
										</div>
										<div class="thumb-content">
											<h5>${ tipPrev[10].tip_title }</h5>
											<p></p>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="img-box">
											<img src="${ tipPrev[11].tip_img_url }"
												onclick="location.href='getTip?tip_seq=${ tipPrev[11].tip_seq }'"
												class="img-fluid" alt="">
										</div>
										<div class="thumb-content">
											<h5>${ tipPrev[11].tip_title }</h5>
											<p></p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Carousel controls -->
				<a class="carousel-control-prev" href="#myCarousel"
					data-slide="prev"> <i class="fa fa-angle-left"></i>
				</a> <a class="carousel-control-next" href="#myCarousel"
					data-slide="next"> <i class="fa fa-angle-right"></i>
				</a>
			</div>
		</div>
	</div>
</body>
</html>