<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포펫츠 펫트너즈</title>
</head>
<body>
		<table>
			<tr>
				<th>파트너 이름</th>
				<th>파트너 소개</th>
			</tr>
			<c:forEach items="${prList }" var="pl">
			<tr>
				<td><a href="partnerreviewlist/${pl.part_id }">${pl.part_name }</a></td>

				<td>${pl.self_infor }</td>

			</tr>
			</c:forEach>
		</table>
</body>
</html>