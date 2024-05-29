<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="addBoard.do" method="post">
  <div class="container mt-3">
    <h3>Q&A 작성</h3>
    <p>상품 및 상품 구매 과정(배송, 반품/취소, 교환/변경)에 대해 문의하실 수 있습니다.<br>
    문의하신 내용에 대한 답변은 <b>'마이페이지>나의 활동>상품Q&A'</b>에서 확인하실 수 있습니다.</p>
    <table class="table">
      <tr>
        <th align="center">제 목</th>
        <td><input type="text" name="title" size="50"></td>
      </tr>
      <tr>
        <th align="center">내 용</th>
        <td><textarea cols="70" rows="5" name="content" placeholder="문의하실 내용을 입력하세요."></textarea></td>
      </tr>
      <tr align="center">
        <td colspan="2"><input type="submit" class="btn btn-outline-primary" value="작성"></td>
      </tr>
    </table>
  </div>
</form>