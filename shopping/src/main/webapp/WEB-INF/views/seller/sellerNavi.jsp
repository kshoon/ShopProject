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
				<h2>내 매장 정보</h2>
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
			</span> <a href="mainShopNearW">
				<h2>근처 필요 상품</h2>
				<div class="content">
					<p>근처 손님들의 필요로 하는 상품을 확인할 수 있습니다.</p>
				</div>
			</a>
		</article>
		<article class="style4">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/shopin3.jpg"
				alt="" />
			</span> <a href="mainShopSold">
				<h2>품절 관리</h2>
				<div class="content">
					<p>상품 재고없음 등 임시보관함.</p>
				</div>
			</a>
		</article>
		<article class="style5">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/shopin4.jpg"
				alt="" />
			</span> <a href="mainShopInsertP">
				<h2>상품 추가</h2>
				<div class="content">
					<p>사람들이 원했던 상품들을 추가할 수 있습니다.</p>
				</div>
			</a>
		</article>
		<article class="style6">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/shopin5.jpg"
				alt="" />
			</span> <a href="mainShopPush">
				<h2>홍보 알람 보내기</h2>
				<div class="content">
					<p>근처 손님들에게 홍보를 해보아요.</p>
				</div>
			</a>
		</article>
		<article class="style2">
			<span class="image"> <img
				src="${pageContext.request.contextPath}/resources/images/pic02.jpg"
				alt="" />
			</span> <a href="main">
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
			</span> <a href="mainShopAlram">
				<h2>알림확인</h2>
				<div class="content">
					<p>알라라라라라암.</p>
				</div>
			</a>
		</article>

	</section>
