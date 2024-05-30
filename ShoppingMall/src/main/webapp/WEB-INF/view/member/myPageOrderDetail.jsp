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
<div class="sc-1wglx39-0 jxMipk">
	<div class="sc-1h67xiw-0 edeWbb">
		<h1 class="sc-1h67xiw-1 jzBiTv">주문상세</h1>
	</div>
    <c:forEach var="order" items="${mypageOrderDetail}">
	<div class="orderBox">
        <div class="order">
            <div class="order-header">
                <span>주문날짜: <fmt:formatDate value="${order.ORDER_DATE}" pattern="yyyy. MM. dd"/></span>
                
            </div>
            <div class="order-details">
                <div>
                    <c:choose>
                        <c:when test="${order.ORDER_STATUS == 1}">
                            <span style="font-weight: bold; color: #555;">상품준비중</span>
                        </c:when>
                        <c:when test="${order.ORDER_STATUS == 2}">
                            <span style="font-weight: bold; color: #555;">배송중</span>
                        </c:when>
                        <c:when test="${order.ORDER_STATUS == 3}">
                            <span style="font-weight: bold; color: #555;">배송완료</span>
                        </c:when>
                    </c:choose>
                </div>
                <a href="productInfo.do?prodNo=${order.PROD_NO}"><img class="prodImage" src="images/${order.PROD_IMAGE}" alt="상품 이미지"></a>
                <div class="product-info">
                    <div class="info">
                        <a href="productInfo.do?prodNo=${order.PROD_NO}" target="_blank">${order.PROD_NAME}</a>
                        <span>
                         <c:set var="totalPrice" value = "${order.PROD_PRICE * order.ORDER_CNT }"/>
                        <fmt:formatNumber value="${totalPrice}"/> 원 · ${order.ORDER_CNT} 개
                        </span>
                    </div>
                </div>
            </div>
            <div class="actions">
                <div class="button-group">
                    <button>장바구니 담기</button>
                     <c:choose>
                        <c:when test="${order.ORDER_STATUS == 1}">
                    		<button>주문취소 신청</button>
                    	</c:when>
                    	 <c:when test="${order.ORDER_STATUS == 2}">
                    		<button>주문취소 신청</button>
                    	</c:when>
                    	 <c:when test="${order.ORDER_STATUS == 3}">
                    		<button>반품 신청</button>
                    	</c:when>
                     </c:choose>
                    <button>리뷰 작성하기</button>
                </div>
            </div>
        </div>
        </div>
    </c:forEach>

<div class="sc-h20x0n-0 gcWEbw"></div>
	<div class="sc-1m6uvm7-0 khiofo">
		<h1 class="sc-1m6uvm7-2 berHYP">
			<span>받는사람 정보</span>
		</h1>
		<c:forEach var="order" items="${mypageUserDetail}">
		<table class="sc-1m6uvm7-3 jqnXTj">
			<caption class="sc-1m6uvm7-1 dSygCD"></caption>
			<colgroup>
				<col width="105">
				<col>
				<col width="100">
			</colgroup>
			<tbody class="sc-zknpht-1 dMXLkO">
				<tr class="sc-cdh0rx-0 kpnmCu">
					<th class="sc-cdh0rx-1 hYQyEN" style="color: rgb(85, 85, 85);">받는사람</th>
					<td class="sc-cdh0rx-2 jRUPB">${order.USER_NAME }</td>
					<td class="sc-cdh0rx-2 gIRWDV"></td>
				</tr>
				<tr class="sc-cdh0rx-0 kpnmCu">
					<th class="sc-cdh0rx-1 hYQyEN" style="color: rgb(85, 85, 85);">연락처</th>
					<td class="sc-cdh0rx-2 jRUPB">${order.USER_PHONE }</td>
					<td class="sc-cdh0rx-2 gIRWDV"></td>
				</tr>
				<tr class="sc-cdh0rx-0 kpnmCu">
					<th class="sc-cdh0rx-1 hYQyEN" style="color: rgb(85, 85, 85);">받는주소</th>
					<td class="sc-cdh0rx-2 jRUPB">(${order.ORDER_POST}) ${order.ORDER_ADDR} ${order.ORDER_DETAIL_ADDR}
					</td>
					<td class="sc-cdh0rx-2 gIRWDV"></td>
				</tr>
				
			</tbody>
		</table>
			</c:forEach>
	</div>
	<div class="sc-1m6uvm7-0 khiofo">
		<h1 class="sc-1m6uvm7-2 berHYP">
			<span>결제 정보</span>
		</h1>
		<c:forEach var="order" items="${mypageUserDetail}">
		<table class="sc-1m6uvm7-3 jqnXTj">
			<caption class="sc-1m6uvm7-1 dSygCD"></caption>
			<colgroup>
				<col>
				<col width="340">
			</colgroup>
			<tbody class="sc-189zx6p-1 dYVCWG">
				<tr class="sc-189zx6p-2 dmEQfU">
					<td>
						<div class="sc-cqdfxt-0 iUCDca">
							<div class="sc-cqdfxt-5 NYtvr" style="color: rgb(17, 17, 17);">
								<strong>총 결제금액 </strong>
							</div>
							<div class="sc-cqdfxt-6 sc-cqdfxt-7 fTOSfp eiVXJZ">
								<strong><fmt:formatNumber value="${order.ORDER_PRICE}"/> 원</strong>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		</c:forEach>
	</div>
	<div class="sc-1vg575n-0 hnMMRm">
		<div class="sc-1vg575n-2 fEXcBR">
			<button class="sc-1vg575n-1 iZblhb">	
				<a href = "myPageOrder.do">주문목록 돌아가기</a>
			</button>
		</div>
		
	</div>
</div>	
