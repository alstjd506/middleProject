package com.shop.product.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.shop.common.SearchVO;
import com.shop.vo.ProductVO;

public interface ProductMapper {
	//메인화면
	List<ProductVO> productList(); //인기목록
	List<ProductVO> productNewList(); //최근등록
	List<ProductVO> categoryList(int categoryCode);
	List<ProductVO> productMdList();
	List<ProductVO> productCheapList();
	
	//메뉴바선택
	List<ProductVO> menuCategory(int categoryCode);

	//상품상세
	List<ProductVO> productInfo(int prodNo);
	
	//검색
	List<ProductVO> searchProduct(SearchVO search);
	int getTotalCnt(SearchVO search);
	
	int updateProductScore(@Param("avgScore") double avgScore, @Param("prodNo") int prodNo);

	//리스트 필터 적용
	List<ProductVO> filterProductTopList(Map<String, Object> params);
	List<ProductVO> filterProductList(Map<String, Object> params);	

}
