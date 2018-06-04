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
    

	.dropdown {
		padding-top: 10px;
	}
/*     .dropdown-menu{
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 360px;
    min-height: 50px;

    z-index: 99;
    } */

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
       		<li style="padding-top:15px; padding-bottom:15px"> <span style="color:white; margin-left: 5px">${sessionScope.member.member_name }님 환영합니다.</span></li>
       		<li style="margin-left: 5px"> <a href="push/sendPush"> 알림발송 </a> </li>
      	</ul>
      	
    </div>
  </div>
</nav>
	<!-- 매장 선택 4개정도 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-6">A마트</div><!-- 1.div,form 2.table 3.버튼 -->
			<div class="col-sm-6">B마트</div>
		</div>
		<div class="row">
			<div class="col-sm-6">C마트</div>
			<div class="col-sm-6">D마트</div>
		</div>
		
		
		
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
