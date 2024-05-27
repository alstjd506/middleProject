package com.shop.admin.mapper;

import java.util.List;

import com.shop.vo.BoardVO;
import com.shop.vo.CategoryVO;
import com.shop.vo.MemberVO;
import com.shop.vo.OrderVO;
import com.shop.vo.ProductVO;
import com.shop.vo.ReplyVO;

public interface AdminMapper {
	List<ProductVO> adminProductList(); // 관리자 상품목록 
	int adminProductCnt(); // 관리자 상품총갯수
	List<MemberVO> adminMemberList(); // 관리자 회원목록 
	List<BoardVO> adminBoardList(); // 관리자 Q&A 목록
	BoardVO adminBoardInfo(int bno); //관리자 답글있는 Q&A 상세보기
	BoardVO adminBoardInfon(int bno); // 관리자 답글없는 Q&A 상세보기
	int adminReplyModi(ReplyVO rvo); // 관리자 답글 수정기능
	int adminBoardReply(ReplyVO rvo); // 관리자 Q&A 답글남기기기능
	int adminBoardReplyUp(int bno); // 관리자 Q&A 답변상태 update
	List<OrderVO> adminOrderList(); // 관리자주문목록
	int adminOrderStatus(int bno); // 관리자 주문상태 변경
	List<OrderVO> adminCancleList(); // 관리자주문취소목록
	int adminCancleAgree(int ono); // 관리자 주문취소승인
	List<OrderVO> adminReturnList(); // 관리자 반품목록
	int adminReturnAgree(int rno); // 관리자 반품승인
	List<CategoryVO> topAdminCategoryList(); // 관리자 상위카테고리목록
	List<CategoryVO> adminCategoryList(int cno);// 관리자 하위카테고리목록
	int adminAddProductControl(ProductVO pvo); //관리자 상품등록 기능
	List<OrderVO> adminUnprocessedOrder(); // 관리자 메인 미처리주문요청
	List<OrderVO> adminUnprocessedCancle(); // 관리자 메인 미처리취소요청
	List<OrderVO> adminUnprocessedReturns(); // 관리자 메인 미처리반품요청
	List<BoardVO> adminUnprocessedReply(); // 관리자 메인 미처리Q&A
	int adminPopularProduct();// 관리자 메인 인기상품
	int adminleastProduct(); // 관리자 메인 비인기상품

}
