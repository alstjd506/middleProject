document.addEventListener('DOMContentLoaded', function() {
	const cancelBtn = document.querySelectorAll('.cancleBtn');
	const confBtn = document.querySelectorAll('.confBtn');
	const returnBtn = document.querySelectorAll('.retrunBtn');

	cancelBtn.forEach(button => {
		button.addEventListener('click', function() {
			const orderNo = this.dataset.orderno;
			cancelOrder(orderNo, this);
			console.log(orderNo);
		});
	});

	confBtn.forEach(button => {
		button.addEventListener('click', function() {
			const orderNo = this.dataset.orderno;
			confOrder(orderNo, this);
			console.log(orderNo);
		});
	});

	returnBtn.forEach(button => {
		button.addEventListener('click', function() {
			const orderNo = this.dataset.orderno;
			returnOrder(orderNo, this);
			console.log(orderNo);
		});
	});


	function cancelOrder(orderNo, button) {
		fetch('myPageCancleOrder.do?orderNo=' + encodeURIComponent(orderNo))
			.then(response => response.json())
			.then(result => {
				if (result.retCode == 'OK') {
					alert('주문이 취소요청 되었습니다.');
					button.textContent = '취소요청';
					button.disabled = true;
				}
			})
			.catch(err => {
				console.error(err);
				alert('주문 취소에 실패했습니다.');

			});
	}

	function confOrder(orderNo, button) {
		fetch('myPageConfOrder.do?orderNo=' + encodeURIComponent(orderNo))
			.then(response => response.json())
			.then(result => {
				if (result.retCode == 'OK') {
					alert('주문이 취소요청 되었습니다.');
					button.textContent = '구매확정';
					button.disabled = true;
				}
			})
			.catch(err => {
				console.error(err);
				alert('주문 취소에 실패했습니다.');

			});
	}

	function returnOrder(orderNo, button) {
		fetch('myPageReturnOrder.do?orderNo=' + encodeURIComponent(orderNo))
			.then(response => response.json())
			.then(result => {
				if (result.retCode == 'OK') {
					alert('주문이 취소요청 되었습니다.');
					button.textContent = '반품요청';
					button.disabled = true;
				}
			})
			.catch(err => {
				console.error(err);
				alert('주문 취소에 실패했습니다.');

			});
	}





});

