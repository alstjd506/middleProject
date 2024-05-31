/**
 * 
 */
const svc = {
	// 댓글목록 => 페이지, 성공콜백, 실패콜백
	reviewList(param = {}, successCall, errorCall) {
		fetch('reviewList.do?prodNo=' + param.prodNo + '&rpage=' + param.rpage)
			.then(resolve => resolve.json()) // json -> 객체.
			.then(successCall)
			.catch(errorCall);
	},
	// 댓글등록 => 댓글정보, 성공콜백, 실패콜백
	addReview(param = {}, successCall, errorCall) {
		
		fetch('addReview.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'prodNo=' + param.prodNo + '&userId=' + param.userId + '&reviewContent=' + param.reviewContent + '&reviewScore=' + param.reviewScore
		})
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	},
	// 댓글삭제 => 삭제할번호, 성공콜백, 실패콜백
	removeReview(reviewNo = 1, successCall, errorCall) {
		fetch('removeReview.do?reviewNo=' + reviewNo)
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	},
	// 댓글 전체건수
	getTotalCount(prodNo = 1, successCall, errorCall) {
		fetch('getTotalCnt.do?prodNo=' + prodNo)
			.then(resolve => resolve.json()) // {totalCount = 10}
			.then(successCall)
			.catch(errorCall);
	},
	//댓글 수정
	modifyview(param = {}, successCall, errorCall) {
		fetch('modifyReview.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'reviewNo=' + param.reviewNo + '&reviewContent=' + param.reviewContent+'&reviewLike'+param.like
		})
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	}
	
} 