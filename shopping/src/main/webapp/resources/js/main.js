var myLat;
var myLot;
$(document).ready(function(){
	firstGps();
	firstMap();
	setInterval(firstGps, 10*1000); //1000당 1초

	$("#mainInputSearch").focus(function(){
//		$(".dropdown-menu").css("display","block");
//		$(".dropdown-menu").append("<tr class='resmenu'><td>최근등록상품</td></tr>");
		
	});
	$("#mainInputSearch").blur(function(){
		delay(function(){
			$(".dropdown-menu").css("display","none");	
			$(".resmenu").remove();
			$("#mainInputSearch").val("");
		}, 100);
		
	});
	$("#mainInputSearch").keyup(function(){
		var keyval = $("#mainInputSearch").val();
		$(".dropdown-menu").css("display","block");
		if($("#mainInputSearch").val()==""){
			$(".dropdown-menu").css("display","none");
			$(".resmenu").remove();
//			$(".dropdown-menu").append("<tr class='resmenu'><td>최근등록상품</td></tr>");
		}
		if($("#mainInputSearch").val()){
			var query = {keyword:$("#mainInputSearch").val()};
			delay(function(){
				$(".resmenu").remove();
				$.ajax({
					type:"POST",
					url:"mainSearch",
					data:query,
					success:function(data){		
						for(var i=0; i <data.length; i++){
							$(".dropdown-menu").append("<tr class='resmenu' id='tr["+data[i].wishlist_no+"]' style='width: 250px'>" 
									+"<td width=77%>"+data[i].product_name+"</td>"
									+"<td><button type='button' class='btn ins' value='"+data[i].product_no+"'>추가</button></td>"
//									+"<td><button type='button' class='btn mak' value='"+data[i].product_no+"'><span class='glyphicon glyphicon-home'></span>5</button></td>" 
//									+"<td><button type='button' class='btn str' value='"+data[i].product_no+"'>500m</button></td>"
									+"</tr>");
						}			
					}
				});
			}, 100);
			
		}
	});

	$(document).on("click", ".ins", function(){
		var mem_no = $('#mem_no').val();
		var prod_no = this.value;
//		alert(mem_no);
//		$member = $(this).attr("member");
//		alert($member.member_no);
		/*
		var query = {prod_no:this.value, member_no : $('#mem_id').val()};
		$.ajax({
			type:"POST",
			url:"mainInsertwish",
			data:query,
			success:function(data) {
//				window.location.href = "join";
				//새로고침
			}
		});
		*/
		
		self.location = "mainInsertwish?prod_no="+prod_no+"&member_no="+mem_no;
	});
	
	$("#mainSearch").on("click", function(){
		var keyval =  encodeURIComponent($("#mainInputSearch").val());
		var mem_no = $('#mem_no').val();
		var id='seller';
		if(keyval){
			self.location="mainSearchBtn?member_no="+mem_no+"&keyval="+keyval;
		}
		// 클릭시 알림보내기
		 
//		    keyval += '를 원하는 손님이 나타났습니다.'
		    $.ajax({
		    	type:"GET",
		    	url:"pushToBuyer?searchText="+keyval+"&member_id="+id,
				data:{},
				success:function(data){	}
		    });
	});
	var cnt = false;	
	$(document).on("click", ".mak", function(){
		console.log(cnt);
		if(cnt){
		$('#map1').remove();
		$('.modal-body').append('<div id="map1" style="width: 100%; height: 400px"></div>');
		}
		cnt = true;
		if($(this).html()==0) {
			alert("근처에 매장이 없습니다.");
			
		}else{
			
			makMap(this.value);
			/*delay(function(){
				console.log("딜레이");
				relayout();
			}, 100);*/

//			relayout();
			
		}
		
//		var prod_no = this.value;
//		alert(myLat);
//		self.location = "mak?prod_no="+prod_no+"&lat1="+mylat+"&lon1="+mylon;
	});
	
	$(document).on("click", ".str", function(){
		
		var mem_no = $('#mem_no').val();
		self.location="strMap?shop_no="+this.value+"&member_no="+mem_no+"&prod_no="+$(this).attr('id');
	/*	
		if($(this).html().equals("0m")) {
			alert("근처에 매장이 없습니다.");
			
		}
		*/
	});
	
	$(document).on("click", ".modLi", function(){
		alert(this.value);
	});
	
	
	$(document).on("click", ".rem", function(){
		var wno = this.value;
		var mem_no = $('#mem_no').val();
		var flag = confirm("삭제하시겠습니까?");
		if(flag){
			self.location="removeWish?wish_no="+wno+"&member_no="+mem_no;
		}
	});
	
	//	$('.his').on("click", function(){
	//		history.back(); //뒤로가기
	//	})
	
	// 모달 다이알로그가 열리면 지도 크기 재조정
	$(document).on('shown.bs.modal',"#myModal", function(){			//모달 눌렀을 때
	console.log("Map Modal is shown!");
	console.log(map);
	relayout();
	var movemove = new daum.maps.LatLng(myLat, myLon);    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(movemove);  
//	map.updateSize();
	});
	
	
	
});
var delay = (function(){

	var timer = 0;

	return function(callback, ms){

	clearTimeout (timer);

	timer = setTimeout(callback, ms);

	};

	})();
	
