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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  <style>  
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background-color:black;
    }

    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    th {
   	 font-weight: bold;
   	  text-align: center;
    }
    body { padding-top: 50px; }
    

	.dropdown {
		padding-top: 10px;
	}

	.sh1 {
		letter-spacing: -2px; 
	}
	#sellNaviT{
		padding-top:15px;
		font-size:3rem;
		text-align:center;
		border-bottom:2px solid gray;
	}
	#sellNaviT>div>a{
		color:black;
	}

  </style>
</head>
<script>
/*  document.location.href="mainShopNearW"; */ 
</script>
<body>


<!-- 젤위에 -->
<jsp:include page="seller/sellerNaviTop.jsp" />
	
	<div class="container">
		<div class="row" id="sellNaviT">
			<div class="col-sm-3">
    			<a href="main">홈으로</a>
    		</div>
   			 <div class="col-sm-3">
    			<a href="mainShopProd">내 상품 관리</a>
   			</div>
    		<div class="col-sm-3">
    			<a href="mainShopInfo">매장 정보 관리</a>
    		</div>
    		<div class="col-sm-3">
    			<a href="mainShopAlram">알림보관함</a>
    		</div>
    		<!-- <div class="col-sm-3">
    			<a href="getQR?code=shop&width=300&height=300">코드생성</a>
    		</div> -->
		</div> 
	<!-- 메인화면 --><!-- 통계부분 -->

		<h1 class="sh1">${shop.shop_name} 환영합니다.</h1>
		<div class="row" style="margin-top:30px;">
			<div class="col-sm-5" style="height:400px;">
				<span class="chartName">가장 많이 추가된 상품입니다.</span>
				<canvas id="Chart1"></canvas>
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-5" style="height:400px;">
				<span class="chartName">인근 사람들이 많이 사려하는 상품입니다.</span>
				<canvas id="Chart2"></canvas>
			</div>
		</div>
		<div style="padding-top: 100px">
			
		</div>
		<div>
		
		</div>
		
		
	</div>
	



</body>
<script src='${pageContext.request.contextPath}/resources/js/chartS.js'></script>

</html>
