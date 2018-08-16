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
	#navi2{
		background-color: thistle;
	}
  </style>
</head>
<script>
	var navi = 2;
</script>
<body>



<!-- 젤위에 -->
<jsp:include page="sellerNaviTop.jsp" />
	
	<!--상품관리 -->
<section id="#wrap_area">
 	<div id="left_area">
 		<jsp:include page="sellerNaviLeft.jsp" />
 	</div>
	<div id="right_area">
	

		<div class="row content" id="midvar">
			 <div class="col-sm-3" style="background:lavender;">
				<a href="mainShopProd"> 보유상품</a>
			 </div>
			 <div class="col-sm-3">
				<a href="mainShopInsertPW">  상품추가(추천) </a>
			 </div>
			 <div class="col-sm-3">
				<a href="mainShopInsertP">  상품추가(전체)	</a>
			 </div>
			 <div class="col-sm-3">
				<a href="mainShopSold">  차단상품	</a>
			 </div>
		</div>
			<h2>&gt;&gt;&gt;&gt;&nbsp;매장이 보유한 상품들 입니다.</h2>
			<h3>
			<span class="glyphicon glyphicon-remove"style="color:black;"></span>로 삭제,
			<span class="glyphicon glyphicon-ban-circle"style="color:black;"></span>로 알림이 안뜨게 할수 있습니다.
			</h3>
		<ul class="nav nav-tabs">
			<li class="nav-item nav-link active"><a href="#" class='shopNavi' id='naviAll'>전체</a></li>
    		<li><a href="#" class='shopNavi' id='naviA'>ㄱ</a></li>
    		<li><a href="#" class='shopNavi' id='naviB'>ㄴ</a></li>
    		<li><a href="#" class='shopNavi' id='naviC'>ㄷ</a></li>
    		<li><a href="#" class='shopNavi' id='naviD'>ㄹ</a></li>
    		<li><a href="#" class='shopNavi' id='naviE'>ㅁ</a></li>
    		<li><a href="#" class='shopNavi' id='naviF'>ㅂ</a></li>
    		<li><a href="#" class='shopNavi' id='naviG'>ㅅ</a></li>    
    		<li><a href="#" class='shopNavi' id='naviH'>ㅇ</a></li>
    		<li><a href="#" class='shopNavi' id='naviI'>ㅈ</a></li>
    		<li><a href="#" class='shopNavi' id='naviJ'>ㅊ</a></li>
    		<li><a href="#" class='shopNavi' id='naviK'>ㅋ</a></li>
    		<li><a href="#" class='shopNavi' id='naviL'>ㅌ</a></li>
    		<li><a href="#" class='shopNavi' id='naviM'>ㅍ</a></li>
    		<li><a href="#" class='shopNavi' id='naviN'>ㅎ</a></li>
    		<li><a href="#" class='shopNavi' id='naviO'>A~E</a></li>
    		<li><a href="#" class='shopNavi' id='naviP'>F~J</a></li>
    		<li><a href="#" class='shopNavi' id='naviQ'>K~O</a></li>
    		<li><a href="#" class='shopNavi' id='naviR'>P~T</a></li>
    		<li><a href="#" class='shopNavi' id='naviS'>U~Z</a></li>
    		<li><a href="#" class='shopNavi' id='naviT'>0~9</a></li>
  		</ul>
  		
			<c:forEach items="${plist}" var = "plist">
			
				<c:if test="(plist.index%4)==1">		<div class="row"></c:if>
				<div class="col-sm-3" style="padding-top:5px;">
					<p style="font-size:24px;">${plist.product_name} 
						<a href="#" onclick="SPProdclick('${plist.product_no}','${member.member_no }'); return false;">
							<span class="glyphicon glyphicon-remove"style="color:black;"></span>
							
						</a>
						<a href="#" onclick="SPSoldclick('${plist.product_no}','${member.member_no }'); return false;">
							<span class="glyphicon glyphicon-ban-circle"style="color:black;"></span>
							
						</a>
					</p>
				</div>	
				<c:if test="(plist.index%4)==1">		</div></c:if>
			</c:forEach>
		
	</div>
</section>


</body>
</html>
