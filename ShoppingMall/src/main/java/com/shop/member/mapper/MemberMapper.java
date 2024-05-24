package com.shop.member.mapper;

import org.apache.ibatis.annotations.Param;

import com.shop.vo.MemberVO;

public interface MemberMapper {

	MemberVO selectMember(@Param("id")String id, @Param("pw")String pw); //로그인
	
//	MemberVO selectMember2(@Param("name")String name, @Param("phone")String phone);	//아이디찾기
//	
//	MemberVO selectMember3(@Param("id")String id, @Param("name")String name, @Param("phone")String phone);	//비밀번호찾기
//	
//	MemberVO selectMember4(@Param("id")String id, @Param("pw")String pw, @Param("name")String name, //
//						   @Param("phone")String phone, @Param("post")int post, @Param("addr")String addr, @Param("detailaddr")String detailaddr);	//회원가입
}

