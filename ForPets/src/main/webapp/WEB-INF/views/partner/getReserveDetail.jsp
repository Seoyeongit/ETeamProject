<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta charset="UTF-8">
<title>서비스 확인 페이지</title>
</head>
<body>

	<div>강아지 이름</div>
	<div>${reserve.voPet.name}</div>
	<div>사용자</div>
	<div>${reserve.user_id }${reserve.voU.user_name }</div>
	<div>주소</div>
	<c:choose>
		<c:when test="${reserve.s_num eq 1}">
			<c:if test="${reserve.reserve_add eq '' }">
				${reserve.voU.user_add }
			<c:otherwise>
				${reserve.reserve_add }
			</c:otherwise>
			</c:if>		
		</c:when>
        <c:when test="${reserve.s_num eq 2}">산책돌봄서비스</c:when>
        <c:when test="${reserve.s_num eq 4 || reserve.s_num eq 5}">${reserve.pick_add }</c:when>
	</c:choose>
	<div>${reserve.voU.user_add }</div>
	<div>연락처</div>
	<div>${reserve.voU.phnumber }</div>
	<div>주의사항</div>
	<div>${reserve.reserve_request }</div>
	<div>서비스명</div>
	<div>
		<c:choose>
			<c:when test="${reserve.s_num eq 1}">기본돌봄서비스</c:when>
          	<c:when test="${reserve.s_num eq 2}">산책돌봄서비스</c:when>
          	<c:when test="${reserve.s_num eq 4}">병원픽업서비스</c:when>
          	<c:when test="${reserve.s_num eq 5}">미용픽업서비스</c:when>
		</c:choose>
	</div>
	<div>추가서비스</div>
		<c:forEach items="${reserve.s_numArr }" var="sArr">
			<c:choose>
				<c:when test="${sArr eq 6 }">샤워서비스</c:when>
				<c:when test="${sArr eq 7 }">훈련서비스</c:when>
			</c:choose>
		</c:forEach>
		<input type="button" onclick="location.href='getReserve';"  value="뒤로가기"/>
</body>
</html>