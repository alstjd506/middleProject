<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
#subBtn, #addBtn {
	border: none;
}

.form-control {
	margin-right: 0 !important;
}

.d-flex {
	margin-bottom: 20px;
}

.right-align {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	margin-top: 20px;
}

.right-align .btn {
	margin-left: 10px;
}

#sum_p_price {
	margin-top: 20px;
	font-size: 1.25rem;
	font-weight: bold;
	text-align: right;
}

.box {
	display: inline-block;
}

.align-bottom {
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	height: 100%;
}

ul, li {
	list-style-type: none;
}

#section {
	margin: 0 auto;
}

.review-form {
	margin-top: 20px;
}

.review-form textarea {
	width: 100%;
	height: 100px;
}

.review-list {
	margin-top: 20px;
}

.review-item {
	border-bottom: 1px solid #ddd;
	padding: 10px 0;
}

div.reviewList div {
	margin: auto;
}

div.review ul {
	list-style-type: none;
	margin-top: 5px;
}

div.review li {
	padding-top: 1px;
	padding-bottom: 1px;
}

div.review span {
	display: inline-block;
}

.reviewList {
	text-align: center;
}
</style>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.2/font/bootstrap-icons.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">

<link href="css/pagging.css" rel="stylesheet" />
<section id="section" class="py-5">
<div class="container-fluid px-4">
	<div class="container px-4 px-lg-5 my-5">

		<form name="myFrm"
			action="adminProductModifyForm.do?prodNo=${product.prodNo }">

			<input type="hidden" name="prodNo" value="${product.prodNo }">


			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="images/${product.prodImage}" />
				</div>
				<div class="col-md-6 align-bottom">
					<div>
						<div class="small mb-1">
							상품코드: <span>${product.prodNo}</span>
						</div>
						<input type="hidden" id="prodNo" value="${product.prodNo}">
						<h1 class="display-5 fw-bolder">상품명 : ${product.prodName}</h1>
						<input type="hidden" name="prodName" value=" ${product.prodName}">
						<div class="fs-5 mb-5">

							<span id="productPrice" data-price="${product.prodPrice}">가격
								: <fmt:formatNumber value="${product.prodPrice}" />원
							</span> <input type="hidden" name="price" value=" ${product.prodPrice}">
						</div>
						<div class="d-flex justify-content small text-warning mb-2">
							평균별점:   
							<c:forEach begin="1" end="${star}" step="1">
								<div class="bi-star-fill"></div>
							</c:forEach>
						</div>
						<div>
							<span id="productCode">카테고리명 : ${product.categoryName }</span> <input
								type="hidden" name="category" value=" ${product.categoryName}">
						</div>
						<div>
							<span id="productCode">판매수 : ${product.prodSale }</span>
						</div>
						<div>
							<span id="productCode">등록일 : <fmt:formatDate
									value="${product.prodDate }" pattern="yyyy-MM-dd" /></span>
						</div>
						<input type="hidden" name="prodDate" value=" ${product.prodDate}">



					</div>
					<div class="right-align">
						<button id="modBtn" class="btn btn-outline-dark flex-shrink-0"
							type="submit">
							<i class="bi-cart-fill me-1"></i> 상품수정
						</button>
						<button id="delBtn" class="btn btn-outline-dark flex-shrink-0"
							type="button">
							<i class="bi-cart-fill me-1"></i> 상품삭제
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<div class="row gx-4 gx-lg-5 my-5">
		<div class="col-md-12">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="description-tab"
						data-bs-toggle="tab" data-bs-target="#description" type="button"
						role="tab" aria-controls="description" aria-selected="true">상품정보</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="review-tab" data-bs-toggle="tab"
						data-bs-target="#review" type="submit" role="tab"
						aria-controls="review" aria-selected="false">리뷰</button>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="description"
					role="tabpanel" aria-labelledby="description-tab">
					<div class="col-md-12">
						<img class="card-img-top mb-5 mb-md-0"
							src="images/${product.prodCommentImage }" />
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> DataTable Example
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<c:forEach var="rtitle" items="${reviewTitle }">
										<th>${rtitle }</th>
									</c:forEach>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="review" items="${reviewList }">
									<tr>
										<td>${review.prodNo }</td>
										<td><div
												class="d-flex justify-content-center small text-warning mb-2">
												<c:forEach begin="1" end="${review.reviewScore }" step="1">
													<div class="bi bi-star-fill"></div>
												</c:forEach>
											</div></td>
										<td>${review.reviewContent }</td>
										<td>${review.userId }</td>
										<td><fmt:formatDate value="${review.reviewDate }"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>
<script src="js/adminProductInfo.js">
console.log(${star});
</script>