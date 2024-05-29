<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.orderBox {
    font-family: Arial, sans-serif;
}

.orderBox .order {
    border: 1px solid #ddd;
    padding: 10px;
    margin-bottom: 20px;
    border-radius: 5px;
}

.orderBox .order-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-bottom: 10px;
    border-bottom: 1px solid #ddd;
}

.orderBox .order-header span {
    font-size: 1.1rem;
    font-weight: bold;
}

.orderBox .order-header svg {
    fill: #346aff;
    vertical-align: middle;
}

.orderBox .order-details {
    display: flex;
    justify-content: space-between;
    padding: 10px 0;
}

.orderBox .order-details img {
    width: 64px;
    height: 64px;
    margin-right: 10px;
}

.orderBox .order-details .product-info {
    flex-grow: 1;
}

.orderBox .order-details .product-info a {
    text-decoration: none;
    color: #000;
    font-size: 1rem;
    display: block;
}

.orderBox .order-details .product-info span {
    display: block;
    color: #555;
}

.orderBox .order-details .actions {
    text-align: right;
}

.orderBox .order-details .actions button {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 3px;
    padding: 5px 10px;
    margin: 2px 0;
    cursor: pointer;
}

.orderBox .order-details .actions button:hover {
    background-color: #f7f7f7;
}
</style>
<div class="orderBox">
<c:forEach var="order" items="${mypageOrderList}">
	<div class="sc-fimazj-0 gKYVxm">
		<div class="sc-abukv2-0 kcHmyx">
			<div class="sc-abukv2-1 kSZYgn"></div>
			<div class="sc-abukv2-2 kThsCL">
				<span class="sc-abukv2-3 gSIruC">주문날짜: <fmt:formatDate value="${order.ORDER_DATE}" pattern="MM-dd"/></span>
				<span class="sc-abukv2-3 gSIruC">주문 상세보기</span>
				<svg width="16" height="16" focusable="false" viewBox="0 0 16 16"
					aria-hidden="true" role="presentation"
					style="fill: rgb(52, 106, 255); vertical-align: middle; height: 100%;">
					<path fill="#346aff" fill-rule="nonzero"
						d="M11.057 8L5.53 13.529c-.26.26-.26.682 0 .942.26.26.682.26.942 0l6-6c.26-.26.26-.682 0-.942l-6-6c-.26-.26-.682-.26-.942 0-.26.26-.26.682 0 .942L11.057 8z"></path></svg>
			</div>
		</div>
		<div class="sc-gnmni8-0 elGTUw">
			<table class="sc-gnmni8-1 eSpcfO">
				<colgroup>
					<col width="600">
					<col width="">
				</colgroup>
				<tbody class="sc-gnmni8-2 hryMPB">
					<tr class="sc-gnmni8-3 gmGnuU">
						<td class="sc-gnmni8-5 hUzAOG"><div
								class="sc-ki5ja7-0 bQVZKC">
								<div class="sc-ki5ja7-1 krPkOP">
									<span font-weight="bold" color="#111111" class="sc-755zt3-0 hullgd" style="font-size: 1.25rem;">
									<c:choose>
										<c:when test="${order.ORDER_STATUS ==1 }">
                                				상품준비중
                                			</c:when>
                                			<c:when test="${order.ORDER_STATUS ==2 }">
                               				 	배송중
                               
                               				</c:when>
                                			<c:when test="${order.ORDER_STATUS ==3 }">
                                				배송완료
                               
                                 			</c:when>
                                			</c:choose>
											</span>
									</div>
								<div class="sc-ki5ja7-2 grCKyH">
									
								</div>
							</div>
							<div class="sc-fe2r96-0 hmCrGF"></div>
							<div class="sc-1jiyjbz-0 dGiGeF">
								<div class="sc-gnmni8-9 kCcQTc">
									<div class="sc-g8964r-0 oRzGt"></div>
									<div class="sc-9cwg9-1 gLgexz">
										<div class="sc-9cwg9-2 cNiGzR">
											<div class="sc-9cwg9-3 eEDOvs">
												<a class="sc-1uwk3m0-0 kdlGbA sc-9cwg9-0 gujsmv"
													href="productInfo.do?prodNo=${order.PROD_NO }"
													target="_blank"><img loading="lazy" width="64"
													height="64"
													src="images/${order.PROD_IMAGE }"
													alt=""></a>
											</div>
											<div class="sc-9cwg9-5 bmwSdh">
												<div class="sc-9cwg9-6 jBCCpd">
													<a class="sc-gnmni8-10 yma-DD"></a><a
														href="/ssr/sdp/link?vendorItemId=86770852998&amp;imagePath=https%3A%2F%2Fthumbnail8.coupangcdn.com%2Fthumbnails%2Fremote%2F96x96ex%2Fimage%2Fvendor_inventory%2F1c35%2F47a648476aaa3dc6d732fc1991b77e262a0bf0e517db1400e96c574b6163.jpg&amp;sourceType=MyCoupang_my_orders_list_product_title"
														target="_blank"
														class="sc-gnmni8-10 sc-8q24ha-0 yma-DD hPjYZj">${order.PROD_NAME }</span></a><a
														class="sc-gnmni8-10 yma-DD"></a><a
														class="sc-gnmni8-10 sc-8q24ha-5 yma-DD iDQVMP"><div
															class="sc-8q24ha-3 gFbjJh">
															<div class="sc-uaa4l4-0 jxRaeI">
																<span font-weight="normal" class="sc-755zt3-0 kftgZM"><fmt:formatNumber value="${order.ORDER_PRICE}"/>원</span>
																	<span class="sc-13xhsmd-0 kYtEGM"><span
																	class="sc-13xhsmd-1 joIhoV"></span></span><span
																	class="sc-755zt3-0 jtWNEg">${order.ORDER_CNT}개</span>
															</div>
														</div>
														<div class="sc-8q24ha-4 cUFnye">
															<button class="sc-1k9quwu-0 bJzbju sc-xuyxga-0 bZaQeF">
															장바구니 담기</button>
															<div class="sc-xuyxga-1 hxalxw"></div>
														</div></a>
													<div class="sc-fxyxvg-0 igPkOG"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div></td>
						<td class="sc-gnmni8-6 gbTJl"><div class="sc-gnmni8-7 bCQoer">
								<button class="sc-1k9quwu-0 eLsqcZ sc-4d0nwb-0 iiEWkt">배송조회</button>
								<button class="sc-1k9quwu-0 IZnx sc-gnmni8-8 kiiuoA">교환,
									반품 신청</button>
								<button class="sc-1k9quwu-0 IZnx sc-gnmni8-8 kiiuoA">리뷰
									작성하기</button>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="sc-h20x0n-0 gcWEbw"></div>
	</div>
	</c:forEach>
</div>