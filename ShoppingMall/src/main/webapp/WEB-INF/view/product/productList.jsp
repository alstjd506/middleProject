<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<section id="section" class="py-5">
	<div id="bodyContainer" class="container px-4 px-lg-5 mt-5">
		<div class="content_box"></div>
		<div id="products" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" data-page="0">
			  <c:forEach var="product" items="${productList}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <a href="productInfo.do?prodNo=${product.prodNo}"><img class="card-img-top" src="images/${product.prodImage}" alt="..." /></a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <a href="productInfo.do?prodNo=${product.prodNo}"><h5 class="fw-bolder">${product.prodName}</h5></a>
                                   
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            	<div class="text-center">
                                    <!-- Product price-->
                                 	<fmt:formatNumber value="${product.prodPrice }"/>원
                                	
                                	<a class="modal_open">Cart</a>
                            	</div>
                            </div>
                        </div>
                     </div>
                     
                     </c:forEach>
		
		</div>
	</div>
</section>
<script src="js/productList.js"></script>
