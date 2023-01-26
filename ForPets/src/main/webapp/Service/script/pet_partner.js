function show_pet() {
	$("#set_pet").show();
}

function show_partner() {
	$("#set_partner").show();
}
function getPetListPopUp(){
	var url = "http://localhost:8000/biz/getPetList.do";
	var name = "getPetList"
	var option = "width = 500, height = 500, top = 100, left = 200, location = no";
	window.open(url, name, option);
}
function getPartnerListPopUp() {
	var url = "http://localhost:8000/biz/getPartnerList.do";
	var name = "getPartnerList"
	var option = "width = 500, height = 500, top = 100, left = 200, location = no";
	window.open(url, name, option);
}
function reserveMake() {
	call_info();
}
function call_info() {
	$.ajax({
			type : "POST",
			url : "http://localhost:8000/biz/getPet.do",
			data : {pet_id : $("#pet_id").val()},
			success : function(data){
				
			},
			error : function(data){
				alert("error");
			}
	});
	$.ajax({
			type : "POST",
			url : "http://localhost:8000/biz/getService.do",
			data : {s_num : $("#s_num").val()},
			success : function(data){
				$("form").submit();
			},
			error : function(data){
				alert("error");
			}
	});
}