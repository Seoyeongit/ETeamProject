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
function sendPet(pet_id, pet_img) {
	
	$("#pet_id", opener.document).val($("#"+pet_id+"_id").val());
	$("#pet_img", opener.document).attr("src", "."+$("#"+pet_id+"_img").attr("src"));
	$("#pet_info_title", opener.document).append("<span>"+ $("#"+pet_id+"_name").val() +"</span>")
	$("#pet_info", opener.document).append("<span>종류 : "+ $("#"+pet_id+"_type").val() +"</span><br>")
	$("#pet_info", opener.document).append("<span>나이 : "+ $("#"+pet_id+"_age").val() +"</span><br>")
	
	$(opener.location).attr("href", "javascript:show_pet();");
	self.close();
}
</script>
</head>
<body>
	<c:forEach items="${getPetList }" var="pet">
		<input type="hidden" value="${ pet.id }" id="${pet.id }_id">
		<input type="hidden" value="${ pet.name }" id="${pet.id }_name">
		<input type="hidden" value="${ pet.type }" id="${pet.id }_type">
		<input type="hidden" value="${ pet.age }" id="${pet.id }_age">
		<!-- Card with an image on left -->
		<div class="col-12">
			<div class="card mb-3">
				<div class="row g-0">
					<div class="col-4">
						<img style="width:100%; height:200px;" src="./myInfo/display?fileName=${pet.img }" id="${pet.id }_img">
					</div>
					<div class="col-8 row">
						<div class="card-body align-self-center">
							<h5 class="card-title"><span>${ pet.name }</span></h5>
							<p class="card-text">
								<span>${ pet.type }</span><br>
								<span>${ pet.age }</span>
							</p>
							<input type="button" style="float:right;" value="선택" Onclick="sendPet(${pet.id });">
						</div>
					</div>
				</div>
			</div><!-- End Card with an image on left -->
		</div>
	</c:forEach>
</body>
</html>