/**
 * order.js
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

let order = {
	// 전체 수량
	totalCount: 0,
	// 전체 금액
	totalPrice: 0,
	
	// 장바구니로부터 가져온 주문상품 목록
	list: function() {
		svc.cartList('user01',
			result => {
				result.forEach(cart => {
					let tr = $('<tr />').attr('align', 'center')
										.css('vertical-align', 'middle')
										.attr('id', cart.PROD_NO)
										.append($('<td />').append($('<img />').attr('src', 'images/' + cart.PROD_IMAGE)
																			   .attr('alt', '상품이미지')
																			   .css('height', '100px')))
										.append($('<td />').attr('align', 'left')
														   .text(cart.PROD_NAME))
										.append($('<td />').append($('<input>').attr('type', 'hidden')
																			   .attr('id', 'count' + cart.PROD_NO)
										  									   .val(cart.CART_CNT))
										  				   .append(cart.CART_CNT + '개'))
										.append($('<td />').append($('<input>').attr('type', 'hidden')
														 				   	   .attr('id', 'price' + cart.PROD_NO)
														   					   .val(cart.PROD_PRICE * cart.CART_CNT))
														   .append($('<span />').text((cart.PROD_PRICE * cart.CART_CNT).numberFormat()))
														   .append('원'))				
					$('#cartTable tbody').append(tr);
					
					order.totalCount += Number(cart.CART_CNT);
					order.totalPrice += cart.PROD_PRICE * cart.CART_CNT;
				})
				$('#totalCount').text(order.totalCount);
				$('#totalPrice').text((order.totalPrice).numberFormat());
			},
			err => console.log(err)
		)
	}
}

// 메인
order.list();