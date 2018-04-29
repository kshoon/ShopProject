$(document).ready(function(){
	$("#mainInputSearch").focus(function(){
		$(".dropdown-menu").css("display","block");
		$(".dropdown-menu").append("<tr class='resmenu'><td>최근등록상품</td></tr>");
		
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

	$(document).on("click", ".ins", function(){
		alert("등록");
		alert(this.value);
	});
	
	$(document).on("click", ".mak", function(){
		alert("주변 정보");
	});
	
	$(document).on("click", ".str", function(){
		alert("최단거리");
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
