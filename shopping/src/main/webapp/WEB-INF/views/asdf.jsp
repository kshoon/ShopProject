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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back_pro.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/logo.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d7fa1315630f585572f6d7cd683066d&libraries=services"></script>
  <script src='${pageContext.request.contextPath}/resources/js/main.js'></script>
  <script src="https://d3js.org/d3.v5.min.js"></script>

  <style>
  body{
 	/*  background: url('${pageContext.request.contextPath}/resources/images/loader.gif');
 	 background-repeat : no-repeat ;
 	 background-size : 1920px; */ /* 720px; */
  }
  .mapcon{
  	/* background: url('${pageContext.request.contextPath}/resources/images/css-loader.gif'); */
  	/* background-color:AntiqueWhite; */
  	background-color:lightgray;
	 background-repeat : no-repeat ;
	 background-size : 100% 600px;
  }
  .jumbotron{
  	/* background-color: AntiqueWhite; */
  	background-color:lightgray;
  	padding-top:15px;
  }
  .wishdiv{
  	/* background-color:Beige; */
  	background-color: white;
  }
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background-color:white;
      border:none;
    }

    /* Add a gray background color and some padding to the footer */
/*     footer {
      background-color: #f2f2f2;
      padding: 25px;
    } */
    th {
   	 font-weight: bold;
   	  text-align: center;
    }
    body { padding-top: 50px; }
    
    /* .form-inline{
    	margin : 10px;
    } */
    #Search {
    	text-align : left;
    	/* background-color:Beige; */
    	background-color: white;
    	padding-top : 10px;
    }
    .dropdown-menu{
    	display: none;
    	position: absolute;
    	background-color: white;
    	padding:10px16px !important;
    	/* min-width: 950px; */
    	min-height: 50px;
    	width:89%;
    	left : 0%;
    	z-index: 99;
    }

	ul.makul {
		min-width:0;
		min-height:0;
    	list-style-type: none;
    	margin: 3px;
    	padding: 3px;
	}
	#modUl {
		min-width:0;
		min-height:0;
    	list-style-type: none;
    	margin: 10px;
    	padding: 10px;
	}

			/* 스크롤 */
	html, body {
		overflow:hidden;
	} 
	/* .wishdiv{
	height:200px;
	 overflow-y: auto;
	}  */
	tbody{
	width:100%;
	height:200px;
	 overflow-y: auto;
	 display:block;
	 boder:0;
	 margin-top : 6px;
	}
	thead{
	width:100%;
		display: block;
		height: 30px;
	}
	thead tr{top: 0;display: block;}
	thead th{width: 220px;}
	tbody tr{height: auto;}
	tbody td{width: 220px;text-align: center;} 
	
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    	border-top: 1px solid black;
    }
    .table>thead>tr>th {
    	border-bottom: 2px solid black;
	}
	.btn-default {
    	border-color: black;
	}
/*  검색창 */
	#mainInputSearch {
		width : 89%;
		border-color: black;
		
	}
	#mainSearch{
		width : 10.5%;
		float: right;
/*     	margin-right: 10px; */
	}


/* 애니메이션 */

#loading {
    position: absolute;
    top: 25%;
    left: 42%;
    width: 200px;
    height: 200px;
    border: 3px solid white;
    border-radius: 50%;

    -webkit-animation-name: example;
    -webkit-animation-duration: 4s;
    animation-name: example;
    animation-duration: 4s;
}
@-webkit-keyframes example {
    0%   {border-color: red;}
    25%  {border-color: yellow;}
    50%  {border-color: blue;}
    100% {border-color: green;}
}
@keyframes example {
    0%   {border-color: red;}
    25%  {border-color: yellow;}
    50%  {border-color: blue;}
    100% {border-color: green;}
} 
.mapIn{
	position:absolute;
	top:2%;
	left:2%;
	z-index:2;
	font-size:22px;
	color: black;
    background-color: rgba(255,255,255,0.5);
}
.CheckBox{
	float:left;
}
#CheckAll{
	margin:5px;
	width:20px;
	height:20px;
	vertical-align:middle;	
}
a, a:hover{
	color:black;
	text-decoration:none 
}
#allRemBtn{
	background-color:transparent;
	border:none;	
}
.mbf > * {
	height:50px;
	font-size:20px;
}
.mbf > input{
	width:70%;
}
.mbf > input, select{
	padding : 5px;
}
.modresult{
	border-bottom:1.5px solid black;
	padding-bottom:5px;
	 margin-bottom:20px;
}
.modshop1{
	position:relative;
}
.modshop1:hover{
	background-color: rgb(0,255,255,0.1);
}
.modshop2{
	position:absolute;
	right:3px; top:0px;
	width:150px;height:75px;
}

