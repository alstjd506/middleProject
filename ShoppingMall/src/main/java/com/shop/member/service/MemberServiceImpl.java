package com.shop.member.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.shop.common.DataSource;
import com.shop.member.mapper.MemberMapper;
import com.shop.vo.MemberVO;
import com.shop.vo.ProductVO;

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

	@Override
	public List<ProductVO> mypageCart(String userId) {
		// TODO Auto-generated method stub
		return mapper.mypageCart(userId);
		
	}

	@Override
	public int mypageReviewCnt(String userId) {
		// TODO Auto-generated method stub
		return mapper.mypageReviewCnt(userId);
	}

	@Override
	public List<Map<String, Object>> mypageRecentOrderList(String userId) {
		// TODO Auto-generated method stub
		return mapper.mypageRecentOrderList(userId);
	}

	@Override
	public int mypageBoardY(String userId) {
		// TODO Auto-generated method stub
		return mapper.mypageBoardY(userId);
	}

	@Override
	public int mypageBoardN(String userId) {
		// TODO Auto-generated method stub
		return mapper.mypageBoardN(userId);
	}

	public List<Map<String, Object>> mypagePastOrderList(String userId) {
		// TODO Auto-generated method stub
		return mapper.mypagePastOrderList(userId);
	}

	@Override
	public List<Map<String, Object>> mypageOrderList(String userId) {
		// TODO Auto-generated method stub
		return mapper.mypageOrderList(userId);
	}

	@Override
	public List<Map<String, Object>> mypageReturnList(String userId) {
		// TODO Auto-generated method stub
		return mapper.mypageReturnList(userId);

	}

	@Override
	public boolean DeleteUser(MemberVO mvo) {
		// TODO Auto-generated method stub
		return false;
	}


}
