package com.shop.admin.mapper;

import java.util.List;

import com.shop.vo.MemberVO;
import com.shop.vo.ProductVO;

public interface AdminMapper {
	List<ProductVO> adminProductList();
	List<MemberVO> adminMemberList();
}
