package com.shop.member.service;

import com.shop.vo.MemberVO;

public interface MemberService {

	MemberVO login(String id, String pw);
	
	String FindId(MemberVO mvo);
	
	String FindPw(MemberVO mvo);
	
	boolean Join(MemberVO mvo);
	
	boolean ModifyUser(MemberVO mvo);

	boolean DeleteUser(String password);


}
