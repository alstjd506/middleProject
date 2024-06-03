<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<style>
#join {
	margin-left: 27%;
	text-align: center;
	box_sizing: content-box;
}

#id {
	width: 50%;
 	text-align: left; 
}
#pw {
	width: 50%;
	text-align: left;
}

#name {
	width: 50%;
	text-align: left;
}

#phone {
	width: 50%;
	text-align: left;
}

#post {
	width: 50%;
	text-align: left;
}

#addr {
	width: 50%;
	text-align: left;
}

#detailaddr {
	width: 50%;
	text-align: left;
}

#form-group {
	display: inline;
	width: 50%;
}

.check {
	color: red;
}

.control-label{
	text-align: left;
	width:100%;
	display: list-item;
}

.form-control{
	width:50%;
}



</style>
</head>
<body>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script >
	
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = ''; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수

							// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								fullAddr = data.roadAddress;

							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								fullAddr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
							if (data.userSelectedType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample6_address').value = fullAddr;

							// 커서를 상세주소 필드로 이동한다.
							document.getElementById('sample6_address2').focus();
						}
					}).open();
		}
		
	</script>

	<form id="join" action="joinControl.do" method="post">

		<div class="row">

			<div class="col-lg-12 ">
				<h2>&nbsp;</h2>
				<h2 class="text-center">회원가입</h2>
			</div>

			<div class="col-sm-8">
				<p>&nbsp;</p>

				<div class="form-group">
					<div class="col-lg-2 control-label">
						<label for="id">아이디　</label>
						<input type="text" class="form-control" name="id" id="id" required style="display: inline;" >
						<button type="button" id="checkId">중복체크</button>
					</div>
					</div>
					
				

				<div class="form-group">
					<div class="col-lg-2 control-label">
						<label id="pw"style="display: inline;">패스워드</label>
						<input type="password" class="form-control" name="pw" id="pw" required style="display: inline;">
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-2 control-label">
						<label id="name"style="display: inline;">이름　　</label>
						<input type="text" class="form-control" name="name" id="name"
							placeholder="한글로 입력하세요" required style="display: inline;">
					</div>
					
				</div>

				<div class="form-group">
					<div class="col-sm-4 control-label">
						<label id="phone" style="display: inline;">전화번호</label>
						<input type="text" class="form-control" name="phone" id="phone"
							placeholder="ex) 010-1234-5678" required style="display: inline;">
					</div>
				</div>

					<a>&nbsp;</a>
				<div class="form-group">
					<div class="col-lg-3 control-label">
						<label id="zip_num" style="display: inline;">우편번호</label>
						<input type="text" id="sample6_postcode" placeholder="우편번호"name="post" id="post" class="form-control" required style="display: inline;">
						<input type="button" onclick="sample6_execDaumPostcode()"value="우편번호 찾기" class="btn btn-primary" style="display: inline;">
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-2 control-label">
						<label id="address1" style="display: inline;">주소　　</label>
						<input type="text" id="sample6_address" id="all" placeholder="주소"
							name="addr" id="addr" class="form-control" required style="display: inline;">
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-3 control-label">
						<label id="address1" style="display: inline;">상세주소</label>
						<input type="text" id="sample6_address2" placeholder="상세주소"
							name="detailaddr" id="detailaddr" class="form-control" required style="display: inline;">
					</div>
				</div>

				<div class="form-group">
					<p class="check" id="check"></p>
					<br />
					<div class="col-sm-12  text-center">
						<input type="submit" value="회원가입" class="btn btn-success" id="submitButton" disabled>
						<input type="submit" value="취소" class="btn btn-warning"
							onclick="location.href='main.do'">
					</div>
				</div>
			</div>
		</div>
	</form>
	</body>
	
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$('#id').focusout(function() {
			if($('#id').val() == "") {
				$('#check').text('공백란을 입력해주세요.');
				$('#check').css('color', 'red');
			} else {
				$('#check').hide();
			}
		});
		$('#checkId').on('click', function() {
			let checkId = $('#id').val();
			fetch('checkUser.do?checkId=' + checkId)
				.then(resolve => resolve.json())
				.then(result => {
					if(result.retCode == 'OK') {
						alert('중복된 아이디입니다.');
						$('#submitButton').attr('disabled', true);
					} else {
						alert('가입 가능한 아이디입니다.');
						$('#submitButton').attr('disabled', false);
					}
				})
		})
		
		$('#pw').focusout(function() {
			if ($('#pw').val() == "") {
				$('#check').text('공백란을 입력해주세요.');
				$('#check').css('color', 'red');
			} else {
				$('#check').hide();
			}
		});
		$('#name').focusout(function() {
			if ($('#name').val() == "") {
				$('#check').text('공백란을 입력해주세요.');
				$('#check').css('color', 'red');
			} else {
				$('#check').hide();
			}
		});
		$("#phone").focusout(function() {
			if ($('#phone').val() == "") {
				$('#check').text('공백란을 입력해주세요.');
				$('#check').css('color', 'red');
			} else {
				$('#check').hide();
			}
		});
		$('#post').focusout(function() {
			if ($('#post').val() == "") {
				$('#check').text('공백란을 입력해주세요.');
				$('#check').css('color', 'red');
			} else {
				$('#check').hide();
			}
		});
		$('#addr').focusout(function() {
			if ($('#addr').val() == "") {
				$('#check').text('공백란을 입력해주세요.');
				$('#check').css('color', 'red');
			} else {
				$('#check').hide();
			}
		});
		$('#detailaddr').focusout(function() {
			if ($('#detailaddr').val() == "") {
				$('#check').text('공백란을 입력해주세요.');
				$('#check').css('color', 'red');
			} else {
				$('#check').hide();
			}
		});
	</script>
</html>