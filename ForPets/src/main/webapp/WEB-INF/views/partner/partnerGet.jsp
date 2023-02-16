<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너 정보 수정</title>
</head>
<body>
	<table>
		<tr>
			<td>아이디</td>
			<td>${ partners.part_id }</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw" value="${ partners.part_pw }"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${ partners.part_name }</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>${ partners.part_nick }</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${ partners.part_add }</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${ partners.gender }</td>
		</tr>
		<tr>
			<td>핸드폰 번호</td>
			<td>${ partners.part_phnumber }</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${ partners.birth }</td>
		</tr>
		<tr>
			<td>자기소개</td>
			<td><textarea name="self" cols="40" rows="10">${ partners.self_infor }</textarea></td>
		</tr>
		<tr>
			<td><input type="submit" onclick="location.href='modify'" value="정보 수정 하기"/></td>
			<td><input type="button" onclick="location.href='partner';" value="뒤로가기"/></td>
		</tr>
	</table>
</body>
</html>