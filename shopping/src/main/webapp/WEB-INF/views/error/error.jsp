<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<h1>알수없는 에러가 발생 하였습니다.</h1>
	<h2>${exception.message}</h2>
	<button type="button" id="Emain">메인으로</button>
	<button type="button" id="Ehes">이전으로</button>
</body>
<script>
$("#Emain").on("click", function(){
	self.location = "login2";
});
$("#Ehes").on("click", function(){
	history.back();
});
</script>
</html>