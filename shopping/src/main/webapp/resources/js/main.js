var myLat;
var myLot;
$(document).ready(function(){
	firstGps();
	setInterval(firstGps(), 1000);

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
							$(".dropdown-menu").append("<tr class='resmenu' id='tr["+data[i].wishlist_no+"]'>" 
									+"<td width=85%>"+data[i].product_name+"</td>"
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
		
		self.location = "mainInsertwish?member_no="+mem_no+"&prod_no="+prod_no;
	});
	
	$("#mainSearch").on("click", function(){
		var keyval = $("#mainInputSearch").val();
		var mem_no = $('#mem_no').val();
		if(keyval){
			self.location="mainSearchBtn?member_no="+mem_no+"&keyval="+keyval;
		}
});
	
	$(document).on("click", ".mak", function(){
		makMap(this.value);
//		var prod_no = this.value;
//		alert(myLat);
//		self.location = "mak?prod_no="+prod_no+"&lat1="+mylat+"&lon1="+mylon;
	});
	
	$(document).on("click", ".str", function(){
		alert("최단거리");
	});
	
	$(document).on("click", ".rem", function(){
		var wno = this.value;
		var mem_no = $('#mem_no').val();
		var flag = confirm("삭제하시겠습니까?");
		if(flag){
			self.location="removeWish?wish_no="+wno+"&member_no="+mem_no;
		}
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

						for(var i=0; i <data.length; i++){
							$("#wm_49").append(
								"<li>매장명 : "+data[i].dto.shop_name+"</li>"
								+"<button type='button' class='btn' value="+data[i].dto.product_no+">"+parseInt(data[i].met)+"m</button>"
							);
//							$(".asd").append(
//									"<li>"+data[i].getMet +"</li>"
//									+"<li>"+data[i].getDto.getShop_name +"</li>"
//									+"<li>"+data[i].getDto().getShop_name() +"</li>"
//							);
					}
					}
        	 });
//        	 self.location = "mak?prod_no="+prod_no+"&lat1="+myLat+"&lon1="+myLon;
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
        	 $('.mak').each(function(index,item){
        		 $.ajax({
 					type:"GET",
 					url:"mak?prod_no="+this.value+"&lat1="+myLat+"&lon1="+myLon,//this.val()?this.value?
 					context: this,
 					data:query,
 					success:function(data){	
 						$(item).html(data.length);
 					}
 				
        		 });
        	 });
        	 $('.str').each(function(index,item){
        		 $.ajax({
 					type:"GET",
 					url:"mak?prod_no="+this.value+"&lat1="+myLat+"&lon1="+myLon,//this.val()?this.value?
 					context: this,
 					data:query,
 					success:function(data){
 						var min = 0;
 						if(data.length>0){
 							min = data[0].met;
 						}
 						for(var i=1; i <data.length; i++){
 							if(min > data[i].met){
 								min = data[i].met 
 							}
 						}
 						$(item).html(parseInt(min)+"m");
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
        	mapOp = {
        			center: new daum.maps.LatLng(fLat, fLon), // 지도의 중심좌표
        	        level: 3 // 지도의 확대 레벨
        	}
        	map = new daum.maps.Map(document.getElementById('map'), mapOp);
        });
    } else {
        alert("해당 브라우저에선 현재위치를 찾을수가 없습니다.");
    }
}


