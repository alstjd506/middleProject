package com.shop.member.service;

import org.apache.ibatis.session.SqlSession;

import com.shop.common.DataSource;
import com.shop.member.mapper.MemberMapper;
import com.shop.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	SqlSession session = DataSource.getInstance().openSession(true);
	MemberMapper mapper = session.getMapper(MemberMapper.class);

	@Override
	public MemberVO login(String id, String pw) {
		return mapper.selectMember(id, pw);
	}
	
	@Override
	public String FindId(MemberVO mvo) {
		return mapper.selectMember2(mvo);
	}

	@Override
	public String FindPw(MemberVO mvo) {
		return mapper.selectMember3(mvo);
	}

	@Override
	public boolean Join(MemberVO mvo) {
		return mapper.selectMember4(mvo)==1;
	}

	@Override
	public boolean ModifyUser(MemberVO mvo) {
		return mapper.selectMembermodify(mvo)==1;
	}

	@Override
	public boolean DeleteUser(String pw) {
		return mapper.deleteMember(pw)==1;
	}



}
