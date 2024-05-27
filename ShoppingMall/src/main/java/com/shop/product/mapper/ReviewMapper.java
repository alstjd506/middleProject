package com.shop.product.mapper;

import java.util.List;

import com.shop.vo.ReviewVO;
import com.shop.common.SearchVO;

public interface ReviewMapper {
	//댓글목록
	List<ReviewVO> reviewList(int prodNo);
	List<ReviewVO> reviewListPaging(SearchVO search);
	
	//리뷰삭제
	int deleteReview(int reviewNo);
	
	//리뷰갯수
	int reviewTotalCnt(int prodNo);
	
	//리뷰수정
	int modifyReview(ReviewVO rvo);
		
	//리뷰 등록
	int insertReview(ReviewVO rvo);
	
	//리뷰 평점
	Double avgScore(int prodNo);
	
}
