package com.shop.member.service;

import java.util.List;
import java.util.Map;

import com.shop.vo.MemberVO;
import com.shop.vo.ProductVO;

public interface MemberService {

	MemberVO login(String id, String pw);
	
	String FindId(MemberVO mvo);
	
	String FindPw(MemberVO mvo);
	
	boolean Join(MemberVO mvo);
	
	boolean ModifyUser(MemberVO mvo);

	boolean DeleteUser(MemberVO mvo);
	
	//mypage
	List<ProductVO> mypageCart(String userId); //마이페이지 장바구니리스트
	int mypageReviewCnt(String userId); // 마이페이지 총 리뷰갯수
	List<Map<String, Object>> mypageRecentOrderList(String userId); //마이페이지 주문리스트
	int mypageBoardY(String userId); //q&a 답변 갯수
	int mypageBoardN(String userId); //q&a 미답변 갯수
	
	boolean DeleteUser(String password);


}
