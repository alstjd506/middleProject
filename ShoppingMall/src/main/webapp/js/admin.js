/**
 * 
 */

document.getElementById('item_catemain').addEventListener('change',function(e){
	let cno= this.value;
	let sel = document.getElementById('item_catesub');
	deletecate();
	fetch('adminAddProductForm.do?cno='+cno)
	.then(resolve => resolve.json())
	.then(result=>{
		result.forEach(es =>{
		let op = document.createElement('option');
		op.innerText = es.categoryName;
		op.value = es.categoryCode;
		sel.appendChild(op);
		return;
		})
		
	})
})
function deletecate(){
	let selEle =document.getElementById('item_catesub');
	console.log(selEle.options.length);
	selEle.options.length=0;
	
}
/*function fnSubmit(){
	let topTitle = document.getElementById('item_catemain').value;
	let title = document.getElementById('item_catesub').value;
	let name = document.getElementById('item_name').value;
	let price = document.getElementById('item_price').value;
	let content = document.getElementById('item_content').value;
	let mainImg = document.getElementById('itemMainImg').value;
	let contentImg = document.getElementById('itemSubImg').value;
	
	console.log('topTitle'+topTitle+'title'+title+'name'+name+
		'price'+price+'content'+content+'mainImg'+mainImg+'contentImg'+contentImg);
	fetch('adminAddProductControl.do',{
		method:'post',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: 'topTitle'+topTitle+'&title'+title+'&name'+name+
		'&price'+price+'&content'+content+'&mainImg'+mainImg+'&contentImg'+contentImg
	})
	.then(resolve => resolve.json())
	.then(result =>{
		if(result.retCode=='OK'){
			alert("상품등록 완료!");
		}
	})
}*/