function searchTime() {
	setTimeout
}
function makMap(prod_no) {
	//좌표받기
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position){
        	 myLat = position.coords.latitude; 
        	 myLon =position.coords.longitude; 
        	 var query = {prod_no:prod_no, lat1 : myLat, lon1:myLon};
        	 $.ajax({
					type:"GET",
					url:"mak?prod_no="+prod_no+"&lat1="+myLat+"&lon1="+myLon,
					data:query,
					success:function(data){	
	    				
						//지도 초기화
						mapOp = {
							center : new daum.maps.LatLng(myLat,myLon),
							level :4,
							mapTypeId : daum.maps.MapTypeId.ROADMAP
						}
						map =  new daum.maps.Map(document.getElementById('map1'),mapOp);
						var temp = new daum.maps.LatLng(myLat,myLon);
						
						
						
						var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
					    imageSize = new daum.maps.Size(50,50), // 마커이미지의 크기입니다
					    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정
					    
					 // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
					        markerPosition = new daum.maps.LatLng(myLat,myLon); // 마커가 표시될 위치입니다

					      map.panTo(temp);   
						//마커 찍어주기
					    var marker = new daum.maps.Marker({	
							position : markerPosition,
							image: markerImage
						});
						
						marker.setMap(map);
						
						var positions = [];	
						var contents =[];
						for(var i=0; i <data.length; i++){
							var shop_name = data[i].dto.shop_name;
							var shop_home = data[i].dto.shop_homepage;
							var shop_lat = data[i].dto.shop_gps_latitude;
							var shop_lon = data[i].dto.shop_gps_longitude;
							var shop_home = data[i].dto.addr_si+data[i].dto.addr_gu+data[i].dto.addr_dong+data[i].dto.addr_bunzi;
							positions[i] = {
									title: shop_name,
									latlng :new daum.maps.LatLng(shop_lat,shop_lon),
									
							}
							
							contents[i] ='<div class="wrap">' + 
						    '    <div class="info">' + 
						    '        <div class="title">' + 
						    		shop_name + 
						    '        </div>' + 
						    '        <div class="body">' + 
						    '            <div class="img">' +
						    '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
						    '           </div>' + 
						    '            <div class="desc">' + 
						    '                <div class="ellipsis">'+shop_home+'</div>' + 
						    '  				 <div><a href=https://'+shop_home+'>홈페이지</a></div>' +
						    '  				 <div>영업시간 : '+'매일 10시 ~ 22시'+'</div>'+		//영업시간 수정바람
						    '            </div>' + 
						    '        </div>' + 
						    '    </div>' +    
						    '</div>';

						}
						imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
						for(var i=0; i<positions.length;i++){
							var imageSize = new daum.maps.Size(24, 35); 
						    
						    // 마커 이미지를 생성합니다    
						    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
						    console.log()
						    // 마커를 생성합니다
							console.log("반복문2" + positions[i].latlng)
						    var marker = new daum.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions[i].latlng, // 마커를 표시할 위치
						        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						        image : markerImage // 마커 이미지 
						    });
						    
						    overlay = new daum.maps.CustomOverlay({
							    content: contents[i],
							    map: map,
							    position: marker.getPosition()       
							});

							 overlay.setMap(map);
							 overlays.push(overlay);
						    // 마커에 표시할 인포윈도우를 생성합니다
								map.setCenter(temp);

						}
						//.modal-title h4 ~~를 파는
						//#map1cont - div -> ul modUl
						$('.modal-title').html(data[0].dto.product_name+"을(를)파는 매장입니다.");
						var str = '';
						for(var i=0;i<data.length; i++) {
							str+='<li class="modLi" value="'+data[i].dto.shop_no+'"> 매장명 : '+data[i].dto.shop_name+' 거리 : '+parseInt(data[i].met)*100+"m"+'</li>'
						}
						$('.modLi').remove();
						$('#modUl').append(str);
					}// ajax 끝
        	 });

        });
    } else {
        alert("해당 브라우저에선 현재위치를 찾을수가 없습니다.");
    }
	
}
function firstGps() {
	//좌표받기
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position){
        	 myLat = position.coords.latitude; 
        	 myLon =position.coords.longitude; 
        	 var query = {prod:this.value, lat1:myLat, lon1:myLon};
        	 var element = this;
        	 var prod;
        	 $('.mak').each(function(index,item){
        		 $.ajax({
 					type:"GET",
 					url:"mak?prod_no="+this.value+"&lat1="+myLat+"&lon1="+myLon,//this.val()?this.value?
 					context: this,
 					data:query,
 					success:function(data){	
 						//console.log("firstGps");
 						$(item).html(data.length);
 						prod=this.value;
 					}
 				
        		 });
        	 });
        	 $('.str').each(function(index,item){
        		 $.ajax({
 					type:"GET",
 					url:"mak?prod_no="+$(this).attr('id')+"&lat1="+myLat+"&lon1="+myLon,//this.val()?this.value?
 					context: this,
 					data:query,
 					success:function(data){
 						var min = 0;
 						var minNo;
 						if(data.length>0){
 							min = data[0].met;
 							minNo = data[0].dto.shop_no;
 							for(var i=1; i <data.length; i++){
 	 							if(min > data[i].met){
 	 								min = data[i].met;
 	 								minNo = data[i].dto.shop_no;
 	 							}
 	 						}
 						}
 				/*		for(var i=1; i <data.length; i++){
 							if(min > data[i].met){
 								min = data[i].met;
 								minNo = data[i].dto.shop_no;
 							}
 						}*/
 						if(minNo){
 							$(item).val(minNo);
 						}
 						$(item).html(parseInt(min)*100+"m");
 		
 						
 					}
 				
        		 });
        	 });

//        	 self.location = "mak?prod_no="+prod_no+"&lat1="+myLat+"&lon1="+myLon;
        });
    } else {
        alert("해당 브라우저에선 현재위치를 찾을수가 없습니다.");
    }
	
}
function firstMap() {
	//좌표받기
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position){
        fLat = position.coords.latitude; 
       	fLon =position.coords.longitude;
       	
       	$.ajax({
				type:"GET",
				url:"fMap",
				context: this,
				data:{},
				success:function(data){	
					mapOp = {
							center: new daum.maps.LatLng(fLat, fLon), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					}
					map = new daum.maps.Map(document.getElementById('map'), mapOp);
					var markerPosition  = new daum.maps.LatLng(fLat, fLon); 

					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
					    position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					
					var positions = [];
//					console.log("매장이름"+ data[0].shop_name);

					for(var i=0; i<data.length; i++){
						positions[i] = {
								title : data[i].shop_name,
								latlng: new daum.maps.LatLng( data[i].shop_gps_latitude,data[i].shop_gps_longitude),
								content : '<div>'+ data[i].shop_name+'</div>'
							/*	'<div class="wrap">' + 
							    '    <div class="info">' + 
							    '        <div class="title">' + 
							    		data[i].shop_name + 
							    '        </div>' + 
							    '        <div class="body">' + 
							    '            <div class="img">' +
							    '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
							    '           </div>' + 
							    '            <div class="desc">' + 
							    '                <div class="ellipsis">'+data[i].shop_home+'</div>' + 
							    '  				 <div><a href=https://'+data[i].shop_home+'>홈페이지</a></div>' +
							    '  				 <div>영업시간 : '+'매일 10시 ~ 22시'+'</div>'+		//영업시간 수정바람
							    '            </div>' + 
							    '        </div>' + 
							    '    </div>' +    
							    '</div>'*/
						}
						
					}
					
					var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					for(var i =0; i<positions.length;i++){
						var imageSize = new daum.maps.Size(24, 35); 
					    
					    // 마커 이미지를 생성합니다    
					    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
//					    console.log()
					    // 마커를 생성합니다
//						console.log("반복문" + positions[i].latlng)
					    var marker = new daum.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng, // 마커를 표시할 위치
					        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        image : markerImage // 마커 이미지 
					    });
					    // 마커에 표시할 인포윈도우를 생성합니다 
					    var infowindow = new daum.maps.InfoWindow({
					        content: positions[i].content // 인포윈도우에 표시할 내용
					    });

					    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
					    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
					    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					}
					
				}
			
		 });
        	
        });
    } else {
        alert("해당 브라우저에선 현재위치를 찾을수가 없습니다.");
    }
}
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
function setMap(data) {
	alert("셑맵")
	mapOp = {
			center: new daum.maps.LatLng(fLat, fLon), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	}
	map = new daum.maps.Map(document.getElementById('map'), mapOp);
	var markerPosition  = new daum.maps.LatLng(fLat, fLon); 

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	
	var positions = [];
	
	for(var i=0; i<data.length(); i++){
		positions[i] = {
				title : data[i].shop_name,
				latlng: new daum.maps.LatLng(data[i].shop_gps_longitude, data[i].shop_gps_latitude)
		}
		
	}
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	for(var i =0; i<positions.length;i++){
		var imageSize = new daum.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}
	
}







var map;
var mylat;
var mylon;
var marker=[];
/*getLocation();

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
			
			
			
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
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
}	*/


var markers=[];
var infowindow;
var overlay;
var overlays=[];
function ohmy(splshop_name,splshop_homepage,whido,gyungdo){

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
    '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
    '           </div>' + 
    '            <div class="desc">' + 
    '                <div class="ellipsis">'+'대구광역시 중구'+'</div>' + 
    '   <div><a href=https://'+splshop_homepage+'>홈페이지</a></div>' +
    '            </div>' + 
    '        </div>' + 
    '    </div>' +    
    '</div>';
     
		
//     '   <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
    
//     '   <div><a href='+splshop_homepage+'>홈페이지</a></div>' + 
    
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
//			infowindow[i].close();
//			overlay.setMap(null);  
	}

}

function hideMarkers(){	
	setOverlays();
	setMarkers(null);	   	
}

function relayout() {  
    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    map.relayout();
    console.log(map+"ㅇㅇ");
}






