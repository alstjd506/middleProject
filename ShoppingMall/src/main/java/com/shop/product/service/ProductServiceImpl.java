package com.shop.product.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.shop.common.DataSource;
import com.shop.product.mapper.ProductMapper;
import com.shop.product.vo.ProductVO;

public class ProductServiceImpl implements ProductService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	ProductMapper mapper = session.getMapper(ProductMapper.class);
	@Override
	public List<ProductVO> productList() {
		// TODO Auto-generated method stub
		return mapper.productList();
	}
	@Override
	public List<ProductVO> productNewList() {
		// TODO Auto-generated method stub
		return mapper.productNewList();
	}
	@Override
	public List<ProductVO> categoryList(int topCategory) {
		// TODO Auto-generated method stub
		return mapper.categoryList(topCategory);
	}
	@Override
	public List<ProductVO> productMdList() {
		// TODO Auto-generated method stub
		return mapper.productMdList();
	}
	@Override
	public List<ProductVO> productCheapList() {
		// TODO Auto-generated method stub
		return mapper.productCheapList();
	}
	
}
