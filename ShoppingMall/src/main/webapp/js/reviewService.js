/**
 * 
 */
const svc = {
	// 댓글목록 => 페이지, 성공콜백, 실패콜백
	reviewList(param = {}, successCall, errorCall) {
		fetch('reviewList.do?bno=' + param.prodNo + '&page=' + param.page)
			.then(resolve => resolve.json()) // json -> 객체.
			.then(successCall)
			.catch(errorCall);
	},
	// 댓글등록 => 댓글정보, 성공콜백, 실패콜백
	addReview(param = {}, successCall, errorCall) {
		
		fetch('addReview.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'prodNo=' + param.prodNo + '&replyer=' + param.writer + '&reply=' + param.reply
		})
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	},
	// 댓글삭제 => 삭제할번호, 성공콜백, 실패콜백
	removeReview(rno = 1, successCall, errorCall) {
		fetch('removeReview.do?rno=' + rno)
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	},
	// 댓글 전체건수
	getTotalCount(bno = 1, successCall, errorCall) {
		fetch('getTotalCnt.do?bno=' + bno)
			.then(resolve => resolve.json()) // {totalCount = 10}
			.then(successCall)
			.catch(errorCall);
	},
	//댓글 수정
	modifyview(param = {}, successCall, errorCall) {
		fetch('addReview.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'reviewNo=' + param.reviewNo + '&review=' + param.review
		})
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	}
	
} 