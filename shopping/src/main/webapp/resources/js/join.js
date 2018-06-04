var status = true;
$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	$("#login").on("click", function(){
		checkIt();
		if(status){
			formObj.attr("action", "join");
			formObj.attr("method", "POST");
			formObj.submit();
		}else {
			alert("ㅎㅇ");
		}
	});
	$("#register").on("click", function(){
		self.location = "registerform1";
	});

});
function checkIt(){
	status = true;
	
	if(!$.trim($("#id").val())){
		alert("아이디를 입력하세요.");
		$("#id").focus();
		status=false;
		return false;
	}
	
	if(!$.trim($("#passwd").val())){
		alert("비밀번호를 입력하세요.");
		$("#passwd").focus();
		status=false;
		return false;
	}
}