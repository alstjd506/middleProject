/**
 * cartService.js
 */

const cartSvc = {
	// 장바구니 목록.
	cartList(successCall, errorCall) {
	fetch('cartList.do')
		.then(resolve => resolve.json())
		.then(successCall)
		.catch(errorCall);
	},
	// 장바구니 삭제
	removeCart(prodNo, successCall, errorCall) {
		fetch('removeCart.do?prodNo=' + prodNo)
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	},
	// 장바구니 수정
	editCart(prodNo, cartCnt, successCall, errorCall) {
		fetch('editCart.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'prodNo=' + prodNo + '&cartCnt=' + cartCnt
		})
			.then(resolve => resolve.json())
			.then(successCall)
			.then(errorCall)
	},
	
	// 장바구니 등록
	addCart(prodNo, cartCnt, successCall, errorCall) {
		fetch('addCart.do', {
			method: 'post',
			headers:  { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'prodNo=' + prodNo + '&cartCnt=' + cartCnt
		})
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall)
		
	},
	// 물품중복 체크
	checkCart(prodNo, successCall, errorCall) {
		fetch('checkCart.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'prodNo=' + prodNo
		})
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall)
		
	}

	
}
