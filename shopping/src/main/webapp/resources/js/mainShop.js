$(document).ready(function(){
	if(document.getElementById('map')!=null){
		InfoMap();
	}
	InfoShop();
	var formObj = $("form");
	$("#shopMod").on("click", function(){
		formObj.attr("action", "mainShopMod");
		formObj.submit();
	});
	$(".shopNavi").on("click", function(){
		var id = this.id;
		if(id=='naviAll'){
			self.location="mainShopProd";
		}else{
			self.location="mainShopProd?id="+id;
		}
	});
	$(".shopNaviI").on("click", function(){
		var id = this.id;
		if(id=='naviAll'){
			self.location="mainShopInsertP";
		}else{
			self.location="mainShopInsertP?id="+id;
		}
	});
	$("#allCheck").on("click", function(){
		
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
	
	$("#allCheckBtn").on("click", function(){
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
	$("#refreshBtn").on("click", function(){
		 location.reload();
	});
	$("#alramOkBtn").on("click", function(){
	
	});
	$("#alramTrashBtn").on("click", function(){
	
	});
});
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
			

			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			var imageSize = new daum.maps.Size(24, 35); 
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		    
		 // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다

		        markerPosition = new daum.maps.LatLng(data[0].shop_gps_latitude,data[0].shop_gps_longitude); // 마커가 표시될 위치입니다

			//마커 찍어주기
		    var marker = new daum.maps.Marker({	
				position : markerPosition,
				image: markerImage
			});
			
			marker.setMap(map);
			
			//그 메모추가
			var iwContent = '<div class="wrap">' + 
		    '    <div class="info">' + 
		    '        <div class="title">' + 
		    		data[0].shop_name + 
		    '        </div>' + 
		    '        <div class="body">' + 
		    '            <div class="img">' +
		    '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
		    '           </div>' + 
		    '            <div class="desc">' + 
		    '                <div class="ellipsis">'+data[0].shop_homepage+'</div>' + 
		    '  				 <div><a href=https://'+data[0].shop_homepage+'>홈페이지</a></div>' +
		    '  				 <div>영업시간 : '+data[0].shop_bh+'</div>'+		//영업시간 수정바람
		    '            </div>' + 
		    '        </div>' + 
		    '    </div>' +    
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

	var flag = confirm("품절관리에서 확인할수있습니다.");
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


