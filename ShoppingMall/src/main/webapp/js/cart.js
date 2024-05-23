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
		svc.cartList('user01',
			result => {
				// 장바구니 상품
				result.forEach(cart => {
					let tr = $('<tr />').attr('align', 'center')
										.css('vertical-align', 'middle')
										.attr('id', cart.PROD_NO)
							   			.append($('<td />').append($('<input>').attr('type', 'checkbox')
							   												   .prop('checked', true)))
										.append($('<td />').append($('<img />').attr('src', 'images/' + cart.PROD_IMAGE)
														                       .attr('alt', '상품이미지')
														                       .css('height', '100px')))
										.append($('<td />').text(cart.PROD_NAME))
										.append($('<td />').append($('<input>').attr('type', 'number')
										   									   .attr('min', '1')
										   									   .attr('max', '99')
										  									   .attr('value', cart.CART_CNT)))
										.append($('<td />').text((cart.PROD_PRICE * cart.CART_CNT).numberFormat() + '원'))
										.append($('<td />').append($('<button />').attr('type', 'button')
																				  .attr('class', 'btn btn-outline-danger btn-sm')
																			      .text('삭제')
																			      .on('click', basket.delItem)))
					$('tbody').append(tr);
					
					basket.totalCount += Number(cart.CART_CNT);
					basket.totalPrice += cart.PROD_PRICE * cart.CART_CNT;
				})
				
				// 장바구니 총 금액, 총 수량
				$('#totalCount').text(basket.totalCount);
				$('#totalPrice').text((basket.totalPrice).numberFormat());
			},
			err => console.log(err)
		);		
	},
	
	// 장바구니 개별삭제
	delItem: function(e) {
		let tr = $(e.target).parent().parent();
		let prodNo = tr.attr('id');
		let userId = 'user01';
		
		svc.cartRemove(userId, prodNo,
			result => {
				if(result.retCode == 'OK') {
					tr.remove();
				} else {
					console.log('처리 실패');
				}
			},
			err => console.log(err)
		)
	},
	// 장바구니 선택삭제
	delCheckedItem: function() {
		
	},
	// 장바구니 전체삭제
	delAllItem: function() {
		
	}
}

// 전체 체크박스 선택/해제
$('#allCheck').on('click', function() {	
	if($('#allCheck').is(':checked')) {
		$('input:checkbox').prop('checked', true);
	} else {
		$('input:checkbox').prop('checked', false);		
	}
});

// 메인
basket.list();