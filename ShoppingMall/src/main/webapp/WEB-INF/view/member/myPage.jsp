<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
body {
	font-family: Arial, sans-serif;
}

#mypage_main {
	width: 80%;
	margin: auto;
}

.info, .order_list, .cart_list {
	margin-bottom: 20px;
}

.info {
	display: flex;
	justify-content: space-between;
}

.info .con {
	width: 32%;
}

.info h3 {
	margin-bottom: 10px;
}

.info ul {
	list-style-type: none;
	padding: 0;
}

.info ul li {
	margin-bottom: 5px;
}

.info ul li span b a {
	text-decoration: none;
	color: blue;
}

.order_list, .cart_list {
	border-top: 1px solid #ddd;
	padding-top: 20px;
}

.order_list h3, .cart_list h3 {
	margin-bottom: 20px;
}

.order_list table {
	width: 100%;
	border-collapse: collapse;
}

.order_list table th, .order_list table td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

.cart_list .plist ul {
	display: flex;
	flex-wrap: wrap;
	padding: 0;
	list-style-type: none;
}

.cart_list .plist ul li {
	width: 100px;
	margin: 10px 1%;
	text-align: center;
}

.cart_list .plist ul li .product-wrapper {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.cart_list .plist ul li img {
	width: 100px;
	height: 100px;
	margin-bottom: 10px;
}

.cart_list .plist ul li span {
	display: block;
	margin-top: 5px;
	font-size: 14px;
}

.cart_list .plist ul li em {
	display: block;
	margin-top: 5px;
	font-size: 14px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="mypage_main">
		<div class="info">
			<div class="con">
				<h3>상품 Q&A</h3>
				<ul>
					<li>"답변 처리중인 질문" <span><b><a href="#"
								title="답변 처리중인 질문">${mypageBoardY }건</a></b></span></li>
					<li>"답변 완료된 상담" <span><b><a href="#"
								title="답변 완료된 상담">${mypageBoardN }건</a></b></span></li>
				</ul>
			</div>
			<div class="con">
				<h3>리뷰</h3>
				<ul>
					<li>"작성가능 리뷰" <span><b><a href="#" title="작성가능 리뷰">0건</a></b></span></li>
					
					<li>"작성한 리뷰" <span><b><a href="#" title="작성한 리뷰">${mypageReviewCnt}건</a></b></span></li>
					
				</ul>
			</div>
		</div>
		<div class="order_list">
			<h3>최근 주문내역</h3>
			<div class="product_list">
				<table>
					<thead>
						<tr>
							<th>주문일</th>
							<th colspan="2">주문내역</th>
							<th>주문상태</th>
							<th>주문관리</th>
						</tr>
					</thead>
					<tbody>
						 <c:if test="${empty mypageRecentOrderList}">
                            <tr>
                                <td colspan="5">최근 구매 상품이 없습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="order" items="${mypageRecentOrderList}">
                            <tr>
                                <td><fmt:formatDate value="${order.ORDER_DATE}" pattern="yyyy-MM-dd"/></td>
                                <td colspan="2">${order.PROD_NAME}</td>
                               <c:choose>
								<c:when test="${order.ORDER_STATUS ==1 }">
                                <td>상품준비중</td>
                                <td><button>주문취소</button></td>
                                </c:when>
                                <c:when test="${order.ORDER_STATUS ==2 }">
                                <td>배송중</td>
                                <td><button>주문취소</button></td>
                                </c:when>
                                <c:when test="${order.ORDER_STATUS ==3 }">
                                <td>배송완료</td>
                                <td>
                                	<button>구매확정</button>
                                	<button>반품신청</button>
                                </td>
                                
                                </c:when>
                                </c:choose>
                            </tr>

                        </c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="cart_list">
				<h3>장바구니</h3>
				<div class="plist">
					<ul>
						<c:forEach var="product" items="${cartList}">
						<li><a href="productInfo.do?prodNo=${product.prodNo}"><img src="images/${product.prodImage}" alt="상품명"class="cart_img">
							<span>${product.prodName }</span><em><b><fmt:formatNumber value="${product.prodPrice}"/></b>원</em></a>
							</li>
						</c:forEach>
					</ul>
				</div>
		</div>
	</div>
</body>
</html>

<script src="js/mypage.js"></script>