<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            
<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">Core</div>
				<a class="nav-link" href="myPage.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> 마이페이지
				</a>
				<div class="sb-sidenav-menu-heading">Interface</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseShop" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 나의 쇼핑
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseShop"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="myPageOrder.do?userId=${logId}">주문/배송조회</a> 
						<a class="nav-link" href="myPageReturn.do?userId=${logId}">취소/반품/교환조회</a>
						<a class="nav-link" href="myPagePastOrder.do?userId=${logId}">과거주문이력</a>
					</nav>
				</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseActivity" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 나의 활동
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseActivity"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="myPageBoard.do">상품Q&A</a> 
						<a class="nav-link" href="myPageReview.do">리뷰</a>
						<a class="nav-link" href="cart.do?userId=${logId}">장바구니</a>
					</nav>
				</div>
				<div class="sb-sidenav-menu-heading">Core</div>
				<a class="nav-link" href="modifyuser.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> 회원정보수정
				</a>
				<a class="nav-link" href="Deleteuser.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> 회원탈퇴
				</a>
			</div>
		</div>
	</nav>
</div>
