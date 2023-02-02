function show_pickup_add() {
	$("#set_pickup_add").show();
}

function getPickupAddPopUp(){
	var url = "http://localhost:8000/biz/Service/getPickupAdd";
	var name = "getPickupAdd"
	var option = "width = 800, height = 540, top = 100, left = 200, location = no";
	window.open(url, name, option);
}