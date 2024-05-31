<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
 <nav id ="nav" class="navbar navbar-expand-lg navbar-light bg-light">
   <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main.do">마루쉐</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">    
               
                    <form class="d-flex" style="width: 100%">
                   		<div id ="top_icon" style="margin-left: auto;" >
                   			<ul style="display: flex; justify-content: flex-end; list-style-type: none;">
                   				
                   				<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
									role="button" data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">${logId}</a>
									<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdown">
                   				
									<a class="dropdown-item" href="myPage.do">마이페이지</a>
									<a class="dropdown-item" href="modifyuser.do">회원정보수정</a>
									<a class="dropdown-item" href="myPageBoard.do">내 게시글 보기</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="logout.do">로그아웃</a>
		
								</div></li>
                   			
                   				<li class="mainForm" list-style-type= none>
                   					<a href="main.do">Shop</a>
                   				</li>
                   				
                   				<li class="OrderForm" list-style-type= none>
                   					<a href="myPageOrder.do?userId=${logId}">Order</a>
                   				</li>
                   				<li class="cartForm" list-style-type= none>
                   					<a href="cart.do?userId=${logId}">Cart</a>
                   				</li>
                   				 
                          		<li class="BoardForm" list-style-type="none">
                           			<a href="board.do">Q&A</a>
                        		</li>
                   			</ul>
                   		
                   		</div>
                    </form>
                </div>
            </div>
          </nav>
  