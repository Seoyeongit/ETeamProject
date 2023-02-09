function show_pickup_add() {
	$("#set_pickup_add").show();
}

function getPickupAddPopUp(add){
	var url = "http://localhost:8000/biz/Service/getPickupAdd?add="+add;
	var name = "getPickupAdd"
	var option = "location = no, width = 800, height = 540, top = 100, left = 200";
	window.open(url, name, option);
}