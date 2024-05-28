/**
 * 
 */
const svc = {
	// 댓글목록 => 페이지, 성공콜백, 실패콜백
	reviewList(param = {}, successCall, errorCall) {
		fetch('adminReviewList.do?prodNo=' + param.prodNo + '&rpage=' + param.rpage)
			.then(resolve => resolve.json()) // json -> 객체.
			.then(successCall)
			.catch(errorCall);
	},
	// 댓글 전체건수
	getTotalCount(prodNo = 1, successCall, errorCall) {
		fetch('adminCountReview.do?prodNo=' + prodNo)
			.then(resolve => resolve.json()) // {totalCount = 10}
			.then(successCall)
			.catch(errorCall);
	},


}

document.getElementById('review-tab').addEventListener('click', function() {
		const prodNo = document.getElementById('prodNo').textContent;
		showList();
		function showList() {
			document.querySelectorAll('div.reviewList ul li').forEach((li, idx) => {
				if (idx >= 3) {
					li.remove();
				}
			})
			svc.reviewList({prodNo: prodNo, rpage: rpage },
				result => {
					console.log(result);
					result.forEach(review => {
						const row = makeRow(review);
						document.querySelector('div.reviewList ul').appendChild(row);
					})
					makePageInfo();
				},
				err => {
					console.log(err);
				}
			)
		}

	function makeRow(review = {}) {
			let tmpl = document.querySelector('div.reviewList ul li:nth-of-type(3)').cloneNode(true);
			tmpl.style.display = 'block';
			tmpl.setAttribute('data-rno', review.reviewNo);
			tmpl.setAttribute('data-userId', review.userId);
			tmpl.querySelector('span:nth-of-type(1)').innerHTML = review.reviewNo;
			tmpl.querySelector('span:nth-of-type(2)').innerText = review.reviewScore;
			tmpl.querySelector('span:nth-of-type(3)').innerText = review.reviewContent;
			tmpl.querySelector('span:nth-of-type(4)').innerText = review.userId;
			tmpl.querySelector('span:nth-of-type(5)').innerText = new Date(review.reviewDate).toLocaleString();
			return tmpl;
		}

let pagination = document.querySelector('div.pagination');

function makePageInfo() {
	svc.getTotalCount(prodNo,
		createPageList	//성공햇을떄 실행할 함수
	),
		err => console.log(err);
}

function createPageList(result) {
	console.log(result);

	let totalCnt = result.totalCount;
	let startPage, endPage, realEnd;
	let prev, next;

	realEnd = Math.ceil(totalCnt / 10);

	endPage = Math.ceil(rpage / 10) * 10;
	startPage = endPage - 9;
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
			rpage = parseInt(e.target.dataset.page, 10); //페이지 지정
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
			rpage = parseInt(e.target.dataset.page, 10);//페이지 지정
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
			rpage = parseInt(e.target.dataset.page, 10); //페이지 지정
			showList();
		})
		pagination.appendChild(aTag);
	}
}


	
});

