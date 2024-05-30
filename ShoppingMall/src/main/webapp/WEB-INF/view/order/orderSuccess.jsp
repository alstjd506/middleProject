<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container mt-3">
  <div align="center">
    <br><h5><b>주문이 정상적으로 완료되었습니다.</b></h5><br>
    <button type="button" class="btn btn-outline-primary" onclick="location.href='/ShoppingMall/main.do'">메인화면</button>
    <button type="button" class="btn btn-outline-secondary" onclick="location.href='/ShoppingMall/myPage.do?userId=${logId}'">마이페이지</button>
  </div>
</div>