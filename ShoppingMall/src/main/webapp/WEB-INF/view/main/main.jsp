<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.container {
    padding-right: 15px; 
    padding-left: 15px; 
    max-width: 100%; 
  
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
    padding-right: 15px;
    padding-left: 15px;
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
    heigth: auto; 
}
.card-body {
    flex-grow: 1; 
}
.card-footer {
    padding-top: 0; 
    background: none; 
    border-top: none; 
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
	width: 100px;
	height: 100px;
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

</style>

<section id= "section" class="py-5">
	          <div  class="container px-4 px-lg-5 mt-5">
	          <div class = "content_box">
				<h3>인기상품</h3>
				</div>
                <div id ="popProducts" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" data-page ="0">
                    <c:forEach var="product" items="${productList}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="images/${product.prodImage}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${product.prodName}</h5>
                                    <!-- Product price-->
                                    <fmt:formatNumber value="${product.prodPrice }"/>원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                     </div>
                     </c:forEach>
                </div>
                <div class="text-center mt-4">
           			 <button id="prev-pop" class="btn btn-primary"><</button>
          			 <button id="next-pop" class="btn btn-primary">></button>
       		 	</div>
            </div>
             <div class="container px-4 px-lg-5 mt-5">
             <div class = "content_box">
				<h3>최근등록</h3>
				</div>
                <div id="newProducts" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" data-page ="0">
                    <c:forEach var="product" items="${productNewList}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="images/${product.prodImage}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${product.prodName}</h5>
                                    <!-- Product price-->
                                    <fmt:formatNumber value="${product.prodPrice }"/>원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                     </div>
                     </c:forEach>
                </div>
                <div class="text-center mt-4">
           			 <button id="prev-new" class="btn btn-primary"><</button>
          			 <button id="next-new" class="btn btn-primary">></button>
       		 	</div>
            </div>
<div class="container px-4 px-lg-5 mt-5">           
   <div class = "content_box">
   	<h3>카테고리 베스트</h3>        
   </div>
   <article class="article class-article">
   	<div class ="scoll-box" id="ctg_best_list">
   		<a data-type=1 class="category-btn" style ="display: inline-block;">
   			<span class="category-icon">
   				<img src="images/천혜향.webp" alt="이미지">
   			</span>
   			<p>강아지 사료</p>
   		</a>
   		<a data-type="2" class="category-btn" style ="display: inline-block;">
   			<span class="category-icon">
   				<img src="images/천혜향.webp" alt="이미지">
   			</span>
   			<p>강아지 간식</p>
   		</a>
   		<a data-type="3" class="category-btn" style ="display: inline-block;">
   			<span class="category-icon">
   				<img src="images/천혜향.webp" alt="이미지">
   			</span>
   			<p>건강관리</p>
   		</a>
   		<a data-type="4" class="category-btn" style ="display: inline-block;">
   			<span class="category-icon">
   				<img src="images/천혜향.webp" alt="이미지">
   			</span>
   			<p>패드/배변판</p>
   		</a>
   		<a data-type="5" class="category-btn" style ="display: inline-block;">
   			<span class="category-icon">
   				<img src="images/천혜향.webp" alt="이미지">
   			</span>
   			<p>장난감</p>
   		</a>
   		<a data-type="6" class="category-btn" style ="display: inline-block;">
   			<span class="category-icon">
   				<img src="images/천혜향.webp" alt="이미지">
   			</span>
   			<p>미용/목욕</p>
   		</a>
   	</div>
   </article>
   <div id="ctgProducts" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" data-page ="0">
	</div>
	<div class="text-center mt-4">
      <button id="prev-ctg" class="btn btn-primary"><</button>
      <button id="next-ctg" class="btn btn-primary">></button>
   </div>
</div>
 		<div class="container px-4 px-lg-5 mt-5">
             <div class = "content_box">
				<h3>MDs Pick! 지금, 이상품 어때요?</h3>
				</div>
                <div id="mdProducts" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" data-page ="0">
                    <c:forEach var="product" items="${productMdList}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="images/${product.prodImage}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${product.prodName}</h5>
                                    <!-- Product price-->
                                    <fmt:formatNumber value="${product.prodPrice }"/>원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                     </div>
                     </c:forEach>
                </div>
                <div class="text-center mt-4">
           			 <button id="prev-md" class="btn btn-primary"><</button>
          			 <button id="next-md" class="btn btn-primary">></button>
       		 	</div>
            </div>
			<div class="container px-4 px-lg-5 mt-5">
             <div class = "content_box">
				<h3>가성비와 가심비 모두 잡은 아이템! (3000원 이하 상품)</h3>
				</div>
                <div id="cheapProducts" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" data-page ="0">
                    <c:forEach var="product" items="${productCheapList}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="images/${product.prodImage}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${product.prodName}</h5>
                                    <!-- Product price-->
                                    <fmt:formatNumber value="${product.prodPrice }"/>원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                     </div>
                     </c:forEach>
                </div>
                <div class="text-center mt-4">
           			 <button id="prev-cheap" class="btn btn-primary"><</button>
          			 <button id="next-cheap" class="btn btn-primary">></button>
       		 	</div>
            </div>


</section>

<script src="js/main.js"></script>