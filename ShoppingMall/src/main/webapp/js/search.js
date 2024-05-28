
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

document.addEventListener("DOMContentLoaded", function(e) {
	e.preventDefault();

	const keywordBtn = document.getElementById('keywordBtn');
	const filterSelect = document.querySelector('.filter-select');

	if (keywordBtn && filterSelect) {
		function searchProduct() {
			const keyword = document.getElementById('keyword').value;
			const filter = document.querySelector('.filter-select').value;
			console.log(keyword);
			console.log(filter);
			fetch('search.do?keyword=' + keyword + '&filter=' + filter)
				.then(response => response.json())
				.then(result => {
					console.log(result);
					showSearchResults(result);
				})
				.catch(err => {
					console.error(err);
				});
		};
		keywordBtn.addEventListener('click', searchProduct);
		filterSelect.addEventListener('change', searchProduct);
	};

	function showSearchResults(products) {
		const div = document.getElementById('searchResults');
		div.innerHTML = '';

		products.forEach(product => {
			const colDiv = document.createElement('div');
			colDiv.className = 'col mb-5';
			const cardDiv = document.createElement('div');
			cardDiv.className = 'card h-100';
			const imgButton = document.createElement('a');
			imgButton.href = `productInfo.do?prodNo=${product.prodNo}`;

			const img = document.createElement('img'); // 이미지 지정
			img.className = 'card-img-top';
			img.src = `images/${product.prodImage}`;

			const cardBodyDiv = document.createElement('div');
			cardBodyDiv.className = 'card-body p-4';
			const textCenterDiv = document.createElement('div');
			textCenterDiv.className = 'text-center';

			const nameButton = document.createElement('a');
			nameButton.href = `productInfo.do?prodNo=${product.prodNo}`;
			const productName = document.createElement('h5'); // 상품명
			productName.className = 'fw-bolder';
			productName.textContent = product.prodName;

			const cardFooterDiv = document.createElement('div');
			cardFooterDiv.className = 'card-footer p-4 pt-0 border-top-0 bg-transparent';

			const priceAndCartDiv = document.createElement('div');
			priceAndCartDiv.className = 'price-and-cart';

			const priceSpan = document.createElement('span');
			priceSpan.className = 'price';
			priceSpan.textContent = product.prodPrice.numberFormat() + "원";

			const cartButton = document.createElement('a');
			cartButton.className = 'modal_open';
			cartButton.setAttribute('data-prodNo', `${product.prodNo}`);
			cartButton.textContent = 'Cart';

			const starDiv = document.createElement('div');
			starDiv.className = 'd-flex small text-warning mb-2 star';
			for (let i = 1; i <= product.prodScore; i++) {
				const starIcon = document.createElement('div');
				starIcon.className = 'bi-star-fill';
				starDiv.appendChild(starIcon);
			}
			const scoreSpan = document.createElement('span');
			scoreSpan.id = 'productScore';
			scoreSpan.style.color = 'black';
			scoreSpan.style.marginLeft = '5px';
			scoreSpan.textContent = product.prodScore + '점';

			starDiv.appendChild(scoreSpan);

			nameButton.appendChild(productName);
			textCenterDiv.appendChild(nameButton);
			cardBodyDiv.appendChild(textCenterDiv);

			priceAndCartDiv.appendChild(priceSpan);
			priceAndCartDiv.appendChild(cartButton);
			cardFooterDiv.appendChild(priceAndCartDiv);
			cardFooterDiv.appendChild(starDiv);

			imgButton.appendChild(img);
			cardDiv.appendChild(imgButton);
			cardDiv.appendChild(cardBodyDiv);
			cardDiv.appendChild(cardFooterDiv);

			colDiv.appendChild(cardDiv);
			div.appendChild(colDiv);
		});
	}

	/*const modal = document.querySelector('.modal');
	const modalCartBtn = document.querySelector('.cart_btn');
	const modalClose = document.querySelector('.close_btn');

	document.getElementById('searchResults').addEventListener('click', function(event) {
		if (event.target.classList.contains('modal_open')) {
			const prodNo = event.target.getAttribute('data-prodNo');
			event.preventDefault();
			modal.setAttribute('data-prodNo', prodNo);
			modal.style.display = 'block';
		}
	});

	modalCartBtn.addEventListener('click', function() { //장바구니 넘어가는 이벤트
		modal.style.display = 'none';
		const prodNo = modal.getAttribute('data-prodNo');
		const cartCnt = 1;
		console.log('상품번호:' + prodNo);
		console.log('유저id:' + userId);
		console.log('수량:' + cartCnt);
		cartSvc.addCart(userId, prodNo, cartCnt,
			result => {
				if (result.retCode == 'OK') {
					window.location.href = 'cart.do';
				} else {
					console.log('처리실패');
				}
			},
			err => console.log(err)
		)
	});

	modalClose.addEventListener('click', function() {
		modal.style.display = 'none';
	});*/
});