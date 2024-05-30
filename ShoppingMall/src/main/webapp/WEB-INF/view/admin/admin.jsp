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
<div class="row">
	<div class="col-xl-3 col-md-6">
		<div class="card bg-primary text-white mb-4">
			<div class="card-body">인기상품</div>
			<div
				class="card-footer d-flex align-items-center justify-content-between">
				<a class="small text-white stretched-link"
					href="adminProductInfo.do?prodNo=${popProd }">상품바로가기</a>
				<div class="small text-white">
					<i class="fas fa-angle-right"></i>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-md-6">
		<div class="card bg-warning text-white mb-4">
			<div class="card-body">인기없는상품</div>
			<div
				class="card-footer d-flex align-items-center justify-content-between">
				<a class="small text-white stretched-link"
					href="adminProductInfo.do?prodNo=${leastProd }">상품바로가기</a>
				<div class="small text-white">
					<i class="fas fa-angle-right"></i>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-md-6">
		<div class="card bg-success text-white mb-4">
			<div class="card-body">리뷰많은상품</div>
			<div
				class="card-footer d-flex align-items-center justify-content-between">
				<a class="small text-white stretched-link"
					href="adminProductInfo.do?prodNo=${popRevi }">상품바로가기</a>
				<div class="small text-white">
					<i class="fas fa-angle-right"></i>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-md-6">
		<div class="card bg-danger text-white mb-4">
			<div class="card-body">별점높은상품</div>
			<div
				class="card-footer d-flex align-items-center justify-content-between">
				<a class="small text-white stretched-link"
					href="adminProductInfo.do?prodNo=${highStar }">상품바로가기</a>
				<div class="small text-white">
					<i class="fas fa-angle-right"></i>
				</div>
			</div>
		</div>
	</div>
</div>
<main>
	<div class="container-fluid px-4">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 미처리주문목록
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<c:forEach var="olist" items="${olist }">
								<th>${olist }</th>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ovo" items="${ovo }">
							<tr>
								<td><a class="orderLink"
								href="adminOrderInfo.do?ono=${ovo.orderNo }&uid=${ovo.userId }">${ovo.orderNo }</a></td>
								<td>${ovo.userId }</td>
								<td>${ovo.orderAddr }</td>
								<td>${ovo.orderDetailAddr }</td>
								<td><fmt:formatDate value="${ovo.orderDate}"
										pattern="yyyy-MM-dd" /></td>
								<c:choose>
									<c:when test="${ovo.orderStatus ==1 }">
										<td><a href="adminOrderStatus.do?bno=${ovo.orderNo }">상품준비중</a></td>
									</c:when>
									<c:when test="${ovo.orderStatus == 2}">
										<td><a href="adminOrderStatus.do?bno=${ovo.orderNo }">배송중</a></td>
									</c:when>
									<c:otherwise>
										<td><a href="adminOrderStatus.do?bno=${ovo.orderNo }">배송완료</a></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="container-fluid px-4">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 미처리취소목록
			</div>
			<div class="card-body">
				<div
					class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
					<div class="datatable-top">
						<div class="datatable-dropdown">
							<label> <select class="datatable-selector"><option
										value="5">5</option>
									<option value="10" selected="">10</option>
									<option value="15">15</option>
									<option value="20">20</option>
									<option value="25">25</option></select> entries per page
							</label>
						</div>
						<div class="datatable-search">
							<input class="datatable-input" placeholder="Search..."
								type="search" title="Search within table"
								aria-controls="datatablesSimple">
						</div>
					</div>
					<div class="datatable-container">
						<table id="datatablesSimple" class="datatable-table">
							<thead>
								<tr>
									<c:forEach var="clist" items="${clist }">
										<th data-sortable="true" style="width: 13.86696730552424%;"><a href="#" class="datatable-sorter">${clist }</a></th>
									</c:forEach>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cvo" items="${cvo }">
									<tr data-index="">
										<td><a class="orderLink"
								href="adminOrderInfo.do?ono=${cvo.orderNo }&uid=${cvo.userId }">${cvo.orderNo }</a></td>
										<td>${cvo.userId }</td>
										<td><fmt:formatDate value="${cvo.orderDate}"
												pattern="yyyy-MM-dd" /></td>
										<c:choose>
											<c:when test="${cvo.orderStatus == 5 }">
												<td><a class="cancleLink"
													href="adminCancleAgree.do?ono=${cvo.orderNo }">취소요청</a></td>
											</c:when>
											<c:otherwise>
												<td>취소완료</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="datatable-bottom">
						<div class="datatable-info">Showing 1 to 10 of 24 entries</div>
						<nav class="datatable-pagination">
							<ul class="datatable-pagination-list">
								<li
									class="datatable-pagination-list-item datatable-hidden datatable-disabled"><a
									data-page="1" class="datatable-pagination-list-item-link">‹</a></li>
								<li class="datatable-pagination-list-item datatable-active"><a
									data-page="1" class="datatable-pagination-list-item-link">1</a></li>
								<li class="datatable-pagination-list-item"><a data-page="2"
									class="datatable-pagination-list-item-link">2</a></li>
								<li class="datatable-pagination-list-item"><a data-page="3"
									class="datatable-pagination-list-item-link">3</a></li>
								<li class="datatable-pagination-list-item"><a data-page="2"
									class="datatable-pagination-list-item-link">›</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid px-4">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 미처리반품목록
			</div>
			<div class="card-body">
				<div
					class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
					<div class="datatable-top">
						<div class="datatable-dropdown">
							<label> <select class="datatable-selector"><option
										value="5">5</option>
									<option value="10" selected="">10</option>
									<option value="15">15</option>
									<option value="20">20</option>
									<option value="25">25</option></select> entries per page
							</label>
						</div>
						<div class="datatable-search">
							<input class="datatable-input" placeholder="Search..."
								type="search" title="Search within table"
								aria-controls="datatablesSimple">
						</div>
					</div>
					<div class="datatable-container">
						<table id="datatablesSimple" class="datatable-table">
							<thead>
								<tr>
									<c:forEach var="rlist" items="${rlist }">
										<th data-sortable="true" style="width: 13.86696730552424%;"><a href="#" class="datatable-sorter">${rlist }</a></th>
									</c:forEach>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="rvo" items="${rvo }">
									<tr data-index="">
										<td><a class="orderLink"
								href="adminOrderInfo.do?ono=${rvo.orderNo }&uid=${rvo.userId }">${rvo.orderNo }</a></td>
										<td>${rvo.userId }</td>
										<td><fmt:formatDate value="${rvo.orderDate}"
												pattern="yyyy-MM-dd" /></td>
										<c:choose>
											<c:when test="${rvo.orderStatus == 7 }">
												<td><a class="returnLink"
													href="adminReturnAgree.do?rno=${rvo.orderNo }">반품요청</a></td>
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
					<div class="datatable-bottom">
						<div class="datatable-info">Showing 1 to 10 of 24 entries</div>
						<nav class="datatable-pagination">
							<ul class="datatable-pagination-list">
								<li
									class="datatable-pagination-list-item datatable-hidden datatable-disabled"><a
									data-page="1" class="datatable-pagination-list-item-link">‹</a></li>
								<li class="datatable-pagination-list-item datatable-active"><a
									data-page="1" class="datatable-pagination-list-item-link">1</a></li>
								<li class="datatable-pagination-list-item"><a data-page="2"
									class="datatable-pagination-list-item-link">2</a></li>
								<li class="datatable-pagination-list-item"><a data-page="3"
									class="datatable-pagination-list-item-link">3</a></li>
								<li class="datatable-pagination-list-item"><a data-page="2"
									class="datatable-pagination-list-item-link">›</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
