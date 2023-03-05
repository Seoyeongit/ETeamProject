<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<c:if test="${empty myCommuList || myCommuList eq ''}">
	<jsp:include page="./noData/no_answer.jsp"></jsp:include>
</c:if>

<c:forEach items="${myCommuList}" var="commu">
	<div
		class="job-box d-md-flex align-items-center justify-content-between mb-30">
		<div class="job-left my-4 d-md-flex align-items-center flex-wrap">

			<div class="job-content">
				<h5>
					${commu.c_title}
				</h5>
				<h5 class="note-title text-truncate">${commu.c_date} 개설</h5>
				<p>${commu.c_content }</p>
			</div>
		</div>
		<div class="job-right my-4 flex-shrink-0">
			<a class="btn d-block w-100 d-sm-inline-block btn-light" href="${pageContext.request.contextPath}/viewcommunityboard/${commu.c_code}">더보기</a>
		</div>
	</div>
</c:forEach>
