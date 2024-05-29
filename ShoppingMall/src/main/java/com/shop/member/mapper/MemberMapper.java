package com.shop.member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.shop.vo.BoardVO;
import com.shop.vo.MemberVO;
import com.shop.vo.OrderVO;
import com.shop.vo.ProductVO;

public interface MemberMapper {

	MemberVO selectMember(@Param("userId")String id, @Param("userPw")String pw); //로그인
	
	String selectMember2(MemberVO mvo);	//아이디찾기

	String selectMember3(MemberVO mvo);	//비밀번호찾기

	int selectMember4(MemberVO mvo); //회원가입
	
	int selectMembermodify(MemberVO mvo); //회원정보수정
	
	int deleteMember(String pw); //회원탈퇴

	//mypage
	List<ProductVO> mypageCart(String userId);
	int mypageReviewCnt(String userId);
	List<Map<String, Object>> mypageRecentOrderList(String userId); //최근 3일 조회
	List<Map<String, Object>> mypagePastOrderList(String userId); //3일 그전쭈욱
	List<Map<String, Object>> mypageOrderList(String userId); //주문/배송중인 상품조회
	List<Map<String, Object>> mypageReturnList(String userId); //취소/반품중인 상품조회
	List<Map<String, Object>> mypageOrderDetail(@Param("userId") String userId, @Param("orderNo") int orderNo);
	List<Map<String, Object>> mypageUserDetail(@Param("userId") String userId, @Param("orderNo") int orderNo);
	
	int mypageBoardY(String userId);
	int mypageBoardN(String userId);
	List<BoardVO> boardList(String userId);
	List<BoardVO> boardInfo(@Param("userId") String userId, @Param("boardNo") int boardNo);
	int updateBoard(BoardVO board);
}