</div>
	<div class="container-fluid px-4">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 미처리Q&A목록
			</div>
			<div class="card-body">
				<div
					class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
					<div class="datatable-top">
						<div class="datatable-dropdown">
							<label> <select class="datatable-selector"><option
										value="5">5</option>
									<option value="10" selected="">10</option>
									<option value="15">15</option>
									<option value="20">20</option>
									<option value="25">25</option></select> entries per page
							</label>
						</div>
						<div class="datatable-search">
							<input class="datatable-input" placeholder="Search..."
								type="search" title="Search within table"
								aria-controls="datatablesSimple">
						</div>
					</div>
					<div class="datatable-container">
						<table id="datatablesSimple" class="datatable-table">
							<thead>
								<tr>
									<c:forEach var="blist" items="${blist }">
										<th>${blist }</th>
									</c:forEach>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bvo" items="${bvo }">
									<tr>
										<td><a class="boardLink"
											href="adminBoardInfo.do?bno=${bvo.boardNo }">${bvo.boardTitle }</a></td>
										<td>${bvo.userId }</td>
										<td><fmt:formatDate value="${bvo.boardDate}"
												pattern="yyyy-MM-dd" /></td>
										<td>${bvo.boardStatus =='y' ? '답변완료' : '미답변' }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="datatable-bottom">
						<div class="datatable-info">Showing 1 to 10 of 24 entries</div>
						<nav class="datatable-pagination">
							<ul class="datatable-pagination-list">
								<li
									class="datatable-pagination-list-item datatable-hidden datatable-disabled"><a
									data-page="1" class="datatable-pagination-list-item-link">‹</a></li>
								<li class="datatable-pagination-list-item datatable-active"><a
									data-page="1" class="datatable-pagination-list-item-link">1</a></li>
								<li class="datatable-pagination-list-item"><a data-page="2"
									class="datatable-pagination-list-item-link">2</a></li>
								<li class="datatable-pagination-list-item"><a data-page="3"
									class="datatable-pagination-list-item-link">3</a></li>
								<li class="datatable-pagination-list-item"><a data-page="2"
									class="datatable-pagination-list-item-link">›</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
</main>