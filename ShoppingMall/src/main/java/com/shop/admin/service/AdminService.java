package com.shop.admin.service;

import java.util.List;



import com.shop.vo.BoardVO;

import com.shop.vo.BoardVO;

import com.shop.vo.MemberVO;
import com.shop.vo.ProductVO;

public interface AdminService {
	List<ProductVO> adminProductList();
	List<MemberVO> adminMemberList();
	List<BoardVO> adminBoardList();
	BoardVO adminBoardInfo(int bno);

}
