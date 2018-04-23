<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d7fa1315630f585572f6d7cd683066d&libraries=services"></script>
<script src='${pageContext.request.contextPath}/resources/js/register.js'></script>
<style>
	.BtnGenderColor{
		background-color : gray;
	}
	/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>
</head>
<body>
<form action="">
<input type="hidden" name="구,판 카테고리"><br>
<input type="text" placeholder="아이디"><br>
<input type="password" placeholder="비밀번호"><br>
<input type="password" placeholder="비밀번호확인"><br>
<input type="text" placeholder="이름"><br>
<input type="text" placeholder="성별"><br>
<button type="button" class="btn" id="m">남</button><button type="button" class="btn" id="w">여</button><br>
<input type="text" placeholder="생일"><br>
<input type="text" placeholder="휴대전화"><br>
<input type="text" placeholder="이메일"><br>
<input type="text" placeholder="주소(시,구,동)" id="adr" readonly data-toggle="modal" data-target="#adrModal"><br>
<input type="text" placeholder="상세(번지)" id="adrr" readonly data-toggle="modal" data-target="#adrrModal" onclick="firstMap()"><br>
</form>
<button type="button" class="btn" id="cancle">취소</button>
<button type="button" class="btn" id="next">다음</button>


  <!-- Modal -->
  <div class="modal fade" id="adrModal" role="dialog">
    <div class="modal-dialog modal-sm">  
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">시구동 입력</h4>
        </div>
        <div class="modal-body">
          <p>검색창</p>
        </div>
      </div>      
    </div>
  </div>
  
   <!-- Modal -->
  <div class="modal fade" id="adrrModal" role="dialog">
    <div class="modal-dialog modal-sm" style="width:500px">  
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">지도</h4>
          
        </div>
        <div class="modal-body">
          <p>지도</p>
        </div>
        <div id="regMap" style="width:100%;height:350px;">
          
          </div>
      </div>      
    </div>
  </div>
  <script type="text/javascript">
  var map; // 맵을 담을 변수
  var mapContainer = document.getElementById('regMap'); // 지도를 표시할 div
  var mapOp // 맵 옵션
//초기 맵설정
  function firstMap() {
  	//좌표받기
  	if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(showPosition);
      } else {
          alert("Geolocation is not supported by this browser.");
      }
  }
  /* 주소 */
  function showPosition(position) {
     var myLat = position.coords.latitude; 
     var myLon =position.coords.longitude; 
     mapOption(myLat, myLon);
  }
  /* 맵 옵션 */
  function mapOption(lat, lon){
  	mapOp = {
  			center: new daum.maps.LatLng(lat, lon), // 지도의 중심좌표
  	        level: 3 // 지도의 확대 레벨
  	}
  	getMap(mapContainer, mapOp);
  }


  // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
  function getMap(mapCont, mapOpt) {
  	map = new daum.maps.Map(mapCont, mapOpt);
  }
 /*  firstMap(); */
  </script>
</body>
</html>