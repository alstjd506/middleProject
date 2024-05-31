package com.shop.product.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.shop.common.DataSource;
import com.shop.common.SearchVO;
import com.shop.product.mapper.ProductMapper;
import com.shop.product.mapper.ReviewMapper;
import com.shop.vo.ProductVO;

public class ProductServiceImpl implements ProductService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	ProductMapper mapper = session.getMapper(ProductMapper.class);
	ReviewMapper reviewMapper = session.getMapper(ReviewMapper.class);
	@Override
	public List<ProductVO> productList() {
		return mapper.productList();
	}
	@Override
	public List<ProductVO> productNewList() {
		return mapper.productNewList();
	}
	@Override
	public List<ProductVO> categoryList(int categoryCode) {
		return mapper.categoryList(categoryCode);
	}
	@Override
	public List<ProductVO> productMdList() {
		return mapper.productMdList();
	}
	@Override
	public List<ProductVO> productCheapList() {
		return mapper.productCheapList();
	}
	@Override
	public List<ProductVO> productInfo(int prodNo) {
		return mapper.productInfo(prodNo);
	}
	@Override
	public List<ProductVO> menuCategory(int categoryCode) {
		return mapper.menuCategory(categoryCode);
	}
	@Override
	public List<ProductVO> searchProduct(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.searchProduct(search);
	}
	@Override
	public int getTotal(SearchVO search) {
		// TODO Auto-generated method stub
		return mapper.getTotalCnt(search);
	}
	@Override
	public int updateProductScore(double avgScore, int prodNo) {
		// TODO Auto-generated method stub
		return mapper.updateProductScore(avgScore, prodNo);
	}

	public void updateProductAvgScore(int prodNo) {
	    Double avgScore = reviewMapper.avgScore(prodNo);
	    if (avgScore == null) {
	        avgScore = 0.0;
	    }
	    mapper.updateProductScore(avgScore, prodNo);
	}
}
