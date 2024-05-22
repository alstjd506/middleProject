<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<section class="py-5">
		 <c:forEach var="product" items="${productInfo}">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="images/${product.prodImage }" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">${product.prodNo}</div>
                        <h1 class="display-5 fw-bolder">${product.prodName}</h1>
                        <div class="fs-5 mb-5">
                           	
                            <span><fmt:formatNumber value="${product.prodPrice }"/>원</span>
                        </div>
                        <p class="lead"> </p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </section>