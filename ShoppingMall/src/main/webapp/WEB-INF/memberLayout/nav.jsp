<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <nav id ="nav" class="navbar navbar-expand-lg navbar-light bg-light">
   <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">마루쉐</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">    
               
                    <form class="d-flex" style="width: 100%">
                   		<div id ="top_icon" style="margin-left: auto;" >
                   			<ul style="display: flex; justify-content: flex-end; list-style-type: none;">
                   				<li class="search_tit" ><span>Search</span></li>
                   				<li class="top_search" >
                   					 <form id ="searchBarForm" name="searchBarForm" action="" method="get" target="_self"> 
                   						<input id="banner_action" name="banner_action" value="" type="hidden">
                   						<div class="searchHeader">
                   						<fieldest title>
                   							<input id ="keyword" name="keyword" fw-filter fw-label="검색어" fw-msg class="inputTypeText" onmousedown="SEARCH_BANNER:clickSearchForm(this)" value="" type="text" style="border: none; border-bottom: 1px solid black; height:30px;">
                   							<button class="btn btn-outline-success" type="submit"></button>
                   						</fieldest>
                   						</div>
                   					</form> 
                   				</li>
                   				<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
									role="button" data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">(${logId})</a>
								<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdown">
                   				
								
									<a class="dropdown-item" href="#!">내 정보수정</a> <a
									class="dropdown-item" href="#!">내 게시글 보기</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#!">로그아웃</a>
		
								</div></li>
                   			
                   				<li class="loginForm" list-style-type= none>
                   					<a href="#!">Logout</a>
                   				</li>
                   				
                   				
                   				<li class="OrderForm" list-style-type= none>
                   					<a href="#!">Order</a>
                   				</li>
                   				<li class="cartForm" list-style-type= none>
                   					<a href="#!">Cart</a>
                   				</li>
                   			</ul>
                   		
                   		</div>
                    </form>
                </div>
            </div>
          </nav>