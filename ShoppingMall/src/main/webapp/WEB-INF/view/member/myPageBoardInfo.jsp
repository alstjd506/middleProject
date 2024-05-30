<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
img {
	height: 100%;
	float: left;
}

form {
	padding-left: 0px;
	text-align: right;
	margin: 0px;
	display: inline-block;
	text-align: right;
	float: left;
	width: 500px;
}

form input {
	padding: 10px;
	width: 300px;
}

form label {
	padding: 20px;
}

.u-label {
	margin-bottom: 20px;
}

#btn {
	width: 100px;
}
</style>
<main>
	<section class="u-clearfix u-section-1" id="carousel_3d7e">
		<h2 class="u-custom-font u-font-merriweather u-text u-text-1">상품Q&A</h2>
		<div class="u-layout">
			<img class="u-expanded-width u-image u-image-contain u-image-1" src="images/rkddkwl1.jpg" data-image-width="100%" data-image-height="100%">
			<c:forEach var="board" items="${boardInfo}">
				<form action="myPageBoardUpdate.do" method="post" class="u-clearfix u-form-spacing-30 u-form-vertical u-inner-form" enctype="multipart/form-data" id="myForm">
					
					<div class="u-form-address u-form-group u-form-group-1">
						<label>게시글번호</label>
						<input type="text" id="boardNo" name="boardNo" value="${board.boardNo}" readonly>
					</div>
					<div class="u-form-group u-form-name">
						<label>제목</label>
						<input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle}" readonly>
					</div>
					<div class="u-form-group u-form-partition-factor-2 u-form-phone u-form-group-3">
						<label>회원아이디</label>
						<input id="bodid" name="bodid" class="u-border-black u-input u-input-rectangle" value="${board.userId}" readonly>
					</div>
					<div class="u-form-email u-form-group u-form-partition-factor-2">
						<label>등록일</label>
						<input type="date" id="bodda" name="bodda" value="<fmt:formatDate value='${board.boardDate}' pattern='yyyy-MM-dd' />" readonly>
					</div>
					<div class="u-form-group u-form-message">
						<label>게시글내용</label>
						<textarea rows="4" cols="50" id="boardContent" name="boardContent" readonly>${board.boardContent}</textarea>
					</div>
					<div>
						<button type="button" id="modBtn">수정</button>
						<button type="submit" id="saveBtn" style="display:none;">저장</button>			
					</div>
					<div class="u-form-group u-form-group-6">
						<label for="text-f8b7" class="u-label">관리자 답글</label>
						<input type="text" value="${board.replyContent}" id="bodre" name="bodre" class="u-border-black u-input u-input-rectangle" readonly>
					</div>
				</form>
			</c:forEach>
		</div>
	</section>
</main>	
<script src="js/myPageBoardInfo.js"></script>