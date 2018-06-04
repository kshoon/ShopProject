<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FCM Push Example</title>
</head>
<body>
 
   <div class="container center-block" style="margin-top: 10%">  
   
   <h3 style="text-align: center; letter-spacing: 2px;"> 구매자에게 보내고 싶은 알림 내용을 작성하세요. </h3>
   <hr style="width: 50%; border: 1px solid"> <br>

        
      <form action="mobile/sendFCM" method="post">
            <div class="form-group"> 
               <input type="text" class="form-control" value="쇼핑깜빡이" style="width: 50%; left: 50%; margin-left: 25%; margin-bottom: 2px;" readonly="readonly"/>
               <textarea class="form-control" style="width: 50%; left: 50%; margin-left: 25%" name="message" rows="4" placeholder="메세지를 입력하세요"></textarea>
               <br> <input type="submit" class="btn btn-info center-block" style="" name="submit" value="Send" id="submitButton">
            </div>
      </form> 
         
    </div>
    
</body>
</html>