.modbody{
	boder:1px solid black;
}
.bookMarkN , .bookMarkI{
	position: absolute;
	right:3px;
	top : 5px;
	font-size:21px;
}
.bookMarkN{
	color:black;
}
.bookMarkI{
	color:orange;
}
p > .glyphicon  {
top : 3px;
} 
#allBook {
	color:orange;
}
svg{
	    top: 15%;
    left: 30%;
    position: absolute;
}
line {
	 stroke:rgb(255, 255,255);
    stroke-width:2
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
	<a class="navbar-brand" href="main" style="font-family: 'Gugi', cursive; font-size: 2rem; color: black;"> <span>쇼핑깜빡</span> <i class="fa fa-lightbulb-o" style="margin-left: -5px; margin-right: -5px"></i> <span>이</span></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar"> <!-- 가운데 창 collapse??-->
     
 
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
		<ul class="nav navbar-nav navbar-right" style="color:black">
       		<li style="padding-top:15px; padding-bottom:15px"> <span style="color:black; margin-left: 5px">${sessionScope.member.member_id }(${sessionScope.member.member_name })님 환영합니다.</span></li>
      	</ul>
    </div>
  </div>
</nav>
<!-- 검색창  -->
<div class="mapcon">
	<div id="loading"></div>
	<div class="container">
		<div class="dropdown" >
			<form class="form-inline" role="search" id="Search">
				<div class="form-group-lg ">
    				<input type="text" class="form-control" id="mainInputSearch" placeholder="wanna">    			
    				<button type="button" class="btn btn-default btn-lg" id="mainSearch"><!-- <span class="glyphicon glyphicon-search"></span> -->추가</button>
  				</div>
			</form>
			<!-- 자동완성  -->
			<table class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu3">
			</table>
		</div>
	</div>
	<!-- 지도  -->
	<div class="container">  
		<div id="map" style="width:100%;height:500px;">
			<p class="mapIn">주변의 모든 매장들입니다.</p>
		</div>
	</div>	
</div>

<!-- 위시리스트  -->
<div class="jumbotron">
	<div class="container">
		<P>전체개수:${wlist.size()} 
		전체선택:<input type="checkbox" id='CheckAll'> 
		 삭제: <button id="allRemBtn"><span class='glyphicon glyphicon-remove'></span></button> 
		 매장지정(검색):	<img src='${pageContext.request.contextPath}/resources/images/market.png'
					 alt='market' width='20' height='20' data-toggle="modal"  data-target="#imgModal" >
		<span class="glyphicon glyphicon-star" id="allBook"></span>			 
		</P>
		
	</div>
  <div class="container text-center wishdiv">
   <table class="table">
   <thead>
		<tr>
			<th onclick="nameSort(0)" id="sortN">상품명</th>
			<th onclick="nameSort(1)" id="sortL">등록일</th>
			<th>근처 매장</th>
			<th>최단거리 매장</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
   	<c:forEach items="${wlist}" var = "wlist">
			<tr>
				<td class="wlsN">
					<input type="checkbox" class='CheckBox' name='chk'  value='${wlist.wishlist_no}'>
					<a onclick="secondMap(${wlist.product_no})">${wlist.product_name}</a>
				</td>
				<td class="wlsD">
					<fmt:formatDate pattern="yyyy.MM.dd" value="${wlist.wishlist_date}"/>
				</td>
				
				<td> 
						<button type='button' data-toggle="modal"  data-target="#myModal" style="background-color:transparent;" class='btn mak' value="${wlist.product_no}">
						<!--<span class='glyphicon glyphicon-home'></span>5  -->위치정보가 없습니다.</button>
			
				</td>
				<td><button type='button' style="background-color:transparent;"class='btn str' value="${wlist.product_no}">위치정보가 없습니다.</button>
					<input type='hidden' class='strval' value='${wlist.product_no}'>
				</td>
				<td><button type='button' style="background-color:transparent;" class='btn rem' value="${wlist.wishlist_no}"><span class='glyphicon glyphicon-remove'></span></button></td>
			</tr>
		</c:forEach>
	</tbody>
		

	</table>
    
  </div>
</div>
<!-- 근처매장 모달 -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="modal_title">~~을 파는 매장입니다.</h4>
				</div>
				<div class="modal-body">
					<div id="map1" style="width: 100%; height: 400px"></div>
				</div>
				<div id="map1cont">
				<ul id="modUl">
				<!--<li>건물명 : 건물이름</li>
					<li>거리 : 거리</li> -->
				</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="hideMarkers()">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!--매장 지정 모달 -->
	<div class="modal fade" id="imgModal">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">알람을 받고싶은 매장명 혹은 지역을 검색해주세요.</h4>
				</div>
				<div class="modal-body">
					<div class="form-group form-group-lg mbf">									
   						<select id="modsel">
	        				<option value='1'>매장명</option>
        					<option value='2'>주소</option>
      					</select>
  						<input id="modSearch" placeholder="Search">
    					<button class="btn btn-default btn-lg" id="modSerchBtn"><span class="glyphicon glyphicon-search"></span></button>
					</div>
					<div class="modbody">

					</div>					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="hideMarkers()">Close</button>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
    var width = 450;
    var height = 450;

    var svg = d3.select("body").append("svg")
            .attr("width", width)
            .attr("height", height);

    var center_x = (width / 2);
    var center_y = (height / 2);

    // Calculate position of the circles, given a d=position and angle=current angle.
    var xpos_gen = function(d, angle) {
        return center_x + (((center_y - radius) * Math.sin(d)) * Math.sin(angle + d));
    };
    var ypos_gen = function(d, angle) {
        return center_y + (((center_y - radius) * Math.cos(d)) * Math.sin(angle + d));
    };

    // Defaults.
    var circle_count = 8;
    var radius = 20;

    // For short.
    var pi = Math.PI;

    // Calculate line start and end coordinates.
    var line_x1 = function(d) {
        return center_x - Math.sin(d) * (width / 2);
    };
    var line_x2 = function(d) {
        return center_x + Math.sin(d) * (width / 2);
    };
    var line_y1 = function(d) {
        return center_y - Math.cos(d) * (height / 2);
    };
    var line_y2 = function(d) {
        return center_y + Math.cos(d) * (height / 2);
    };

    // The data sets the initial position of the circles as well as their
    // relative positions to each other.
    var data = [];

    // Update the drawing with new parameters.
    var generate = function(circle_count) {
        // Refill the data.
        data = [];
        for (i = 0; i < circle_count; i++) {
            data.push((pi / circle_count) * i);
        }

        // Draw the lines
        var lines = svg.selectAll('line').data(data);
        var line_draw = function(l) {
            l.attr('x1', line_x1)
             .attr('y1', line_y1)
             .attr('x2', line_x2)
             .attr('y2', line_y2);
        };

        lines.enter()
                .append('line')
                .call(line_draw);

        lines.call(line_draw);

        lines.exit().remove();
    };

    generate(8);

    var update = function(angle) {
        // Generate new position functions in each call that depend on the current angle.
        var xpos = function(d) {
            return xpos_gen(d, angle);
        };

        var ypos = function(d) {
            return ypos_gen(d, angle);
        };

        var circles = svg.selectAll('circle').data(data);

        var circle_draw = function(circle) {
            circle.attr('r', radius)
                  .attr('cx', xpos)
                  .attr('cy', ypos);
        };

        circles.enter()
                .append('circle')
                .call(circle_draw);

        circles.call(circle_draw);

        circles.exit().remove();
    };

    // Base angle to make calculations
    // Ee increase this 1 degree each timer call.
    var angle = 0;

    d3.timer(function() {
        // Increase base angle.
        angle = angle + (Math.PI / 90);

        // Avoid angle growing too much.
        if (angle >= Math.PI * 2) {
            angle = 0;
        }

        // Update visuals.
        update(angle);
    });


</script>

</html>
