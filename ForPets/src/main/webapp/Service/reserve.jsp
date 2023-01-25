<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./script/kakaopay.js" type="text/javascript"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.js"></script>
</head>
<body>
	<ul>
		<li><a href="../choice.jsp">서비스 예약</a></li>
		<li><a href="../FindHospital/findHospital.jsp">근처 병원 찾기</a></li>
		<li><a href="../getTipList.do">Tip 게시판</a></li>
	</ul>
	<center>
		<p>반려동물 정보</p>
		<table>
			<tr>
				<td>펫 아이디 : <input type="text" value="${reserve.pet_id }"></td>
			</tr>
			<tr>	
				<td>펫 이름 : <input type="text" value="${pet_info.name }"></td>
			</tr>
			<tr>	
				<td>펫 종류 : <input type="text" value="${pet_info.type }"></td>
			</tr>
			<tr>
				<td>펫 나이 : <input type="text" value="${pet_info.age }"></td>
			</tr>
		</table>
		<hr>
		<p>예약 날짜 및 시간</p>
		<table>
			<tr>
				<td>날짜 : <input type="text" value="${reserve.reserve_day }"></td>
			</tr>
			<tr>
				<td>시간 : <input type="text" value="${reserve.reserve_time }"></td>
			</tr>
		</table>
		<hr>
		<p>예약 주소</p>
		<table>
			<tr>
				<td>주소 : <input type="text" value="${reserve.reserve_add }"></td>
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
				<td align="center">${serv.s_name }</td>
				<td align="center">${serv.s_price }</td>
			</tr>
		</table>
		<hr>
		<button type="button" onclick="pay()">결제하기</button>
	</center>
</body>
</html>