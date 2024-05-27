<%@ tag body-content="empty" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ attribute name="pageInfo" type="com.shop.common.PageDTO" required="true" %>

<div class="center">
 <div class="pagination">
  
  <c:if test="${pageInfo.prev }"> <!-- 이전페이지 여부 체크 -->
   <a href="searchForm.do?keyword=${keyword }&page=${pageInfo.startPage-1}">&laquo;</a>
  </c:if>
  
  <c:forEach var="p" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
  <a href="searchForm.do?keyword=${keyword }&page=${p}" class="${p==pageInfo.page?'active':''}">${p}</a>
  </c:forEach>
  
  <c:if test="${pageInfo.next }"> <!-- 이후페이지 여부 체크 -->
  <a href="searchForm.do?keyword=${keyword }&page=${pageInfo.endPage+1}">&raquo;</a>
  </c:if>
  
  </div>
</div>