<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav id ="nav" class="navbar navbar-expand-lg navbar-light bg-light">
   <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="main.do">마루쉐</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div id="top_icon" style="margin-left: auto;">
                    <ul style="display: flex; justify-content: flex-end; list-style-type: none;">
               <!--          <li class="search_tit"><span>Search</span></li>
                        <li class="top_search">
            <form class="d-flex" id="searchBarForm" name="searchBarForm" action="searchForm.do" method="get" style="width: 100%">
                            <div class="searchHeader">
                                <fieldset title>
                                    <input id="keyword" name="keyword" class="inputTypeText"  value="" type="text" style="border: none; border-bottom: 1px solid black; height:30px;">
                                    <button id ="keywordBtn"class="btn btn-outline-success" type="submit">검색</button>
                                </fieldset>
                            </div>
                                 </form>
                        </li> -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${empty logId ? 'Guest' : logId}</a>
                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <c:choose>
                                    <c:when test="${empty logId}">
                                        <a class="dropdown-item" href="join.do">회원가입</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="dropdown-item" href="myPage.do?userId=${logId }">마이페이지</a>
                                       
                                        <a class="dropdown-item" href="modifyuser.do">회원정보수정</a>
                                        <a class="dropdown-item" href="#!">내 게시글 보기</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="logout.do">로그아웃</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </li>
                        <c:if test="${empty logId}">
                            <li class="loginForm" list-style-type="none">
                                <a href="login.do">Login</a>
                            </li>
                        </c:if>
                        <li class="OrderForm" list-style-type="none">
                            <a href="myPageOrder.do">Order</a>
                        </li>
                        <li class="cartForm" list-style-type="none">
                            <a href="cart.do?userId=${logId}">Cart</a>
                        </li>
                          <li class="BoardForm" list-style-type="none">
                            <a href="board.do">Q&A</a>
                        </li>
                    </ul>
                </div>
           
        </div>
    </div>
</nav>

<script src="js/search.js"></script>