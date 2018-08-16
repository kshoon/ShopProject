$(document).ready(function(){
	$("#mainInputSearch").focus(function(){
		$(".dropdown-menu").css("display","block");
		$(".dropdown-menu").append("<tr class='resmenu'><td>최근등록상품</td></tr>");
		
	});
	$("#mainInputSearch").blur(function(){
		$(".dropdown-menu").css("display","none");	
		$(".resmenu").remove();
		$("#mainInputSearch").val("");
		
	});
	$("#mainInputSearch").keyup(function(){
		var keyval = $("#mainInputSearch").val();
		if($("#mainInputSearch").val()==""){
			$(".resmenu").remove();
			$(".dropdown-menu").append("<tr class='resmenu'><td>최근등록상품</td></tr>");
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
							$(".dropdown-menu").append("<tr class='resmenu' id='tr["+data[i].product_no+"]'>" 
									+"<td width=60%>"+data[i].product_name+"</td>"
									+"<td><button type='button' class='btn ins' value='"+data[i].product_no+"'>등록</button></td>"
									+"<td><button type='button' class='btn mak' value='"+data[i].product_no+"'><span class='glyphicon glyphicon-home'></span>5</button></td>" 
									+"<td><button type='button' class='btn str' value='"+data[i].product_no+"'>500m</button></td></tr>");
						}						
					}
				});
			}, 100);
			
		}
	});
	$(".btn mak").on("click", function(){
		alert("ㅎㅇ");
	});
	$("#imgTest").on("click", function(){
		var keyword = '진라면';
		alert(keyword);
	/*	var settings = {
				"async": true,
				  "crossDomain": true,
				  "url": "https://openapi.naver.com/v1/search/image?query="+keyword,
				  "method": "GET",
				  headers: {
				    "X-Naver-Client-Id": "i47n_IJpK5xCItQ86hXJ",
				    "X-Naver-Client-Secret": "89gdOaQLoj",
				    "Cache-Control": "no-cache",
				    "Postman-Token": "45fce144-31aa-4e67-8b46-2c5e680244e7"
				  }
				}

				$.ajax(settings).done(function (response) {
				  console.log(response);
				});*/
		$.ajax({
			
			url: "https://openapi.naver.com/v1/search/image",
			type: "GET",
			headers: {
			    "X-Naver-Client-Id": "i47n_IJpK5xCItQ86hXJ",
			    "X-Naver-Client-Secret": "89gdOaQLoj",
			    "Cache-Control": "no-cache",
			    "Postman-Token": "45fce144-31aa-4e67-8b46-2c5e680244e7"
			},
			data: {
				query:keyword,
				output: "json"
			},
			dataType: "jsonp",
			success:function(result) {
				alert("ㅎㅇ");
			}
			
			
		});
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









