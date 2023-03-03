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
<link href="${pageContext.request.contextPath}/resources/css/Tip/tip.css" rel="stylesheet" />
<script>
function sendPart(part_id) {
	
	$("#part_id", opener.document).val($("#"+part_id+"_id").val());
	$("#part_img", opener.document).attr("src", "."+$("#"+part_id+"_img").attr("src"));
	$("#part_info_title", opener.document).append("<span>"+ $("#"+part_id+"_name").val() +"</span><br>")
	
	$(opener.location).attr("href", "javascript:show_partner();");
	self.close();
}
</script>
</head>
<body>
	<c:forEach items="${getPartnerList }" var="partner">
		<input type="hidden" value="${ partner.part_id }" id="${partner.part_id }_id" readonly>
		<input type="hidden" value="${ partner.part_name }" id="${partner.part_id }_name" readonly>
		<!-- Card with an image on left -->
		<div class="col-12">
			<div class="card mb-3">
				<div class="row g-0">
					<div class="col-4">
						<img style="width:100%; height:200px;" src="./partner/display?fileName=${partner.img }" id="${partner.part_id }_img">
					</div>
					<div class="col-8 row">
						<div class="card-body align-self-center">
							<h5 class="card-title"><span>${ partner.part_name }</span></h5>
							<p class="card-text">
								<span>${ partner.part_id }</span>
							</p>
							<input type="button" style="float:right;" value="선택" Onclick="sendPart('${partner.part_id}');">
						</div>
					</div>
				</div>
			</div><!-- End Card with an image on left -->
		</div>
	</c:forEach>
</body>
</html>