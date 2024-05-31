document.addEventListener('DOMContentLoaded', function() {
	const cancelBtn = document.querySelectorAll('.cancleBtn');
	const returnBtn = document.querySelectorAll('.returnBtn');
	const confBtn = document.querySelectorAll('.confBtn');
	const cartBtn = document.querySelectorAll('.cartBtn');

	cartBtn.forEach(button => {
		button.addEventListener('click', function() {
			const prodNo = this.dataset.prodno;
			addCartProd(prodNo);
		});
	});

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
					alert('구매확정 되었습니다.');
					button.textContent = '구매확정';
					button.disabled = true;
				}
			})
			.catch(err => {
				console.error(err);
				alert('구매확정이 실패했습니다.');

			});
	}

	function returnOrder(orderNo, button) {
		fetch('myPageReturnOrder.do?orderNo=' + encodeURIComponent(orderNo))
			.then(response => response.json())
			.then(result => {
				if (result.retCode == 'OK') {
					alert('반품요청 되었습니다.');
					button.textContent = '반품요청';
					button.disabled = true;
				}
			})
			.catch(err => {
				console.error(err);
				alert('반품요청에 취소에 실패했습니다.');

			});
	}

	function addCartProd(prodNo) {
		let cartCnt = 1;
		cartSvc.checkCart(prodNo,
			result => {
				if (result.retCode == 'OK') {
					alert('해당 상품이 장바구니에 있습니다.');
				} else {
					cartSvc.addCart(prodNo, cartCnt,
						result => {
							if (result.retCode == 'OK') {
								window.location.href = 'cart.do';
							} else {
								console.log('처리 실패');
							}
						},
						err => console.log(err)
					);
				}
			},
			err => console.log(err)
		);
	}

});
document.querySelectorAll('.detail').forEach(function(element) {
	element.addEventListener('click', function(event) {
		event.preventDefault();
		var orderNo = this.getAttribute('data-order-no');
		var form = document.getElementById('orderForm' + orderNo);
		form.submit();
	});
});

