package com.shop.member.service;

import com.shop.vo.MemberVO;

public interface MemberService {

	MemberVO login(String id, String pw);
	MemberVO FindId(String name, String phone);
	MemberVO FindPw(String id, String name, String phone);
	MemberVO Join(String id, String pw, String name, String phone, int post, String addr, String detailaddr);

}
