<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page session="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
  <title>쇼핑깜빡이</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/logo.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainS.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d7fa1315630f585572f6d7cd683066d&libraries=services"></script>
		<script>
		var mem_no = ${sessionScope.member.member_no }
		</script>
  <script src='${pageContext.request.contextPath}/resources/js/mainShop.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  <style>  
	.nearWList {
		width : 100%;
		font-size : 3rem;
	}
	input{
		font-size : 2rem;
		border: 0;
		outline: 0;
		background: transparent;
		border-bottom: 1px solid gray;
		width : 50%;
		
	}
	input:-webkit-autofill {
		-webkit-box-shadow: 0 0 0 30px white inset;
	}
	button {
		background-color:mediumslateblue;
		color : white;
	}
	#navi4{
		background-color: thistle;
	}
	a, a:hover{
		color:black;
	}
	/* 	.container >.row > div {
		border-right : 2px solid gray;
		
	} */
	
  </style>
</head>

<body>



<!-- 젤위에 -->
<jsp:include page="sellerNaviTop.jsp" />

	<section id="#wrap_area">
 	<div id="left_area">
 		<jsp:include page="sellerNaviLeft.jsp" />
 	</div>
	<div id="right_area">
	<div style="border-bottom:2px solid gray; font-size:3rem; margin-top:30px;margin-bottom:5px;">
		알림보관함
	</div>
	<div class="row content" id="midalvar">
			 <div class="col-sm-3" >
				<a href="mainShopAlram"> 받은 알림함</a>
			 </div>
			 <div class="col-sm-3" style="background:lavender;">
				<a href="mainShopNearW">  알림 보내기 </a>
			 </div>
	</div>
  		<div class="row content">
   			 <div class="col-sm-3 sidenav">
      			
      			<h2>알람 보내기</h2>    
    		</div>
    		<div class="col-sm-9" style="margin-top:50px;">
    			<c:forEach items="${plist}" var = "plist" varStatus="status">
					<div class="nearWList">
						${plist.product_name} 
						<span style="padding:1px 1rem 1px 1rem;background-color:mediumslateblue; border-radius:50%;color:white;"> ${plist.countP}</span>
          				<span class="glyphicon glyphicon-envelope" style="color:mediumslateblue;" id="putmsg${status.index}"></span>
 						<input type="hidden" class="pushInput" value="${slist.shop_name }에서 ${plist.product_name}를 팔고있습니다." id="inputmsg${status.index}">
 						<button style="visibility:hidden" class="btn btnmsg" id="btnmsg${status.index}" value="${plist.product_no}">보내기</button> 
 						
					</div>
				</c:forEach>
    		</div>
    	</div>

	</div>
	</section>
	

</body>
</html>
