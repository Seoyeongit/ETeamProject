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
	<form action="../insertanswer.do" method="post">
	<input type="hidden" name="sd_svcode" value="${surveyboard3.s_svcode }">

	<table>
		<c:forEach items="${surveyboard }" var="sur" >
			<tr>
				 <th>Q. ${sur.sd_title } </th> 
			</tr>			
		<c:forEach items="${surveyboard2 }" var="sur2">
		<c:choose>
			<c:when test="${sur.sd_order eq sur2.sc_order }">
				<c:choose>
					<c:when test="${sur.sd_type eq 'ju' }">
						<tr>
							 <td> 
								 <input type="hidden" name="${sur2.sc_order }" value="${sur2.sc_ascode }">
								 <input type="text" name="${sur2.sc_ascode }">
							 </td>
						</tr>
					</c:when>
					
					<c:when test="${sur.sd_type eq 'gaek' }">
						<tr>
							 <td>
							 	<input type="radio" name="${sur2.sc_order }" value="${sur2.sc_ascode }">${sur2.sc_answer }
							 	<input type="hidden" name="${sur2.sc_ascode }" value="${sur2.sc_answer }">
							 </td>
						</tr>
					</c:when>
					
					<c:when test="${sur.sd_type eq 'check' }">
						<tr>
							 <td>
							 	<input type="checkbox" name="${sur2.sc_order }" value="${sur2.sc_ascode }">${sur2.sc_answer } 
							 	<input type="hidden" name="${sur2.sc_ascode }" value="${sur2.sc_answer }">
							 </td>
						</tr>
					</c:when>
					
					<c:when test="${sur.sd_type eq 'time' }">
						<tr>
							<td>
							  	<input type="hidden" name="${sur2.sc_order }" value="${sur2.sc_ascode }">
								<input type="time" name="${sur2.sc_ascode }">
							</td>
						</tr>
					</c:when>
					
				    <c:when test="${sur.sd_type eq 'schedule' }">
						<tr>
							 <td>
							  	<input type="hidden" name="${sur2.sc_order }" value="${sur2.sc_ascode }">
								<input type="date" name="${sur2.sc_ascode }">
							</td>
						</tr>
					</c:when>
					
				</c:choose>
			</c:when>
		</c:choose>
		</c:forEach>
		</c:forEach>
	</table>
	
	<input type="submit" value="제출하기">
	</form>
</body>
</html>