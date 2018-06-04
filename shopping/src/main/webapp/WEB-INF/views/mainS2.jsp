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
  <script src='${pageContext.request.contextPath}/resources/js/mainS.js'></script>
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
       		<li style="margin-left: 5px"> <a href="push/sendPush"> 알림발송 </a> </li>
      	</ul>
      	
    </div>
  </div>
</nav>
	<!-- 판매자 근처 위시 보는 칸 -->
	<div class="container">
		<!-- 푸시하는곳으로 -->
		
		
		
	</div>


<footer class="container-fluid text-center">
  <p>Footer Text</p>
      아이디: ${member.member_id} <br>	
   번호 : ${sessionScope.member.member_no } <br>
   <form>
  <input type="hidden" id="mem_no" value="${sessionScope.member.member_no }">  
   </form>
</footer>
</body>
</html>
