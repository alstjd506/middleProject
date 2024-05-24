/**
 * orderService.js
 */
const svc = {
	// 주문목록
	cartList(userId, successCall, errorCall) {
		fetch('cartList.do?userId=' + userId)
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	}
}