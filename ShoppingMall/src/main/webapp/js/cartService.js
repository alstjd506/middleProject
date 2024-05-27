/**
 * cartService.js
 */

const cartSvc = {
	// 장바구니 목록.
	cartList(userId, successCall, errorCall) {
	fetch('cartList.do?userId=' + userId)
		.then(resolve => resolve.json())
		.then(successCall)
		.catch(errorCall);
	},
	// 장바구니 삭제
	removeCart(userId, prodNo, successCall, errorCall) {
		fetch('removeCart.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'userId=' + userId + '&prodNo=' + prodNo
		})
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	},
	// 장바구니 수정
	editCart(userId, prodNo, cartCnt, successCall, errorCall) {
		fetch('editCart.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'userId=' + userId + '&prodNo=' + prodNo + '&cartCnt=' + cartCnt
		})
			.then(resolve => resolve.json())
			.then(successCall)
			.then(errorCall)
	}

	
}
