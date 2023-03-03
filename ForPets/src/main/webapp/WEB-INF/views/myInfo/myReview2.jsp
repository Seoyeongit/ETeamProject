<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty myReview || myReview eq ''}">
	<jsp:include page="./noData/no_Reivew.jsp"></jsp:include>
</c:if>
<c:forEach items="${myReview}" var="myR">
	<div class="d-flex flex-column mb-5 ">
		<div class="m-0">
			<h5>${myR.r_title }</h5>
			<div class="text-black-50">예약넘버 : ${myR.reserve_num}</div>
		</div>
		<div class="p-0 d-flex">
			<div class="">
			<c:choose>
				<c:when test="${myR.star_rating eq 1}">⭐</c:when>
				<c:when test="${myR.star_rating eq 2}">⭐⭐</c:when>
				<c:when test="${myR.star_rating eq 3}">⭐⭐⭐</c:when>
				<c:when test="${myR.star_rating eq 4}">⭐⭐⭐⭐</c:when>
				<c:when test="${myR.star_rating eq 5}">⭐⭐⭐⭐⭐</c:when>
			</c:choose>
			|&nbsp;
			</div>
			<div class="text-black-50">${myR.r_date}</div>
		</div>
		<div class="pt-2">
			<div>
				${myR.r_content}
			</div>
		</div>
	</div>
</c:forEach>
</body>
</html>