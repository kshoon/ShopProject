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
      <a class="navbar-brand" href="main">쇼핑깜빡이</a>
    </div>

    <div class="collapse navbar-collapse" id="myNavbar"> <!-- 가운데 창 collapse??-->
    
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>

    </div>
  </div>
</nav>
<!-- 검색창  -->

	<div class="container">
		<div class="dropdown">
		<form class="form-inline" role="search" id="Search">
			<div class="form-group form-group-lg ">
    			<input type="text" class="form-control" id="mainInputSearch"placeholder="wanna">
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
   <table class="table">
	<tr>
		<th>상품명</th>
		<th>등록일</th>
		<th>근처 매장</th>
		<th>가까운 매장</th>
		<th>삭제</th>
	</tr>
   	<c:forEach items="${wlist}" var = "wlist">
			<tr>

				<td>${wlist.product_name}</td>
				<td>
					<fmt:formatDate pattern="yyyy.MM.dd" value="${wlist.wishlist_date}"/>
				</td>
				
				<td> 
						<button type='button' class='btn mak' value="${wlist.product_no}">
						<!--<span class='glyphicon glyphicon-home'></span>5  -->위치정보가 없습니다.</button>
						<div class="makdiv">
							<ul class="makul" id="wm_${wlist.wishlist_no }">
								<li>
								</li>
							</ul>
						</div>					
				</td>
				<td><button type='button' class='btn str' value="${wlist.product_no}">위치정보가 없습니다.</button></td>
				<td><button type='button' class='btn rem' value="${wlist.wishlist_no}"><span class='glyphicon glyphicon-remove'></span></button></td>
			</tr>
		</c:forEach>
<%-- 		  	<c:forEach items="${sessionScope.wlist}" var = "wlist">
			<tr>

				<td>${sessionScope.wlist.product_name}</td>
				<td>
					<fmt:formatDate pattern="yyyy.MM.dd" value="${sessionScope.wlist.wishlist_date}"/>
				</td>
				
				<td> 
						<button type='button' class='btn mak' value="${sessionScope.wlist.product_no}">
						<!--<span class='glyphicon glyphicon-home'></span>5  -->위치정보가 없습니다.</button>
						<div class="makdiv">
							<ul class="makul" id="wm_${sessionScope.wlist.wishlist_no }">
								<li>
								</li>
							</ul>
						</div>					
				</td>
				<td><button type='button' class='btn str' value="${sessionScope.wlist.product_no}">위치정보가 없습니다.</button></td>
			</tr>
		</c:forEach> --%>
	</table>
   <form>
   
   
   <!--수정수정수정  -->
  <%--  <input type="hidden" id="mem_id"  value="${member.member_no }"> --%>
  <input type="hidden" id="mem_no" value="${sessionScope.member.member_no }">

  
   </form>
    
  </div>
</div>
  <!-- 관련 이미지 컨텐츠1  -->
<!-- <div class="container bg-3 text-center" id="con1">    
  <div class="row">
    <div class="col-sm-4">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-4"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-4"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div> --><!-- <br>
<div class="container bg-3 text-center"  id="con2">
	<div class="row">
	<div class="col-sm-12"><br><br><br><br><br><br><br><br><br><br><br><br><br>	</div>
	</div>
</div>  -->
<!-- 관련 이미지 컨텐츠2  -->
<!-- <div class="container bg-3 text-center" id="con3">    
  <div class="row">
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div><br><br> -->

<footer class="container-fluid text-center">
  <p>Footer Text</p>
      아이디: ${member.member_id} <br>	
   번호 : ${sessionScope.member.member_no } <br>

</footer>
</body>
</html>
