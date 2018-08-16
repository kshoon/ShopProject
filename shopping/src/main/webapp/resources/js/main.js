var myLat;
var myLot;
$(document).ready(function(){
//	distance(1);
	firstGps();
	firstMap();
	setInterval(firstGps, 10*1000); //1000당 1초 즉 10초당 한번

/*	$("#mainInputSearch").focus(function(){
//		$(".dropdown-menu").css("display","block");
//		$(".dropdown-menu").append("<tr class='resmenu'><td>최근등록상품</td></tr>");
		
	});*/
	$("#mainInputSearch").blur(function(){				//위시검색창 해제
		delay(function(){
			$(".dropdown-menu").css("display","none");	
			$(".resmenu").remove();
			$("#mainInputSearch").val("");
		}, 100);
		
	});
	$("#mainInputSearch").keyup(function(){			//위시 검색창 자도완성
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
							$(".dropdown-menu").append("<tr class='resmenu' id='tr["+data[i].wishlist_no+"]' style='width: 100%;'>" 
									+"<td width=95% style='padding:10px 16px;'>"+data[i].product_name+"</td>"
									+"<td><button type='button' class='btn ins' value='"+data[i].product_no+"'>추가</button></td>"
									+"</tr>");
						}			
					}
				});
			}, 100);
			
		}
	});
