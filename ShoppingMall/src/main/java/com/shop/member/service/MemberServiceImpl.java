package com.shop.member.service;

import org.apache.ibatis.session.SqlSession;

import com.shop.common.DataSource;
import com.shop.member.mapper.MemberMapper;
import com.shop.vo.MemberVO;

public class MemberServiceImpl implements MemberService{

	SqlSession session = DataSource.getInstance().openSession(true);
	MemberMapper mapper = session.getMapper(MemberMapper.class);
	@Override
	public MemberVO login(String id, String pw) {
		return mapper.selectMember(id, pw);
	}
	@Override
	public MemberVO FindId(String name, String phone) {
		return null;
	}
	@Override
	public MemberVO FindPw(String id, String name, String phone) {
		return null;
	}
	@Override
	public MemberVO Join(String id, String pw, String name, String phone, int post, String addr, String detailaddr) {
		return null;
	}
	
	
	
//	@Override
//	public MemberVO FindId(String name, String phone) {
//			return mapper.selectMember2(name, phone);
//	}
//
//	@Override
//	public MemberVO FindPw(String id, String name, String phone) {
//		return mapper.selectMember3(id, name, phone);
//	}
//
//	@Override
//	public MemberVO Join(String id, String pw, String name, String phone, int post, String addr, String detailaddr) {
//		return mapper.selectMember4(id, pw, name, phone, post, addr, detailaddr);
//	}
	
	
	
}
