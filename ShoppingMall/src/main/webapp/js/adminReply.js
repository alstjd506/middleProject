/**
 * 
 */
document.getElementById('modBtn').addEventListener('click', function(e) {
	e.preventDefault();


	let bno = document.getElementById('bodno').value;
	let reply = document.getElementById('bodre').value;
	console.log('bno: ' + bno + '   reply: ' + reply);
	fetch('adminReplyModi.do', {
		headers: {
			Accept: "application / json",
		},
		method: 'post',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: 'bno=' + bno + '&reply=' + reply
	})
		.then(resolve => resolve.json())
		.then(result => {
			if (result.retCode == 'OK') {
				alert("답글 수정완료!");
			} else {
				alert("오류발생!!");
			}

			window.location.reload();
		})
})