<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script>
function sendPet(pet_id) {
	
	$("#pet_name", opener.document).val($("#"+pet_id+"_name").val());
	$("#pet_type", opener.document).val($("#"+pet_id+"_type").val());
	$("#pet_age", opener.document).val($("#"+pet_id+"_age").val());
	
	$(opener.location).attr("href", "javascript:show_pet();");
	self.close();
}
</script>
</head>
<body>
	<center>
		<c:forEach items="${getPetList }" var="pet">
			<table border="1" cellpadding="0" cellspacing="0" width="300">
				<tr>
					<td><input type="text" value="${ pet.id }" id="${pet.id }_id"></td>				
					<td><input type="text" value="${ pet.name }" id="${pet.id }_name"></td>
					<td><input type="text" value="${ pet.type }" id="${pet.id }_type"></td>
					<td><input type="text" value="${ pet.age }" id="${pet.id }_age"></td>
					<td>
						<c:choose>
							<c:when test="${fn:contains(pet.gender,'M') }" >수컷</c:when>
							<c:when test="${fn:contains(pet.gender,'F')}" >암컷</c:when>
						</c:choose>
					</td>
				</tr>
			</table>
			<input type="button" value="선택" Onclick="sendPet(${pet.id });">
			<br>
		</c:forEach>
	</center>
</body>
</html>