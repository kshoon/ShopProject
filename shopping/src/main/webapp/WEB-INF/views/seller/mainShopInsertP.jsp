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
	<!--상품관리 -->
	<div class="container" style="padding-top: 40px">
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
		<p>이름 | 추가</p>
		<c:forEach items="${plist}" var = "plist">
			<c:if test="(plist.index%4)==1">		<div class="row"></c:if>
				<div class="col-sm-3">
					<p>${plist.product_name} 
						<a href="#" onclick="SPProdInsertclick('${plist.product_no}','${member.member_no }'); return false;">
							<span class="glyphicon glyphicon-plus"style="color:black;"></span>
						</a>
					</p>
				</div>
			<c:if test="(plist.index%4)==1">		</div></c:if>
		</c:forEach>

	</div>
	
	
	<div class="container">
	<jsp:include page="sellerNavi.jsp" />
	</div>

<footer class="container-fluid text-center">
   <form>
      
   <!--수정수정수정  -->
  <%--  <input type="hidden" id="mem_id"  value="${member.member_no }"> --%>
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
