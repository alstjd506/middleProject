/**
 * cartService.js
 */

const svc = {
	// 장바구니 목록.
	cartList(userId, successCall, errorCall) {
	fetch('cartList.do?userId=' + userId)
		.then(resolve => resolve.json())
		.then(successCall)
		.catch(errorCall);
	},
	// 장바구니 삭제
	cartRemove(userId, prodNo, successCall, errorCall) {
		fetch('removeCart.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'userId=' + userId + '&prodNo=' + prodNo
		})
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	}
}
