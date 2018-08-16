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
	.title{
		background-color: mediumslateblue !important;
		color:white;
	}
	/* ------매장정보 table style ----------*/
	#infoTable {
		padding-bottom: 3px;
		font-size: 16px;
	}
	
	#infoTable th, td {
		padding-bottom: 15px;
	}
	
	#infoTable th { 
		text-align: left;
		letter-spacing: 1.5px;

	}
	
	#infoTable td input{
		width: 100%;
		border: 0;
		outline: 0;
		background: transparent;
		border-bottom: 1px solid gray; 
	}
	
	input:-webkit-autofill {
		-webkit-box-shadow: 0 0 0 30px white inset;
	}
	
	#infoTable td input[readonly="readonly"] {
		border-bottom: 1px solid black;
		cursor: default;
 	}
	
	
	/*수정 버튼*/
	.modBtn {
	    border: none;
	    background-color: mediumslateblue ;
	    color: white;
	    padding: 10px 32px; 
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	}
	
	.btn {
		float: right; 
	}
	

	

  </style>
</head>

<body>

<!-- 젤위에 -->
<jsp:include page="sellerNaviTop.jsp" />
	<!-- 매장 선택 4개정도 -->


	<div class="container">
		<div class="row"  style="padding-top: 40px">
			<div class="col-sm-6" id="map" style="height: 400px"></div>
			<div class="col-sm-6">
				<form class="form-horizontal" method="POST" style="margin-left:25px;">
					<input type="hidden" name="mem_no"
						value="${sessionScope.member.member_no }">
					
				
					<table style="width: 100%;" id="infoTable">
						
						<tr>
							<th colspan="2"> 매장 이름 </th>
							<td colspan="4"> <input type="text" name="shop_name" id="shopName" readonly="readonly"> </td>
						</tr>
						
						<tr>
							<th colspan="2"> 매장 홈페이지 </th>
							<td colspan="4"> <input type="text" id="shopHp" name="shop_homepage"> </td>
						</tr>
						
						<tr>
							<th colspan="2"> 매장 주소 </th>
							<td colspan="4"> <input type="text" id="shopAdr" name="shop_addr"> </td>
						</tr>
						
						<tr>
							<th colspan="2"> 상세 주소 </th>
							<td colspan="4"> <input type="text" id="shopBunzi" name="addr_bunzi"> </td>
						</tr>
						
						<tr>
							<th colspan="2"> 영업 시간 </th>
							<td colspan="4"> <input type="text" id="shopBh" name="shop_bh"> </td>
						</tr>
						
						<tr>
							<th colspan="2"> 매장 사진 </th>
							<td colspan="4"> <input type="text" id="shopPi" name="shop_image"> </td>
						</tr>
						
						<tr>
							<th colspan="6" style="padding-bottom: 5px"> 매장 설명 </th>
						</tr>
						
						<tr>
							<td colspan="6"> <textarea class="form-control" rows="3" id="shopEx" name="shop_explain"> </textarea> </td>
						</tr>
						
					</table>
				
				<div class="btn">
					<button class='modBtn' id='shopMod'> 매장 정보 수정</button>
				</div>
				
				</form>

			</div>
		</div>
	</div>
	<div class="container">
	<jsp:include page="sellerNavi.jsp" />
	</div>
</body>
</html>
