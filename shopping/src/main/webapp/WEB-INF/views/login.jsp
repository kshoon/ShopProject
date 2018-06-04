<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>

<style>
@import url("https://fonts.googleapis.com/css?family=Lato:100,300,400,700");

* {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.submit-wrap {
	position: absolute;
	bottom: 0;
	width: 100%;
}

.submit-wrap a {
	font-size: 12px;
	display: block;
	margin-top: 20px;
	text-align: center;
	text-decoration: none;
	color: #999999;
}

.submit-wrap a:hover {
	text-decoration: underline;
}

.checkbox {
	margin-top: 4px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	width: 0;
	height: 0;
	margin: 17px -1px;
	padding: 0;
	border: 0;
}

.checkbox+label {
	vertical-align: middle;
	display: inline-block;
	width: 50%;
}

.checkbox+label:before {
	content: "\A";
	color: #999999;
	font-family: Verdana;
	font-weight: bold;
	font-size: 8px;
	line-height: 10px;
	text-align: center;
	display: inline-block;
	vertical-align: middle;
	position: relative;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	background: transparent;
	border: 1px solid #d9d9d9;
	width: 11px;
	height: 11px;
	margin: -2px 8px 0 0;
}

input.submit {
	font-size: 12px;
	line-height: 42px;
	display: block;
	width: 100%;
	height: 42px;
	cursor: pointer;
	vertical-align: middle;
	letter-spacing: 2px;
	text-transform: uppercase;
	color: #263238;
	border: 1px solid #263238;
	background: transparent;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
}

input.submit:hover {
	background-color: #263238;
	color: #ffffff;
	-moz-transition: all 0.2s;
	-o-transition: all 0.2s;
	-webkit-transition: all 0.2s;
	transition: all 0.2s;
}

.checkbox:checked+label:before {
	content: "✓";
}

input.inpt {
	font-size: 14px;
	display: block;
	width: 100%;
	height: 42px;
	margin-bottom: 12px;
	padding: 16px 13px;
	color: #999999;
	border: 1px solid #d9d9d9;
	background: transparent;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
}

input.inpt::-webkit-input-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

input.inpt:-moz-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

input.inpt::-moz-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

input.inpt:-ms-input-placeholder {
	font-size: 14px;
	color: #999999;
	font-family: 'Lato', sans-serif;
}

input.inpt:focus {
	border-color: #999999;
}

label:not([for='remember']) {
  display: none;
}

form {
  position: relative;
  height: 287px;
}

/* .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
.more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
.more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
} */

</style>


</head>
<body>

	<form action="loginPost" method="post">
		<input type="text" name="member_id" id="id" class="inpt" required="required" placeholder="Your ID">
			<label for="id">Your ID</label>
			<input type="password" name="member_pw" id="password" class="inpt" required="required" placeholder="Your password">
			<label for="password">Your password</label>
			<input type="checkbox" id="remember" class="loginCheckbox" checked>
			<label for="remember">Remember me</label>

		<div class="submit-wrap">
			<input type="submit" value="Sign in" class="submit center-block">
			<a href="#" class="more">Forgot your password?</a>
			<a href="#" class="more">sign up</a>
		</div>
	</form>


</body>
</html>