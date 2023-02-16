<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<title>View Survey</title>
</head>
<body>

	<h1> ${user_id } 님이 답변한 설문입니다. </h1>

	<h3>${answerboard3.s_title }</h3>
 	<input type="hidden" name="sd_svcode" value="${answerboard3.s_svcode }">

	<table>
		<c:forEach items="${answerboard }" var="ans" >
			<tr>
				 <th>Q. ${ans.sd_title } </th> 
			</tr>			
			<c:forEach items="${answerboard2 }" var="ans2">
			
				<c:choose>
					<c:when test="${ans.sd_order eq ans2.sc_order }">
						<c:choose>
							<c:when test="${ans.sd_type eq 'ju' }">
								<tr>
									<c:forEach items="${answerboard4 }" var="ans4">
										<c:choose>
											<c:when test="${ ans2.sc_order eq ans4.sa_order}">
												 <td>
													 <input type="text" name="${ans2.sc_ascode }" value="${ans4.sa_content }" readonly>
												 </td>
									 		</c:when>
									 	</c:choose>	
									 </c:forEach>
								</tr>
							</c:when>	
							
					<c:when test="${ans.sd_type eq 'gaek' }">
						<tr>
							<c:forEach items="${answerboard4 }" var="ans4">
								<c:choose>
									<c:when test="${ ans2.sc_order eq ans4.sa_order and ans2.sc_ascode eq ans4.sa_ascode}">
										<td>
							 				<input type="radio" name="${ans2.sc_order }" value="${ans2.sc_ascode }" checked onclick="return(false);">${ans4.sa_content }
										 </td>
							 		</c:when>
							 		<c:when  test="${ ans2.sc_order eq ans4.sa_order }">
							 			<td>
							 				<input type="radio" name="${ans2.sc_order }" value="${ans2.sc_ascode }" onclick="return(false);">${ans2.sc_answer }
										 </td>
							 		</c:when>
							 	</c:choose>	
							 </c:forEach>							 
						</tr>
					</c:when>
					
					<c:when test="${ans.sd_type eq 'check' }">
						<tr>
						 	<td>
							 	<input type="checkbox" name="${ans2.sc_order }" id="${ans2.sc_ascode }" onclick="return(false);">${ans2.sc_answer }
							</td>
						<c:forEach items="${answerboard4 }" var="ans4">
								<c:choose>
									<c:when test="${ ans2.sc_order eq ans4.sa_order and ans2.sc_ascode eq ans4.sa_ascode}">
										<script>
											// $('input[value=${ans2.sc_ascode }]').is(":checked") == true;
											 $("input#${ans2.sc_ascode}").prop("checked", true);
										</script>
							 		</c:when>
							 	</c:choose>	
							</c:forEach>
						</tr>
					</c:when>
					
					<c:when test="${ans.sd_type eq 'time' }">
						<tr>
							<c:forEach items="${answerboard4 }" var="ans4">
								<c:choose>
									<c:when test="${ ans2.sc_order eq ans4.sa_order}">
										<td>
											<input type="time" name="${ans2.sc_ascode }" value="${ans4.sa_content }" readonly>
										</td>
								 	</c:when>
								</c:choose>	
							</c:forEach>
						</tr>
					</c:when>
					
				    <c:when test="${ans.sd_type eq 'schedule' }">
						<tr>
							 <c:forEach items="${answerboard4 }" var="ans4">
								<c:choose>
									<c:when test="${ ans2.sc_order eq ans4.sa_order}">
										<td>
											<input type="date" name="${ans2.sc_ascode }" value="${ans4.sa_content }" readonly>
										</td>
								 	</c:when>
								</c:choose>	
							</c:forEach>
						</tr>
					</c:when>
					
				</c:choose>
			</c:when>
		</c:choose>
		</c:forEach>
		</c:forEach>

	</table>
	
	<a href="../deleteanswer.do/${sd_svcode }&${user_id}"><input type="button" value="삭제하기"></a>
	
</body>
</html>