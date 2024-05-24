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
	<div class="container-fluid px-4">
		<h1 class="mt-4">Dashboard</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">Dashboard</li>
		</ol>
		<div class="row">
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-area me-1"></i> Area Chart Example
					</div>
					<div class="card-body">
						<canvas id="myAreaChart" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i> Bar Chart Example
					</div>
					<div class="card-body">
						<canvas id="myBarChart" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i>
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
								<td><a class="productLink" href="#">${product.prodName }</a></td>
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
							<td>${order.orderDate }</td>
							<c:choose>
								<c:when test="${order.orderStatus ==1 }">
									<td>상품준비중</td>
								</c:when>
								<c:when test="${order.orderStatus == 2}">
									<td>배송중</td>
								</c:when>
								<c:otherwise>
									<td>배송완료</td>
								</c:otherwise>
							</c:choose>
							</tr>
						</c:forEach>
						<c:forEach var="cancle" items="${cancleList }">
							<tr>
							<td>${cancle.orderNo }</td>
							<td>${cancle.userId }</td>
							<td>${cancle.orderDate }</td>
							<c:choose>
							<c:when test="${cancle.orderStatus == 4 }">
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
							<td>${returns.orderDate }</td>
							<c:choose>
								<c:when test="${returns.orderStatus == 6 }">
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
	</div>
</main>
<script>
	console.log("${boardList}")
</script>
