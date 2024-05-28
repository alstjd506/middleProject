/**
 * 
 */


function setImg(event) {
	var reader = new FileReader();
	console.log('여기들어왔어요');
	reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		document.querySelector("div#imgs").appendChild(img);
	};
	reader.readAsDataURL(event.target.files[0]);
}
/*document.getElementById('modBtn').addEventListener('click', function(e) {
	e.preventDefault();
	let prodNo = document.getElementById('prodNo').value;
	let name = document.getElementById('name').value;
	let price = document.getElementById('price').value;
	let comment = document.getElementById('content').value;
	console.log('prodNo: ' + prodNo + 'name: ' + name + 'price: ' + price + 'comment: ' + comment);
	let mainimg = document.getElementById('mainimg').value;
	let conimg = document.getElementById('conimg').value;
	console.log('mainimg: ' + mainimg + ' conimg: ' + conimg);
	fetch('adminProductModify.do', {
		headers: {
			Accept: "application / json",
		},
		method: 'post',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: 'prodNo=' + prodNo + '&Name=' + name + '&Price=' + price +
      '&comment=' + comment + '&mainimg=' + mainimg + '&conimg=' + conimg
	})
		.then(resolve => resolve.json())
		.then(result => {
			if (result.retCode == 'OK') {
				alert("상품수정완료!");
			} else {
				alert("오류발생!")
			}
			window.location.reload();
		})
})
*/
document.getElementById('cancelBtn').addEventListener('click', function() {
	window.location.href = 'adminProductInfo.do?prodNo=' + document.getElementById('prodNo').value;
});
