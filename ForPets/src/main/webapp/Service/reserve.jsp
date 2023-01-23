<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<td>펫 아이디 : <span>${reserve.pet_id }</span></td>
			</tr>
			<tr>	
				<td>펫 이름 : <span>${pet_info.name }</span></td>
			</tr>
			<tr>	
				<td>펫 종류 : <span>${pet_info.type }</span></td>
			</tr>
			<tr>
				<td>펫 나이 : <span>${pet_info.age }</span>
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
				<td>서비스명</td>
				<td>가격</td>
			</tr>
			<tr>
				<td>${serv.s_name }</td>
				<td>${serv.s_price }</td>
			</tr>
		</table>
		<p>결제</p>
	</center>
</body>
</html>