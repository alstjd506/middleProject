
const loginId = document.getElementById('userId');
const loginPw = document.getElementById('userPw');
const loginBtn = document.getElementById('login_Btn');










//아이디 중복체크
function checkUserId() {
    	    var userId = document.getElementsByName("userId")[0].value;

    	    // AJAX 요청으로 서버에 아이디 중복 체크 요청
    	    // 서버 응답에 따라 아이디가 존재하면 버튼을 비활성화하고, 존재하지 않으면 버튼을 활성화
    	    var xhr = new XMLHttpRequest();
    	    xhr.open("POST", "./checkUserId.do");
    	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    	    xhr.onreadystatechange = function () {
    	        if (xhr.readyState === 4 && xhr.status === 200) {
    	            var response = JSON.parse(xhr.responseText);
    	            if (response.status === "DUPLICATED") {
    	                alert("아이디가 이미 존재합니다.");
    	                document.getElementById("submitButton").disabled = true;
    	            } else {
    	                alert("사용 가능한 아이디입니다.");
    	                document.getElementById("submitButton").disabled = false;
    	            }
    	        }
    	    };
    	    xhr.send("userId=" + userId);
    	}