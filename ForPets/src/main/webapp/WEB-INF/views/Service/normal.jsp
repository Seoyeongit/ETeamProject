<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/juso.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pet_partner.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script>
$(document).ready(function(){
	$("#set_pet").hide();
	$("#set_partner").hide();
});	
</script>
</head>
<body>
	<ul>
		<li><a href="${pageContext.request.contextPath}/">홈</a></li>
		<li><a href="${pageContext.request.contextPath}/Service/choice">서비스 예약</a></li>
		<li><a href="${pageContext.request.contextPath}/FindHospital/findHospital">근처 병원 찾기</a></li>
		<li><a href="${pageContext.request.contextPath}/Tip/getTipList">Tip 게시판</a></li>
	</ul>
	<center>
		<form action="getService" method="post">
			<input type="hidden" value="${member.user_id }" name="user_id">
			<input type="hidden" id="pet_id" name="pet_id">
			<input type="hidden" value="1" id="s_num" name="s_num">
			<p>반려동물 정보</p>
			<table id="set_pet">
				<tr>
					<td>이름 : <input type="text" id="pet_name" name="pet_name" readonly></td>
				</tr>
				<tr>
					<td>종류 : <input type="text" id="pet_type" name="pet_type" readonly></td>
				</tr>
				<tr>
					<td>나이 : <input type="text" id="pet_age" name="pet_age" readonly></td>
				</tr>
			</table>
			<br>
			<input type="button" value="선택" onclick="getPetListPopUp('${member.user_id}')">
			<hr>
			<p>추가 서비스</p>
			<label><input type="checkbox" name="s_num" value="21">샤워</label>
			<label><input type="checkbox" name="s_num" value="22">훈련</label>
			<hr>
			<p>요청사항</p>
			<input type="text" name="reserve_request" size="45">
			<hr>
			<p>날짜 및 시간</p>
			<label for="date"><input type="date" id="date" name="reserve_day"></label>
			<select name="reserve_start">
			<%
				for(int i=12;i<=20;i++) {
			%>
				<option value="<%=i%>:00"><%=i%>:00</option>
			<%
				}
			%>
			</select>부터
			<select name="reserve_end">
			<%
				for(int i=12;i<=20;i++) {
			%>
				<option value="<%=i%>:00"><%=i%>:00</option>
			<%
				}
			%>
			</select>까지
			<br>
			<p>주소</p>
			<table>
				<tr>
					<td colspan="2"><input type="text" id="sample6_address" name="address" placeholder="주소" readonly size="45"></td>
				</tr>
				<tr>
					<td><input type="text" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소"></td>
					<td><input type="text" id="sample6_extraAddress" placeholder="참고항목" readonly></td>
				</tr>
			</table>
			<br>
			<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기">
			<hr>
			<p>파트너 정보</p>
			<table id="set_partner">
				<tr>
					<td>파트너 아이디 : <input type="text" id="part_id" name="part_id" readonly></td>
				</tr>
				<tr>
					<td>파트너 이름 : <input type="text" id="part_name" readonly></td>
				</tr>
			</table>
			<br>
			<input type="button" value="파트너선택" onclick="getPartnerListPopUp()">
			<hr>
			<input type="button" value="다음" onclick="reserveMake()">
		</form>
	</center>
</body>
</html>