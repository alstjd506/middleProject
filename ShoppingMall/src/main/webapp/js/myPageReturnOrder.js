document.addEventListener('DOMContentLoaded', function() {
	const cartBtn = document.querySelectorAll('.cartBtn');
	const buyBtn = document.getElementById('buyBtn');
	const orderForm = document.getElementById('orderForm');
	
	cartBtn.forEach(button => {
		button.addEventListener('click', function() {
			const prodNo = this.dataset.prodno;
			addCartProd(prodNo);
		})
	})	
	
	function addCartProd(prodNo) {
		let cartCnt = 1;
		cartSvc.checkCart(userId, prodNo, 
			result => {
				if(result.retCode == 'OK') {
					alter('해당삼품이 장바구니에 있습니다.');
				}else{
					cartSvc.addCart(userId, prodNo, cartCnt,
						result =>{
							if(result.retCode == 'OK') {
								window.location.href = 'cart.do';
							} else {
								console.log('처리실패');
							}
					},
					 err => console.log(err));
				}
		},
		err => console.log(err));
		
	}
	buyBtn.addEventListener('click', function() {
		const cartCnt = 1;
		console.log('주문상품:'+prodNo);
		console.log('주문수량:'+cartCnt);
		
		formProdCnt.value = cartCnt;
		orderForm.submit();
	});
	
});
