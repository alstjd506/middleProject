package com.shop.product.service;

import java.util.List;

import com.shop.common.SearchVO;
import com.shop.vo.ReviewVO;

public interface ReviewService {
	List<ReviewVO> reviewList(SearchVO search); //리뷰 리스트
	boolean removeReview(int reviewNo); //리뷰삭제
	boolean addReview(ReviewVO review); //리뷰등록
	int TotalCount(int prodNo); //리뷰 총갯수
	boolean modifyReview(ReviewVO review); //리뷰수정
	
	double avgScore(int prodNo);
	
	
}
