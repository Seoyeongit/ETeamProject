<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../favicon.jsp"></jsp:include>
<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/resources/css/reserve.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/resources/js/partner_page.js"></script>
    <script src="http://code.jquery.com/jquery-3.1.1.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
<title>서비스 확인 페이지</title>
</head>
<body>
	<div class="main-controller">
	<div class="text-controller">
	<div class="name-box"><div><b>펫 이름</b></div>
	<div class="pet-name">${reserve.voPet.name}</div></div>
	<div class="user-box"><div><b>사용자</b></div>
	<div class="user-id">${reserve.user_id }${reserve.voU.user_name }</div></div>
	<div class="add-box">
	<div><b>주소</b></div>
	<div class="add-detail">
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
	</div>
	</div>
	<div>${reserve.voU.user_add }</div>
	<div class="phnum-box">
	<div><b>연락처</b></div>
	<div class="ph-num">${reserve.voU.phnumber }</div></div>
	<div class="warnig">
	<div><b>주의사항</b></div>
	<div class="warn-not">${reserve.reserve_request }</div></div>
	<div class="ser-name">
	<div><b>서비스명</b></div>
	<div class="serv-nam">
		<c:choose>
			<c:when test="${reserve.s_num eq 1}">기본돌봄서비스</c:when>
          	<c:when test="${reserve.s_num eq 2}">산책돌봄서비스</c:when>
          	<c:when test="${reserve.s_num eq 4}">병원픽업서비스</c:when>
          	<c:when test="${reserve.s_num eq 5}">미용픽업서비스</c:when>
		</c:choose>
	</div>
	</div>
	<div class="add-serv">
	<div><b>추가서비스</b></div>
	<div class="add-seradd">
		<c:forEach items="${reserve.s_numArr }" var="sArr">
			<c:choose>
				<c:when test="${sArr eq 6 }">샤워서비스</c:when>
				<c:when test="${sArr eq 7 }">훈련서비스</c:when>
			</c:choose>
		</c:forEach>
		</div>
		</div>
	</div>
	</div>
		<input type="button" class="back-bt" onclick="location.href='getReserve';"  value="뒤로가기"/>
</body>
</html>