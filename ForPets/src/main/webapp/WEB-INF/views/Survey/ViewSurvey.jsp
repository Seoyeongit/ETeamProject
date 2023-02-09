<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Survey</title>
</head>
<body>

	<h1>_______님의 설문지 입니다.</h1>
	
	<table>
		<c:forEach items=${surveyboard } var="sur">
			<tr>
			 	 <th>Q1. ${sur.sd_title} </th>
			</tr>
		</c:forEach>
			<tr>
				 <td>///</td>
			</tr>
		
	</table>
</body>
</html>