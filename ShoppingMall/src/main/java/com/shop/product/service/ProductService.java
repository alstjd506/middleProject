package com.shop.product.service;

import java.util.List;

import com.shop.product.vo.ProductVO;

public interface ProductService {
	List<ProductVO> productList();
	List<ProductVO> productNewList();
	List<ProductVO> categoryList(int topCategory);
	List<ProductVO> productMdList();
	List<ProductVO> productCheapList();
}
