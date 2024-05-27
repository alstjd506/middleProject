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

    // 이벤트 위임 사용: document 또는 상위 요소에 이벤트 핸들러 등록
    document.querySelectorAll('.nav-link').forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();  // 기본 동작 방지

            const categoryCode = this.getAttribute('data-no');
            if (categoryCode != null) {
                console.log( categoryCode); // 디버깅용 로그
                if (categoryCode.length == 1) {
                    fetch('category.do?categoryCode=' + categoryCode)
                        .then(response => response.json())
                        .then(result => {
                            console.log(result); // 디버깅용 로그
                            showList(result);
                        })
                        .catch(err => {
                            console.error(err); // 에러 로그
                        });
                } else if (categoryCode.length == 2) {
                    fetch('category.do?categoryCode=' + categoryCode)
                        .then(response => response.json())
                        .then(result => {
                            console.log("Fetched result:", result); // 디버깅용 로그
                            showList(result);
                        })
                        .catch(err => {
                            console.error("Fetch error:", err); // 에러 로그
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
document.addEventListener('DOMContentLoaded', function() {
	const modal = document.querySelector('.modal');
	const modalOpenButtons = document.querySelectorAll('.modal_open');
	const modalCartBtn = document.querySelector('.cart_btn');
	const modalClose = document.querySelector('.close_btn');

	//열기 버튼을 눌렀을 때 모달팝업이 열림
	modalOpenButtons.forEach(button => {
		button.addEventListener('click', function(event) {
			event.preventDefault();
			modal.style.display = 'block';
		});
	});

	modalCartBtn.addEventListener('click', function() { //장바구니 넘어가는 이벤트
		modal.style.display = 'none';
		window.location.href = 'cart.do';
	});

	modalClose.addEventListener('click', function() {
		modal.style.display = 'none';
	});

});
