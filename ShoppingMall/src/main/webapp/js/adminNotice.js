/**
 * 
 */
document.getElementById('add').addEventListener('click',function(){
	let title = document.getElementById('title').value;
	let content = document.getElementById('content').value;
	
	console.log('title: '+title);
	console.log('content: '+content);
	fetch('adminNoticeControl.do',{
		method:'post',
		headers:{ 'Content-Type': 'application/x-www-form-urlencoded' },
		body:'title='+title+'&content='+content
	}) 
	.then(resolve =>resolve.json())
	.then(result=>{
		if(result.retCode=='OK'){
			alert("공지사항 등록완료!");
			console.log(result.retCode);
			window.location.href = "adminBoardList.do";
		}else{
			alert("오류발생!!");
		}
	})
})
document.getElementById('cancle').addEventListener('click',function(){
	window.location.href = "admin.do";
})