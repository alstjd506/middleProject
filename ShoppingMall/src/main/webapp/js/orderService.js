/**
 * orderService.js
 */
const orderSvc = {
	// 주문목록
	orderList(userId, prodNo, successCall, errorCall) {
		fetch('orderList.do?userId=' + userId + '&prodNo=' + prodNo)
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	},
	orderInfo(userId, successCall, errorCall) {
		fetch('orderInfo.do?userId=' + userId)
			.then(resolve => resolve.json())
			.then(successCall)
			.then(errorCall);
	}
}