/**
 * 
 */
/*document.getElementById('modBtn').addEventListener('click',function(e){
	let prodNo = document.getElementById('prodNo').innerText;
	
})*/
document.getElementById('delBtn').addEventListener('click', function() {
	let prodNo = document.getElementById('prodNo').value;
	console.log("이거찍어" + prodNo);
	fetch('adminProductRemove.do?prodNo=' + prodNo)
		.then(resolve => resolve.json())
		.then(result => {
			if (result.retCode == 'OK') {
				Swal.fire({
					title: "Good job!",
					text: "삭제완료",
					icon: "success"
				});
				window.location.href = 'adminProductList.do';
			} else {
				alert("삭제실패");
			}
		})

})
