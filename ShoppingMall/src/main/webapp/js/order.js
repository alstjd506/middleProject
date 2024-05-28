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
	cartList: function() {
		orderSvc.orderList(prodNo,
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
										.append($('<td />').append($('<span />').text((cart.PROD_PRICE * cart.CART_CNT).numberFormat()))
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
	},
	
	// 바로구매 주문상품
	directOrder: function() {
		orderSvc.orderDirect(prodNo, 
			result => {
				let tr = $('<tr />').attr('align', 'center')
									.css('vertical-align', 'middle')
									.attr('id', result.prodNo)
									.append($('<td />').append($('<img />').attr('src', 'images/' + result.prodImage)
																		   .attr('alt', '상품이미지')
																		   .css('height', '100px')))
									.append($('<td />').attr('align', 'left')
													   .text(result.prodName))
									.append($('<td />').append($('<input>').attr('type', 'hidden')
																		   .attr('id', 'count' + result.prodNo)
										  								   .val(prodCnt))
										  			   .append(prodCnt + '개'))
									.append($('<td />').append($('<span />').text((result.prodPrice * prodCnt).numberFormat()))
													   .append('원'))				
				$('#cartTable tbody').append(tr);
					
				order.totalCount += Number(prodCnt);
				order.totalPrice += result.prodPrice * prodCnt;
				$('#totalCount').text(order.totalCount);
				$('#totalPrice').text((order.totalPrice).numberFormat());
			},
			err => console.log(err)
		)
	},
	
	// 주문회원 정보
	info: function() {
		orderSvc.orderInfo(
			result => {
				$('#postcode').val(result.userPost)
							  .attr('readonly', true)
				$('#search').attr('type', 'hidden')
				$('#address').val(result.userAddr)
							 .attr('readonly', true)
				$('#detailAddress').val(result.userDetailAddr)
								   .attr('readonly', true)
			},
			err => console.log(err)
		)
	}
}

// 이벤트
// 배송지 설정
$('input:radio[name=deliveryAddr]').on('change', function() {
	if($('input:radio[name=deliveryAddr]:checked').val() == 'old') {
		order.info();
	} else {
		$('#postcode').val('')
					  .attr('readonly', false)
		$('#search').attr('type', 'button')
		$('#address').val('')
					 .attr('readonly', false)
		$('#detailAddress').val('')
						   .attr('readonly', false)
	}
})

// 주문
$('#purchase').on('click', function() {
	if($('#postcode').val() == '' || $('#address').val() == '' || $('#detailAddress').val() == '') {
		alert('배송지를 입력해주세요.');
		return;
	}
	
	let prodNoVal = '';
	let prodCntVal = '';
	
	$('#cartTable tbody tr').each((idx, item) => {
		if(idx > 0) {
			let prodNo = $(item).attr('id');
			prodNoVal += prodNo + ',';
			prodCntVal += $('#count' + prodNo).val() + ',';
		}
	})
	
	let form = $('<form />').attr('action', 'orderForm.do')
				 			.attr('method', 'post')
				 			.append($('<input>').attr('type', 'hidden')
				 								.attr('name', 'prodNo')
				 								.val(prodNoVal))
				 			.append($('<input>').attr('type', 'hidden')
				 								.attr('name', 'prodCnt')
				 								.val(prodCntVal))
				 			.append($('<input>').attr('type', 'hidden')
				 								.attr('name', 'userPost')
				 								.val($('#postcode').val()))
				 			.append($('<input>').attr('type', 'hidden')
				 								.attr('name', 'userAddr')
				 								.val($('#address').val()))
				 			.append($('<input>').attr('type', 'hidden')
				 								.attr('name', 'userDetailAddr')
				 								.val($('#detailAddress').val()))
	
	$('body').append(form);
	
	form.submit();
})

// 메인
if(prodNo.indexOf(',') != -1) {
	order.cartList();	
} else {
	order.directOrder();
}
order.info();