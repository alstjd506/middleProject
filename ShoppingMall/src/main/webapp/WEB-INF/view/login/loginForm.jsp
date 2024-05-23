<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#login {
	margin-left: 35%;
	margin-top: 10%;
	box_sizing:content-box;
	width: 300px;
}
#btn {
	width: 100% ;
}
</style>
<form id="login">
	<!-- Email input -->
	<div data-mdb-input-init class="form-outline mb-4">
		<input type="text" id="form2Example1" class="form-control"  placeholder="ID"/> 
	</div>

	<!-- Password input -->
	<div data-mdb-input-init class="form-outline mb-4">
		<input type="password" id="form2Example2" class="form-control"  placeholder="Password" /> 
	</div>

	<!-- 2 column grid layout for inline styling -->
	<div class="row mb-4">
		<div class="col d-flex justify-content-center">
			<!-- Checkbox -->
<!-- 			<div class="form-check"> -->
<!-- 				<input class="form-check-input" type="checkbox" value="" -->
<!-- 					id="form2Example31" checked /> <label class="form-check-label" -->
<!-- 					for="form2Example31"> Remember me </label> -->
<!-- 			</div> -->
		<div class="col">
			<!-- Simple link -->
			<a href="#!">아이디 찾기</a>
		</div>
<!-- 		<div class="col"> -->
			<!-- Simple link -->
			<a href="#!">비밀번호 찾기</a>
<!-- 		</div> -->
		</div>

	</div>

	<!-- Submit button -->
	<button type="button" data-mdb-button-init data-mdb-ripple-init
		class="btn btn-primary btn-block mb-4" id="btn">Sign in</button>

	<!-- Register buttons -->
	<div class="text-center">
		<p>
			회원이 아니신가요? <a href="#!">회원가입</a>
		</p>
	
		<button type="button" data-mdb-button-init data-mdb-ripple-init
			class="btn btn-link btn-floating mx-1">
			<i class="fab fa-facebook-f"></i>
		</button>

		<button type="button" data-mdb-button-init data-mdb-ripple-init
			class="btn btn-link btn-floating mx-1">
			<i class="fab fa-google"></i>
		</button>

		<button type="button" data-mdb-button-init data-mdb-ripple-init
			class="btn btn-link btn-floating mx-1">
			<i class="fab fa-twitter"></i>
		</button>

		<button type="button" data-mdb-button-init data-mdb-ripple-init
			class="btn btn-link btn-floating mx-1">
			<i class="fab fa-github"></i>
		</button>
	</div>
</form>