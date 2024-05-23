/**
 * 
 */
Number.prototype.numberFormat = function() {
    if (this == 0)
        return '0';
    let regex = /(^[+-]?\d+)(\d{3})/;
    let nstr = (this + '');
    while (regex.test(nstr)) {
        nstr = nstr.replace(regex, '$1' + ',' + '$2');
    }
    return nstr;
};

document.addEventListener('DOMContentLoaded', function() {
    const subBtn = document.getElementById('subBtn');
    const addBtn = document.getElementById('addBtn');
    const inputQty = document.getElementById('inputQuantity');
    const productPrice = parseInt(document.getElementById('productPrice').dataset.price); 
    const sumPrice = document.getElementById('sum_p_price').querySelector('span');
	const addCartBtn = document.getElementById('addCartBtn');
	
    function TotalPrice() {
        const qty = parseInt(inputQty.value);
        const total = qty * productPrice;
        sumPrice.textContent = (total).numberFormat() + '원';
    }

    subBtn.addEventListener('click', function() {
        let currentValue = parseInt(inputQty.value);
        if (currentValue > 1) {
            inputQty.value = currentValue - 1;
            TotalPrice();
        }
    });

    addBtn.addEventListener('click', function() {
        let currentValue = parseInt(inputQty.value);
        inputQty.value = currentValue + 1;
        TotalPrice();
    });

    inputQty.addEventListener('input', function() {
        let currentValue = parseInt(inputQty.value);
        if (isNaN(currentValue) || currentValue < 1) {
            inputQty.value = 1;
        }
        TotalPrice();
    });
    
    addCartBtn.addEventListener('click', function(){
		const prodNo = document.getElementById('prodNo').textContent;
		console.log(prodNo);		
		const qty = parseInt(inputQty.value);
		console.log(qty);
		
	})
    
    

    TotalPrice();
});


 