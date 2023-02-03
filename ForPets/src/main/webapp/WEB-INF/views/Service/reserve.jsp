<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/kakaopay.js" type="text/javascript"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.js"></script>
<style>
	#pickadd {
		font-size : 5px;
	}
</style>
</head>
<body>
	<ul>
		<li><a href="${pageContext.request.contextPath}/Service/choice">서비스 예약</a></li>
		<li><a href="${pageContext.request.contextPath}/FindHospital/findHospital">근처 병원 찾기</a></li>
		<li><a href="${pageContext.request.contextPath}/Tip/getTipList">Tip 게시판</a></li>
	</ul>
	<center>
		<p>반려동물 정보</p>
		<form action="reserveInsert" method="post">
			<table>
				<tr>
					<td>펫 아이디 : <span>${reserve.pet_id }</span></td>
				</tr>
				<tr>	
					<td>펫 이름 : <span>${pet_info.name }</span></td>
				</tr>
				<tr>	
					<td>펫 종류 : <span>${pet_info.type }</span></td>
				</tr>
				<tr>
					<td>펫 나이 : <span>${pet_info.age }</span></td>
				</tr>
			</table>
			<hr>
			<p>예약 날짜 및 시간</p>
			<table>
				<tr>
					<td>날짜 : <span>${reserve.reserve_day }</span></td>
				</tr>
				<tr>
					<td>시간 : <span>${reserve.reserve_time }</span></td>
				</tr>
			</table>
			<hr>
			<p>예약 주소</p>
			<table>
				<tr>
					<td>주소 : <span>${reserve.reserve_add }</span></td>
				</tr>
			</table>
			<hr>
			<p>예약 서비스 및 금액</p>
			<table>
				<tr>
					<td width="100" align="center">서비스명</td>
					<td width="100" align="center">가격</td>
				</tr>
				<tr>
					<td align="center"><span>${serv.s_name }</span></td>
					<td align="center"><span>${serv.s_price }</span></td>
				</tr>
				<c:if test="${reserve.pick_add != null && reserve.pick_add != '' }">
						<tr><td align="center" colspan="2"><span id="pickadd">픽업 주소 : ${reserve.pick_add }</span></td></tr>
				</c:if>
			</table>
		</form>
		<hr>
		<button type="button" onclick="pay('${serv.s_name}', ${serv.s_price})">결제하기</button>
	</center>
</body>
</html>