/**
 * 
 */
$(document).ready(function(){
    //registerform1
	$("#gugu").on("click", function(){
		self.location = "registerform2?"+$("#gugu").val();
	});
	$("#papa").on("click", function(){
		self.location = "registerform2?"+$("#papa").val();
	});
	
	//registerform2
	$("#cancle").on("click", function(){
		
		history.back(); //뒤로가기
	});
	
	$("#m").on("click", function(){
		$("#m").addClass("BtnGenderColor");
		$("#w").removeClass("BtnGenderColor");
	});
	$("#w").on("click", function(){
		$("#w").addClass("BtnGenderColor");
		$("#m").removeClass("BtnGenderColor");
	});

	
});

/*//초기 맵설정
function firstMap() {
	//좌표받기
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        alert("Geolocation is not supported by this browser.");
    }
}
 주소 
function showPosition(position) {
   var myLat = position.coords.latitude; 
   var myLon =position.coords.longitude; 
   mapOption(myLat, myLon);
}
 맵 옵션 
function mapOption(lat, lon){
	var mapOp = {
			center: new daum.maps.LatLng(lat, lon), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	}
	getMap($('#regMap'), mapOp);
}


// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
function getMap(mapCont, mapOpt) {
	var map = new daum.maps.Map(mapCont, mapOpt);
}
firstMap();*/
