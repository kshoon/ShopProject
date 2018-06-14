var myLat;
var myLot;
$(document).ready(function(){
//	distance(1);
	firstGps();
	firstMap();
	setInterval(firstGps, 10*1000); //1000당 1초

/*	$("#mainInputSearch").focus(function(){
//		$(".dropdown-menu").css("display","block");
//		$(".dropdown-menu").append("<tr class='resmenu'><td>최근등록상품</td></tr>");
		
	});*/
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
			var keyword = $("#mainInputSearch").val();
			var query = {keyword:keyword};
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
									+"</tr>");
						}			
					}
				});
			}, 100);
			
		}
	});

	$(document).on("click", ".ins", function(){

		var prod_no = this.value;
		distance(parseInt(prod_no));
		delay(function(){	
			location.href = "mainInsertwish?prod_no="+prod_no;
		}, 100);
	});
	
	$("#mainSearch").on("click", function(){
		var keyval = $("#mainInputSearch").val();
		distance(keyval);
		keyval =  encodeURIComponent(keyval);

		if(keyval){
			delay(function(){	
				self.location="mainSearchBtn?keyval="+keyval;
			}, 100);
		}
		// 클릭시 알림보내기
		 
//		    keyval += '를 원하는 손님이 나타났습니다.'
//		    $.ajax({
//		    	type:"GET",
//		    	url:"pushToBuyer?searchText="+keyval+"&member_id="+id,
//				data:{},
//				success:function(data){
//					console.log("푸쉬완료");
//				}
//		    });
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
		self.location="strMap?shop_no="+this.value+"&prod_no="+$(this).attr('id');
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

		var flag = confirm("삭제하시겠습니까?");
		if(flag){
			self.location="removeWish?wish_no="+wno;
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
							var shop_bh = data[i].dto.shop_bh;
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
						    '  				 <div>영업시간 : '+shop_bh+'</div>'+		//영업시간 수정바람
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
							var met =parseInt(data[i].met);
							var metStr = '';
							if(met>1000) {
								metStr = (met/1000).toFixed(2)+'km';
							}else {
								metStr = met+"m"; 
							}
							str+='<li class="modLi" value="'+data[i].dto.shop_no+'"> 매장명 : '+data[i].dto.shop_name+' 거리 : '+metStr+'</li>'
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
 						
 						var met =parseInt(min);
						var metStr = '';
						if(met>1000) {
							metStr = (met/1000).toFixed(2)+'km';
						}else {
							metStr = met+"m"; 
						}
 						
 						$(item).html(metStr);
 		
 						
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
							center: new daum.maps.LatLng(fLat, fLon), // 지도의 중심좌표	, fLat은 현재위치
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


var overlay;
var overlays=[];


function relayout() {  
    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    map.relayout();
    console.log(map+"ㅇㅇ");
}
function distance(prod) {
	//좌표받기

	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
        		function(position){
        			myLat = position.coords.latitude; 
        			myLon = position.coords.longitude; 
        			var query;

        			if(typeof prod == 'number'){
        				query = {lat:myLat, lon:myLon, prod_no: prod};
        			}else if( typeof prod == 'string'){
        				query = {lat:myLat, lon:myLon, prod_name: prod};
        			}
        			
        			$.ajax({
        				url:"distance",
        				data:query,
        				dataType: 'jsonp',
        				success:function(data){			//100000m이하 좌표, 거리, 매장번호, 상품번호 
        					for(var i = 0; i< data.length; i ++) { 							//prod_no가 널이면 0
        						
//        						if(data[i].product_no == 0 && data[i].soldout_check == 0) {	//매장에 상품이 없음
//        							console.log("매장번호: "+data[i].shop_no+"매장주인번호: "+data[i].member_no+data[i].product_no+"상품을 추가하시겠습니까?"+data[i].met);
//        							alert("매장번호: "+data[i].shop_no+"매장주인번호: "+data[i].member_no+data[i].product_no+"상품을 추가하시겠습니까?"+data[i].met);
//        						}else if((data[i].product_no == prod || data[i].product_name == prod )&& data[i].soldout_check == 0) {	//매장이 상품을 가지고있음
//        							console.log("매장번호: "+data[i].shop_no+"매장주인번호: "+data[i].member_no+data[i].product_no+"상품을 찾습니다."+data[i].met);
//        						}
        						var query = data[i]; 
        						 $.ajax({
        							 	type:'post',
        						    	url:"pushToSeller",
        						    	headers:{
        									"Content-Type" : "application/json",
        									"X-HTTP-Method-Override" : "POST"
        								},
        								data:JSON.stringify(query),
        								datatype:'text',
        								success:function(result){
        									console.log(result.shop_no);
        									console.log("푸쉬완료");
        								}
        						    });
        					}
        				}
        			
        		 });
        	 },
        	 function (error) {
        		 alert("에러");
        	 }
        		);
    } else {
        alert("해당 브라우저에선 현재위치를 찾을수가 없습니다.");
    }
}

