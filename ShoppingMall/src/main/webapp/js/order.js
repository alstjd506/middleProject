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
		let userId = 'user01';
		orderSvc.orderList(userId, prodNo,
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
	
	// 주문회원 정보
	info: function() {
		let userId = 'user01';
		orderSvc.orderInfo(userId, 
			result => {
				$('#name').val(result.userName)
						  .attr('readonly', true)
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
		$('#name').val('')
				  .attr('readonly', false)
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
	let userId = 'user01';
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
	// 회원아이디, 우편번호, 주소, 상세주소 추가해야 함
	
	//$('body').append(form);
	
	//form.submit();
})



// 메인
order.list();
order.info();