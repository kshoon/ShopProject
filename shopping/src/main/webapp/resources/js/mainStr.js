$(document).ready(function() {
	
	var Sname = $('#hShop_name').val();
	var Slat = $('#hShop_lat').val();
	var Slon = $('#hShop_lon').val();
	var Shome = $('#hShop_hom').val();
	var Saddr = $('#hShop_addr').val();
	var Sbh = $('#hShop_bh').val();
	var Sep = $('#hShop_explain').val();
	SecondMap(Sname, Slon, Slat, Shome, Saddr, Sbh, Sep);
});
var overlays=[];
function SecondMap(shop_name,shop_gps_longitude, shop_gps_latitude, shop_home, shop_addr, shop_bh, shop_explain) {
	// 좌표받기
	if (navigator.geolocation) {
		navigator.geolocation
				.getCurrentPosition(function(position) {
					fLat = position.coords.latitude;
					fLon = position.coords.longitude;
					var shop_explain2="";
					if(shop_explain.length>10){
						shop_explain2 += '<p>'+shop_explain.substring(10, shop_explain.length);
						shop_explain =  shop_explain.slice(0, 10);
						if(shop_explain2.length>15) {
							shop_explain2 = shop_explain2.substring(0, 13) +'...';
						}
    				}
					mapOp = {
						center : new daum.maps.LatLng(shop_gps_latitude, shop_gps_longitude), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					}
					var map = new daum.maps.Map(document.getElementById('mapS'),
							mapOp);
					var markerPosition = new daum.maps.LatLng(fLat, fLon);

					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
						position : markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);

					var position= {
							title : shop_name,
							latlng: new daum.maps.LatLng(shop_gps_latitude, shop_gps_longitude)
					}
					var imageSrc = "resources/images/market.png";
					var imageSize = new daum.maps.Size(30, 25); 
					var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
					 var marker = new daum.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: position.latlng, // 마커를 표시할 위치
					        title : position.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        image : markerImage // 마커 이미지 
					    });
					 var content = 
						'<div class="wrap">' + 
					    '	<div class="info">' + 
					    '		<div class="title">' + 	shop_name + '</div>' + 
					    '		<div class="body">' + 
					    '			<div class="img">' +
					    '				<img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="75" height="80">' +
					    '			</div>' + 
					    '			<div class="desc">' + 
					    '				<div class="ellipsis">'+shop_addr+'</div>' + 
					    '				<div><a href=https://'+shop_home+'>홈페이지</a>, 전화번호 : 010-1234-5678</div>' + //전화번호 수정바람
					    '				<div>영업시간 : '+shop_bh+'</div>'+		//영업시간 수정바람
					    '				<div>매장설명 : '+shop_explain+shop_explain2+'</div>'+
					    '            </div>' + 
					    '		</div>' + 
					    '	</div>' +    
					    '</div>';
					 var overlay = new daum.maps.CustomOverlay({
						    content: content,
						    map: map,
						    position: marker.getPosition()       
						});

						 overlay.setMap(map);
						 overlays.push(overlay);
				});

	} else {
		alert("해당 브라우저에선 현재위치를 찾을수가 없습니다.");
	}
}