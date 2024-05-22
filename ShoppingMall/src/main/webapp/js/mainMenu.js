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
document.querySelectorAll('.nav-all').forEach(button => {
	button.addEventListener('click', function() {

		const topCategory = this.getAttribute('data-no');
		console.log(topCategory);
		fetch('menuTopCategory.do?topCategory=' + topCategory)
			.then(response => response.json())
			.then(result => {
				showList(result);
			})
			.catch(err => {
				console.log(err);
			});
	});
});
document.querySelectorAll('.nav-link').forEach(button => {
	button.addEventListener('click', function() {

		const categoryCode = this.getAttribute('data-no');
		console.log(categoryCode);
		fetch('menuCategory.do?categoryCode=' + categoryCode)
			.then(response => response.json())
			.then(result => {
				showList(result);
			})
			.catch(err => {
				console.log(err);
			});
	});
});

function showBody(products) {
	console.log(products);

	const section = document.getElementById('section');
	section.innerHTML = '';
	

	products.forEach(product => {
		const conDiv = document.createElement('div');
		conDiv.className ='container px-4 px-lg-5 mt-5';
		const contDiv = document.createElement('div');
		contDiv.className ='content_box';
		
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

		const productPrice = document.createElement('div'); // 상품가격
		productPrice.textContent = product.prodPrice.numberFormat() + "원";

		textCenterDiv.appendChild(productName);
		textCenterDiv.appendChild(productPrice);
		cardBodyDiv.appendChild(textCenterDiv);

		const cardFooterDiv = document.createElement('div');
		cardFooterDiv.className = 'card-footer p-4 pt-0 border-top-0 bg-transparent'
		const textCenterFDiv = document.createElement('div');
		textCenterFDiv.className = 'text-center';
		const viewButton = document.createElement('a');
		viewButton.className = 'btn btn-outline-dark mt-auto';
		viewButton.href = `productInfo.do?bno=${product.prodNo}`;
		viewButton.textContent = 'View options';

		textCenterFDiv.appendChild(viewButton);
		cardFooterDiv.appendChild(textCenterFDiv);

		cardDiv.appendChild(img);
		cardDiv.appendChild(cardBodyDiv);
		cardDiv.appendChild(cardFooterDiv);

		colDiv.appendChild(cardDiv);
		contDiv.appendChild(colDiv);
		conDiv.appendChild(contDiv);
	})
}
