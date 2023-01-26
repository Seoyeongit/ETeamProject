<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.js"></script>
</head>
<body>
	<ul>
		<li><a href="../choice.jsp">서비스 예약</a></li>
		<li><a href="../FindHospital/findHospital.jsp">근처 병원 찾기</a></li>
		<li><a href="../getTipList.do">Tip 게시판</a></li>
	</ul>
	<center>
		<p>예약이 완료 되었습니다.</p>
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
					<td align="center"><input type="text" value="${serv.s_name }" id="s_name"></td>
					<td align="center"><input type="text" value="${serv.s_price }" id="s_price"></td>
				</tr>
			</table>
	</center>
</body>
</html>