<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

    z-index: 1;
    }

  </style>
</head>
<body>
<!-- 젤위에 -->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container"> <!--전체 폭 -->
    <div class="navbar-header"> <!--로고 -->
  <!--     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button> -->
      <a class="navbar-brand" href="#">쇼핑깜빡이</a>
    </div>

    <div class="collapse navbar-collapse" id="myNavbar"> <!-- 가운데 창 collapse??-->
    
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>

    </div>
  </div>
</nav>
<!-- 검색창  -->

	<div class="container">
		<div class="dropdown">
		<form class="form-inline" role="search" id="Search">
			<div class="form-group form-group-lg ">
    			<input type="text" class="form-control" id="mainInputSearch"placeholder="Search">
    			<button type="submit" class="btn btn-default btn-lg" id="mainSearch"><span class="glyphicon glyphicon-search"></span></button>
  			</div>
		</form>
			<table class="dropdown-menu">
			</table>
		</div>
	</div>
  

<!-- 위시리스트  -->
<div class="jumbotron">
  <div class="container text-center">
    <h1>위시리스트</h1>      
    <p>등록되었던 위시리스트 파바박</p>
    아이디: ${member.member_id} <br>	
   번호 : ${member.member_no }
    
  </div>
</div>
  <!-- 관련 이미지 컨텐츠1  -->
<div class="container bg-3 text-center" id="con1">    
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
</div><br>
<div class="container bg-3 text-center"  id="con2">
	<div class="row">
	<div class="col-sm-12"><br><br><br><br><br><br><br><br><br><br><br><br><br>	</div>
	</div>
</div> 
<!-- 관련 이미지 컨텐츠2  -->
<div class="container bg-3 text-center" id="con3">    
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
</div><br><br>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
