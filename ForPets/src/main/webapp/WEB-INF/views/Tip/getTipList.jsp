<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="${pageContext.request.contextPath}/resources/css/Tip/style.css" rel="stylesheet" />
<style>
	#main_content {
		display : table;
		width : 100%;
	}
	#sidebar, #main {
		display : table-cell;
	}
</style>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="main_content">
	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">
		<ul class="sidebar-nav" id="sidebar-nav">
			<li class="nav-item">
				<a class="nav-link collapsed" href="${pageContext.request.contextPath}/Service/choice">
					<i class="bi bi-grid"></i>
					<span>서비스 예약</span>
				</a>
			</li><!-- End Dashboard Nav -->
			
			<li class="nav-item">
				<a class="nav-link collapsed" href="${pageContext.request.contextPath}/FindHospital/findHospital">
					<i class="bi bi-grid"></i>
          			<span>근처 병원 찾기</span>
        		</a>
      		</li><!-- End Tip Board Nav -->

			<li class="nav-item">
				<a class="nav-link collapsed" href="${pageContext.request.contextPath}/Tip/getTipList">
					<i class="bi bi-grid"></i>
					<span>팁 게시판</span>
				</a>
			</li><!-- End Tip Board Nav -->
		</ul>
	</aside><!-- End Sidebar-->
	
	<main id="main" class="main">
			<section class="section">
				<div class="row align-items-top">
					<div class="col-lg-10">
							<form action="getTipList" method="post">
							<table border="1" cellpadding="0" cellspacing="0" width="700">
								<tr>
									<td align="right">
										<select name="searchCondition">
												<option value="TITLE">제목</option>
												<option value="CONTENT">내용</option>
										</select>
										<input name="searchKeyword" type="text" />
										<input  type="submit" value="검색" />
									</td>
								</tr>
							</table>
							</form>
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
						<br>
						<a href="insertTip">새 글 작성</a>
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