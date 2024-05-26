package com.shop.product.service;

import java.util.List;

import com.shop.common.SearchVO;
import com.shop.vo.ProductVO;

public interface ProductService {
	//메인화면
	List<ProductVO> productList();
	List<ProductVO> productNewList();
	List<ProductVO> categoryList(int categoryCode);
	List<ProductVO> productMdList();
	List<ProductVO> productCheapList();
	
	//메뉴바선택
	List<ProductVO> menuCategory(int categoryCode);

	
	//상품상세
	List<ProductVO> productInfo(int prodNo);
	
	//상품검색
	List<ProductVO> searchProduct(SearchVO search);
	int getTotal(SearchVO search);
	
	
}