/*	$(document).on("keypress", "#mainInputSearch", function(e){			//위시엔터 검색
	     if(e.which == 13) {
	    
	     }	
	});*/
	$(document).on("click", "#mainSearch", function(){
		var keyval = $("#mainInputSearch").val();
		
		
		if(keyval){
			distance(keyval);
//			delay(function(){
//				alert("끝");
//				self.location="mainSearchBtn?keyval="+keyval;
//			}, 100);
		}else {
			alert("다시입력해주세요");
		}
		// 클릭시 알림보내기

		/*    $.ajax({
		    	type:"GET",
		    	url:"pushToBuyer?searchText="+keyval,
				data:{},
				success:function(data){
					console.log("푸쉬완료");
		
				}
			});*/
	});
	$(document).on("click", ".ins", function(){

		var prod_no = this.value;
		distance(parseInt(prod_no));
		
//		delay(function(){
//			alert("끝");
//			location.href = "mainInsertwish?prod_no="+prod_no;
//		}, 100);
	});
	
	
	
	var cnt = false;	
	$(document).on("click", ".mak", function(){
		console.log(cnt);
		if(cnt){
		$('.modal-body').append('<div id="map1" style="width: 100%; height: 400px"></div>');
		}
		cnt = true;
		if($(this).html()==0) {
			
			$('#myModal').modal('hide');
			alert("근처에 매장이 없습니다.");
			
		}else{
			
			makMap(this.value);

		}

	});
	var cont = false;
	$(document).on("click", ".str", function(){
		if(cont){
			$('.mobody').append('<div id="map2" style="width: 100%; height: 600px"></div>');
		}
		cont = true;
		if($(this).html()=='0m') {
				$('#strModal').modal('hide');
				alert("근처에 매장이 없습니다.");	
		}else{	
			strMap(this.value,this.nextElementSibling.value);

		}
//		self.location="strMap?shop_no="+this.value+"&prod_no="+this.nextElementSibling.value;

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
	
	
	// 모달 다이알로그가 열리면 지도 크기 재조정
	$(document).on('shown.bs.modal',"#myModal", function(){			//모달 눌렀을 때

		relayout();
		var movemove = new daum.maps.LatLng(myLat, myLon);    
		// 	지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(movemove);  

	});
	$(document).on('hidden.bs.modal',"#myModal", function(){			//모달 종료될때
		$('#map1').remove();
		$('.modLi').remove();
		$('#modal_title').html("로딩중입니다.");
	});
	$(document).on('shown.bs.modal',"#strModal", function(){			//모달 눌렀을 때

		relayout();
		var movemove = new daum.maps.LatLng(myLat, myLon);    
		// 	지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(movemove);  

	});
	$(document).on('hidden.bs.modal',"#strModal", function(){			//모달 종료될때
		$('#map2').remove();
		
		$('#str_title').html("로딩중입니다.");
	});
	$("#CheckAll").on("click", function(){			//위시 체크 전체선택
		
		if($('#CheckAll').prop('checked')){
			$('input[name=chk]:checkbox').each(function(){
				$(this).prop('checked',true);
			});
		}else {
			$('input[name=chk]:checkbox').each(function(){
				$(this).prop('checked',false);
			});
		}
	});
	
	$("#allRemBtn").on("click", function(){	// 위시 전체 삭제
		var flag = confirm("삭제하시겠습니까?");
		if(flag){
			$('input[name=chk]:checked').each(function(){
				var wno = this.value;
				$.get("remAll?wish_no="+wno, function(data, status){});
			});
			location.reload();
		}
	});
	$("#allBook").on("click", function(){	// 알림지정매장 클릭
		$("#bookUl").empty(); 
		$("#bookUl").toggleClass("disIn");
		$.get("bookList",function(data,status){
			for(var i =0; i<data.length; i++) {
				$("#bookUl").append("<li class='bookLi' value='"+data[i].shop_no+"'>"+data[i].shop_name+"</li>")
			}
		});
	});
	
	$(document).on("click", ".bookLi", function(e){			//알림지정매장 지도 위치변경
	     $.get("booklatlon?shop_no="+this.value, function(data,status){
	    	 var bookMove = new daum.maps.LatLng(data.shop_gps_latitude, data.shop_gps_longitude);
	    	 map.panTo(bookMove);
	     });
			// 	지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			  
	});
	
	$(document).on("keypress", "#modSearch", function(e){			//엔터 검색
		     if(e.which == 13) {
		          $("#modSerchBtn").trigger('click');
		     }
	});
	$(document).on("click", "#modSerchBtn", function(){			//매장지정 검색
		var keyval = $("#modSearch").val();
		var option = $("#modsel").val();	//1 = 매장명 , 2=주소
		
		if(keyval){
			$(".modbody").empty();
			$.get("modSearch?option="+option+"&keyval="+keyval, function(data, status){
				var modres =$('<div></div>').addClass('modresult');
				var modtext= $('<p></p>').text(keyval+"의 검색결과 "+data.length+"건").appendTo(modres);
//				$(".modbody").append("<div class='modresult'>"+keyval+"의 검색결과 "+data.length+"건</div>")
				$(".modbody").append(modres);
				for(var i =0; i<data.length; i++) {
					/*var modshop1 = $('<div></div>').addClass('modshop1');
					var modshopP = $('<p></p>').text(data[i].shop_name).appendTo(modshop1);*/
					$(".modbody").append(
					"<div class='modshop1' data-value='"+data[i].shop_no+"'>" + 
							"<input type='hidden' value="+data[i].shop_no+">"+
							"<p style='font-size:1.5em'>"+data[i].shop_name+"</p>"+
					data[i].addr_si+" "+data[i].addr_gu+" "+data[i].addr_dong +" "+ data[i].addr_bunzi +
					"<div class='modshop2'></div>"+
					"<hr></div>"
					);
					var lat = data[i].shop_gps_latitude;
					var lon = data[i].shop_gps_longitude;
					var markerPosition  = new daum.maps.LatLng(lat, lon); 
					var marker = {
					    position: markerPosition
					};

					var staticMapContainer  = $('.modshop2')[i] // 이미지 지도를 표시할 div  
					    staticMapOption = { 
					        center: new daum.maps.LatLng(lat, lon), // 이미지 지도의 중심좌표
					        level: 5, // 이미지 지도의 확대 레벨
					        marker: marker // 이미지 지도에 표시할 마커 
					    };    

					// 이미지 지도를 생성합니다
					var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
				}

			});
		}else {
			alert("다시입력해주세요");
		}
	
	});
	$(document).on("click", ".modshop1", function(){	//매장 지정하면 맵전환
		$('#imgModal').modal('hide');
		thirdMap(this.firstElementChild.value);
	});
	$(document).on('hidden.bs.modal',"#imgModal", function(){			//모달 종료될때
		$(".modbody").empty();
		$("#modSearch").val("");
		/*$(".modbody").css("height",95);*/
	});
	
	$(document).on("click",".bookMarkN", function(){
		$.get("bMN?shop_no="+this.nextElementSibling.value, function(data, status){
			
		});
		this.className="glyphicon glyphicon-star bookMarkI";
		
	});
	
	$(document).on("click",".bookMarkI", function(){
		$.get("bMI?shop_no="+this.nextElementSibling.value, function(data, status){

		});
		this.className="glyphicon glyphicon-star-empty bookMarkN";
	});
});
// 딜레이관련
var delay = (function(){

	var timer = 0;

	return function(callback, ms){

	clearTimeout (timer);

	timer = setTimeout(callback, ms);

	};

})();
// 딜레이 관련	
function searchTime() {
	setTimeout
}
var nameS = 0;
var listS = 0;
function targetM(prod) {
		alert(prod);
		$('#sortN').append("<img src='./resources/images/shop_store.png' class='sortImgN' alt='sort' width='20' height='20'>");
}
function nameSort(a) {
	if(a==0){
		$('.sortImgN').remove();
		if(nameS==0) {
			$('#sortN').append("<img src='./resources/images/sort_up.png' class='sortImgN' alt='sort' width='15' height='15'>");
			nameS = 1;
		}else if (nameS==1) {
			$('#sortN').append("<img src='./resources/images/sort_down.png' class='sortImgN' alt='sort' width='15' height='15'>");
			nameS = 2;
		}else {
			nameS = 0;
		}
	}else if(a == 1){
		$('.sortImg').remove();
		if(listS==0) {
			listS = 1;
			$('#sortL').append("<img src='./resources/images/sort_up.png' class='sortImg' alt='sort' width='15' height='15'>");
		}else if (listS==1) {
			$('#sortL').append("<img src='./resources/images/sort_down.png' class='sortImg' alt='sort' width='15' height='15'>");
			listS = 2;
		}else {
			listS = 0;
		}
		
	}
	 $.get("wishNew?a="+nameS+"&b="+listS, function(data, status){
		 $('.wlsN').each(function(index,item){
			 $(item).html('<input type="checkbox" class="CheckBox" name="chk"  value='+data[index].wishlist_no+'>'
					 +'<a onclick="secondMap('+data[index].product_no+')">'+data[index].product_name+'</a>');
//			 $(item).html(data[index].product_name);
		 });
		 $('.wlsD').each(function(index,item){
			 var date = new Date(data[index].wishlist_date);
			 $(item).html(date.toLocaleDateString());
			 
		 });
		 $('.mak').each(function(index,item){
			 $(item).val(data[index].product_no);
		 });
		 $('.strval').each(function(index,item){
			 $(item).val(data[index].product_no);
		 });
		 
		 $('.str').each(function(index,item){
			 $(item).val(data[index].product_no); 
		 });
		 $('.rem').each(function(index,item){
			 $(item).val(data[index].wishlist_no); 
		 });
		 firstGps();
	 });
	 
	
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
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new daum.maps.MapTypeControl();

						// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
						// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
						map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
						var zoomControl = new daum.maps.ZoomControl();
						map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
						
						
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
							var shop_home = data[i].dto.shop_homepage;
							var shop_bh = data[i].dto.shop_bh;
							var shop_explain = data[i].dto.shop_explain;
							var shop_addr = data[i].dto.addr_si+' '+data[i].dto.addr_gu+' '+data[i].dto.addr_dong+' '+data[i].dto.addr_bunzi;
							var shop_number= data[i].dto.shop_phone;;
							var shop_explain2="";
							if(shop_explain.length>10){
								shop_explain2 += '<p>'+shop_explain.substring(10, shop_explain.length);
								shop_explain =  shop_explain.slice(0, 10);
								if(shop_explain2.length>15) {
									shop_explain2 = shop_explain2.substring(0, 13) +'...';
								}
		    				}

							positions[i] = {
									title: shop_name,
									latlng :new daum.maps.LatLng(shop_lat,shop_lon),
									
							}
							var bookm;
							 $.ajax({
								 	type:'get',
							    	url:"sBM?shop_no="+data[i].dto.shop_no,
									async:false,
									success:function(result){
										console.log(result);
										if(result=="fail"){bookm = 'glyphicon-star-empty bookMarkN';
										}else{bookm = 'glyphicon-star bookMarkI';}								
									}
							    });
							contents[i] =
								'<div class="wrap">' + 
								'		<div class="info">' + 
								'			<div class="title">' + shop_name + 
								'				<span class="glyphicon '+bookm+'"></span>' +
					   			'				<input type="hidden" value="'+data[i].dto.shop_no+'">' +
								'			</div>'  + 								
							    '		<div class="body">' + 
							    '			<div class="img">' +
							    '				<img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
							    '			</div>' + 
							    '			<div class="desc">' + 
							    '				<div class="ellipsis">'+shop_addr+'</div>' + 
							    '				<div><a href=https://'+shop_home+'>'+shop_home+'</a>, '+shop_number+'</div>' +
							    '				<div>영업시간 : '+shop_bh+'</div>'+
							    '				<div>매장설명 : '+shop_explain+shop_explain2+'</div>'+
							    '			</div>' + 
							    '		</div>' + 
							    '	</div>' +    
							    '</div>';

						}
						imageSrc = "resources/images/market.png";
						for(var i=0; i<positions.length;i++){
							var imageSize = new daum.maps.Size(30, 25); 
						    
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
						$('#modal_title').html(data[0].dto.product_name+"을(를)파는 매장입니다.");
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
						$('#modUl').append(str);
					}// ajax 끝
        	 });

        });
    } else {
        alert("해당 브라우저에선 현재위치를 찾을수가 없습니다.");
    }
	
}
function strMap(shop_no, prod_no) {
	//좌표받기
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position){
        	 myLat = position.coords.latitude; 
        	 myLon =position.coords.longitude; 
        	 var query = {shop_no:shop_no, prod_no : prod_no};
        	 $.ajax({
					type:"GET",
					url:"shopOne?shop_no="+shop_no,
					data:query,
					success:function(data){	
	    				
						//지도 초기화
						mapOp = {
							center : new daum.maps.LatLng(data.shop_gps_latitude,data.shop_gps_longitude),
							level :3,
							mapTypeId : daum.maps.MapTypeId.ROADMAP
						}
						map =  new daum.maps.Map(document.getElementById('map2'),mapOp);
						var temp = new daum.maps.LatLng(myLat,myLon);
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new daum.maps.MapTypeControl();

						// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
						// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
						map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
						var zoomControl = new daum.maps.ZoomControl();
						map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
						
						
						var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
					    imageSize = new daum.maps.Size(50,50), // 마커이미지의 크기입니다
					    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정
					    
						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
					        markerPosition = new daum.maps.LatLng(myLat,myLon); // 마커가 표시될 위치입니다

//					    map.panTo(temp);   
						//마커 찍어주기
					    var marker = new daum.maps.Marker({	
							position : markerPosition,
							image: markerImage
						});
						
						marker.setMap(map);
						var shop_explain = data.shop_explain;
						var shop_explain2 = "";
						var shop_addr = data.addr_si+' '+data.addr_gu+' '+data.addr_dong+' '+data.addr_bunzi;
				
						if(shop_explain.length>10){
							shop_explain2 += '<p>'+shop_explain.substring(10, shop_explain.length);
							shop_explain =  shop_explain.slice(0, 10);
							if(shop_explain2.length>15) {
								shop_explain2 = shop_explain2.substring(0, 13) +'...';
							}
		    			}

						var position = {
									title: data.shop_name,
									latlng :new daum.maps.LatLng(data.shop_gps_latitude,data.shop_gps_longitude),
									
						}
						var bookm;
						$.ajax({
							type:'get',
							url:"sBM?shop_no="+data.shop_no,
							async:false,
							success:function(result){
								console.log(result);
								if(result=="fail"){
									bookm = 'glyphicon-star-empty bookMarkN';
								}else{
									bookm = 'glyphicon-star bookMarkI';}								
								}
						});
						var content =
							'<div class="wrap">' + 
							'		<div class="info">' + 
							'			<div class="title">' + data.shop_name + 
							'				<span class="glyphicon '+bookm+'"></span>' +
					   		'				<input type="hidden" value="'+data.shop_no+'">' +
							'			</div>'  + 								
							'		<div class="body">' + 
							'			<div class="img">' +
							'				<img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
							'			</div>' + 
							'			<div class="desc">' + 
							'				<div class="ellipsis">'+shop_addr+'</div>' + 
							'				<div><a href=https://'+data.shop_homepage+'>'+data.shop_homepage+'</a>, '+data.shop_phone+'</div>' +
							'				<div>영업시간 : '+data.shop_bh+'</div>'+
							'				<div>매장설명 : '+shop_explain+shop_explain2+'</div>'+
							'			</div>' + 
							'		</div>' + 
							'	</div>' +    
							'</div>';						
						imageSrc = "resources/images/market.png";
						var imageSize = new daum.maps.Size(30, 25); 
						    
						// 마커 이미지를 생성합니다    
						var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
						// 마커를 생성합니다
						
						var marker = new daum.maps.Marker({
							map: map, // 마커를 표시할 지도
							 position: position.latlng, // 마커를 표시할 위치
							 title : position.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
							 image : markerImage // 마커 이미지 
						});
						    
						overlay = new daum.maps.CustomOverlay({
							content: content,
							map: map,
							position: marker.getPosition()       
						});

						overlay.setMap(map);
						overlays.push(overlay);
						// 마커에 표시할 인포윈도우를 생성합니다
//						map.setCenter(temp);
						var prod_name;
						$.ajax({
							type:'get',
							url:"prodOne?prod_no="+prod_no,
							async:false,
							success:function(name){
								prod_name=name.product_name;								
							}
						});
						$('#str_title').html(prod_name+"을(를)파는 가장 가까운 매장입니다.");

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
 					url:"mak?prod_no="+$('.strval')[index].value+"&lat1="+myLat+"&lon1="+myLon,// $('.strval')[index].value?$(this).attr('id')
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
 							/*alert($('.strval')[index].value)*/
// 							$('.strval')[index].value=minNo;
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
					// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
					var mapTypeControl = new daum.maps.MapTypeControl();

					// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
					// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
					map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

					// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
					var zoomControl = new daum.maps.ZoomControl();
					map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
					var markerPosition  = new daum.maps.LatLng(fLat, fLon); 
					var temp = new daum.maps.LatLng(fLat,fLon);
					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
					    position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					
					var positions = [];
//					console.log("매장이름"+ data[0].shop_name);
					var contents = [];
					for(var i=0; i<data.length; i++){
						var shop_bh = data[i].shop.shop_bh;
						var shop_home = data[i].shop.shop_homepage;
						var shop_explain = data[i].shop.shop_explain;
						var shop_addr = data[i].shop.addr_si+' '+data[i].shop.addr_gu+' '+data[i].shop.addr_dong+' '+data[i].shop.addr_bunzi;
						var str = '';
						var countStr;
						var shop_number= data[i].shop.shop_phone;
						for(var j=0; j<data[i].pnlist.length; j++){
							
							console.log(countStr);
							
							str += data[i].pnlist[j];
							countStr = str.length;
							if(countStr >= 20) {
								str+= "... +"+(data[i].pnlist.length-j-1);
								j=data[i].pnlist.length;
							}
							if(j<data[i].pnlist.length-1){
								str += ", ";
							}
							
						}
						positions[i] = {
								title : data[i].shop.shop_name,
								latlng: new daum.maps.LatLng( data[i].shop.shop_gps_latitude,data[i].shop.shop_gps_longitude),
								info : '<div style=width:286px>'+str+ '</div>'
						}
						var shop_explain2="";
						if(shop_explain.length>10){
							shop_explain2 += '<p>'+shop_explain.substring(10, shop_explain.length);
							shop_explain =  shop_explain.slice(0, 10);
							if(shop_explain2.length>15) {
								shop_explain2 = shop_explain2.substring(0, 13) +'...';
							}
	    				}
						
						var bookm;
						 $.ajax({
							 	type:'get',
						    	url:"sBM?shop_no="+data[i].shop.shop_no,
								async:false,
								success:function(result){
									console.log(result);
									if(result=="fail"){bookm = 'glyphicon-star-empty bookMarkN';
									}else{bookm = 'glyphicon-star bookMarkI';}								
								}
						    });
						
						contents[i] = '<div class="wrap">' + 
									'		<div class="info">' + 
									'			<div class="title">' + data[i].shop.shop_name +
					    			'				<span class="numberC"style="height:24px;width:24px;background-color:white; border-radius:50%;color:mediumslateblue; display: inline-block; text-align: center;margin: auto;">'+ data[i].pnlist.length+'</span>'+
					    			'				<span class="glyphicon '+bookm+'"></span>' +
						   			'				<input type="hidden" value="'+data[i].shop.shop_no+'">' +
					    			'        	</div>' + 
								    '		<div class="body">' + 
								    '			<div class="img">' +
								    '				<img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
								    '			</div>' + 
								    '			<div class="desc">' + 
								    '				<div class="ellipsis">'+shop_addr+'</div>' + 
								    '				<div><a href=https://'+shop_home+'>'+shop_home+'</a>, '+shop_number+'</div>' +
								    '				<div>영업시간 : '+shop_bh+'</div>'+
								    '				<div>매장설명 : '+shop_explain+shop_explain2+'</div>'+
								    '			</div>' + 
								    '		</div>' + 
								    '	</div>' +    
								    '</div>';
					}
					
					var imageSrc = "resources/images/market.png";
					for(var i =0; i<positions.length;i++){
						var imageSize = new daum.maps.Size(30, 25); 
					    
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
					    overlay = new daum.maps.CustomOverlay({
						    content: contents[i],
						    map: map,
						    position: marker.getPosition()       
						});
					    
						 overlay.setMap(map);
						 overlays.push(overlay);
					    // 마커에 표시할 인포윈도우를 생성합니다
							map.setCenter(temp);
					    
					    
					    
					    // 마커에 표시할 인포윈도우를 생성합니다 
					    var infowindow = new daum.maps.InfoWindow({
					    	content: positions[i].info // 인포윈도우에 표시할 내용
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
function secondMap(prod_no) {
	//좌표받기
	
	$("#map").empty();
	
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position){
        fLat = position.coords.latitude; 
       	fLon =position.coords.longitude;

       	$.ajax({
				type:"GET",
				url:"mak?prod_no="+prod_no+"&lat1="+fLat+"&lon1="+fLon,
				context: this,
				data:{},
				success:function(data){	
					if(data.length>=1){
						$('#map').append("<p class='mapIn'>"+data[0].dto.product_name+"를 파는 매장입니다.</p>");
					}
					mapOp = {
							center: new daum.maps.LatLng(fLat, fLon), // 지도의 중심좌표	, fLat은 현재위치
					        level: 3 // 지도의 확대 레벨
					}
					map = new daum.maps.Map(document.getElementById('map'), mapOp);
					// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
					var mapTypeControl = new daum.maps.MapTypeControl();

					// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
					// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
					map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

					// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
					var zoomControl = new daum.maps.ZoomControl();
					map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
					var markerPosition  = new daum.maps.LatLng(fLat, fLon); 
					var temp = new daum.maps.LatLng(fLat,fLon);
					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
					    position: markerPosition
					});
					
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					
					var positions = [];
//					console.log("매장이름"+ data[0].shop_name);
					var contents = [];
					for(var i=0; i<data.length; i++){
						var shop_bh = data[i].dto.shop_bh;
						var shop_home = data[i].dto.shop_homepage;
						var shop_explain = data[i].dto.shop_explain;
						var shop_addr = data[i].dto.addr_si+' '+data[i].dto.addr_gu+' '+data[i].dto.addr_dong+' '+data[i].dto.addr_bunzi;
						var str = '';
						var countStr;
						var shop_number= data[i].dto.shop_phone;
//						for(var j=0; j<data[i].pnlist.length; j++){
//							
//							console.log(countStr);
//							
//							str += data[i].pnlist[j];
//							countStr = str.length;
//							if(countStr >= 20) {
//								str+= "... +"+(data[i].pnlist.length-j-1);
//								j=data[i].pnlist.length;
//							}
//							if(j<data[i].pnlist.length-1){
//								str += ", ";
//							}
//							
//						}
						positions[i] = {
								title : data[i].dto.shop_name,
								latlng: new daum.maps.LatLng( data[i].dto.shop_gps_latitude,data[i].dto.shop_gps_longitude),
//								info : '<div style=width:286px>'+str+ '</div>'
						}
						var shop_explain2="";
						if(shop_explain.length>10){
							shop_explain2 += '<p>'+shop_explain.substring(10, shop_explain.length);
							shop_explain =  shop_explain.slice(0, 10);
							if(shop_explain2.length>15) {
								shop_explain2 = shop_explain2.substring(0, 13) +'...';
							}
	    				}
						var bookm;
						 $.ajax({
							 	type:'get',
						    	url:"sBM?shop_no="+data[i].dto.shop_no,
								async:false,
								success:function(result){
									console.log(result);
									if(result=="fail"){bookm = 'glyphicon-star-empty bookMarkN';
									}else{bookm = 'glyphicon-star bookMarkI';}								
								}
						    });
						
						contents[i] = '<div class="wrap">' + 
									'		<div class="info">' + 
									'			<div class="title">' + data[i].dto.shop_name +
//					    			'				<span class="numberC"style="height:25px;width:25px;background-color:MediumSeaGreen; border-radius:50%;color:white; display: inline-block; text-align: center;margin: auto;">'+ data[i].pnlist.length+'</span>'+
									'				<span class="glyphicon '+bookm+'"></span>' +
						   			'				<input type="hidden" value="'+data[i].dto.shop_no+'">' +
					    			'        	</div>' + 
								    '		<div class="body">' + 
								    '			<div class="img">' +
								    '				<img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
								    '			</div>' + 
								    '			<div class="desc">' + 
								    '				<div class="ellipsis">'+shop_addr+'</div>' + 
								    '				<div><a href=https://'+shop_home+'>'+shop_home+'</a>, '+shop_number+'</div>' +
								    '				<div>영업시간 : '+shop_bh+'</div>'+
								    '				<div>매장설명 : '+shop_explain+shop_explain2+'</div>'+
								    '			</div>' + 
								    '		</div>' + 
								    '	</div>' +    
								    '</div>';
					}
					
					var imageSrc = "resources/images/market.png";
					for(var i =0; i<positions.length;i++){
						var imageSize = new daum.maps.Size(30, 25); 
					    
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
					    overlay = new daum.maps.CustomOverlay({
						    content: contents[i],
						    map: map,
						    position: marker.getPosition()       
						});
					    
						 overlay.setMap(map);
						 overlays.push(overlay);
					    // 마커에 표시할 인포윈도우를 생성합니다
							map.setCenter(temp);
					    
					    
					    
					    // 마커에 표시할 인포윈도우를 생성합니다 
					    var infowindow = new daum.maps.InfoWindow({
					    	content: positions[i].info // 인포윈도우에 표시할 내용
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
function thirdMap(shop_no) {		//매장지정 맵변경
	//좌표받기
	
	$("#map").empty();
	
	if (shop_no) {

       	$.ajax({
				type:"GET",
				url:"tMap?shop_no="+shop_no,
				context: this,
				data:{},
				success:function(data){	
					$('#map').append("<p class='mapIn'>"+data.shop.shop_name+"입니다.</p>");

					mapOp = {
							center: new daum.maps.LatLng( data.shop.shop_gps_latitude,data.shop.shop_gps_longitude), // 지도의 중심좌표	, fLat은 현재위치
					        level: 3 // 지도의 확대 레벨
					}
					map = new daum.maps.Map(document.getElementById('map'), mapOp);
					// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
					var mapTypeControl = new daum.maps.MapTypeControl();

					// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
					// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
					map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

					// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
					var zoomControl = new daum.maps.ZoomControl();
					map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

					var temp = new daum.maps.LatLng( data.shop.shop_gps_latitude,data.shop.shop_gps_longitude);

					
					
					var positions = [];
//					console.log("매장이름"+ data[0].shop_name);
					var contents = [];
					
					var shop_bh = data.shop.shop_bh;
					var shop_home = data.shop.shop_homepage;
					var shop_explain = data.shop.shop_explain;
					var shop_addr = data.shop.addr_si+' '+data.shop.addr_gu+' '+data.shop.addr_dong+' '+data.shop.addr_bunzi;
					var str = '';
					var countStr;
					var shop_number= data.shop.shop_phone;
					for(var j=0; j<data.pnlist.length; j++){
							
						console.log(countStr);
							
						str += data.pnlist[j];
						countStr = str.length;
						if(countStr >= 20) {
							str+= "... +"+(data.pnlist.length-j-1);
							j=data.pnlist.length;
						}
						if(j<data.pnlist.length-1){
							str += ", ";
						}
							
					}
					position = {
							title : data.shop.shop_name,
							latlng: new daum.maps.LatLng( data.shop.shop_gps_latitude,data.shop.shop_gps_longitude),
							info : '<div style=width:286px>'+str+ '</div>'
					}
					var shop_explain2="";
					if(shop_explain.length>10){
						shop_explain2 += '<p>'+shop_explain.substring(10, shop_explain.length);
						shop_explain =  shop_explain.slice(0, 10);
						if(shop_explain2.length>15) {
							shop_explain2 = shop_explain2.substring(0, 13) +'...';
						}
	    			}
						
					var bookm; 
					 $.ajax({
						 	type:'get',
					    	url:"sBM?shop_no="+data.shop.shop_no,
							async:false,
							success:function(result){
								console.log(result);
								if(result=="fail"){bookm = 'glyphicon-star-empty bookMarkN';
								}else{bookm = 'glyphicon-star bookMarkI';}								
							}
					    });
					/*$.get("sBM?shop_no="+data.shop.shop_no, function(result, status){
						if(result==null){bookm = 'glyphicon-star-empty bookMarkN';
						}else{bookm = 'glyphicon-star bookMarkI';}
					});*/
					content = '<div class="wrap">' + 
								'		<div class="info">' + 
								'			<div class="title">' + data.shop.shop_name +
					   			'				<span class="numberC" style="height:24px;width:24px;background-color:white; border-radius:50%;color:mediumslateblue; display: inline-block; text-align: center;margin: auto;">'+ data.pnlist.length+'</span>'+
					   			'				<span class="glyphicon '+bookm+'"></span>' +
					   			'				<input type="hidden" value="'+data.shop.shop_no+'">' +
					   			'        	</div>' + 
							    '		<div class="body">' + 
							    '			<div class="img">' +
							    '				<img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
							    '			</div>' + 
							    '			<div class="desc">' + 
							    '				<div class="ellipsis">'+shop_addr+'</div>' + 
							    '				<div><a href=https://'+shop_home+'>'+shop_home+'</a>, '+shop_number+'</div>' +
							    '				<div>영업시간 : '+shop_bh+'</div>'+
							    '				<div>매장설명 : '+shop_explain+shop_explain2+'</div>'+
							    '			</div>' + 
							    '		</div>' + 
							    '	</div>' +    
							    '</div>';
				
					
					var imageSrc = "resources/images/market.png";
					var imageSize = new daum.maps.Size(30, 25); 
					   
					// 마커 이미지를 생성합니다    
					var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
					// 마커를 생성합니다

					var marker = new daum.maps.Marker({
						map: map, // 마커를 표시할 지도
					    position: position.latlng, // 마커를 표시할 위치
					    title : position.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					    image : markerImage // 마커 이미지 
					});
					overlay = new daum.maps.CustomOverlay({
						content: content,
						map: map,
						position: marker.getPosition()       
					});
					    
					overlay.setMap(map);
					overlays.push(overlay);
					// 마커에 표시할 인포윈도우를 생성합니다
					map.setCenter(temp);

					// 마커에 표시할 인포윈도우를 생성합니다 
					var infowindow = new daum.maps.InfoWindow({
						content: position.info // 인포윈도우에 표시할 내용
					});

					// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
					// 이벤트 리스너로는 클로저를 만들어 등록합니다 
					// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				}
					
				
				
		 });
        	
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
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
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
        						console.log('success');
//        						alert("distance끝푸쉬직전");
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
//        									alert("pushToSeller끝");
        									console.log(result.shop_no);
        									console.log("푸쉬완료");
        									
        								}
        						});
        					}
        					if(typeof prod == 'number'){

        						location.href = "mainInsertwish?prod_no="+prod;
                			}else if( typeof prod == 'string'){

                				self.location="mainSearchBtn?keyval="+prod;
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

