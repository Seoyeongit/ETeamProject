function getPetListPopUp(){
	var url = "getPetList.do";
	var name = "getPetList"
	var option = "width = 500, height = 500, top = 100, left = 200, location = no";
	window.open(url, name, option);
}

function sendPet(pet_id) {
	
	$("#pet_name", opener.document).val($("#"+pet_id+"_name").val());
	$("#pet_type", opener.document).val($("#"+pet_id+"_type").val());
	$("#pet_age", opener.document).val($("#"+pet_id+"_age").val());
	
	$(opener.location).attr("href", "javascript:show_pet();");
	self.close();
}

function getPartnerListPopUp() {
	var url = "getPartnerList.do";
	var name = "getPartnerList"
	var option = "width = 500, height = 500, top = 100, left = 200, location = no";
	window.open(url, name, option);
}

function sendPart(part_id) {
	
	$("#part_id", opener.document).val($("#"+part_id+"_id").val());
	$("#part_name", opener.document).val($("#"+part_id+"_name").val());
	
	$(opener.location).attr("href", "javascript:show_partner();");
	self.close();
}