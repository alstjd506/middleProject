/**
 * 
 */





 let rpage = 1;
showList();
function showList() {
	// 댓글목록을 초기화
	document.querySelectorAll('div.content ul li').forEach((li, idx) => {
		if (idx >= 3) {
			li.remove();
		}
	})
	svc.reviewList({ prodNo: prodNo, page: rpage },
		result => {
			console.log(result);
			result.forEach(reply => {
				const row = makeRow(reply);
				document.querySelector('div.reply ul').appendChild(row);

			})
			makePageInfo();
		},// 두번쨰 param.
		err => {
			console.log(err);
		} // 세번쨰 param
	)//end of replyList

}//목록 출력


//삭제버튼
function deleteRow(e) {
	console.log(e);
	const rno = e.target.parentElement.parentElement.dataset.rno;
	const replyer = e.target.parentElement.parentElement.dataset.replyer;
	console.log(replyer);
	if (writer == replyer) {
		svc.removeReply(rno,
		result => {
				if (result.retCode == 'OK') {
					alert('삭제완료');
					//e.target.parentElement.parentElement.remove();
					
					showList();

				} else if (result.retCode == 'NG') {
					alert('삭제를 완료할 수 없습니다.');
				} else {
					alert('알수없는 반환값');
				}
			},
			err => console.log(err))
		}else{
			alert('다른사람의 댓글을 삭제할 수 없습니다')		
		}
}

document.getElementById('addReply').addEventListener('click', function(e) {
	let reply = document.getElementById('reply').value;

	/*if (!writer) {
		alert('로그인하세요');
		return;
	}*/
	if (!reply) {
		alert('댓글 내용을 입력하세요');
		return;
	}
	svc.addReply({bno: bno, writer: writer, reply:reply},
	result => {
			if (result.retCode == 'OK') {
				//location.reload();
				const row = makeRow(result.retVal);
				document.querySelector('div.reply ul').appendChild(row);
				//댓글초기화
				document.querySelector('#reply').value = "";
				
				svc.getTotalCount(bno, 
				result => {
					let totalCnt = result.totalCount;
					let realEnd = Math.ceil(totalCnt / 5);
					rpage = realEnd;
					showList();
				},
				err => console.log(err));
			}
	},
		err => console.log(err));

});

//row 생성.
function makeRow(reply = {}) {
	let tmp1 = document.querySelector('div.reply li:nth-of-type(3)').cloneNode(true);
	console.log(tmp1);
	tmp1.style.display = 'block';
	tmp1.setAttribute('data-rno', reply.replyNo); //실제 replyNo를 가지고잇는 reply를 담아둔다
	tmp1.setAttribute('data-replyer', reply.replyer);
	tmp1.querySelector('span:nth-of-type(1)').innerText = reply.replyNo;
	tmp1.querySelector('span:nth-of-type(2)').innerText = reply.reply;
	tmp1.querySelector('span:nth-of-type(3)').innerText = reply.replyer;
	return tmp1;
}

//페이징 생성.
let pagination = document.querySelector('div.pagination');

function makePageInfo(){
	svc.getTotalCount(bno,
		createPageList	//성공햇을떄 실행할 함수
		),
		err => console.log(err);
}


function createPageList(result) {
	console.log(result);

	let totalCnt = result.totalCount;
	let startPage, endPage, realEnd;
	let prev, next;

	realEnd = Math.ceil(totalCnt / 5);

	endPage = Math.ceil(rpage / 5) * 5;
	startPage = endPage - 4;
	endPage = endPage > realEnd ? realEnd : endPage;

	prev = startPage > 1;
	next = endPage < realEnd;

	console.log(startPage, endPage, realEnd, prev, next);

	// a 태그 생성. 
	pagination.innerHTML = '';

	//이전 페이지 여부.
	if (prev) {
		let aTag = document.createElement('a');
		aTag.setAttribute('data-page', startPage - 1);
		aTag.setAttribute('href', '#');
		aTag.innerHTML = "&laquo;";
		aTag.addEventListener('click', function(e) {
			e.preventDefault(); // a 태그는 페이지이동.
			rpage = e.target.dataset.page; //페이지 지정
			showList();
		})
		pagination.appendChild(aTag);
	}
	for (let rpg = startPage; rpg <= endPage; rpg++) {
		let aTag = document.createElement('a');
		aTag.setAttribute('data-page', rpg);
		aTag.setAttribute('href', rpg);
		if (rpg == rpage) {
			aTag.className = 'active';
		}
		aTag.innerHTML = rpg;
		aTag.addEventListener('click', function(e) {
			e.preventDefault(); // a 태그는 페이지이동.
			rpage = e.target.dataset.page; //페이지 지정
			showList();
		})
		pagination.appendChild(aTag);

	}
	//이후 페이지 여부.
	if (next) {
		let aTag = document.createElement('a');
		aTag.setAttribute('data-page', endPage + 1);
		aTag.setAttribute('href', '#');
		aTag.innerHTML = "&raquo;";
		aTag.addEventListener('click', function(e) {
			e.preventDefault(); // a 태그는 페이지이동.
			rpage = e.target.dataset.page; //페이지 지정
			showList();
		})
		pagination.appendChild(aTag);
	}
}
