package com.shop.member.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.shop.vo.BoardVO;
import com.shop.vo.MemberVO;
import com.shop.vo.OrderVO;
import com.shop.vo.ProductVO;
import com.shop.vo.ReviewVO;

public interface MemberService {

	MemberVO login(String id, String pw);
	
	String FindId(MemberVO mvo);
	
	String FindPw(MemberVO mvo);
	
	boolean Join(MemberVO mvo);
	
	boolean ModifyUser(MemberVO mvo);

	boolean DeleteUser(MemberVO mvo);
	
	boolean DeleteUser(String password);
	
	//mypage
	List<ProductVO> mypageCart(String userId); //마이페이지 장바구니리스트
	int mypageReviewCnt(String userId); // 마이페이지 총 리뷰갯수
	List<Map<String, Object>> mypageRecentOrderList(String userId); //마이페이지 주문리스트
	int mypageBoardY(String userId); //q&a 답변 갯수
	int mypageBoardN(String userId); //q&a 미답변 갯수
	int myPageOrderCnt(String userId); //해당주문의 상품갯수
	List<Map<String, Object>> mypagePastOrderList(String userId); //3일 그전쭈욱
	List<Map<String, Object>> mypageOrderList(String userId); //주문/배송중인 상품조회
	List<Map<String, Object>> mypageReturnList(String userId); //취소/반품중인 상품조회
	List<Map<String, Object>> mypageOrderDetail(@Param("userId") String userId, @Param("orderNo") int orderNo);
	List<Map<String, Object>> mypageUserDetail(@Param("userId") String userId, @Param("orderNo") int orderNo);
	
	boolean cancleOrder(int orderNo);
	boolean confOrder(int orderNo);
	boolean returnOrder(int orderNo);
	
	
	
	List<BoardVO> boardList(String userId);
	List<BoardVO> boardInfo(@Param("userId") String userId, @Param("boardNo") int boardNo);
	boolean updateBoard(BoardVO board);
	
	List<Map<String, Object>> myPageReview(String userId);
	
}
