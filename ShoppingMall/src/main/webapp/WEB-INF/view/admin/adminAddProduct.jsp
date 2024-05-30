<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="container-fluid px-4">
<form action="adminAddProductControl.do" method="post"
	name="itemInsertForm" id="itemInsertForm" enctype="multipart/form-data">

	<div class="tab-content">
		<!-- 상품등록 -->
		<div class="tab-pane active" id="itemInsert_1">
			<div class="form-group" style="">
				<input type="hidden" value="${TopCategoryList.categoryCode }" />
				<h3>대분류</h3>
				<select class="form-control" name="item_catemain" id="item_catemain"
					title="상품 대분류">
					<option>선택</option>
					<c:forEach var="top" items="${ topCategory}">
						<option value=${top.categoryCode }>${top.categoryName }</option>
					</c:forEach>
				</select>
				<h3>소분류</h3>
				<select class="form-control" name="item_catesub" id="item_catesub"
					title="상품 소분류">
				</select>
			</div>
			<hr class="divider-w mt-10 mb-20">
			<div class="form-group">
				<h3>상품명</h3>
				<input class="form-control input-lg" type="text" placeholder="상품명"
					name="item_name" id="item_name" />
			</div>
			<hr class="divider-w mt-10 mb-20">
			<div class="form-group">
				<h3>판매가</h3>
				<input class="form-control input-lg" type="number"
					placeholder="판매가 / 단위 : 원" name="item_price" id="item_price" />
			</div>

			<hr class="divider-w mt-10 mb-20">
			<!-- 상품내용 에디터 -->
			<div class="form-group">
				<h3>상품내용</h3>
				<textarea class="form-control input-lg" placeholder="내용을 입력하세요"
					name="item_content" id="item_content"></textarea>

			</div>
			<!-- 상품등록 끝-->

			<!--  상품이미지 -->
			<div class="tab-pane" id="itemInsert_3">

				<div class="form-group">
					<h3>메인이미지 ( 썸네일 )</h3>
					<input type="file" name="itemMainImg" id="itemMainImg"
						accept="image/*" onchange="setImg(event);" />
				</div>

				<div class="form-group">
					<h3>내용이미지</h3>
					<input type="file" name="itemSubImg" accept="image/*"
						id="itemSubImg" onchange="setImg(event);" />
				</div>
				<div id="imgs"></div>
				<hr />
				<input type="submit" value="상풍등록">

			</div>
</form>
</div>
<!--  상품이미지 끝 -->
<script src="js/admin.js">
	
</script>