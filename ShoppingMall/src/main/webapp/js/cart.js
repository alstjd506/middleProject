/**
 * cart.js
 */
// 숫자 3자리 콤마찍기
Number.prototype.numberFormat = function() {
	if (this == 0)
		return 0;
	let regex = /(^[+-]?\d+)(\d{3})/;
	let nstr = (this + '');
	while (regex.test(nstr)) {
		nstr = nstr.replace(regex, '$1' + ',' + '$2');
	}
	return nstr;
};

let basket = {
	// 전체 수량
	totalCount: 0,
	// 전체 금액
	totalPrice: 0,
	
	// 장바구니 목록
	list: function() {
		cartSvc.cartList(
			result => {
				if(result.length == 0) {
					basket.emptyBasket();
				} else {
				// 장바구니 상품
				result.forEach(cart => {
					let tr = $('<tr />').attr('align', 'center')
										.css('vertical-align', 'middle')
										.attr('id', cart.PROD_NO)
										.append($('<input>').attr('type', 'hidden')
															.attr('name', 'prodNo')
															.val(cart.PROD_NO))
							   			.append($('<td />').append($('<input>').attr('type', 'checkbox')
							   												   .prop('checked', true)
							   												   .on('click', basket.calcTotal)))
										.append($('<td />').append($('<img />').attr('src', 'images/' + cart.PROD_IMAGE)
														                       .attr('alt', '상품이미지')
														                       .css('height', '100px')))
										.append($('<td />').attr('align', 'left')
														   .append($('<a />').attr('href', '/ShoppingMall/productInfo.do?prodNo=' + cart.PROD_NO)
														   .text(cart.PROD_NAME)))
										.append($('<td />').append($('<input>').attr('type', 'hidden')
																			   .attr('id', 'price' + cart.PROD_NO)
																			   .val(cart.PROD_PRICE))
														   .append((cart.PROD_PRICE).numberFormat() + '원'))
										.append($('<td />').append($('<input>').attr('type', 'number')
																			   .attr('id', 'count' + cart.PROD_NO)
										   									   .attr('min', '1')
										   									   .attr('max', '99')
										  									   .val(cart.CART_CNT)
										  									   .on('change', basket.changeProdNo)))
										.append($('<td />').append($('<span />').attr('id', 'cartPrice' + cart.PROD_NO)
														 					    .text((cart.PROD_PRICE * cart.CART_CNT).numberFormat()))
														   .append('원'))
										.append($('<td />').append($('<button />').attr('type', 'button')
																				  .attr('class', 'btn btn-outline-danger btn-sm')
																			      .text('삭제')
																			      .on('click', basket.delItem)))
				
					$('tbody').append(tr);
				})
				basket.calcTotal();
				}
			},
			err => console.log(err)
		);		
	},
	
	// 장바구니 개별삭제
	delItem: function(e) {
		let tr = $(e.target).parent().parent();
		
		let prodNo = tr.attr('id');
		
		cartSvc.removeCart(prodNo,
			result => {
				if(result.retCode == 'OK') {					
					tr.remove();
					basket.calcTotal();
					basket.emptyBasket();
				} else {
					console.log('처리 실패');
				}
			},
			err => console.log(err)
		)
	},
	
	// 장바구니 선택삭제
	delCheckedItem: function() {
		$('input:checked').each((idx, item) => {
			if($(item).attr('id') != 'allCheck') {
				let tr = $(item).parent().parent();
				
				let prodNo = tr.attr('id');
				
				cartSvc.removeCart(prodNo,
					result => {
						if(result.retCode == 'OK') {
							tr.remove();
							basket.calcTotal();
							basket.emptyBasket();
						} else {
							console.log('처리 실패');
						}
					},
					err => console.log(err)
				)
			}
		})
	},
	
	// 장바구니 전체삭제
	delAllItem: function() {
		$('#cartTable tbody tr').each((idx, item) => {
			if(idx > 0) {
				let tr = $(item);
				let prodNo = tr.attr('id');
								
				cartSvc.removeCart(prodNo,
					result => {
						if(result.retCode == 'OK') {
							tr.remove();
							basket.calcTotal();
							basket.emptyBasket();
						} else {
							console.log('처리 실패');
						}
					},
					err => console.log(err)
				)
			}
		})
	},
	
	// 체크된 장바구니 총 금액, 총 수량
	calcTotal: function() {
		basket.totalCount = 0;
		basket.totalPrice = 0;
		
		$('input:checked').each((idx, item) => {
			if($(item).attr('id') != 'allCheck') {
				let tr = $(item).parent().parent();
				let prodNo = tr.attr('id');
				let price = tr.find($('#price' + prodNo)).val();
				let count = tr.find($('#count' + prodNo)).val();
				
				basket.totalCount += Number(count);
				basket.totalPrice += count * price;
			}
		})
		
		$('#totalCount').text(basket.totalCount);
		$('#totalPrice').text((basket.totalPrice).numberFormat());
	},
	
	// 수량 조절
	changeProdNo: function(e) {
		let tr = $(e.target).parent().parent();
		
		let prodNo = tr.attr('id');
		
		let priceInput = tr.find($('#price' + prodNo));
		let countInput = tr.find($('#count' + prodNo));
		
		if(countInput.val() > 99) {
			alert('상품의 수량은 최대 99개까지 가능합니다.');
			countInput.val(1);
		}
		if(countInput.val() <= 0) {
			alert('상품의 수량은 1개부터 99개까지 가능합니다.');
			countInput.val(1);
		}
		
		let price = priceInput.val();
		let count = countInput.val();
		
		cartSvc.editCart(prodNo, count,
			result => {
				if(result.retCode == 'OK') {
					tr.find($('#cartPrice' + prodNo)).text((price * count).numberFormat());
					
					basket.calcTotal();
				} else {
					console.log('처리 실패');
				}
			},
			err => console.log(err)
		)	
	},
	
	// 빈 장바구니
	emptyBasket: function() {
		if($('#cartTable tbody tr').length == 1) {
			$('#totalInfo').hide();
			$('tbody').append($('<tr />').append($('<td />').attr('colspan', '7')
															.attr('align', 'center')
															.text('장바구니에 상품이 없습니다.')));
			$('#delbtns').hide();
			$('#purchase').attr('disabled', true);
		}
	}
}

// 이벤트
// 전체 체크박스 선택/해제
$('#allCheck').on('click', function() {	
	if($('#allCheck').is(':checked')) {
		$('input:checkbox').prop('checked', true);
	} else {
		$('input:checkbox').prop('checked', false);		
	}
	basket.calcTotal();
});

// 장바구니 선택삭제
$('#selectDelete').on('click', basket.delCheckedItem);

// 장바구니 전체삭제
$('#allDelete').on('click', basket.delAllItem);

// 주문
$('#purchase').on('click', function() {
	if(basket.totalCount == 0) {
		alert('주문할 상품을 선택해주세요.')
		return;
	}
	
	let val = '';
	
	$('input:checked').each((idx, item) => {
		if($(item).attr('id') != 'allCheck') {
			let tr = $(item).parent().parent();
			let prodNo = tr.attr('id');
				
			val += prodNo + ',';
		}
	})
	
	let form = $('<form />').attr('action', 'order.do')
				 			.attr('method', 'post')
				 			.append($('<input>').attr('type', 'hidden')
				 								.attr('name', 'prodNo')
				 								.val(val))

	$('body').append(form);
	
	form.submit();
})

// 메인
basket.list();
