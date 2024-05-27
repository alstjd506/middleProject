package com.shop.member.mapper;

import org.apache.ibatis.annotations.Param;

import com.shop.vo.MemberVO;

public interface MemberMapper {

	MemberVO selectMember(@Param("userId")String id, @Param("userPw")String pw); //로그인
	
	String selectMember2(MemberVO mvo);	//아이디찾기

	String selectMember3(MemberVO mvo);	//비밀번호찾기

	int selectMember4(MemberVO mvo); //회원가입
	
	int selectMembermodify(MemberVO mvo); //회원정보


}