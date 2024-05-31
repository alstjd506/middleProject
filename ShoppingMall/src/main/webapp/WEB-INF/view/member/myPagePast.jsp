<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.orderBox {
    font-family: Arial, sans-serif;
    max-width: 900px;
    margin: 0 auto;
}

.order {
    border: 1px solid #ddd;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 5px;
}

.order-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

.order-header span {
    font-size: 1.1rem;
    font-weight: bold;
}

.order-header a {
    text-decoration: none;
    color: #346aff;
    font-size: 0.9rem;
}

.order-details {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.product-info {
    display: flex;
    align-items: center;
}

.product-info img {
    width: 80px;
    height: 80px;
    margin-right: 20px;
}

.product-info .info {
    display: flex;
    flex-direction: column;
}

.product-info .info a {
    text-decoration: none;
    color: #000;
    font-size: 1rem;
    margin-bottom: 5px;
}

.product-info .info span {
    color: #555;
}

.actions {
    display: flex;
    flex-direction: column;
    align-items: flex-end;
}

.actions button {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 3px;
    padding: 5px 10px;
    margin: 5px 0;
    cursor: pointer;
    width: 150px;
}

.actions button:hover {
    background-color: #f7f7f7;
}

.prodImage {
    width: 100px;
    height: 100px;
}
</style>
<div class="orderBox">
<c:if test="${empty mypageRecentOrderList}">
                           
        <h1>구매 상품이 없습니다.</h1>
    
    </c:if>
    <c:forEach var="order" items="${mypagePastOrderList}">
        <div class="order">
            <div class="order-header">
           	 <form id="orderForm${order.ORDER_NO}" action="myPageOrderDetail.do" method="post">
                    <input type="hidden" id="formOrderNo${order.ORDER_NO}" name="orderNo" value="${order.ORDER_NO}">
                </form>
                <span>주문날짜: <fmt:formatDate value="${order.ORDER_DATE}" pattern="yyyy. MM. dd"/></span>
                 <span>주문번호 : ${order.ORDER_NO }</span>
                  <span><a href="#" class="detail" data-order-no="${order.ORDER_NO}">주문 상세보기</a></span>
            </div>
            <div class="order-details">
                <div>
                    <c:choose>
                        <c:when test="${order.ORDER_STATUS == 4}">
                            <span style="font-weight: bold; color: #555;">구매확정</span>
                        </c:when>
                        <c:when test="${order.ORDER_STATUS == 6}">
                            <span style="font-weight: bold; color: #555;">취소완료</span>
                        </c:when>
                        <c:when test="${order.ORDER_STATUS == 8}">
                            <span style="font-weight: bold; color: #555;">반품완료</span>
                        </c:when>
                    </c:choose>
                </div>
                <a href="productInfo.do?prodNo=${order.FIRST_PROD_NO}"><img class="prodImage" src="images/${order.FIRST_PROD_IMAGE}" alt="상품 이미지"></a>
                <div class="product-info">
                    <div class="info">
                        <a href="productInfo.do?prodNo=${order.FIRST_PROD_NO}" target="_blank">${order.FIRST_PROD_NAME} (외 ${order.PROD_CNT}개)</a>
                        <span>
                         <c:set var="totalPrice" value = "${order.FIRST_PROD_PRICE * order.FIRST_ORDER_CNT }"/>
                        <fmt:formatNumber value="${totalPrice}"/> 원 · ${order.FIRST_ORDER_CNT} 개
                        </span>
                    </div>
                </div>
            </div>
            <div class="actions">
                <div class="button-group">
                  
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<script src="js/cartService.js"></script>
<script src ="js/orderService.js"></script>
<script src = "js/myPagePastOrder.js"></script>