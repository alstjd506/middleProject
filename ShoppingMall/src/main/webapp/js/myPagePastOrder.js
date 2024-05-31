document.addEventListener('DOMContentLoaded', function() {
    const cartBtn = document.querySelectorAll('.cartBtn');
    const buyBtn = document.querySelectorAll('.buyBtn');
    const orderForm = document.getElementById('orderForm');
    const formProdCnt = document.getElementById('formProdCnt'); 

    cartBtn.forEach(button => {
        button.addEventListener('click', function() {
            const prodNo = this.dataset.prodno;
            addCartProd(prodNo);
        });
    });

    buyBtn.forEach(button => { 
        button.addEventListener('click', function() {
            const prodNo = this.dataset.prodno;
            const cartCnt = 1;
            console.log('주문상품:', prodNo);
            console.log('주문수량:', cartCnt);

            formProdCnt.value = cartCnt;
            orderForm.submit();
        });
    });

    function addCartProd(prodNo) {
        let cartCnt = 1;
        cartSvc.checkCart(prodNo, 
            result => {
                if (result.retCode == 'OK') {
                    alert('해당 상품이 장바구니에 있습니다.');
                } else {
                    cartSvc.addCart(prodNo, cartCnt,
                        result => {
                            if (result.retCode == 'OK') {
                                window.location.href = 'cart.do';
                            } else {
                                console.log('처리 실패');
                            }
                        },
                        err => console.log(err)
                    );
                }
            },
            err => console.log(err)
        );
    }
});
document.querySelectorAll('.detail').forEach(function(element) {
	element.addEventListener('click', function(event) {
		event.preventDefault();
		var orderNo = this.getAttribute('data-order-no');
		var form = document.getElementById('orderForm' + orderNo);
		form.submit();
	});
});
