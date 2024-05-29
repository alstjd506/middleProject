<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
ul{
	list-style: none;
}
</style>

<div class="container mt-3">
  <table class="table" id="cartTable">
    <thead class="table-dark">
      <tr align="center">
        <th colspan="7">장바구니</th>
      </tr>
    </thead>
    <tbody>
      <tr align="center">
        <td><input type="checkbox" id="allCheck" checked /></td>
        <td colspan="2">상품</td>
        <td>금액</td>
        <td>수량</td>
        <td>합계</td>
        <td> </td>
      </tr>
    </tbody>
  </table>
  <div align="right" id="delbtns">
    <button type="button" id="selectDelete" class="btn btn-outline-secondary btn-sm">선택삭제</button>
    <button type="button" id="allDelete" class="btn btn-outline-secondary btn-sm">전체삭제</button>
  </div>
  <div id="totalInfo">
    <ul>
      <li>주문 수량 <span id="totalCount">0</span>개</li>
      <li>합계 금액 <span id="totalPrice">00,000</span>원</li>
    </ul>
  </div>
  <div align="center">
    <button type="button" id="purchase" class="btn btn-primary">주문하기</button>
    <button type="button" class="btn btn-primary" onclick="location.href='/ShoppingMall/main.do'">쇼핑 계속하기</button>
  </div>
<hr>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="js/cartService.js"></script>
<script src="js/cart.js"></script>