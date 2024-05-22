<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--   <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light"></div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#" >전체상품</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" id="menuDropdown" role="button" data-bs-toggle="dropdown" href=# >사료</a>
             			<ul class="dropdown-menu" aria-labelledby="menuDropdown">
                         	<li><a class="dropdown-item" href="#!">전체</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">건식사료</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">습식사료</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">퍼피</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">어덜트(전연령)</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">시니어</a></li>
                     	</ul>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" id="menuDropdown" role="button" data-bs-toggle="dropdown" href="#">간식</a>
                     	<ul class="dropdown-menu" aria-labelledby="menuDropdown">
                         	<li><a class="dropdown-item" href="#!">전체</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">덴탈/껌</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">사사미/육포</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">캔/파우치</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">소시지</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">우유/분유</a></li>
                     	</ul>                   		
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" id="menuDropdown" role="button" data-bs-toggle="dropdown" href="#">건강관리</a>                   		
                		<ul class="dropdown-menu" aria-labelledby="menuDropdown">
                        	<li><a class="dropdown-item" href="#!">전체</a></li>
                        	<li><hr class="dropdown-divider" /></li>
                        	<li><a class="dropdown-item" href="#!">종합영양제</a></li>
                        	<li><hr class="dropdown-divider" /></li>
                        	<li><a class="dropdown-item" href="#!">치아</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">피부/모질</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">뼈/관절</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">눈/귀</a></li>
                     	</ul> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" id="menuDropdown" role="button" data-bs-toggle="dropdown" href="#">배번용품</a>
                    	<ul class="dropdown-menu" aria-labelledby="menuDropdown">
                        	<li><a class="dropdown-item" href="#!">전체</a></li>
                        	<li><hr class="dropdown-divider" /></li>
                        	<li><a class="dropdown-item" href="#!">배변패드</a></li>
                        	<li><hr class="dropdown-divider" /></li>
                        	<li><a class="dropdown-item" href="#!">배변봉투/집게</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">배변판</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">기저귀</a></li>
                     	</ul> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" id="menuDropdown" role="button" data-bs-toggle="dropdown" href="#!">장난감</a>
                    	<ul class="dropdown-menu" aria-labelledby="menuDropdown">
                        	<li><a class="dropdown-item" href="#!">전체</a></li>
                        	<li><hr class="dropdown-divider" /></li>
                        	<li><a class="dropdown-item" href="#!">봉제</a></li>
                        	<li><hr class="dropdown-divider" /></li>
                        	<li><a class="dropdown-item" href="#!">고무</a></li>
                        	<li><hr class="dropdown-divider" /></li>
                        	<li><a class="dropdown-item" href="#!">공</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">자동장난감</a></li>
                     	</ul> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" id="menuDropdown" role="button" data-bs-toggle="dropdown" href="#!">미용/목욕</a>
                    	<ul class="dropdown-menu" aria-labelledby="menuDropdown">
                        	<li><a class="dropdown-item" href="#!">전체</a></li>
                        	<li><hr class="dropdown-divider" /></li>
                        	<li><a class="dropdown-item" href="#!">샴푸/린스</a></li>
                        	<li><hr class="dropdown-divider" /></li>
                        	<li><a class="dropdown-item" href="#!">브러쉬</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">발톱</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">물티슈</a></li>
                         	<li><hr class="dropdown-divider" /></li>
                         	<li><a class="dropdown-item" href="#!">드라이기</a></li>
                     	</ul> 
                </div>
            </div> -->
            
<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">Core</div>
				<a class="nav-link" href="#">
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
						<a class="nav-link" href="#">건식사료</a> 
						<a class="nav-link" href="#">습식사료</a>
						<a class="nav-link" href="#">퍼피</a>
						<a class="nav-link" href="#">어덜트</a>
						<a class="nav-link" href="#">시니어</a>
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
						<a class="nav-link" href="#">덴탈/껌</a> 
						<a class="nav-link" href="#">사사미/육포</a>
						<a class="nav-link" href="#">캔/파우치</a>
						<a class="nav-link" href="#">소시지</a>
						<a class="nav-link" href="#">우유분유</a>
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
						<a class="nav-link" href="#">종합영양제</a> 
						<a class="nav-link" href="#">치아</a>
						<a class="nav-link" href="#">피부/모질</a> 
						<a class="nav-link" href="#">뼈/관절</a> 
						<a class="nav-link" href="#">눈/귀</a>
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
						<a class="nav-link" href="#">배변패드</a> 
						<a class="nav-link" href="#">배변봉투/집게</a>
						<a class="nav-link" href="#">배변판</a> 
						<a class="nav-link" href="#">기저귀</a> 
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
						<a class="nav-link" href="#">봉제</a> 
						<a class="nav-link" href="#">고무</a>
						<a class="nav-link" href="#">공</a> 
						<a class="nav-link" href="#">자동장난감</a> 
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
						<a class="nav-link" href="#">샴푸/린스</a> 
						<a class="nav-link" href="#">브러쉬</a>
						<a class="nav-link" href="#">발톱</a> 
						<a class="nav-link" href="#">물티슈</a> 
						<a class="nav-link" href="#">드라이기</a>
					</nav>
				</div>
			</div>
		</div>
	</nav>
</div>
