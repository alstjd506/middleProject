<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
body {
	font-family: "Arial", sans-serif;
	margin: 40px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

a {
	color: #337ab7;
	text-decoration: none;
}

ul {
	list-style: none;
	padding: 0;
}

li {
	display: inline;
	margin-right: 5px;
}

li a.active {
	font-weight: bold;
	text-decoration: underline;
}

.write-link {
	display: block;
	text-align: center;
	margin-top: 20px;
}

.container {
	max-width: 500px;
	margin: 50px auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f9f9f9;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

input[type="text"], textarea {
	width: calc(100% - 22px);
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

textarea {
	height: 100px;
	resize: vertical;
}

.new-button {
	width: 30%;
	padding: 10px;
	margin: 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 18px;
	cursor: pointer;
}

.new-button:hover {
	background-color: #45a049;
}
</style>
<div class="container-fluid px-4">
<div class="container">
	<h1>상품 수정</h1>
	<form action="adminProductModify.do"
		class="form-container" enctype="multipart/form-data" method="post">
		<input type="hidden" name="prodNo" id="prodNo" value="${product.prodNo }"> <label
			for="name">상품명</label> <input type="text" name="name"
			value="${product.prodName }"> <label for="price">가격</label>
		<input type="text" name="price" value="${product.prodPrice }"> <label
			for="category">카테고리</label> <input type="text" name="category"
			value="${product.categoryName }" readonly> <label for="date">등록일</label>
		<input type="text" name="date"
			value="<fmt:formatDate value="${product.prodDate}"
									pattern="yyyy-MM-dd" />"
			readOnly> <label for="content">내용</label>
		<textarea name="content">${product.prodComment }</textarea>
		<label for="mainimg">메인이미지</label> <input type="file" name="mainimg"
			accept="image/*" onchange="setImg(event);"> <label
			for="conimg">내용이미지</label> <input type="file" name="conimg"
			accept="image/*" onchange="setImg(event);">
		<div id="imgs"></div>
		<hr />
		<input type="submit" value="상품수정" class="new-button" id="modBtn"><input
			type="button" value="취소" id="cancelBtn" class="new-button">
	</form>
</div>
</div>
<script src="js/adminMod.js">

</script>