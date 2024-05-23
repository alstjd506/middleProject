package com.shop.member.mapper;

import com.shop.vo.MemberVO;

public interface MemberMapper {

	MemberVO selectMember(String id, String pw);	//로그인
	MemberVO selectMember2(String name, String phone);	//아이디찾기
	MemberVO selectMember3(String id, String name, String phone);	//비밀번호찾기
	MemberVO selectMember4(String id, String pw, String name, String phone, int post, String addr, String detailaddr);	//회원가입
}

