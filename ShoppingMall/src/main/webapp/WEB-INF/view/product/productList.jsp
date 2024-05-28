<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.container {
    padding-right: 15px;
    padding-left: 15px;
    max-width: 100%;
}
#section {
    margin: 0 auto;
}
.row {
    display: flex;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
    justify-content: center;
    gap: 15px;
}
.col {
    padding-right: 0px;
    padding-left: 0px;
    border: 1px solid #ccc;
    margin: 5px;
    width: 250px;
}
.card {
    height: 100%;
    display: flex;
    flex-direction: column;
    border: none;
}
.card-img-top {
    width: 100%;
    height: auto;
}
.card-body {
    flex-grow: 1;
    padding-right: 0px;
    padding-left: 0px;
}
.card-footer {
    display: flex;
    flex-direction: column;
    padding-top: 0;
    padding-right: 0 !important;
    padding-left: 15px !important;
    background: none;
    border-top: none;
    text-align: center !important;
}
.btn-outline-dark {
    margin-top: auto;
}
.category-btn {
    display: inline-flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 100px;
    height: 100px;
    border-radius: 40%;
    margin: 20px;
    text-decoration: none;
    color: black;
}
.category-icon img {
    width: 60px;
    height: 60px;
    object-fit: cover;
}
.categroy-icon span {
    font-size: 12px;
    text-align: center;
}
.scoll-box {
    text-align: center;
}
.content_box h3 {
    text-align: center;
}
a {
    text-decoration: none;
    color: black;
}
.card-footer .price-and-cart {
    display: flex;
    justify-content: space-between;
    width: 80%;
}
.card-footer .price {
    margin-right: auto;
}
.card-footer .star {
    margin-top: 5px;
    display: flex;
    align-items: center;
    justify-content: flex-start;
}
.filter-select {
	width: 150px;
	height: 30px;
}
</style>
<section id="section" class="py-5">
	<div class="filter-option">
		<select class="filter-select">
			<option data-filter="highPrice" value="highPrice">높은가격순</option>
			<option data-filter="sale" value="sale">판매량순</option>
			<option data-filter="new" value="new">신상품순</option>
			<option data-filter="lowPrice" value="lowPrice">낮은가격순</option>
			<option data-filter="review" value="review">상품평 많은 순</option>
		</select>
	</div>
	<div id="bodyContainer" class="container px-4 px-lg-5 mt-5">
		<div class="content_box"></div>
		<div id="products" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"
			data-page="0">
			<c:forEach var="product" items="${productList}">
				<input type="hidden" name="prodNo" value="${product.prodNo }">
				  <div class="col mb-5">
                    <div class="card h-100">
                        <!-- 상품 이미지 -->
                        <a href="productInfo.do?prodNo=${product.prodNo}"><img class="card-img-top" src="images/${product.prodImage}" alt="..." /></a>
                        <!-- 상품 상세 -->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- 상품 이름 -->
                                <a href="productInfo.do?prodNo=${product.prodNo}"><h5 class="fw-bolder">${product.prodName}</h5></a>
                            </div>
                        </div>
                        <!-- 상품 액션 -->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="price-and-cart">
                                <!-- 상품 가격 -->
                                <span class="price"><fmt:formatNumber value="${product.prodPrice}"/>원</span>
                                <!-- 장바구니 링크 -->
                                <a class="modal_open" data-prodNo="${product.prodNo }">Cart</a>
                            </div>
                            <div class="d-flex small text-warning mb-2 star">
                                <!-- 별점 -->
                                <c:forEach var="star" begin="1" end="${product.prodScore}" step="1">
                                    <div class="bi-star-fill"></div>
                                </c:forEach>
                                <span id="productScore" style="color: black;">${product.prodScore}점</span>
                            </div>
                        </div>
                    </div>
                </div>
			</c:forEach>
		</div>
	</div>
	<!-- 모달 -->
	<div class="modal">
		<div class="modal_popup">
			<p>선택하신 상품이 장바구니에 담겼습니다.</p>
			<button type="button" class="cart_btn">장바구니 가기</button>
			<button type="button" class="close_btn">계속쇼핑 하기</button>
		</div>
	</div>
	<!--end 모달 팝업-->
</section>
<script>
	
	const userId = '${logId}';
</script>
<script src="js/cartService.js"></script>
<script src="js/productList.js"></script>
