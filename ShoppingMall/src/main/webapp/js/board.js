/**
 * board.js
 */

if (userId == '') {
	Swal.fire({
		title: '로그인이 필요한 서비스입니다.',
		text: "로그인 페이지로 이동하시겠습니까?",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '승인',
		cancelButtonText: '취소',
		reverseButtons: false
	}).then(result => {
		if (result.isConfirmed) {
			location.href = "login.do";
		} else {
			history.back();
		}
	})
}
