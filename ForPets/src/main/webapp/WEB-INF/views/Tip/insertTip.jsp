<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	.add_service{
		background-color : #F5F5F5;
		color : #8bda8b;
	}
	.footer {
		text-align : center; !important;
	}
</style>
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
	                    	<li class="nav-item"><span style="font-size:15px;"><a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Service/work">- 산책</a></span></li>
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
						<form action="insertTip.do" method="post">
							<div class="mb-3 row">
					            <h5><b>제목</b></h5>
					            <div class="col-sm-12 pb-1">
					            	<div class="col-sm-12">
					                	<input type="text" name="tip_title" placeholder="제목" class="form-control">
					            	</div>
					            </div>
					            <div class="col-sm-12 pb-1">
					            <h5><b>동영상 URL</b></h5>
					            	<div class="col-sm-12">
					                	<input type="text" name="tip_video" placeholder="동영상 URL" class="form-control">
					            	</div>
					            </div>
					            <div class="col-sm-12 pb-1">
					            <h5><b>내용</b></h5>
					            	<div class="col-sm-12">
					                	<textarea name="tip_content" class="form-control col-sm-12" rows="10" style="resize:none;"></textarea>
					            	</div>
					            </div>
					        </div>
							
							<hr>
							<div class="col-12">
								<input type="submit" value="새글 등록" style="float:right;">
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