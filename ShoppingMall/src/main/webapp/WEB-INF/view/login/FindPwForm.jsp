<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>비밀번호 찾기</title>
<style>
@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");

html {
	height: 100%;
}

body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding-top: 200px;
	padding-bottom: 40px;
	font-family: "Nanum Gothic", arial, helvetica, sans-serif;
	background-repeat: no-repeat;
}

.card {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
}

#btn-Yes {
	background-color: #e4932b;
	border: none;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

a {
	color: #f58b34;
	text-decoration: none;
}

.links {
	text-align: center;
	margin-bottom: 10px;
}

.check {
	color: red;
}
</style>
</head>

<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%" align="center">

	<div class="card align-middle" style="width: 35rem;">
		<div class="card-title" style="text-align: center;">

			<h2 class="card-title"
				style="color: #f58b34; margin-left: auto; margin-right: auto;">
				<img src="images/귀여운강아지.png" />
			</h2>
		</div>
		
		<div class="card-body">
			<form action="findPwControl.do" class="form-signin" method="POST">
				<input type="text" name="id" id="id" class="form-control"
					placeholder="아이디" required autofocus><br> <input
					type="text" name="name" id="name" class="form-control"
					placeholder="이름" required><BR> <input type="text"
					name="phone" id="phone" class="form-control"
					placeholder="연락처 ex)010-1234-5678" required><br>
				<p class="check" id="check">${findpw_checkf}</p>
				<br />
				<button id="btn-Yes" class="btn btn-lg btn-primary btn-block"
					type="submit">비밀번호 찾기</button>
			</form>
		</div>
		
		<div class="links">
			<a href="findid.do">아이디 찾기</a> | <a href="login.do">로그인</a> | <a
				href="join.do">회원가입</a>

		</div>
	</div>

</body>
<script type="text/javascript">
	//아이디 정규식
	var idJ = /^[a-z0-9]{5,20}$/;

	$("#id").focusout(function() {
		if ($('#id').val() == "") {
			$('#check').text('아이디를 입력해주세요.');
			$('#check').css('color', 'red');
		}
	});

	//   		$("#id").focusout(function(){
	//   			if(!idJ.test($(this).val())){
	//   			$('#checks').text('5~20자의 영문 소문자, 숫자만 사용가능합니다');
	//   			$('#checks').css('color', 'red');
	//   		}
	//   		 });

	$("#name").focusout(function() {
		if ($('#name').val() == "") {
			$('#check').text('이름을 입력해주세요.');
			$('#check').css('color', 'red');
		}
	});

	$("#phone").focusout(function() {
		if ($('#phone').val() == "") {
			$('#check').text('연락처를 입력해주세요');
			$('#check').css('color', 'red');
		}
	});
</script>
</html>