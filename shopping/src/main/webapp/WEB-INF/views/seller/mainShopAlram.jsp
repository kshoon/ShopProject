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

  </style>
</head>

<body>

<!-- 젤위에 -->
<jsp:include page="sellerNaviTop.jsp" />

	<div class="container">
  		<div class="row content">
   			 <div class="col-sm-3 sidenav">
      			<br><br>
      			<h2>받은 알림함(${fn:length(alist)})</h2>    
    			</div>

  		<div class="col-sm-9">
  	
     		 
     		<button class='btn' id="allCheckBtn"><input type="checkbox" id='allCheck'></button>
     		<button class='btn' id="refreshBtn"><span class="glyphicon glyphicon-refresh"></span></button>
     		<button class='btn' id="alramOkBtn"><span class="glyphicon glyphicon-ok"></span></button>
     		<button class='btn' id="alramTrashBtn"><span class="glyphicon glyphicon-trash"></span></button>
      		<hr>
      		<table>

      			<c:forEach items="${alist}" var = "alist">
      				<tr>
      					<td> <input type="checkbox" name='alramCheck' value='${alist.alram_no}'> </td>
      					<td> ${alist.alram_content}
      					
      					<c:set var="conC" value="${alist.alram_content}"/>

      					<c:set var="lastC" value="${fn:length(conC)}" />
      					<c:set var="subS" value="${fn:substring(conC, lastC-1, lastC)}" />

 
      					
      					
      					<c:if test="${subS eq '?'}">
      					<td> 추가</td>
      					</c:if> 
      					<td> 삭제</td>
      				</tr>
      			</c:forEach>
      		</table>
    	</div>
 		</div>
	</div>
	
	<div class="container">
	<jsp:include page="sellerNavi.jsp" />
	</div>

<footer class="container-fluid text-center">
   <form>      
   <!--수정수정수정  -->
  <input type="hidden" id="mem_no" value="${sessionScope.member.member_no }">
   </form>
	<div class="container">
    <hr>
        <div class="text-center center-block">
            <p class="txt-railway"style="font-family: 'Gugi', cursive; font-size: 2rem; color: black; display:inline-block "> <span>쇼핑깜빡</span> <i class="fa fa-lightbulb-o" style="margin-left: -5px; margin-right: -5px"></i> <span>이</span></p>
            <br />
                <a href="https://www.facebook.com/bootsnipp"><i id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a>
	            <a href="https://twitter.com/bootsnipp"><i id="social-tw" class="fa fa-twitter-square fa-3x social"></i></a>
	            <a href="https://plus.google.com/+Bootsnipp-page"><i id="social-gp" class="fa fa-google-plus-square fa-3x social"></i></a>
	            <a href="mailto:bootsnipp@gmail.com"><i id="social-em" class="fa fa-envelope-square fa-3x social"></i></a>
			</div>
    <hr>
	</div>

</footer>
</body>
</html>
