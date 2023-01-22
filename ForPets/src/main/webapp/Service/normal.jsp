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
<script src="./script/juso.js" type="text/javascript"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script>
$(document).ready(function(){
	$("#set_pet").hide();
	$("#set_partner").hide();
});	

function show_pet() {
	$("#set_pet").show();
}

function show_partner() {
	$("#set_partner").show();
}
function getPetListPopUp(){
	var url = "http://localhost:8000/biz/getPetList.do";
	var name = "getPetList"
	var option = "width = 500, height = 500, top = 100, left = 200, location = no";
	window.open(url, name, option);
}
function getPartnerListPopUp() {
	var url = "http://localhost:8000/biz/getPartnerList.do";
	var name = "getPartnerList"
	var option = "width = 500, height = 500, top = 100, left = 200, location = no";
	window.open(url, name, option);
}
function reserveMake() {
	call_pet_info();
	$("form").submit();
}
function call_pet_info() {
	var petid = $("#pet_id").val();
	$.post("http://localhost:8000/biz/getPet.do", {pet_id : petid});
}
</script>
</head>
<body>
	<ul>
		<li><a href="choice.jsp">서비스 예약</a></li>
		<li><a href="../FindHospital/findHospital.jsp">근처 병원 찾기</a></li>
		<li><a href="../getTipList.do">Tip 게시판</a></li>
	</ul>
	<center>
		<form action="http://localhost:8000/biz/reserve.do" method="post">
			<input type="hidden" value="abc123" name="user_id">
			<input type="hidden" id="pet_id" name="pet_id">
			<input type="hidden" value="1" name="s_num">
			<p>반려동물 정보</p>
			<table id="set_pet">
				<tr>
					<td>이름 : <input type="text" id="pet_name" name="pet_name"></td>
				</tr>
				<tr>
					<td>종류 : <input type="text" id="pet_type" name="pet_type"></td>
				</tr>
				<tr>
					<td>나이 : <input type="text" id="pet_age" name="pet_age"></td>
				</tr>
			</table>
			<br>
			<input type="button" value="선택" onclick="getPetListPopUp()">
			<hr>
			<p>추가 서비스</p>
			<p>산책 / 실내 놀이 등 추가 예정</p>
			<hr>
			<p>날짜 및 시간</p>
			<label for="date"><input type="date" id="date" name="reserve_day"></label>
			<label for="time-select">
				<select id = "time-select" name="reserve_time">
					<option value="12:00">12:00</option>
					<option value="13:00">13:00</option>
					<option value="14:00">14:00</option>
				</select>
			</label>
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
					<td>파트너 아이디 : <input type="text" id="part_id" name="part_id"></td>
				</tr>
				<tr>
					<td>파트너 이름 : <input type="text" id="part_name"></td>
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