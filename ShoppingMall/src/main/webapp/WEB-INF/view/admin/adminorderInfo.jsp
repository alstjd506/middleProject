<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
a {
	text-decoration: none;
	color: black;
}
</style>
<div class="container-fluid px-4">
<div class="sc-1wglx39-0 jxMipk">
	<div class="sc-1h67xiw-0 edeWbb">
		<h1 class="sc-1h67xiw-1 jzBiTv">주문상세</h1>
		<c:choose>
		<c:when test="${order.orderStatus==1 }"><a href="adminOrderStatus.do?bno=${order.orderNo }">상품준비중</a></c:when>
		<c:when test="${order.orderStatus==2 }"><a href="adminOrderStatus.do?bno=${order.orderNo }">배송중</a></c:when>
		<c:when test="${order.orderStatus==3 }"><a href="adminOrderStatus.do?bno=${order.orderNo }">배송완료</a></c:when>
		<c:when test="${order.orderStatus==4 }">구매확정</c:when>
		<c:when test="${order.orderStatus==5 }"><a class="cancleLink"
										href="adminCancleAgree.do?ono=${order.orderNo }">취소요청</a></c:when>
		<c:when test="${order.orderStatus==6 }">취소완료</c:when>
		<c:when test="${order.orderStatus==7 }"><a class="returnLink"
										href="adminReturnAgree.do?rno=${order.orderNo }">반품요청</a></c:when>
		<c:when test="${order.orderStatus==8 }">반품완료</c:when>
		
		</c:choose>
	</div>
	<div class="sc-llyby5-0 cpmwZc">
		<div class="sc-llyby5-1 hEqipt">
			<span class="sc-llyby5-2 dslKAU"><strong>주문날짜:<fmt:formatDate value="${order.orderDate}"
									pattern="yyyy-MM-dd" />
					</strong></span><span class="sc-llyby5-2 jtryGp" style="color: rgb(85, 85, 85);">주문번호 :
				${order.orderNo }</span>
		</div>
		<div class="sc-llyby5-3 fROrYB"></div>
	</div>
	<c:forEach var="prod" items="${uid }">
	<div class="sc-gnmni8-0 elGTUw">
		<table class="sc-gnmni8-1 eSpcfO">
			<colgroup>
				<col width="600">
				<col width="">
			</colgroup>
			<tbody class="sc-gnmni8-2 hryMPB">
				<tr class="sc-gnmni8-3 gmGnuU">
					<td class="sc-gnmni8-5 hUzAOG"><div class="sc-ki5ja7-0 bQVZKC">
					<hr />
						</div>
						<div class="sc-fe2r96-0 hmCrGF"></div>
						<div class="sc-1jiyjbz-0 dGiGeF">
							<div class="sc-gnmni8-9 kCcQTc">
								<div class="sc-g8964r-0 oRzGt"></div>
								<div class="sc-9cwg9-1 gLgexz">
									<div class="sc-9cwg9-2 cNiGzR">
										<div class="sc-9cwg9-3 eEDOvs">
											<a class="productLink"
								href="adminProductInfo.do?prodNo=${prod.prodNo }"
												target="_blank"><img loading="lazy" width="64"
												height="64"
												src="images/${prod.prodImage }"
												alt="${prod.prodName }"></a>
										</div>
										<div class="sc-9cwg9-5 bmwSdh">
											<div class="sc-9cwg9-6 jBCCpd">
												<a class="productLink"
								href="adminProductInfo.do?prodNo=${prod.prodNo }"
													target="_blank"
													class="sc-gnmni8-10 sc-8q24ha-0 yma-DD hPjYZj"><span color="#111111"
													class="sc-755zt3-1 sc-8q24ha-1 inmgHC ifMZxv">${prod.prodName }</span></a>
														<div class="sc-uaa4l4-0 jxRaeI">
															<span font-weight="normal" color="#555555"
																class="sc-755zt3-0 eDgzyT"><fmt:formatNumber value="${prod.prodPrice }"
									pattern="#,###" />원</span><span
																class="sc-13xhsmd-0 kYtEGM"><span
																class="sc-13xhsmd-1 joIhoV"></span></span><span
																class="sc-755zt3-0 jtWNEg">${prod.orderCnt }개</span>
														</div>
														<div>
														<span>
														상품총금액:<fmt:formatNumber value="${prod.prodTotal }"
									pattern="#,###" />원
														</span>
														</div>
													</div>
												<div class="sc-fxyxvg-0 igPkOG"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div></td>
				</tr>
			</tbody>
		</table>
	</div>
	</c:forEach>
	<div class="sc-h20x0n-0 gcWEbw"></div>
	<h3>주문 총금액 :<fmt:formatNumber value="${order.orderPrice }"
									pattern="#,###" />원</h3>
	<div class="sc-1m6uvm7-0 khiofo">
		<h1 class="sc-1m6uvm7-2 berHYP">
			<span>받는사람 정보</span>
		</h1>
		<table class="sc-1m6uvm7-3 jqnXTj">
			<colgroup>
				<col width="105">
				<col>
				<col width="100">
			</colgroup>
			<tbody class="sc-zknpht-1 dMXLkO">
				<tr class="sc-cdh0rx-0 kpnmCu">
					<th class="sc-cdh0rx-1 hYQyEN" style="color: rgb(85, 85, 85);">받는사람</th>
					<td class="sc-cdh0rx-2 jRUPB">${order.userName }</td>
					<td class="sc-cdh0rx-2 gIRWDV"></td>
				</tr>
				<tr class="sc-cdh0rx-0 kpnmCu">
					<th class="sc-cdh0rx-1 hYQyEN" style="color: rgb(85, 85, 85);">연락처</th>
					<td class="sc-cdh0rx-2 jRUPB">${order.userPhone }</td>
					<td class="sc-cdh0rx-2 gIRWDV"></td>
				</tr>
				<tr class="sc-cdh0rx-0 kpnmCu">
					<th class="sc-cdh0rx-1 hYQyEN" style="color: rgb(85, 85, 85);">받는주소</th>
					<td class="sc-cdh0rx-2 jRUPB">(${order.orderPost }) ${order.orderAddr }
						${order.orderDetailAddr }</td>
					<td class="sc-cdh0rx-2 gIRWDV"></td>
				</tr>
			</tbody>
		</table>
	</div>
	</div>
	</div>