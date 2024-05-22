package com.shop.product.service;

import java.util.List;

import com.shop.vo.ProductVO;

public interface ProductService {
	//메인화면
	List<ProductVO> productList();
	List<ProductVO> productNewList();
	List<ProductVO> categoryList(int topCategory);
	List<ProductVO> productMdList();
	List<ProductVO> productCheapList();
	
	//상품상세
	List<ProductVO> productInfo(int prodNo);
	
	
	
}
