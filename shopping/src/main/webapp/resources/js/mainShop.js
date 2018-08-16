
$(document).ready(function(){
	if(document.getElementById('map')!=null){		//매장정보에서 쓰일 map 생성
		InfoMap();
	}
	InfoShop();
	var formObj = $("form");
	$("#shopMod").on("click", function(){			//매장 수정
		formObj.attr("action", "mainShopMod");
		formObj.submit();
	});
	$(".shopNavi").on("click", function(){			//상품관리에서 초성으로 이동
		var id = this.id;
		if(id=='naviAll'){
			self.location="mainShopProd";
		}else{
			self.location="mainShopProd?id="+id;
		}
	});
	$(".shopNaviI").on("click", function(){			//상품추가(전체)에서  초성이동
		var id = this.id;
		if(id=='naviAll'){
			self.location="mainShopInsertP";
		}else{
			self.location="mainShopInsertP?id="+id;
		}
	});
	$("#ShopSearch").on("click", function(){		//상품추가(전체)에서 검색
		var keyword = $("#ShopInputSearch").val();
		self.location="mainShopInsertPSearch?keyword="+keyword;
	});
	$("#listAll").on("click",function(){			//리스트 전체보기

		if(this.classList=='listToggle'){			
			$('.dinone').css("display","none");	
			$(this).html("더보기");
		}else{
			$('.dinone').css("display","block");
			$(this).html("닫기");
		}
		this.classList.toggle("listToggle");
	});
	$(".shopNaviIW").on("click", function(){		//상품추가(추천)에서 초성이동
		var id = this.id;
		if(id=='naviAll'){
			self.location="mainShopInsertPW";
		}else{
			self.location="mainShopInsertPW?id="+id;
		}
	});
	$("#allCheck").on("click", function(){			//알람
		
		if($('#allCheck').prop('checked')){
			$('input[name=alramCheck]:checkbox').each(function(){
				$(this).prop('checked',true);
			});
		}else {
			$('input[name=alramCheck]:checkbox').each(function(){
				$(this).prop('checked',false);
			});
		}
	});
	
	$("#allCheckBtn").on("click", function(){		//알람
		if($('#allCheck').prop('checked')){
			$('input[name=alramCheck]:checkbox').each(function(){
				$(this).prop('checked',true);
			});
		}else {
			$('input[name=alramCheck]:checkbox').each(function(){
				$(this).prop('checked',false);
			});
		}
	});
	$("#refreshBtn").on("click", function(){	//알람에서 새로고침 버튼
		 location.reload();
	});
	$("#alramOkBtn").on("click", function(){	//알람 전체 추가
		$('input[name=alramCheck]:checked').each(function(){
			alert(this.value);
		});
	});
	$("#alramTrashBtn").on("click", function(){	// 알람 전체 삭제
		$('input[name=alramCheck]:checked').each(function(){
			
			var alr_no = this.value;
			$.get("alramRem?alram_no="+alr_no, function(data, status){});
			
		});
		 location.reload();
	});
	$(".alrIns").on("click", function(){		//알람 추가
		alert(this.getAttribute("data-alrNo"));
	});
	$(".alrRem").on("click", function(){			//알람 삭제
		var alr_no = this.getAttribute("data-alrNo");
		$.get("alramRem?alram_no="+alr_no, function(data, status){location.reload();});
	});
	$(".glyphicon-envelope").on("click", function(){	//알람 푸쉬버튼(알람 보내는 창 챙성)
		var inputNum = this.id.charAt(this.id.length-1);
		var ipm = document.getElementById("inputmsg"+inputNum);
		var ibm = document.getElementById("btnmsg"+inputNum);

		ipm.type= "text";
		ibm.style.visibility = "visible";
		
		
	});
	$(".btnmsg").on("click", function(){			//판매자가 구매자에게 알람 보내기
		
		var inputNum = this.id.charAt(this.id.length-1);
		var ipm = document.getElementById("inputmsg"+inputNum);
		var prod_no = this.value;
		var pushMsg = ipm.value;
//		$.get("pushToBuyer?searchText="+pushMsg, function(data, status){location.reload();});
		$.ajax({
			type:"GET",
			url:"pushToBuyer?searchText="+pushMsg,
			data:{},
			success:function(data){
			console.log("푸쉬완료");
			}
		});
			    location.reload();
//		 $.ajax({
//			 	type:'post',
//		    	url:"pushToProd",
//		    	headers:{
//					"Content-Type" : "application/json",
//					"X-HTTP-Method-Override" : "POST"
//				},
//				data:{
//					prod_no : prod_no,
//					pushMsg : pushMsg
//				},
//				success:function(result){
//					console.log("푸쉬완료");
//				}
//		    });
//		delay(function(){	
//			 location.reload();
//		}, 3000);
	});
});
var delay = (function(){
	
	var timer = 0;

	return function(callback, ms){

	clearTimeout (timer);

	timer = setTimeout(callback, ms);

	};

})();
function InfoMap(){	//멤버가 가진 매장에 대한 정보로 지도 생성
	console.log(mem_no)	//jsp파일에 세션에서 멤버no를 받아옴
	$.ajax({
		url:"myshop",
          data: {
              mem_no : mem_no,
          },
         dataType: 'jsonp',
		success:function(data){	
			console.log(data[0].shop_name);
			console.log(data);
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new daum.maps.LatLng(data[0].shop_gps_latitude,data[0].shop_gps_longitude), // 지도의 중심좌표
		        level: 4 // 지도의 확대 레벨
		    };

			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new daum.maps.Map(mapContainer, mapOption); 
			
			
		//마커추가
			

			var imageSrc = "resources/images/market.png";
			var imageSize = new daum.maps.Size(30, 25); 
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		    
		 // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다

		        markerPosition = new daum.maps.LatLng(data[0].shop_gps_latitude,data[0].shop_gps_longitude); // 마커가 표시될 위치입니다

			//마커 찍어주기
		    var marker = new daum.maps.Marker({	
				position : markerPosition,
				image: markerImage
			});
			
			marker.setMap(map);
			var shop_addr = data[0].addr_si+' '+data[0].addr_gu+' '+data[0].addr_dong+' '+data[0].addr_bunzi;
			var shop_number= data[0].shop_phone;
			var shop_explain = data[0].shop_explain;
			var shop_explain2="";
			if(shop_explain.length>10){
				shop_explain2 += '<p>'+shop_explain.substring(10, shop_explain.length);
				shop_explain =  shop_explain.slice(0, 10);
				if(shop_explain2.length>15) {
					shop_explain2 = shop_explain2.substring(0, 13) +'...';
				}
			}
			//그 메모추가
			var iwContent = 
			'<div class="wrap">' + 
			'		<div class="info">' + 
			'			<div class="title">' + data[0].shop_name +
			'        	</div>' + 
		    '		<div class="body">' + 
		    '			<div class="img">' +
		    '				<img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
		    '			</div>' + 
		    '			<div class="desc">' + 
		    '				<div class="ellipsis">'+shop_addr+'</div>' + 
		    '				<div><a href=https://'+data[0].shop_homepage+'>'+data[0].shop_homepage+'</a>, '+shop_number+'</div>' +
		    '				<div>영업시간 : '+data[0].shop_bh+'</div>'+
		    '				<div>매장설명 : '+shop_explain+shop_explain2+'</div>'+
		    '			</div>' + 
		    '		</div>' + 
		    '	</div>' +    
		    '</div>'
			, // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new daum.maps.LatLng(data[0].shop_gps_latitude,data[0].shop_gps_longitude); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성하고 지도에 표시합니다
			var infowindow =  new daum.maps.CustomOverlay({
				map: map, // 인포윈도우가 표시될 지도
				position : iwPosition, 
				content : iwContent
			});
		}
	
 	});
}

