package com.shop.product.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.shop.common.DataSource;
import com.shop.product.mapper.ProductMapper;
import com.shop.vo.ProductVO;

public class ProductServiceImpl implements ProductService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	ProductMapper mapper = session.getMapper(ProductMapper.class);
	@Override
	public List<ProductVO> productList() {
		return mapper.productList();
	}
	@Override
	public List<ProductVO> productNewList() {
		return mapper.productNewList();
	}
	@Override
	public List<ProductVO> categoryList(int topCategory) {
		return mapper.categoryList(topCategory);
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
	
}
