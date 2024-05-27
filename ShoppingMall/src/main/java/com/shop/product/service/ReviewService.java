package com.shop.product.service;

import java.util.List;

import com.shop.common.SearchVO;
import com.shop.vo.ReviewVO;

public interface ReviewService {
	List<ReviewVO> reviewList(SearchVO search);
	boolean removeReview(int reviewNo);
	boolean addReview(ReviewVO review); //리뷰등록
	int TotalCount(int prodNo);
	boolean modifyReview(ReviewVO review);
	
	
	
}
