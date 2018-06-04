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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d7fa1315630f585572f6d7cd683066d&libraries=services"></script>
  <script src='${pageContext.request.contextPath}/resources/js/main.js'></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
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
    
    .form-inline{
    	margin : 10px;
    }
    #Search {
    	text-align : center;
    }
    #con2{
    	background-color:gray;
    }
    .dropdown-menu{
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 360px;
    min-height: 50px;

    z-index: 99;
    }
    .makdiv{
    	background-color:white;
    	position:absolute;
        z-index: 1;
        min-width:0;
        min-height:0;
        left:60%;

    }
	ul.makul {
	        min-width:0;
        min-height:0;
    list-style-type: none;
    margin: 3px;
    padding: 3px;
	}
  </style>
</head>

<body>
<script>
function firstMap() {
	//좌표받기
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position){
        	fLat = position.coords.latitude; 
       	 fLon =position.coords.longitude; 
        	mapOp = {
        			center: new daum.maps.LatLng(fLat, fLon), // 지도의 중심좌표
        	        level: 3 // 지도의 확대 레벨
        	}
        	map = new daum.maps.Map(document.getElementById('map'), mapOp);
        });
    } else {
        alert("Geolocation is not supported by this browser.");
    }
}
firstMap()
</script>


<!-- 젤위에 -->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container"> <!--전체 폭 -->
    <div class="navbar-header"> <!--로고 -->
 		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="main">쇼핑깜빡이</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar"> <!-- 가운데 창 collapse??-->
     
 
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
		<ul class="nav navbar-nav navbar-right" style="color:white">
       		<li style="padding-top:15px; padding-bottom:15px"> <span style="color:white; margin-left: 5px">${sessionScope.member.member_name }님 환영합니다.</span></li>
      	</ul>
    </div>
  </div>
</nav>
<!-- 검색창  -->

	<div class="container">
		<div class="dropdown">
		<form class="form-inline" role="search" id="Search">
			<div class="form-group form-group-lg ">
    			<input type="text" class="form-control" id="mainInputSearch" placeholder="wanna">
    			<button type="button" class="btn btn-default btn-lg" id="mainSearch"><!-- <span class="glyphicon glyphicon-search"></span> -->추가</button>
  			</div>
		</form>
			<table class="dropdown-menu">
			</table>
		</div>
	</div>
  

<!-- 위시리스트  -->
<div class="container">
	<div id="map" style="width:100%;height:500px;">
		
	</div>
</div>
<div class="jumbotron">
  <div class="container text-center">

   <form>
   
   
   <!--수정수정수정  -->
  <%--  <input type="hidden" id="mem_id"  value="${member.member_no }"> --%>
  <input type="hidden" id="mem_no" value="${sessionScope.member.member_no }">

  
   </form>
    
  </div>
</div>

<footer class="container-fluid text-center">
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
