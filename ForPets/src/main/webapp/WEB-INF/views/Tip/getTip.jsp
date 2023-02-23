<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
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
					<div class="row align-items-top col-sm-10">
						<div class="col-lg-12">
							<form action="updateTip" method="post">
								<input name="tip_seq" type="hidden" value="${ tip.tip_seq }"/>
								<div class="col-sm-12">
									<iframe width="100%" height="500" src="${tip.tip_video }" frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
								</div>
								<div class="col-sm-12 rounded" style="background-color : #F5F5F5;">
									<h5><b><span id="tip_title">${ tip.tip_title }</span></b></h5>
									<span class="align-top" style="font-size:15px;">조회수 : ${ tip.tip_hit +1 }회</span>
									<c:choose>
				                        <c:when test="${tip.tip_create_date eq tip.tip_update_date || tip.tip_update_date eq null}">
												<span class="align-top" style="font-size:15px;">등록일 : ${ tip.tip_create_date }</span><br>
				                        </c:when>
				                        <c:otherwise>
												<span class="align-top" style="font-size:15px;">수정일 : ${ tip.tip_update_date }</span><br>
				                        </c:otherwise>
						            </c:choose>
									
									<span id="tip_content">${ tip.tip_content }</span><br>
								</div>
								<div class="col-12">
									<input type="submit" value="글 수정" style="float:right;">
								</div>
							</form>
						</div>						
						<div class="col-lg-12">
							<hr>
							<a href="insertTip">글등록</a>&nbsp;&nbsp;&nbsp;
							<a href="deleteTip?tip_seq=${ tip.tip_seq }">글삭제</a>&nbsp;&nbsp;&nbsp;
							<a href="getTipList">글목록</a>
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