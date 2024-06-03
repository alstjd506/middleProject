<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">Home</div>
				<a class="nav-link" href="admin.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> 관리자메인화면
				</a>
				<div class="sb-sidenav-menu-heading">관리목록</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseLayouts" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 회원관리
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseLayouts"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="memberList.do">회원목록</a> 
						<a class="nav-link" href="adminBoardList.do">상품Q&A</a>
					</nav>
				</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapsePages" aria-expanded="false"
					aria-controls="collapsePages">
					<div class="sb-nav-link-icon">
						<i class="fas fa-book-open"></i>
					</div> 상품관리
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapsePages"
					aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav accordion"
						id="sidenavAccordionPages">
						<a class="nav-link collapsed" href="adminProductList.do"> 상품목록
							
						</a>
						
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#pagesCollapseError" aria-expanded="false"
							aria-controls="pagesCollapseError"> 주문관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="pagesCollapseError"
							aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordionPages">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="adminOrderList.do">주문 현황</a> <a
									class="nav-link" href="adminCancleList.do">취소 현황</a> <a
									class="nav-link" href="adminReturnList.do">반품 현황</a>
							</nav>
						</div>
					</nav>
				</div>
				<div class="sb-sidenav-menu-heading">상품등록</div>
				<a class="nav-link" href="adminAddProduct.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-chart-area"></i>
					</div> 상품등록
				</a> <a class="nav-link" href="adminChartControl.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-table"></i>
					</div> 판매차트
				</a>
				 <a class="nav-link" href="adminNotice.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-table"></i>
					</div> 공지사항등록
				</a>
			</div>
		</div>
		<div class="sb-sidenav-footer">
			<div class="small"></div>
			관리자짱짱맨
		</div>
	</nav>
</div>