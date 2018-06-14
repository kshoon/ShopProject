<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
       <!-- <div class="dropdown navbar-right">
  			<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">내매장보기
  			<span class="caret"></span></button>
  			<ul class="dropdown-menu">
	    		<li><a href="#">통합관리</a></li>
    			<li><a href="#">A마트</a></li>
    			<li><a href="#">B마트</a></li>
  			</ul>
		</div> -->
		<ul class="nav navbar-nav navbar-right" style="color:white">
       		<li style="padding-top:15px; padding-bottom:15px"> <span style="color:white; margin-left: 5px">${sessionScope.member.member_id }(${sessionScope.member.member_name })님 환영합니다.</span></li>
      	</ul>
    </div>
  </div>
</nav>