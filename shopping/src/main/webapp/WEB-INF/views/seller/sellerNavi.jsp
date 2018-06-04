<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
function back(){
	history.back();
}
</script>
	<div>
		<a href="main">홈으로</a>
		<a href="#" onclick="back();return false;">뒤로가기</a>
	</div>
	<section class="tiles">
		<article class="style1">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/question4.jpg"
				alt="" />
			</span> <a href="mainShopInfo">
				<h2>매장정보</h2>
				<div class="content">
					<p>매장의 정보를 변경할 수 있습니다.</p>
				</div>
			</a>
		</article>
		<article class="style2">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/question6.jpg"
				alt="" />
			</span> <a href="mainShopProd">
				<h2>상품관리</h2>
				<div class="content">
					<p>상품을 관리할 수 있습니다..</p>
				</div>
			</a>
		</article>
		<article class="style3">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/shopin2.jpg"
				alt="" />
			</span> <a href="generic.html">
				<h2>근처위시</h2>
				<div class="content">
					<p>근처 손님의 위시들 샤라랑</p>
				</div>
			</a>
		</article>
		<article class="style4">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/shopin3.jpg"
				alt="" />
			</span> <a href="generic.html">
				<h2>Tempus</h2>
				<div class="content">
					<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
						veroeros et feugiat.</p>
				</div>
			</a>
		</article>
		<article class="style5">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/shopin4.jpg"
				alt="" />
			</span> <a href="generic.html">
				<h2>상품추가</h2>
				<div class="content">
					<p>내매장에 물건들을 저~장.</p>
				</div>
			</a>
		</article>
		<article class="style6">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/shopin5.jpg"
				alt="" />
			</span> <a href="generic.html">
				<h2>홍보 푸쉬</h2>
				<div class="content">
					<p>근처 손님들에게 홍보를 해보아요.</p>
				</div>
			</a>
		</article>
		<article class="style2">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/pic02.jpg"
				alt="" />
			</span> <a href="generic.html">
				<h2>문의 체크</h2>
				<div class="content">
					<p>문의체크 나문희</p>
				</div>
			</a>
		</article>
		<article class="style3">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/pic02.jpg"
				alt="" />
			</span> <a href="generic.html">
				<h2>알림확인</h2>
				<div class="content">
					<p>알라라라라라암.</p>
				</div>
			</a>
		</article>

	</section>
