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
document.addEventListener('DOMContentLoaded', function() {
	showPage('popProducts', 0); // 리스트 초기 페이지 설정
	showPage('newProducts', 0);
	showPage('ctgProducts', 0);
	showPage('mdProducts', 0);
	showPage('cheapProducts', 0);

	document.getElementById('prev-pop').addEventListener('click', function() {
		changePage('popProducts', -1);
	});
	document.getElementById('next-pop').addEventListener('click', function() {
		changePage('popProducts', 1);
	});
	document.getElementById('prev-new').addEventListener('click', function() {
		changePage('newProducts', -1);
	});
	document.getElementById('next-new').addEventListener('click', function() {
		changePage('newProducts', 1);	
	});
	document.getElementById('prev-ctg').addEventListener('click', function() {
		changePage('ctgProducts', -1);
	});
	document.getElementById('next-ctg').addEventListener('click', function() {
		changePage('ctgProducts', 1);
	});
	document.getElementById('prev-md').addEventListener('click', function() {
		changePage('mdProducts', -1);
	});
	document.getElementById('next-md').addEventListener('click', function() {
		changePage('mdProducts', 1);
	});
	document.getElementById('prev-cheap').addEventListener('click', function() {
		changePage('cheapProducts', -1);
	});
	document.getElementById('next-cheap').addEventListener('click', function() {
		changePage('cheapProducts', 1);
	});
	
	loadCategory(1); 
	
});
function loadCategory(topCategory){
	fetch('category.do?topCategory=' + topCategory)
			.then(response => response.json())  
			.then(result => {
				showList(result);
				showPage('ctgProducts', 0);
			})
			.catch(err => {
				console.log(err);  
			});
}
function showPage(divId, page) {
	let div = document.getElementById(divId);
	let productPage = 5; // 보여지는 상품갯수
	let children = div.children; // 상품리스트 한개한개의 div
	let totalProduct = children.length; // 상품 div의 갯수
	let totalPage = Math.ceil(totalProduct / productPage);
	let newPage = Math.max(0, Math.min(page, totalPage - 1)); // 페이지 범위를 확인

	let startIndex = newPage * productPage; // 현재 페이지의 시작 인덱스
	let endIndex = startIndex + productPage; // 현재 페이지의 종료 인덱스

	div.setAttribute('data-page', newPage);
	for (let i = 0; i < children.length; i++) {
		// 페이지에 포함되면 보이게 설정
		if (i >= startIndex && i < endIndex) {
			children[i].style.display = '';
		} else {
			children[i].style.display = 'none';
		}
	}
}
function changePage(divId, updown) {
	let div = document.getElementById(divId);
	let currentPage = parseInt(div.getAttribute('data-page'), 10); // data-page를 10진수로 가져와 currentPage에 저장
	showPage(divId, currentPage + updown); // 상품div의 data-page를 -1 , 1 변경
}

document.querySelectorAll('.category-btn').forEach(button => {
	button.addEventListener('click', function() {

		const topCategory = this.getAttribute('data-type');
		console.log(topCategory);
		fetch('category.do?topCategory=' + topCategory)
			.then(response => response.json())  
			.then(result => {
				showList(result);
				showPage('ctgProducts', 0);
			})
			.catch(err => {
				console.log(err);  
			});

	});
});

function showList(products) {
	console.log(products);
	
	const div = document.getElementById('ctgProducts');
	div.innerHTML = '';

	products.forEach(product => {
		const colDiv = document.createElement('div');
		colDiv.className = 'col mb-5';
		const cardDiv = document.createElement('div');
		cardDiv.className = 'card h-100';
		const img = document.createElement('img'); //이미지 지정
		img.className = 'card-img-top';
		img.src = `images/${product.prodImage}`;
		console.log(product.img);

		const cardBodyDiv = document.createElement('div');
		cardBodyDiv.className = 'card-body p-4';
		const textCenterDiv = document.createElement('div');
		textCenterDiv.className = 'text-center';

		const productName = document.createElement('h5'); //상품명
		productName.className = 'fw-bolder';
		productName.textContent = product.prodName;

		const productPrice = document.createElement('div'); // 상품가격
		productPrice.textContent = product.prodPrice.numberFormat()+"원";

		textCenterDiv.appendChild(productName);
		textCenterDiv.appendChild(productPrice);
		cardBodyDiv.appendChild(textCenterDiv);

		const cardFooterDiv = document.createElement('div');
		cardFooterDiv.className = 'card-footer p-4 pt-0 border-top-0 bg-transparent'
		const textCenterFDiv = document.createElement('div');
		textCenterFDiv.className = 'text-center';
		const viewButton = document.createElement('a');
		viewButton.className = 'btn btn-outline-dark mt-auto';
		viewButton.href = '#';
		viewButton.textContent = 'View options';

		textCenterFDiv.appendChild(viewButton);
		cardFooterDiv.appendChild(textCenterFDiv);

		cardDiv.appendChild(img);
		cardDiv.appendChild(cardBodyDiv);
		cardDiv.appendChild(cardFooterDiv);

		colDiv.appendChild(cardDiv);
		div.appendChild(colDiv);
	})
}

