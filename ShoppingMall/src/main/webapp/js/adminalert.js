/**
 * 
 */
console.log(cno);
fetch('adminCancleAgree.do?ono='+cno)
.then(resolve => resolve.json())
.then(result =>{
	if(result.status=='success'){
		alert('처리완료.');
	}else{
		alert('처리실패');
	}
})