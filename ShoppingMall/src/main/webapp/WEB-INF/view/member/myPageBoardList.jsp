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
         <th>글번호</th>	
         <th>제목</th>
         <th>작성자</th>
         <th>작성일시</th>
         <th>답변상태</th>
      </tr>
   </thead>
   <tbody>
      <c:forEach var="board" items="${boardList}">
      <tr>
         <td>${board.boardNo}</td>
         <td>
            <a href="#" class="info" data-board-no="${board.boardNo}">${board.boardTitle}</a>
            <form id="boardForm${board.boardNo}" action="myPageBoardInfo.do" method="post" style="display:none;">
                <input type="hidden" name="boardNo" value="${board.boardNo}">
            </form>
         </td>
         <td>${board.userId}</td>
         <td><fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd" /></td>
         <c:choose>
            <c:when test="${board.boardStatus == 'n'}">
               <td>미답변</td>
            </c:when>
            <c:when test="${board.boardStatus == 'y'}">
               <td>답변완료</td>
            </c:when>
         </c:choose>
      </tr>
      </c:forEach>
   </tbody>
</table>
<hr/>

<script src="js/myPageBoardList.js"></script>