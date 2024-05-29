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
        <th colspan="4">주문상품</th>
      </tr>
    </thead>
    <tbody>
      <tr align="center">
        <td colspan="2">상품</td>
        <td>수량</td>
        <td>금액</td>
      </tr>
    </tbody>
  </table>
  <div id="totalInfo">
    <ul>
      <li>총 수량 <span id="totalCount">0</span>개</li>
      <li>총 금액 <span id="totalPrice">00,000</span>원</li>
    </ul>
  </div>
  <table class="table" id="orderTable">
    <thead class="table-dark">
      <tr align="center">
        <th colspan="2">주문/결제</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><input type="radio" name="deliveryAddr" value="old" id="old" checked> <label for="old">기존 배송지</label></td>
        <td><input type="radio" name="deliveryAddr" value="new" id="new"> <label for="new">새 배송지</label></td>
      </tr>
      <tr>
        <td rowspan="3">주소</td>
        <td><input type="text" id="postcode" placeholder="우편번호"> <input type="button" id="search" onclick="execDaumPostcode()" value="우편번호 찾기"></td>
      </tr>
      <tr>
        <td><input type="text" id="address" placeholder="주소" size="80"></td>
      </tr>
      <tr>
        <td><input type="text" id="detailAddress" placeholder="상세주소" size="80"></td>
      </tr>
    </tbody>
  </table>
  <div align="center">
    <button type="button" id="purchase" class="btn btn-primary">주문하기</button>
  </div>
  <hr>
</div>
<script>
let prodNo = '${prodNo}';
let prodCnt = '${prodCnt}';
</script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="js/orderService.js"></script>
<script src="js/order.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById('address').value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('detailAddress').focus();
            }
        }).open();
    }
</script>
