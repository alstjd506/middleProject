<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="filter-buttons">
    <button class="filter-btn" data-filter="sales">판매량순</button>
    <button class="filter-btn" data-filter="new">신상품순</button>
    <button class="filter-btn" data-filter="highPrice">높은가격순</button>
    <button class="filter-btn" data-filter="lowPrice">낮은가격순</button>
    <button class="filter-btn" data-filter="reviews">상품평 많은 순</button>
</div>

<div id="searchResults" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
   
</div>

<script src="js/search.js"></script>