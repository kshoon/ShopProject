<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/logo.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/register.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d7fa1315630f585572f6d7cd683066d&libraries=services"></script>
		<script src='${pageContext.request.contextPath}/resources/js/register.js'></script>
</head>

<style>
/* 	div {
		border:1px solid gray;
	} */
	
	#gugu, #papa {
		border-radius: 25px;
	}
	.regiSelect{
		font-size:3rem;
		color:white;
		text-align:center;
		position:relative;
		top:45%;
	}
</style>
<body>
<jsp:include page="regiNaviTop.jsp" />
	<div class="container">
		<div class="row" style="padding-top:50px;">
			<div class="col-sm-5"  style="height:500px; background-color:mediumslateblue;" id="gugu">
				<p class="regiSelect">일반사용자</p>
				<!-- <button type="button" class="btn" id="gugu" value=1>구매자</button> -->
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-5"  style="height:500px; background-color:mediumslateblue;" id="papa">
				<p class="regiSelect">판매자</p>
				<!-- <button type="button" class="btn" id="papa" value=2>판매자</button><br> -->
			</div>
		</div>
		<div class="row"  style="padding-top:20px;">
			<div class="col-sm-5"></div>
			<div class="col-sm-2">
				<button type="button" class="btn" id="cancle">취소</button>
			</div>
			<div class="col-sm-5"></div>
		</div>
		
		
		
	</div>
</body>
</html>