function InfoShop(){ 	//매장정보 불러옴
	$.ajax({
		url:"myshop",	//모바일컨트롤러
          data: {
              mem_no : mem_no,
          },
         dataType: 'jsonp',
		success:function(data){	
			console.log(data[0].shop_name);
			var addr = data[0].addr_si +" "+ data[0].addr_gu +" "+ data[0].addr_dong  
			$("#shopName").val(data[0].shop_name);
			$("#shopAdr").val(addr);
			$("#shopHp").val(data[0].shop_homepage);
			$("#shopEx").val(data[0].shop_explain);
			$("#shopBunzi").val(data[0].addr_bunzi);
			$("#shopBh").val(data[0].shop_bh);
			
			
			
		}
	
 	});
	
}

function SPProdclick(prod_no, mem_no) {

	var flag = confirm("삭제하시겠습니까?");
	if (flag) {
		self.location= "SPProd?prod_no="+prod_no+"&mem_no="+mem_no;

	}
}

function SPSoldclick(prod_no, mem_no) {

	var flag = confirm("차단상품에서 확인할수있습니다.");
	if (flag) {
		self.location= "SPSold?prod_no="+prod_no+"&mem_no="+mem_no;

	}
}

function SPSoldOclick(prod_no, mem_no) {

	alert("상품 관리에서 확인 하실수 있습니다.");
	self.location= "SPSoldO?prod_no="+prod_no+"&mem_no="+mem_no;
}
function SPProdInsertclick(prod_no, mem_no) {

	var flag = confirm("등록하시겠습니까?");
	if (flag) {
		self.location= "SPProdInsert?prod_no="+prod_no+"&mem_no="+mem_no;

	}
}


