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

<body>



<!-- 젤위에 -->
<jsp:include page="sellerNaviTop.jsp" />

	<!--상품관리 -->
	<section id="#wrap_area">
 	<div id="left_area">
 		<jsp:include page="sellerNaviLeft.jsp" />
 	</div>
	<div id="right_area">
			<div class="row content"  id="midvar">
			 <div class="col-sm-3">
				<a href="mainShopProd"> 보유상품</a>
			 </div>
			 <div class="col-sm-3">
				<a href="mainShopInsertPW">  상품추가(추천) </a>
			 </div>
			 <div class="col-sm-3">
				<a href="mainShopInsertP">  상품추가(전체)	</a>
			 </div>
			 <div class="col-sm-3"  style="background:lavender;">
				<a href="mainShopSold">  차단상품	</a>
			 </div>
		</div>
		<h2>&gt;&gt;&gt;&gt;&nbsp;알람이 안뜨게 차단된 상품들 입니다.</h2>
		<hr style="border-width:3px">

			<c:forEach items="${plist}" var = "plist">
			
				<c:if test="(plist.index%4)==1">		<div class="row"></c:if>
				<div class="col-sm-3" style="padding-top:5px;">
					<p style="font-size:24px;">${plist.product_name} 
						<a href="#" onclick="SPSoldOclick('${plist.product_no}','${member.member_no }'); return false;">
							<span class="glyphicon glyphicon-ok-circle"style="color:black;"></span>
							
						</a>

					</p>
				</div>	
				<c:if test="(plist.index%4)==1">		</div></c:if>
			</c:forEach>
		
	</div>
	</section>
	

</body>
</html>
