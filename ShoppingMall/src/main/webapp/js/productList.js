/**
 * 
 */
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

/*document.addEventListener('DOMContentLoaded', function() {
    console.log('리스트화면 이벤트발생');

    document.querySelectorAll('.nav-link').forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();  

            const categoryCode = this.getAttribute('data-no');
            if (categoryCode != null) {
                console.log( categoryCode); 
                if (categoryCode.length == 1) {
                    fetch('category.do?categoryCode=' + categoryCode)
                        .then(response => response.json())
                        .then(result => {
                            console.log(result); 
                            showList(result);
                        })
                        .catch(err => {
                            console.error(err); 
                        });
                } else if (categoryCode.length == 2) {
                    fetch('category.do?categoryCode=' + categoryCode)
                        .then(response => response.json())
                        .then(result => {
                            console.log("Fetched result:", result); 
                            showList(result);
                        })
                        .catch(err => {
                            console.error("Fetch error:", err); 
                        });
                }
            }
        });
    });
});
function showList(products) {
	console.log(products);

	const div = document.getElementById('products');
	div.innerHTML = '';

	products.forEach(product => {
		const colDiv = document.createElement('div');
		colDiv.className = 'col mb-5';

		const cardDiv = document.createElement('div');
		cardDiv.className = 'card h-100';

		const imgButton = document.createElement('a');
		imgButton.href = `productInfo.do?prodNo=${product.prodNo}`;

		const img = document.createElement('img');
		img.className = 'card-img-top';
		img.src = `images/${product.prodImage}`;

		const cardBodyDiv = document.createElement('div');
		cardBodyDiv.className = 'card-body p-4';
		const textCenterDiv = document.createElement('div');
		textCenterDiv.className = 'text-center';

		const nameButton = document.createElement('a');
		nameButton.href = `productInfo.do?prodNo=${product.prodNo}`;
		const productName = document.createElement('h5');
		productName.className = 'fw-bolder';
		productName.textContent = product.prodName;

		const cardFooterDiv = document.createElement('div');
		cardFooterDiv.className = 'card-footer p-4 pt-0 border-top-0 bg-transparent';

		const textCenterFDiv = document.createElement('div');
		textCenterFDiv.className = 'text-center';
		textCenterFDiv.textContent = product.prodPrice.numberFormat() + "원";

		const cartButton = document.createElement('a');
		cartButton.className = 'modal_open';
		cartButton.textContent = 'Cart';
		cartButton.addEventListener('click', function() {
			document.querySelector('.modal').style.display = 'block';
		});
		nameButton.appendChild(productName);
		textCenterDiv.appendChild(nameButton);
		cardBodyDiv.appendChild(textCenterDiv);
		textCenterFDiv.appendChild(cartButton);
		cardFooterDiv.appendChild(textCenterFDiv);

		imgButton.appendChild(img);
		cardDiv.appendChild(imgButton);
		cardDiv.appendChild(cardBodyDiv);
		cardDiv.appendChild(cardFooterDiv);

		colDiv.appendChild(cardDiv);
		div.appendChild(colDiv);
	});
}*/
/*document.addEventListener('DOMContentLoaded', function() {
	const modal = document.querySelector('.modal');
	const modalOpenButtons = document.querySelectorAll('.modal_open');
	const modalCartBtn = document.querySelector('.cart_btn');
	const modalClose = document.querySelector('.close_btn');
	let prodNo = null;
	let cartCnt =1;
	//열기 버튼을 눌렀을 때 모달팝업이 열림
	modalOpenButtons.forEach(button => {
		button.addEventListener('click', function(event) {
			event.preventDefault();
			prodNo = this.getAttribute('data-prodNo')
			event.preventDefault();
			modal.style.display = 'block';
		});
	});
	modalCartBtn.addEventListener('click', function() { //장바구니 넘어가는 이벤트
		modal.style.display = 'none';
		console.log('상품번호:'+prodNo);
		console.log('수량:'+cartCnt);
		console.log('유저id:' + userId);
		cartSvc.checkCart(userId, prodNo,
			result => {
				if (result.retCode == 'OK') {
					alert('해당상품이 장바구니에 있습니다.')
				} else {
					cartSvc.addCart(userId, prodNo, cartCnt,
						result => {
							if (result.retCode == 'OK') {
								window.location.href="cart.do"
							} else {
								console.log('처리실패');
							}
						},
						err => console.log(err)
					)
				}
			},
			err => console.log(err)
		)
	});
	modalClose.addEventListener('click', function() {
		modal.style.display = 'none';
		cartSvc.checkCart(userId, prodNo,
			result => {
				if (result.retCode == 'OK') {
					alert('해당상품이 장바구니에 있습니다.')
				} else {
					cartSvc.addCart(userId, prodNo, cartCnt,
						result => {
							if (result.retCode == 'OK') {
								alert('장바구니에 담겼습니다.')
							} else {
								console.log('처리실패');
							}
						},
						err => console.log(err)
					)
				}
			},
			err => console.log(err)
		)
	});
});
*/