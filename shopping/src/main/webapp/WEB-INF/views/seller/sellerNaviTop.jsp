<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <nav class="navbar navbar-default navbar-fixed-top">
 <!--전체 폭 -->
    <div class="navbar-header"> <!--로고 -->
 		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <!-- <a class="navbar-brand" href="main">쇼핑깜빡이</a> -->
	<a class="navbar-brand" href="main" style="font-size: 2.5rem; color:white; margin-left:850px;">
		 <span>쇼핑깜빡</span> <i class="fa fa-lightbulb-o" style="margin-left: -5px; margin-right: -5px"></i> <span>이</span>
	</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar"> <!-- 가운데 창 collapse??-->
     
 
      <ul class="nav navbar-nav navbar-right" style="margin-right:15px;">
        <li><a href="logout" style="color:white;"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
      
		<ul class="nav navbar-nav navbar-right" style="color:white">
       		<li style="padding-top:15px; padding-bottom:15px"> <span style="color:white; margin-left: 5px">${sessionScope.member.member_id }(${sessionScope.member.member_name })님 환영합니다.</span></li>
      	</ul>
      		<!-- <div class="dropdown navbar-right">
  			<button style="background-color:mediumslateblue; border-color:white;" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">메뉴
  			<span class="caret"></span></button>
  			<ul class="dropdown-menu">
	    		<li><a href="main">홈</a></li>
    			<li><a href="mainShopProd">상품관리</a></li>
    			<li><a href="mainShopInfo">매장관리</a></li>
    			<li><a href="mainShopAlram">알림보관함</a></li>
    			<li><a href="getQR?code=shop&width=300&height=300">코드생성</a></li>
  			</ul>
		</div> -->
    </div>
</nav>