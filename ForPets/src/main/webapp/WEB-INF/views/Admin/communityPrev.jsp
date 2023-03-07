<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY PREV</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/admin/tipPrev.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.thumb-content {
	height: 180px;
}

.prev-title {
	height: 100px;
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
										<div class="thumb-content">
											<div class="prev-title">
												<h5>${ comPrev[0].c_title }</h5>
												<p>${ comPrev[0].c_date }</p>
											</div>
											<hr>
											<p>작성자 | ${ comPrev[0].user_id }</p>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="thumb-content">
											<div class="prev-title">
												<h5>${ comPrev[1].c_title }</h5>
												<p>${ comPrev[1].c_date }</p>
											</div>
											<div class="prev-id">
												<hr>
												<p>작성자 | ${ comPrev[1].user_id }</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="thumb-content">
											<div class="prev-title">
												<h5>${ comPrev[2].c_title }</h5>
												<p>${ comPrev[2].c_date }</p>
											</div>
											<div class="prev-id">
												<hr>
												<p>작성자 | ${ comPrev[2].user_id }</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="thumb-content">
											<div class="prev-title">
												<h5>${ comPrev[3].c_title }</h5>
												<p>${ comPrev[3].c_date }</p>
											</div>
											<div class="prev-id">
												<hr>
												<p>작성자 | ${ comPrev[3].user_id }</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="row">
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="thumb-content">
											<div class="prev-title">
												<h5>${ comPrev[4].c_title }</h5>
												<p>${ comPrev[4].c_date }</p>
											</div>
											<div class="prev-id">
												<hr>
												<p>작성자 | ${ comPrev[4].user_id }</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="thumb-content">
											<div class="prev-title">
												<h5>${ comPrev[5].c_title }</h5>
												<p>${ comPrev[5].c_date }</p>
											</div>
											<div class="prev-id">
												<hr>
												<p>작성자 | ${ comPrev[5].user_id }</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="thumb-content">
											<div class="prev-title">
												<h5>${ comPrev[6].c_title }</h5>
												<p>${ comPrev[6].c_date }</p>
											</div>
											<div class="prev-id">
												<hr>
												<p>작성자 | ${ comPrev[6].user_id }</p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="thumb-wrapper">
										<div class="thumb-content">
											<div class="prev-title">
												<h5>${ comPrev[7].c_title }</h5>
												<p>${ comPrev[7].c_date }</p>
											</div>
											<div class="prev-id">
												<hr>
												<p>작성자 | ${ comPrev[7].user_id }</p>
											</div>
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