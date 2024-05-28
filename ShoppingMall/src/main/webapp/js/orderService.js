/**
 * orderService.js
 */
const orderSvc = {
	// 장바구니 -> 주문 목록
	orderList(prodNo, successCall, errorCall) {
		fetch('orderList.do?prodNo=' + prodNo)
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	},
	// 바로구매 목록
	orderDirect(prodNo, successCall, errorCall) {
		fetch('orderDirect.do?prodNo=' + prodNo)
			.then(resolve => resolve.json())
			.then(successCall)
			.then(errorCall)
	},
	// 주문자 정보
	orderInfo(successCall, errorCall) {
		fetch('orderInfo.do')
			.then(resolve => resolve.json())
			.then(successCall)
			.then(errorCall);
	}
}