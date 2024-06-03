<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.center {
  text-align: center;
}

</style>
<table class="table">
   <thead>
      <tr>
         <th>상품번호</th>	
         <th>상품명</th>
         <th>작성내용</th>
         <th>평점</th>
         <th>작성일시</th>
       
      </tr>
   </thead>
   <tbody>
      <c:forEach var="review" items="${reviewList}">
      <tr>
     
         <td> <a href ="productInfo.do?prodNo=${review.PROD_NO}">${review.PROD_NO}</a></td>
         <td> <a href ="productInfo.do?prodNo=${review.PROD_NO}">${review.PROD_NAME }</a></td>
         <td> <a href ="productInfo.do?prodNo=${review.PROD_NO}">${review.REVIEW_CONTENT}</a></td>
         <td>${review.REVIEW_SCORE}</td>
         <td><fmt:formatDate value="${review.REVIEW_DATE}" pattern="yyyy-MM-dd" /></td>
      
      </tr>
      </c:forEach>
   </tbody>
</table>
<hr/>