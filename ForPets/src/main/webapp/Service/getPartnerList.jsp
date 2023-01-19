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
function sendPart(part_id) {
	
	$("#part_id", opener.document).val($("#"+part_id+"_id").val());
	$("#part_name", opener.document).val($("#"+part_id+"_name").val());
	
	$(opener.location).attr("href", "javascript:show_partner();");
	self.close();
}
</script>
</head>
<body>
	<center>
		<c:forEach items="${getPartnerList }" var="partner">
			<table border="1" cellpadding="0" cellspacing="0" width="300">
				<tr>
					<td><input type="text" value="${ partner.part_id }" id="${partner.part_id }_id" readonly></td>				
					<td><input type="text" value="${ partner.part_name }" id="${partner.part_id }_name" readonly></td>
					<td>
						<c:choose>
							<c:when test="${fn:contains(partner.gender,'M')}" >남자</c:when>
							<c:when test="${fn:contains(partner.gender,'F')}" >여자</c:when>
						</c:choose>
					</td>
				</tr>
			</table>
			<input type="button" value="선택" Onclick="sendPart('${partner.part_id}');">
			<br>
		</c:forEach>
	</center>
</body>
</html>