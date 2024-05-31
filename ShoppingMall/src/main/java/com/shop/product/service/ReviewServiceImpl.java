package com.shop.product.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.shop.common.DataSource;
import com.shop.common.SearchVO;
import com.shop.product.mapper.ReviewMapper;
import com.shop.vo.ReviewVO;

public class ReviewServiceImpl implements ReviewService {
	SqlSession session = DataSource.getInstance().openSession(true);
	ReviewMapper mapper = session.getMapper(ReviewMapper.class);
	ProductService productService = new ProductServiceImpl();
	
	@Override
	public List<ReviewVO> reviewList(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.reviewListPaging(search);
	}
	@Override
	public boolean addReview(ReviewVO review) {
		// TODO Auto-generated method stub
		boolean result = mapper.insertReview(review) == 1;
		if (result) {
			updateProductAvgScore(review.getProdNo());
		}
		return result;
	}


	@Override
	public boolean removeReview(int reviewNo) {
		// TODO Auto-generated method stub
		return mapper.deleteReview(reviewNo) == 1;
	}

	@Override
	public int TotalCount(int prodNo) {
		// TODO Auto-generated method stub
		return mapper.reviewTotalCnt(prodNo);
	}

	@Override
	public boolean modifyReview(ReviewVO review) {
		// TODO Auto-generated method stub
		return mapper.modifyReview(review) == 1;
	}
	@Override
	public double avgScore(int prodNo) {
		Double avgScore = mapper.avgScore(prodNo);
		if (avgScore != null)
			return avgScore;
		else
			return 0.0;
	}
	
	private void updateProductAvgScore(int prodNo) {
		Double avgScore = mapper.avgScore(prodNo);
		if (avgScore == null) {
			avgScore = 0.0;
		}
		productService.updateProductScore(avgScore, prodNo);
	}
	
	

	
}
