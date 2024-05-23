/**
 * 
 */
document.getElementById('item_catemain').addEventListener('change',function(){
	let cno= this.value;
	let op = document.createElement('option')
	let sel = document.getElementById('item_catesub');
	fetch('adminAddProductForm.do?cno='+cno)
	.then(resolve => resolve.json())
	.then(result=>{
		console.log(result);
		result.forEach(es =>{
		op.innerText = es.categoryName;
		op.value = es.categoryCode;
		sel.appendChild(op);
		return;
		})
		
		
	})
		
	
})