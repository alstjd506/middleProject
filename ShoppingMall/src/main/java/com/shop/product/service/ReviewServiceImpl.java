package com.shop.product.service;

import org.apache.ibatis.session.SqlSession;

import com.shop.common.DataSource;
import com.shop.product.mapper.ReviewMapper;
import com.shop.vo.ReviewVO;

public class ReviewServiceImpl implements ReviewService {
	SqlSession session = DataSource.getInstance().openSession(true);
	ReviewMapper mapper = session.getMapper(ReviewMapper.class);
	
	@Override
	public boolean addReview(ReviewVO review) {
		// TODO Auto-generated method stub
		return mapper.insertReview(review) == 1;
	}
	

	
}
