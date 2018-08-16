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
			</span> <a href="mainShopNearW">
				<h2>홈</h2>
				<div class="content">
					<p>근처 사용자의 위시리스트를 확인할 수 있습니다..</p>
				</div>
			</a>
		</article>
		<article class="style2">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/question6.jpg"
				alt="" />
			</span> <a href="mainShopProd">
				<h2>내 상품 관리</h2>
				<div class="content">
					<p>팔고 있는 상품들을 관리할 수 있습니다.</p>
				</div>
			</a>
		</article>
		<article class="style3">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/shopin2.jpg"
				alt="" />
			</span> <a href="mainShopInfo">
				<h2>매장 정보 관리</h2>
				<div class="content">
					<p>회원가입시 입력했던 매장정보를 수정할 수 있습니다.</p>
				</div>
			</a>
		</article>
		<article class="style4">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/shopin3.jpg"
				alt="" />
			</span> <a href="mainShopAlram">
				<h2>알림 보관함</h2>
				<div class="content">
					<p>구매자들이 보낸 알림들을 확인할 수 있습니다.</p>
				</div>
			</a>
		</article>


	</section>
