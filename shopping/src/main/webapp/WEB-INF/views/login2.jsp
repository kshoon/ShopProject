<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Story by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>main</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- main 템플릿 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>

/* / / / / / / / / / / / / / / / */
/*  모달 가운데 정렬 */
	
/* 모달 가운데 정렬 - 이까지 */
/* / / / / / / / / / / / / / / / */
</style>
<!-- 설명  -->
<!-- 쇼핑 깜빡이는?
꼭 사야 했던 물건을 깜빡 하였거나 근처의 가까운 매장을 찾을때 알람을 통해 알려주는 서비스 입니다.
지역경제 활성화와 소상공인들을 위한 판매 촉진 등 생활에 도움이 되는 서비스 입니다.
구매자
· 깜빡한 물건을 알려주는 알람
· 가까운 매장정보를 확인하고 길찾기
· 근처 매장의 할인이나 이벤트 알람
판매자
· 주변의 구매자들의 소비 패턴 정보 확인
· 재고상품의 홍보 및 빠른판매가능
· 매장 정보 입력으로 매장홍보 가능 -->
 

</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper" class="divided">
 
		<!-- One -->
		<section
			class="banner style1 orient-left content-align-left image-position-right fullscreen onload-image-fade-in onload-content-fade-right">
			<div class="content" style="margin-left: 10% "> 
				<!-- <h2 style="letter-spacing: -5px"> 쇼핑이</h2> -->
				<p class="navbar-brand"style="font-family: 'Gugi', cursive; font-size: 2rem; color: black; display:inline-block "> <span>쇼핑깜빡</span> <i class="fa fa-lightbulb-o" style="margin-left: -5px; margin-right: -5px"></i> <span>이</span></p>
				<br><br> <br><p class="major"> &nbsp; &nbsp; 더 이상 깜빡하지 마세요.</p> 
				<ul class="actions vertical">
					<li><a href="#" class="button big wide smooth-scroll-middle"
						data-toggle="modal" data-target="#myModal">Sign in</a></li>
				</ul>
				<a>
					<img src='${pageContext.request.contextPath}/resources/images/googleP.png' alt="google" width="150" height="50">
				</a>
				<a>
					<img src='${pageContext.request.contextPath}/resources/images/appleP.png' alt="google" width="150" height="50">
				</a>
			</div>
			<div class="image"
				style="background: url('${pageContext.request.contextPath}/resources/images/question4.jpg'); background-size:1000px 1000px">
				<!-- <img src="./resources/images/question4.jpg" alt="" /> -->
				<div class="container">
					<!-- <h3>#자주</h3>
					<h4>#검색</h4>
					<h3>#해시태그</h3> -->
				</div>
			
			</div>
			
				




			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" style="height: 50px; text-align: center">
							<button type="button" class="close" data-dismiss="modal"
								style="height: 30px">&times;</button>
							<h4 class="modal-title">Sign in</h4>
						</div>


						<!-- Modal Content -->
						<div class="modal-body">
							<jsp:include page="login.jsp" />


						</div>
						<div class="modal-footer"
							style="height: 50px; margin-bottom: 10px">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" style="height: 30px">Close</button>
						</div>
					</div>
				</div>
			</div>







		</section>

		<!-- Two -->
		<!-- <section class="spotlight style1 orient-right content-align-left image-position-center onscroll-image-fade-in" id="first">
						<div class="content">
							<h2>Magna etiam feugiat</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id ante sed ex pharetra lacinia sit amet vel massa. Donec facilisis laoreet nulla eu bibendum. Donec ut ex risus. Fusce lorem lectus, pharetra pretium massa et, hendrerit vestibulum odio lorem ipsum dolor sit amet.</p>
							<ul class="actions vertical">
								<li><a href="#" class="button">Learn More</a></li>
							</ul>
						</div>
						<div class="image">
							<img src="./resources/images/spotlight01.jpg" alt="" />
						</div>
					</section>

				Three
					<section class="spotlight style1 orient-left content-align-left image-position-center onscroll-image-fade-in">
						<div class="content">
							<h2>Tempus adipiscing</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id ante sed ex pharetra lacinia sit amet vel massa. Donec facilisis laoreet nulla eu bibendum. Donec ut ex risus. Fusce lorem lectus, pharetra pretium massa et, hendrerit vestibulum odio lorem ipsum dolor sit amet.</p>
							<ul class="actions vertical">
								<li><a href="#" class="button">Learn More</a></li>
							</ul>
						</div>
						<div class="image">
							<img src="./resources/images/spotlight02.jpg" alt="" />
						</div>
					</section>

				Four
					<section class="spotlight style1 orient-right content-align-left image-position-center onscroll-image-fade-in">
						<div class="content">
							<h2>Pharetra etiam nulla</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id ante sed ex pharetra lacinia sit amet vel massa. Donec facilisis laoreet nulla eu bibendum. Donec ut ex risus. Fusce lorem lectus, pharetra pretium massa et, hendrerit vestibulum odio lorem ipsum dolor sit amet.</p>
							<ul class="actions vertical">
								<li><a href="#" class="button">Learn More</a></li>
							</ul>
						</div>
						<div class="image">
							<img src="./resources/images/spotlight03.jpg" alt="" />
						</div>
					</section>

				Five
					<section class="wrapper style1 align-center">
						<div class="inner">
							<h2>Massa sed condimentum</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id ante sed ex pharetra lacinia sit amet vel massa. Donec facilisis laoreet nulla eu bibendum. Donec ut ex risus. Fusce lorem lectus, pharetra pretium massa et, hendrerit vestibulum odio lorem ipsum.</p>
						</div>

						Gallery
							<div class="gallery style2 medium lightbox onscroll-fade-in">
								<article>
									<a href="./resources/images/gallery/fulls/01.jpg" class="image">
										<img src="./resources/images/gallery/thumbs/01.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Ipsum Dolor</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="./resources/images/gallery/fulls/02.jpg" class="image">
										<img src="./resources/images/gallery/thumbs/02.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Feugiat Lorem</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="./resources/images/gallery/fulls/03.jpg" class="image">
										<img src="./resources/images/gallery/thumbs/03.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Magna Amet</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="./resources/images/gallery/fulls/04.jpg" class="image">
										<img src="./resources/images/gallery/thumbs/04.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Sed Tempus</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="./resources/images/gallery/fulls/05.jpg" class="image">
										<img src="./resources/images/gallery/thumbs/05.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Ultrices Magna</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="./resources/images/gallery/fulls/06.jpg" class="image">
										<img src="./resources/images/gallery/thumbs/06.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Sed Tempus</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="./resources/images/gallery/fulls/07.jpg" class="image">
										<img src="./resources/images/gallery/thumbs/07.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Ipsum Lorem</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="./resources/images/gallery/fulls/08.jpg" class="image">
										<img src="./resources/images/gallery/thumbs/08.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Magna Risus</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="./resources/images/gallery/fulls/09.jpg" class="image">
										<img src="./resources/images/gallery/thumbs/09.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Tempus Dolor</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="./resources/images/gallery/fulls/10.jpg" class="image">
										<img src="./resources/images/gallery/thumbs/10.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Sed Etiam</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="./resources/images/gallery/fulls/11.jpg" class="image">
										<img src="./resources/images/gallery/thumbs/11.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Magna Lorem</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="./resources/images/gallery/fulls/12.jpg" class="image">
										<img src="./resources/images/gallery/thumbs/12.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Ipsum Dolor</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
							</div>

					</section>

				Six
					<section class="wrapper style1 align-center">
						<div class="inner">
							<h2>Ipsum sed consequat</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id ante sed ex pharetra lacinia sit amet vel massa. Donec facilisis laoreet nulla eu bibendum. Donec ut ex risus. Fusce lorem lectus, pharetra pretium massa et, hendrerit vestibulum odio lorem ipsum.</p>
							<div class="items style1 medium onscroll-fade-in">
								<section>
									<span class="icon style2 major fa-diamond"></span>
									<h3>Lorem</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-save"></span>
									<h3>Ipsum</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-bar-chart"></span>
									<h3>Dolor</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-wifi"></span>
									<h3>Amet</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-cog"></span>
									<h3>Magna</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-paper-plane"></span>
									<h3>Tempus</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-desktop"></span>
									<h3>Aliquam</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-refresh"></span>
									<h3>Elit</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-hashtag"></span>
									<h3>Morbi</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-bolt"></span>
									<h3>Turpis</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-envelope"></span>
									<h3>Ultrices</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-leaf"></span>
									<h3>Risus</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
							</div>
						</div>
					</section>

				Seven
					<section class="wrapper style1 align-center">
						<div class="inner medium">
							<h2>Get in touch</h2>
							<form method="post" action="#">
								<div class="field half first">
									<label for="name">Name</label>
									<input type="text" name="name" id="name" value="" />
								</div>
								<div class="field half">
									<label for="email">Email</label>
									<input type="email" name="email" id="email" value="" />
								</div>
								<div class="field">
									<label for="message">Message</label>
									<textarea name="message" id="message" rows="6"></textarea>
								</div>
								<ul class="actions">
									<li><input type="submit" name="submit" id="submit" value="Send Message" /></li>
								</ul>
							</form>

						</div>
					</section> -->

		<!-- Footer -->
		<footer class="wrapper style1 align-center">
			<div class="inner">
				<ul class="icons">
					<li><a href="#" class="icon style2 fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon style2 fa-facebook"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon style2 fa-instagram"><span
							class="label">Instagram</span></a></li>
					<li><a href="#" class="icon style2 fa-linkedin"><span
							class="label">LinkedIn</span></a></li>
					<li><a href="#" class="icon style2 fa-envelope"><span
							class="label">Email</span></a></li>
				</ul>
				<p>
					&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.
				</p>
			</div>
		</footer>

	</div>

	<!-- Scripts -->
	<script src="./resources/assets/js/jquery.min.js"></script>
	<script src="./resources/assets/js/jquery.scrollex.min.js"></script>
	<script src="./resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="./resources/assets/js/skel.min.js"></script>
	<script src="./resources/assets/js/util.js"></script>
	<script src="./resources/assets/js/main.js"></script>

</body>
</html>