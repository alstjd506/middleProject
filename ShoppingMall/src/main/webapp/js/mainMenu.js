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
			if (topCategory.length == 1) {
				fetch('menuTopCategory.do?topCategory=' + topCategory)
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
});
document.querySelectorAll('.nav-link').forEach(button => {
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
});

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


	products.forEach(product => {
		const colDiv = document.createElement('div');
		colDiv.className = 'col mb-5';
		const cardDiv = document.createElement('div');
		cardDiv.className = 'card h-100';
		const img = document.createElement('img'); //이미지 지정
		img.className = 'card-img-top';
		img.src = `images/${product.prodImage}`;
		console.log(product.Image);
		const cardBodyDiv = document.createElement('div');
		cardBodyDiv.className = 'card-body p-4';

		const textCenterDiv = document.createElement('div');
		textCenterDiv.className = 'text-center';

		const productName = document.createElement('h5'); //상품명
		productName.className = 'fw-bolder';
		productName.textContent = product.prodName;

		const cardFooterDiv = document.createElement('div');
		cardFooterDiv.className = 'card-footer p-4 pt-0 border-top-0 bg-transparent'
		const textCenterFDiv = document.createElement('div');
		textCenterFDiv.className = 'text-center';
		textCenterFDiv.textContent = product.prodPrice.numberFormat() + "원";

		const buyButton = document.createElement('a');
		buyButton.className = 'btn btn-outline-dark mt-auto';
		buyButton.href = `productInfo.do?prodNo=${product.prodNo}`;
		buyButton.textContent = 'Buy';
		const cartButton = document.createElement('a');
		cartButton.className = 'btn btn-outline-dark mt-auto';
		cartButton.href = `productInfo.do?prodNo=${product.prodNo}`;
		cartButton.textContent = 'Cart';

		textCenterDiv.appendChild(productName);
		cardBodyDiv.appendChild(textCenterDiv);
		textCenterFDiv.appendChild(buyButton);
		textCenterFDiv.appendChild(cartButton);
		cardFooterDiv.appendChild(textCenterFDiv);

		cardDiv.appendChild(img);
		cardDiv.appendChild(cardBodyDiv);
		cardDiv.appendChild(cardFooterDiv);

		colDiv.appendChild(cardDiv);
		rowDiv.appendChild(colDiv);

	});
	conDiv.appendChild(rowDiv);
	section.appendChild(conDiv);
}
