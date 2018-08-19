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

	p {
		font-size : 1.8rem;
	}
	
	a {
		color : black;
	}
	a:hover {
		color : black;	
	}
	.dinone {
		display: none;
	}
	
	#listAll {
		float: right;
		background-color:transparent;
		border : none;
		font-size: 1.2em;
	}
	#navi2{
		background-color: thistle;
	}
  </style>
</head>

<body>



<!-- 젤위에 -->
<jsp:include page="sellerNaviTop.jsp" />	
	<!--상품관리 -->
	<section id="#wrap_area">
 	<div id="left_area">
 		<jsp:include page="sellerNaviLeft.jsp" />
 	</div>
	<div id="right_area">
		<div style="border-bottom:2px solid gray; font-size:3rem; margin-top:30px;margin-bottom:5px;">
			내 상품 관리
		</div>
	<div class="row content"  id="midvar">
			 <div class="col-sm-3">
				<a href="mainShopProd"> 보유상품</a>
			 </div>
			 <div class="col-sm-3">
				<a href="mainShopInsertPW">  상품추가(추천) </a>
			 </div>
			 <div class="col-sm-3"  style="background:lavender;">
				<a href="mainShopInsertP">  상품추가(전체)	</a>
			 </div>
			 <div class="col-sm-3">
				<a href="mainShopSold">  차단상품	</a>
			 </div>
		</div>
			<h2>&gt;&gt;&gt;&gt;&nbsp;전체 상품들 입니다.</h2>
			<h3><span class="glyphicon glyphicon-plus"style="color:black;"></span>로 추가할 수 있습니다.</h3>
			<!--검색창  -->
			<form class="form-inline" role="search">
				<div class="form-group form-group-lg" style="margin-left:75%">
    				<input type="text" class="form-control" id="ShopInputSearch" placeholder="Search">
    				<button type="button" class="btn btn-default btn-lg" id="ShopSearch"><span class="glyphicon glyphicon-search"></span></button>
  				</div>
			</form>
			
		<ul class="nav nav-tabs">
			<li class="active"><a href="#" class='shopNaviI' id='naviAll'>전체</a></li>
    		<li><a href="#" class='shopNaviI' id='naviA'>ㄱ</a></li>
    		<li><a href="#" class='shopNaviI' id='naviB'>ㄴ</a></li>
    		<li><a href="#" class='shopNaviI' id='naviC'>ㄷ</a></li>
    		<li><a href="#" class='shopNaviI' id='naviD'>ㄹ</a></li>
    		<li><a href="#" class='shopNaviI' id='naviE'>ㅁ</a></li>
    		<li><a href="#" class='shopNaviI' id='naviF'>ㅂ</a></li>
    		<li><a href="#" class='shopNaviI' id='naviG'>ㅅ</a></li>    
    		<li><a href="#" class='shopNaviI' id='naviH'>ㅇ</a></li>
    		<li><a href="#" class='shopNaviI' id='naviI'>ㅈ</a></li>
    		<li><a href="#" class='shopNaviI' id='naviJ'>ㅊ</a></li>
    		<li><a href="#" class='shopNaviI' id='naviK'>ㅋ</a></li>
    		<li><a href="#" class='shopNaviI' id='naviL'>ㅌ</a></li>
    		<li><a href="#" class='shopNaviI' id='naviM'>ㅍ</a></li>
    		<li><a href="#" class='shopNaviI' id='naviN'>ㅎ</a></li>
    		<li><a href="#" class='shopNaviI' id='naviO'>A~E</a></li>
    		<li><a href="#" class='shopNaviI' id='naviP'>F~J</a></li>
    		<li><a href="#" class='shopNaviI' id='naviQ'>K~O</a></li>
    		<li><a href="#" class='shopNaviI' id='naviR'>P~T</a></li>
    		<li><a href="#" class='shopNaviI' id='naviS'>U~Z</a></li>
    		<li><a href="#" class='shopNaviI' id='naviT'>0~9</a></li>
  		</ul>
		
		<c:forEach items="${plist}" var = "plist" varStatus="i">
				
				
				
					<c:if test="${i.index%4==0 && i.index <= 40}">		<div class="row"></c:if>

					<c:if test="${i.index%4==0 && i.index > 40}">		<div class="row dinone"></c:if>


						<div class="col-sm-3" style="padding-top:5px;">
							<p style="font-size:24px;">${plist.product_name} 
								<a href="#" onclick="SPProdInsertclick('${plist.product_no}','${member.member_no }'); return false;">
									<span class="glyphicon glyphicon-plus"style="color:black;"></span>
								</a>
							</p>
						</div>
				
					<c:if test="${i.index%4==3 || i.last}"></div></c:if>		
					<c:if test="${i.index > 40 && i.last}"> <button id="listAll">더보기</button></c:if>
				
				
		</c:forEach>

<%--  <c:forEach items="${plist}" var = "plist">

					<c:if test="(plist.index%4)==1">		<div class="row"></c:if>

						<div class="col-sm-3">
							<p>${plist.product_name} 
								<a href="#" onclick="SPProdInsertclick('${plist.product_no}','${member.member_no }'); return false;">
									<span class="glyphicon glyphicon-plus"style="color:black;"></span>
								</a>
							</p>
						</div>
				
					<c:if test="(plist.index%4)==1">		</div></c:if>

</c:forEach> --%>
 
	</div>
	</section>
	


</body>
</html>
