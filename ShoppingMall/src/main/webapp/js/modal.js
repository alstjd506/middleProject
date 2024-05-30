/**
 * 
 */
document.addEventListener('DOMContentLoaded', function() {
    const modal = document.querySelector('.modal');
    const modalCartBtn = document.querySelector('.cart_btn');
    const modalClose = document.querySelector('.close_btn');
    let prodNo = null;
    let cartCnt = 1;

    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('modal_open')) {
            e.preventDefault();
            prodNo = e.target.getAttribute('data-prodNo');
            modal.style.display = 'block';
            modal.setAttribute('data-prodNo', prodNo);
        }
    });

    modalCartBtn.addEventListener('click', function() {
        modal.style.display = 'none';
        prodNo = modal.getAttribute('data-prodNo');

        console.log('상품번호:' + prodNo);
        console.log('상품갯수:' + cartCnt);

        cartSvc.checkCart(prodNo, result => {
            if (result.retCode == 'OK') {
                alert('해당상품이 장바구니에 있습니다.');
            } else {
                cartSvc.addCart(prodNo, cartCnt, result => {
                    if (result.retCode == 'OK') {
                        window.location.href = 'cart.do';
                    } else {
						alert('로그인이 필요한 서비스입니다.');
						location.href='login.do';
                        console.log('처리실패');
                    }
                }, err => console.log(err));
            }
        }, err => console.log(err));
    });

    modalClose.addEventListener('click', function() {
        modal.style.display = 'none';
        cartSvc.checkCart(prodNo, result => {
            if (result.retCode == 'OK') {
                alert('해당상품이 장바구니에 있습니다.');
            } else {
                cartSvc.addCart(prodNo, cartCnt, result => {
                    if (result.retCode == 'OK') {
                        alert('장바구니에 담겼습니다.');
                    } else {
                        console.log('처리실패');
                    }
                }, err => console.log(err));
            }
        }, err => console.log(err));
    });
});