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
<main>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i>
			      총 ${prodCnt }개의 상품이 등록되어었습니다.
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<c:forEach var="ptitle" items="${productTitle }">
								<th>${ptitle }</th>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="mtitle" items="${memberTitle }">
								<th>${mtitle }</th>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="btitle" items="${boardTitle }">
								<th>${btitle }</th>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="otitle" items="${orderTitle }">
								<th>${otitle }</th>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="ctitle" items="${cancleTitle }">
								<th>${ctitle }</th>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="rtitle" items="${returnTitle }">
								<th>${rtitle }</th>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${productList }">
							<tr>
								<td><a class="productLink" href="adminProductInfo.do?prodNo=${product.prodNo }">${product.prodName }</a></td>
								<td>${product.prodComment }</td>
								<td><fmt:formatNumber value="${product.prodPrice }"
										pattern="#,###" />원</td>
								<td>${product.prodSale }</td>
								<td><fmt:formatDate value="${product.prodDate }"
										pattern="yyyy-MM-dd" /></td>
								<td>${product.categoryName }</td>
							</tr>
						</c:forEach>
						<c:forEach var="member" items="${memberList }">
							<tr>
								<td>${member.userId }</td>
								<td>${member.userPw }</td>
								<td>${member.userName }</td>
								<td>${member.userPhone }</td>
								<td>${member.userAddr }</td>
								<td>${member.userDetailAddr }</td>
							</tr>
						</c:forEach>
						<c:forEach var="board" items="${boardList }">
							<tr>
								<td><a class="boardLink"
									href="adminBoardInfo.do?bno=${board.boardNo }">${board.boardTitle }</a></td>
								<td>${board.userId }</td>
								<td><fmt:formatDate value="${board.boardDate}"
										pattern="yyyy-MM-dd" /></td>
										<td>${board.boardStatus =='y' ? '답변완료' : '미답변' }</td>
							</tr>
						</c:forEach>
						<c:forEach var="order" items="${orderList }">
						<tr>
							<td>${order.orderNo }</td>
							<td>${order.userId }</td>
							<td>${order.orderAddr }</td>
							<td>${order.orderDetailAddr }</td>
							<td><fmt:formatDate value="${order.orderDate}"
													pattern="yyyy-MM-dd" /></td>
							<c:choose>
								<c:when test="${order.orderStatus ==1 }">
									<td><a href="adminOrderStatus.do?bno=${order.orderNo }">상품준비중</a></td>
								</c:when>
								<c:when test="${order.orderStatus == 2}">
									<td><a href="adminOrderStatus.do?bno=${order.orderNo }">배송중
									</a></td>
								</c:when>
								<c:when test="${order.orderStatus == 3}">
									<td><a href="adminOrderStatus.do?bno=${order.orderNo }">배송완료</a></td>
								</c:when>
								<c:otherwise>
									<td>구매확정</td>
								</c:otherwise>
							</c:choose>
							</tr>
						</c:forEach>
						<c:forEach var="cancle" items="${cancleList }">
							<tr>
							<td>${cancle.orderNo }</td>
							<td>${cancle.userId }</td>
							<td><fmt:formatDate value="${cancle.orderDate}"
													pattern="yyyy-MM-dd" /></td>
							<c:choose>
							<c:when test="${cancle.orderStatus == 5 }">
								<td><a class="cancleLink" href="adminCancleAgree.do?ono=${cancle.orderNo }">취소요청</a></td>
							</c:when>
							<c:otherwise>
								<td>취소완료</td>
							</c:otherwise>
							</c:choose>
							</tr>
						</c:forEach>
						<c:forEach var="returns" items="${orderReturn }">
							<tr>
							<td>${returns.orderNo }</td>
							<td>${returns.userId }</td>
							<td><fmt:formatDate value="${returns.orderDate}"
													pattern="yyyy-MM-dd" /></td>
							<c:choose>
								<c:when test="${returns.orderStatus == 7 }">
								<td><a class="returnLink" href="adminReturnAgree.do?rno=${returns.orderNo }">반품요청</a></td>
								</c:when>
								<c:otherwise>
								<td>반품완료</td>
								</c:otherwise>
							</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	
</main>
<script>
</script>
