<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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
                    <li class="nav-item"><a class="nav-link js-scroll-trigger active" href="${pageContext.request.contextPath}/Tip/getTipList">팁 게시판</a></li>
                </ul>
            </div>
		</nav>
		
		<main id="main" class="main">
				<section class="section">
					<div class="align-items-top">
						<div class="col-lg-10">
							<div class="col-lg-12">
								<form action="getTipList" method="post">
									<input type="submit" class="btn" style="float:right; background-color:#8bda8b; color:white;" value="검색">
									<input name="searchKeyword" type="text" class="btn" style="float:right; border-color:#8bda8b;" />
									<select name="searchCondition" style="float:right; border-color:#8bda8b;" class="btn">
										<option class="text-center" value="TITLE">제목</option>
										<option class="text-center" value="CONTENT">내용</option>
									</select>
								</form>
							</div><br><br><br>
							
							<div class="col-lg-12">
								<c:forEach items="${tipList }" var="tip">
									<!-- Card with an image on left -->
									<div class="card mb-3" onclick="location.href='getTip?tip_seq=${ tip.tip_seq }'">
										<div class="row g-0">
											<div class="col-md-4">
												<img src="${ tip.tip_img_url }"  class="img-fluid rounded-start" alt="...">
											</div>
											<div class="col-md-8">
												<div class="card-body">
													<h5 class="card-title">${ tip.tip_title }</h5>
													<p class="card-text">${tip.tip_content }</p>
												</div>
											</div>
										</div>
									</div><!-- End Card with an image on left -->
								</c:forEach>
							</div>
							<c:choose>
								<c:when test="${role eq 'admin' }">
									<div class="col-12">
										<div class="col-sm-3 flex-fill" style="float:right;">
											<input type="button" class="form-control btn" 
											style="background-color:#8bda8b; color:white;" onclick="insertTip" value="새 글 작성">
										</div>
									</div>
								</c:when>
							</c:choose>
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