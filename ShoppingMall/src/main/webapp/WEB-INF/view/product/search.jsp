<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.centered {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
	text-align: center;
}

.searchBar, .filter-option {
	margin-bottom: 20px;
}

.searchInput {
	width: 400px;
	height: 60px;
	border: none;
	border-bottom: 1px solid black;
}

.filter-select {
	width: 150px;
	height: 30px;
}

#searchResults {
	width: 100%;
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

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>
<section id="section">

	<div class="searchBar">
		<input id="keyword" name="keyword" class="searchInput" type="text"
			style="border: none; border-bottom: 1px solid black; height: 30px;">
		<button id="keywordBtn" class="btn btn-outline-success">검색</button>
	</div>

	<div class="filter-option">
		<select class="filter-select">
			<option data-filter="highPrice" value="highPrice">높은가격순</option>
			<option data-filter="sale" value="sale">판매량순</option>
			<option data-filter="new" value="new">신상품순</option>
			<option data-filter="lowPrice" value="lowPrice">낮은가격순</option>
			<option data-filter="review" value="review">상품평 많은 순</option>
		</select>
	</div>

	<div id="searchResults"
		class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

	</div>
<my:paging pageInfo="${paging }" />

</section>
<script src="js/search.js"></script>