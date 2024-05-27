// function searchProducts(filter = 'sales') {

function searchProducts() {
	const keyword = document.getElementById('keyword').value;
	console.log(keyword);
	fetch('search.do?keyword=' + keyword)
		.then(response => response.json())
		.then(result => {
			showSearchResults(result);
		})
		.catch(err => {
			console.error(err);
		});
};

document.addEventListener('DOMContentLoaded', function() {
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
	}
});