<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>회원탈퇴</title>
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
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

    #btn-Yes{
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
    a{ 
    	color: #f58b34; text-decoration: none; 
    }

    .links{
        text-align: center;
        margin-bottom: 10px;
    }
    
    .checks{
    	color : red;
    }
    </style>
  </head>
   
  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:35rem;">
		<div class="card-title" style="text-align: center;">
		
			<h2 class="card-title" style="color:#f58b34; margin-left: auto; margin-right: auto;"><img src="images/귀여운강아지.png" /></h2>
		</div>
            
		<div class="card-body">
      <form action="DeleteUserControl.do" class="form-signin" method="POST">
      
        <input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호를 입력하세요" required autofocus><br>
       		<p class="checks" id="checks">${findpw_checkf}</p><br/>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">회원탈퇴</button>
      
      </form>
      
		</div>

	</div>
  
  </body>
    <script type="text/javascript">

	$("#pw").focusout(function(){
    if($('#pw').val() == ""){
  		$('#check').text('비밀번호를 입력해주세요.');
  	  	$('#check').css('color', 'red');
  	
  	
//   	if(confirm("탈퇴하시겠습니까?")){
//   		alert("회원탈퇴 완료");
//   	}else{
//   		alert("회원탈퇴 실패");
//   	}
  	  	
  	  	
  </script>
</html>