
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
function getQueryParam(param) {
    let params = new URLSearchParams(window.location.search);
    return params.get(param);
}

const categoryCode = getQueryParam('categoryCode');
document.querySelector('.filter-select').addEventListener('change', function() {
    const filterValue = encodeURIComponent(this.value); 
    
    console.log(filterValue);
    console.log(categoryCode);
    fetch(`filterProductList.do?categoryCode=${categoryCode}&filter=${filterValue}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json(); // 
        })
        .then(data => {
            showList(data); //
        })
        .catch(error => console.error('Error:', error));
});

function showList(products) {
      const div = document.getElementById('products');
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