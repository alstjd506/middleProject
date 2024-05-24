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

document.querySelectorAll('.nav-link').forEach(link => {
	link.addEventListener('click', function() {

		const topCategory = this.getAttribute('data-no');
		if (topCategory != null) {
			console.log(topCategory);
		/*	if (topCategory.length == 1) {*/
				fetch('menuTopCategory.do?topCategory=' + topCategory)
					.then(response => response.json())
					.then(result => {
						showBody(result);
					})
					.catch(err => {
						console.log(err);
					});
			/*}*/

		}

	});
});
/*document.querySelectorAll('.nav-link').forEach(button => {
	button.addEventListener('click', function() {

		const categoryCode = this.getAttribute('data-no');
		console.log(categoryCode);
		if (categoryCode != null) {
			if (categoryCode.length == 2) {
				fetch('menuCategory.do?categoryCode=' + categoryCode)
					.then(response => response.json())
					.then(result => {

						showBody(result);
					})
					.catch(err => {
						console.log(err);
					});
			}
		}
	});
});*/

function showBody(products) {
	console.log(products);

	const section = document.getElementById('section');
	section.innerHTML = '';

	const conDiv = document.createElement('div');
	conDiv.className = 'container px-4 px-lg-5 mt-5';
	const contDiv = document.createElement('div');
	contDiv.className = 'content_box';
	const rowDiv = document.createElement('div')
	rowDiv.className = 'row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center'
	
	//모달창 생성
	const ctgModal = document.createElement('div'); //모달창
	ctgModal.className = 'modal';
	ctgModal.style.display = 'none';
	const modalPopup = document.createElement('div');
	modalPopup.className = 'modal_popup';
	const comment = document.createElement('p');
	comment.textContent = '상품이 장바구니에 담겼습니다.'
	const modalCartBtn = document.createElement('button'); //장바구니가기버튼
	modalCartBtn.className = 'cart_btn';
	modalCartBtn.textContent = '장바구니 보기';
	modalCartBtn.addEventListener('click', function() { //장바구니 클릭 이벤트
		const modal = document.querySelector('.modal');
		modal.style.display = 'none';
		window.location.href = 'cart.do';
	});
	
	const modalCloseBtn = document.createElement('button'); //계속쇼핑하기버튼
	modalCloseBtn.className = 'close_btn';
	modalCloseBtn.textContent = '계속쇼핑 하기';
	modalCloseBtn.addEventListener('click', function() {//계속쇼핑 클릭 이벤트
		const modal = document.querySelector('.modal');
		modal.style.display = 'none';
	});

	modalPopup.appendChild(comment);
	modalPopup.appendChild(modalCartBtn);
	modalPopup.appendChild(modalCloseBtn);
	ctgModal.appendChild(modalPopup);
	section.appendChild(ctgModal); // section에 모달창 추가

	products.forEach(product => {
		const colDiv = document.createElement('div');
		colDiv.className = 'col mb-5';
		const cardDiv = document.createElement('div');
		cardDiv.className = 'card h-100';
		const imgButton = document.createElement('a');
		imgButton.href = `productInfo.do?prodNo=${product.prodNo}`;

		const img = document.createElement('img'); //이미지 지정
		img.className = 'card-img-top';
		img.src = `images/${product.prodImage}`;
		const cardBodyDiv = document.createElement('div');
		cardBodyDiv.className = 'card-body p-4';

		const textCenterDiv = document.createElement('div');
		textCenterDiv.className = 'text-center';
		const nameButton = document.createElement('a');
		nameButton.href = `productInfo.do?prodNo=${product.prodNo}`;

		const productName = document.createElement('h5'); //상품명
		productName.className = 'fw-bolder';
		productName.textContent = product.prodName;

		const cardFooterDiv = document.createElement('div');
		cardFooterDiv.className = 'card-footer p-4 pt-0 border-top-0 bg-transparent'
		const textCenterFDiv = document.createElement('div');
		textCenterFDiv.className = 'text-center';
		textCenterFDiv.textContent = product.prodPrice.numberFormat() + "원";

		const cartButton = document.createElement('a');
		cartButton.className = 'modal_open';
		cartButton.textContent = 'Cart';
		cartButton.addEventListener('click', function() {
			document.querySelector('.modal').style.display = 'block';
		})

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
		rowDiv.appendChild(colDiv);

	});
	conDiv.appendChild(rowDiv);
	section.appendChild(conDiv);
};



