<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>지도 생성하기</title>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d7fa1315630f585572f6d7cd683066d&libraries=services"></script>
   <script>
$(document).ready(function(){
	$("#btn").on("click", function(){
		getShopMap();
	});
	$("#btn2").on("click", function(){
		mm();
	});

});
</script> 
</head>
<body>
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:100%;height:350px;"></div>
<button type="button" class="btn" id="btn">좌표찍기</button>
<button type="button" class="btn" id="btn2">좌표찍기2</button>

<script>
var map; // 맵을 담을 변수
var mapContainer = document.getElementById('map'); // 지도를 표시할 div
var mapOp // 맵 옵션
var geocoder = new daum.maps.services.Geocoder(); //// 주소-좌표 변환 객체를 생성합니다

var adr = new Array();
var adr2 = new Array();
adr[0] = "대구광역시 중구 태평로 225번지";
adr[1] = "대구광역시 중구 태평로 200번지";
adr[2] = "대구광역시 중구 태평로 230번지";
adr[3] = "대구광역시 중구 태평로 22-3번지";
var adname = new Array();
adname[0] = "대백";
adname[1] = "하나로마트";
adname[2] = "가가마트";
adname[3] = "나나마트";

// 초기 맵설정
function firstMap() {
	//좌표받기
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        alert("Geolocation is not supported by this browser.");
    }
}
/* 주소 */
function showPosition(position) {
   var myLat = position.coords.latitude; 
   var myLon =position.coords.longitude; 
   mapOption(myLat, myLon);
}
/* 맵 옵션 */
function mapOption(lat, lon){
	mapOp = {
			center: new daum.maps.LatLng(lat, lon), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	}
	getMap(mapContainer, mapOp);
}


// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
function getMap(mapCont, mapOpt) {
	map = new daum.maps.Map(mapCont, mapOpt);
}
firstMap();

function getMark() {
	alert("a: "+adr2[1]+"b:"+adname[1]);
	// 결과값으로 받은 위치를 마커로 표시합니다
    /* var marker = new daum.maps.Marker({
        map: map,
        position: coords
    });
    alert(adname[i]);
	var asd = adname[i] + "ㅁㄴㅇ";
    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new daum.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+asd+'</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords); */
	

}
function mm() {
	alert(adr2[0]);
}
function getShopMap() {
	var pos;
	for(var i=0; i < adr.length; i++) {		
		geocoder.addressSearch(adr[i], function(result, status) {
			if (status === daum.maps.services.Status.OK) {
			
				var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				var marker = new daum.maps.Marker({
	          	  map: map,
	           	 position: coords
	        	});
				 var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+adname+'</div>'
		     	  });
				 infowindow.open(map, marker);
				 map.setCenter(coords);	
			}
		})
		
		;
		
			
	}
	
	/* for(var i=0; i < adr.length; i++) {
	geocoder.addressSearch(adr[i], function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });
	        alert(adname[i]);
			var asd = adname[i] + "ㅁㄴㅇ";
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+asd+'</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	}); 
	}*/
}
</script>
</body>
</html>