<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">Core</div>
				<a class="nav-link" href="main.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> 메인화면
				</a>
				<div class="sb-sidenav-menu-heading">Interface</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseFood" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 사료
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseFood"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a data-no="1" class="nav-link" href="productList.do?categoryCode=1">전체</a> 
						<a data-no="10" class="nav-link" href="productList.do?categoryCode=10">건식사료</a> 
						<a data-no="11" class="nav-link" href="productList.do?categoryCode=11">습식사료</a>
					
					</nav>
				</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseSnack" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 간식
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseSnack"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a data-no="2" class="nav-link" href= "productList.do?categoryCode=2" >전체</a> 
						<a data-no="20" class="nav-link" href="productList.do?categoryCode=20" >덴탈/껌</a> 
						<a data-no="21" class="nav-link" href="productList.do?categoryCode=21" >사사미/육포</a>
						<a data-no="22" class="nav-link" href="productList.do?categoryCode=22" >캔/파우치</a>
						<a data-no="23" class="nav-link" href="productList.do?categoryCode=23" >소시지</a>
						<a data-no="24" class="nav-link" href="productList.do?categoryCode=24">동결건조</a>
						<a data-no="25" class="nav-link" href="productList.do?categoryCode=25" >우유/분유</a>
					</nav>
				</div>
			
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseHealth" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 건강관리
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseHealth"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a data-no="3" class="nav-link" href="productList.do?categoryCode=3" >전체</a> 
						<a data-no="30" class="nav-link" href="productList.do?categoryCode=30" >종합영양제</a> 
						<a data-no="31" class="nav-link" href="productList.do?categoryCode=31" >치아</a>
						<a data-no="32" class="nav-link" href="productList.do?categoryCode=32" >피부/모질</a> 
						<a data-no="33" class="nav-link" href="productList.do?categoryCode=33" >뼈/관절</a> 
						<a data-no="34" class="nav-link" href="productList.do?categoryCode=34" >눈/귀</a>
					</nav>
				</div>
				
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseBowel" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 배변용품
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseBowel"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a data-no="4" class="nav-link" href="productList.do" >전체</a> 
						<a data-no="40" class="nav-link" href="productList.do" >배변패드</a> 
						<a data-no="41" class="nav-link" href="productList.do" >배변봉투</a>
						<a data-no="42" class="nav-link" href="productList.do" >배변판</a> 
						<a data-no="43" class="nav-link" href="productList.do" >기저귀</a> 
					</nav>
				</div>
				
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseToy" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 장난감
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseToy"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a data-no="5" class="nav-link" href="productList.do" >전체</a> 
						<a data-no="50" class="nav-link" href="productList.do" >봉제</a> 
						<a data-no="51" class="nav-link" href="productList.do" >라텍스</a>
						<a data-no="52" class="nav-link" href="productList.do" >공</a>
						<a data-no="53" class="nav-link" href="productList.do" >노즈워크</a>
						<a data-no="54" class="nav-link" href="productList.do" >자동장난감</a> 
					</nav>
				</div>
				
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseBeauty" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 미용/목욕
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseBeauty"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a data-no="6" class="nav-link" href="productList.do" >전체</a> 
						<a data-no="60" class="nav-link" href="productList.do" >샴푸/린스</a> 
						<a data-no="61" class="nav-link" href="productList.do" >브러쉬</a>
						<a data-no="62" class="nav-link" href="productList.do" >발톱/가위</a> 
						<a data-no="63" class="nav-link" href="productList.do" >물티슈/크리너</a> 
						<a data-no="64" class="nav-link" href="productList.do" >타올</a>
					</nav>
				</div>
				
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseLiving" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 리빙
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseLiving"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a data-no="7" class="nav-link" href="productList.do" >전체</a> 
						<a data-no="70" class="nav-link" href="productList.do" >하우스/방석</a> 
						<a data-no="71" class="nav-link" href="productList.do" >안전문/울타리</a>
						<a data-no="72" class="nav-link" href="productList.do" >식기/급수기</a> 
					
					</nav>
				</div>
			</div>
		</div>
	</nav>
</div>
