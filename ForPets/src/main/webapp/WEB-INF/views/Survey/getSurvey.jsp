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

	<h1>${surveyboard3.s_title }</h1>
	
	<table>
		<c:forEach items="${surveyboard }" var="sur">
			<tr>
				 <th>Q. ${sur.sd_title } </th> 
			</tr>			
		<c:forEach items="${surveyboard2 }" var="sur2">
		<c:choose>
			<c:when test="${sur.sd_order eq sur2.sc_order }">
				<c:choose>
					<c:when test="${sur.sd_type eq 'ju' }">
						<tr>
							 <td>A. <input type="text" name=""></td>
						</tr>
					</c:when>
					<c:when test="${sur.sd_type eq 'gaek' }">
						<tr>
							 <td><input type="radio" name="">${sur2.sc_answer } </td>
						</tr>
					</c:when>
					<c:when test="${sur.sd_type eq 'check' }">
						<tr>
							 <td><input type="checkbox" name="">${sur2.sc_answer } </td>
						</tr>
					</c:when>
					<c:when test="${sur.sd_type eq 'time' }">
						<tr>
							 <td><input type="time" name=""></td>
						</tr>
					</c:when>
				    <c:when test="${sur.sd_type eq 'schedule' }">
						<tr>
							 <td><input type="date" name=""></td>
						</tr>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
		</c:forEach>
		</c:forEach>
	</table>
</body>
</html>