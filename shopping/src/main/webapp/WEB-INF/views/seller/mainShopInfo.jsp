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


  </style>
</head>

<body>



<!-- 젤위에 -->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container"> <!--전체 폭 -->
    <div class="navbar-header"> <!--로고 -->
 		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <!-- <a class="navbar-brand" href="main">쇼핑깜빡이</a> -->
	<a class="navbar-brand" href="main" style="font-family: 'Gugi', cursive; font-size: 2rem; color: white;"> <span>쇼핑깜빡</span> <i class="fa fa-lightbulb-o" style="margin-left: -5px; margin-right: -5px"></i> <span>이</span></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar"> <!-- 가운데 창 collapse??-->
     
 
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
       <div class="dropdown navbar-right">
  			<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">내매장보기
  			<span class="caret"></span></button>
  			<ul class="dropdown-menu">
	    		<li><a href="#">통합관리</a></li>
    			<li><a href="#">A마트</a></li>
    			<li><a href="#">B마트</a></li>
  			</ul>
		</div>
		<ul class="nav navbar-nav navbar-right" style="color:white">
       		<li style="padding-top:15px; padding-bottom:15px"> <span style="color:white; margin-left: 5px">${sessionScope.member.member_id }(${sessionScope.member.member_name })님 환영합니다.</span></li>
      	</ul>
    </div>
  </div>
</nav>

	<!-- 매장 선택 4개정도 -->
	<div class="container">
		<div class="row"  style="padding-top: 40px">
			<div class="col-sm-6" id="map" style="height: 400px"></div>
			<div class="col-sm-6">
				<form method="POST">		
				<input type="hidden" name ="mem_no" value="${sessionScope.member.member_no }">
				매장명<input type="text" name ="shop_name" id="shopName"> <br>
				매장홈피	<input type="text" id="shopHp" name="shop_homepage"> <br>
				설명	<input type="text" id="shopEx" name="shop_explain"> <br>
				주소	<input type="text" id="shopAdr" name="shop_addr"> <br>
				상세	<input type="text" id="shopBunzi" name="addr_bunzi"> <br>
				사진	<input type="text" id="shopPi" name="shopPi"> <br>
				
				<button class='btn' id='shopMod'>수정</button>
				</form>
			</div>
		</div>
	</div>
	<div class="container">
	<jsp:include page="sellerNavi.jsp" />
	</div>

<footer class="container-fluid text-center">
   <form>
      
   <!--수정수정수정  -->
  <%--  <input type="hidden" id="mem_id"  value="${member.member_no }"> --%>
  <input type="hidden" id="mem_no" value="${sessionScope.member.member_no }">

   </form>
	<div class="container">
    <hr>
        <div class="text-center center-block">
            <p class="txt-railway"style="font-family: 'Gugi', cursive; font-size: 2rem; color: black; display:inline-block "> <span>쇼핑깜빡</span> <i class="fa fa-lightbulb-o" style="margin-left: -5px; margin-right: -5px"></i> <span>이</span></p>
            <br />
                <a href="https://www.facebook.com/bootsnipp"><i id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a>
	            <a href="https://twitter.com/bootsnipp"><i id="social-tw" class="fa fa-twitter-square fa-3x social"></i></a>
	            <a href="https://plus.google.com/+Bootsnipp-page"><i id="social-gp" class="fa fa-google-plus-square fa-3x social"></i></a>
	            <a href="mailto:bootsnipp@gmail.com"><i id="social-em" class="fa fa-envelope-square fa-3x social"></i></a>
			</div>
    <hr>
	</div>

</footer>
</body>
</html>
