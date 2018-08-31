<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page session="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

	td {
	  font-size : 1.8rem;
	}
	tr {
		line-height : 200%;
	}
	
	
	#atable td {
		padding-top: 15px;
		line-height: 20px;
	}
	.Cwhite{
		background-color: mediumslateBlue;
		color:white;
	}
	#navi4{
		background-color: thistle;
	}
	a, a:hover{
		color:black;
	}
	
  </style>
</head>

<body>

<!-- 젤위에 -->
<jsp:include page="sellerNaviTop.jsp" />

	<section id="#wrap_area">
 	<div id="left_area">
 		<jsp:include page="sellerNaviLeft.jsp" />
 	</div>
	<div id="right_area">
	<div style="border-bottom:2px solid gray; font-size:3rem; margin-top:30px;margin-bottom:5px;">
		알림보관함
	</div>
	<div class="row content" id="midalvar">
			 <div class="col-sm-3" style="background:lavender;">
				<a href="mainShopAlram"> 받은 알림함</a>
			 </div>
			 <div class="col-sm-3">
				<a href="mainShopNearW">  알림 보내기 </a>
			 </div>
	</div>
  		<div class="row content">
   			 <div class="col-sm-3 sidenav">
      			
      			<h2>받은 알림함(${fn:length(alist)})</h2>    
    		</div>

  		<div class="col-sm-9" style="padding-top:15px;">
  	
     		 
     		<button class='btn Cwhite' id="allCheckBtn"><input type="checkbox" id='allCheck'></button>
     		<button class='btn Cwhite' id="refreshBtn"><span class="glyphicon glyphicon-refresh Cwhite"></span></button>
     		<button class='btn Cwhite' id="alramOkBtn"><span class="glyphicon glyphicon-ok Cwhite"></span></button>
     		<button class='btn Cwhite' id="alramTrashBtn"><span class="glyphicon glyphicon-trash Cwhite"></span></button>
      		<hr>
      		<table id="atable" style="width: 100%">

      			<c:forEach items="${alist}" var = "alist">
      				<tr>
      					<td style="border-bottom: 1px solid gray"> <input type="checkbox" name='alramCheck' value='${alist.alram_no}'> </td>
      					<td style="border-bottom: 1px solid gray"> ${alist.alram_content}
      					
      					<c:set var="conC" value="${alist.alram_content}"/>

      					<c:set var="lastC" value="${fn:length(conC)}" />
      					<c:set var="subS" value="${fn:substring(conC, lastC-1, lastC)}" />

 
      					
      					
      					<c:if test="${subS eq '?'}">
      					<td class="alrIns" style="border-bottom: 1px solid gray;" data-alrNo='${alist.alram_no}'>
      						<span class="glyphicon glyphicon-ok" ></span>
      					</td>
      					</c:if> 
      					<td class="alrRem" style="border-bottom: 1px solid gray;" data-alrNo='${alist.alram_no}'>
      						<span class="glyphicon glyphicon-trash"></span>
      					</td>
      				</tr>
      			</c:forEach>
      		</table>
    	</div>
 		</div>
	</div>
	</section>
	
</body>
</html>
