package com.shop.admin.service;

import java.util.List;



import com.shop.vo.BoardVO;
import com.shop.vo.CategoryVO;
import com.shop.vo.BoardVO;

import com.shop.vo.MemberVO;
import com.shop.vo.OrderVO;
import com.shop.vo.ProductVO;

public interface AdminService {
	List<ProductVO> adminProductList();// 관리자 상품목록 
	List<MemberVO> adminMemberList(); // 관리자 회원목록 
	List<BoardVO> adminBoardList(); // 관리자 Q&A 목록
	BoardVO adminBoardInfo(int bno); //관리자 Q&A 상세보기
	List<OrderVO> adminOrderList(); // 관리자주문목록
	List<OrderVO> adminCancleList(); // 관리자주문취소목록
	boolean adminCancleAgree(int ono); // 관리자 주문취소승인
	List<OrderVO> adminReturnList(); // 관리자 반품목록
	boolean adminReturnAgree(int rno); // 관리자 반품승인
	List<CategoryVO> topAdminCategoryList(); // 관리자 상위카테고리목록
	List<CategoryVO> adminCategoryList(int cno);// 관리자 하위카테고리목록
	boolean adminAddProductControl(ProductVO pvo); //관리자 상품등록 기능
}
