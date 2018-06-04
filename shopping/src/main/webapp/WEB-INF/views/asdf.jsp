	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<!DOCTYPE html>
	<html>
	<head>
	<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>



	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d7fa1315630f585572f6d7cd683066d&libraries=services"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script>
	
	var asdf;
	$(document).ready(function(){	
		$(".shopSearchClass").click(function(){
			var shopS = this.value;
		    $.ajax({
		    	   url:'insertwish',
			        dataType:'json',
			        async:false,
			        type:'get',
			        data:{'shopsearch':shopS},
			        success:function(data){
			        	Search(data.shop_name,data.shop_addr,data.shop_homepage);
			        }
		    });
		});
		
	
		
	});
	
	
	var map;
	var mylat;
	var mylon;
	var marker=[];
	getLocation();

	function getLocation() {
		//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {
	
				    mylat = position.coords.latitude // 위도
				    mylon = position.coords.longitude; // 경도
	
				locPosition = new daum.maps.LatLng(mylat, mylon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	
				// 마커와 인포윈도우를 표시합니다
				
				aa(locPosition, message,mylat,mylon);
				
			});
	
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	
			var locPosition = new daum.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'
			
		}		
		
		
		
		function aa(locPosition, message,mylat,mylon){
			$("#map1").ready(function() {
				//검색창에 엔터 입력시 좌표 검색
	
				//변수 설정 및 최초 위치 설정
				
				var marker = '';
	    				
				//지도 초기화
				map = new daum.maps.Map(document.getElementById('map1'), {
					center : new daum.maps.LatLng(mylat,mylon),
					level :1,
					mapTypeId : daum.maps.MapTypeId.ROADMAP
				});
		
				var temp = new daum.maps.LatLng(mylat,mylon);
				
				
				
				var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
			    imageSize = new daum.maps.Size(50,50), // 마커이미지의 크기입니다
			    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정
			    
			 // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
			        markerPosition = new daum.maps.LatLng(mylat,mylon); // 마커가 표시될 위치입니다
				
			      map.panTo(temp);   
				//마커 찍어주기
				marker = new daum.maps.Marker({	
					position : markerPosition,
					image: markerImage
				});
	
				marker.setMap(map);
				
			});
			
		}		
	}	
	
	
	var markers=[];
	var infowindow;
	var overlay;
	var overlays=[];
	function ohmy(whido,gyungdo,splshop_name,splshop_addr,splshop_homepage){
		alert(splshop_homepage);
	
		
		var temp=new daum.maps.LatLng(whido,gyungdo);
		
		 function deg2rad(deg) {
		        return deg * (Math.PI/180)
		    }
		
		  var R = 6371; // Radius of the earth in km
		    var dLat = deg2rad(whido-mylat);  // deg2rad below
		    var dLon = deg2rad(gyungdo-mylon);
		    var a = Math.sin(dLat/2)*Math.sin(dLat/2)+Math.cos(deg2rad(mylat))*Math.cos(deg2rad(whido))*Math.sin(dLon/2)*Math.sin(dLon/2);
		    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		    var d = R * c; // Distance in km
		
		
		if(15.0>d){	
		
			
		marker = new daum.maps.Marker({
			position : temp
		});
			
		
		
		marker.setMap(map);
		
		markers.push(marker);
		
		
		
		var content = '<div class="wrap">' + 
        '    <div class="info">' + 
        '        <div class="title">' + 
                    splshop_name + 
        '        </div>' + 
        '        <div class="body">' + 
        '            <div class="img">' +
        '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
        '           </div>' + 
        '            <div class="desc">' + 
        '                <div class="ellipsis">'+splshop_addr+'</div>' + 
        '   <div><a href=http://'+splshop_homepage+'>홈페이지</a></div>' +
        '            </div>' + 
        '        </div>' + 
        '    </div>' +    
        '</div>';
	     
			
//         '   <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
        
//         '   <div><a href='+splshop_homepage+'>홈페이지</a></div>' + 
        
		 overlay = new daum.maps.CustomOverlay({
		    content: content,
		    map: map,
		    position: marker.getPosition()       
		});

		 overlay.setMap(map);
		 overlays.push(overlay);
		}
		

		return d;
				
		}

	function setOverlays(){			
		for(var i=0; i<overlays.length;i++){
			overlays[i].setMap(null);
		}
	
	}

	function setMarkers(map){			
		for(var i=0; i<markers.length;i++){
			markers[i].setMap(map);
// 			infowindow[i].close();
// 			overlay.setMap(null);  
		}
	
	}
	
	function hideMarkers(){	
		setOverlays();
		setMarkers(null);	   	
	}
	
	
	function Search(shop_name,shop_addr,shop_homepage){	
		var whido=$("#widoid").val();
		var gyungdo=$("#gyungdoid").val();	
		var arrwhido = whido.split(",");
		var arrgyungdo=gyungdo.split(",");	
		var jsonshop_name=JSON.stringify(shop_name); // json 을 변환
		var jsonshop_addr=JSON.stringify(shop_addr); // json 을 변환
		var jsonshop_homepage=JSON.stringify(shop_homepage); // json 을 변환
		



 	 	var regExp = /[\{\}\[\]\/?;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi 
 	 	
 	 	var shop_name_re =jsonshop_name.replace(regExp,"");  //마트이름(replace)
		var splshop_name=shop_name_re.split(","); //마트이름 (spl_name split)
		
		
		var shop_addr_re=jsonshop_addr.replace(regExp,""); // 마트주소(replace)
		var splshop_addr=shop_addr_re.split(",");
		
	
		
		var shop_homepage_re=jsonshop_homepage.replace(regExp,""); // 마트주소(replace)
		var splshop_homepage=shop_homepage_re.split(",");
		
		
		
		
		
		
	 	 for (var i = 0; i < splshop_name.length; i++) {
			ohmy(arrwhido[i],arrgyungdo[i],splshop_name[i],splshop_addr[i],splshop_homepage[i]);
		}
	}
	function relayout() {  
	    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
	    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
	    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
	    map.relayout();
	}
	</script>
	
	</head>
	<body>

		<!-- The Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
	
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">지도입니다.</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
	
					<!-- Modal body -->
					<div class="modal-body">
						<div id="map" style="width: 100%; height: 600px"
							onmouseover="relayout()"></div>
							
					</div>
	
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="hideMarkers()">Close</button>
					</div>
				</div>
			</div>
		</div>
	
	
		<input type="hidden" id="widoid" value="${wido}">
		<input type="hidden" id="gyungdoid" value="${gyungdo}">
	
		<div>
			<label>좌표 : </label> <label id="latlng"></label>
		</div>
	
	
		<input type="text" name="shopsearch" id="shopsearch">
		<button type="button" id="insertbutton">등록</button>
	
		<!-- Button to Open the Modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#myModal">지도</button>
	
		<table>
			<c:forEach items="${list}" var="as">
				<tr>
					<td>${as.product_no }</td>
					<td>${as.product_name}</td>
					<td>${as.wishList_date}</td>
					<td><button type="button" class="shopSearchClass" 
							data-toggle="modal" data-target="#myModal"
							value="${as.product_name}" >지도</button></td>
				</tr>
			</c:forEach>			
		</table>		
	</body>
	</html>