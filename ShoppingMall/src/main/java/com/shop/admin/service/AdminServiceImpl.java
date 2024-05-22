package com.shop.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.shop.admin.mapper.AdminMapper;
import com.shop.common.DataSource;

import com.shop.vo.BoardVO;

import com.shop.vo.MemberVO;
import com.shop.vo.ProductVO;

public class AdminServiceImpl implements AdminService {

	SqlSession session = DataSource.getInstance().openSession(true);
	AdminMapper mapper = session.getMapper(AdminMapper.class);

	public List<ProductVO> adminProductList() {
		return mapper.adminProductList();
	}

	@Override
	public List<MemberVO> adminMemberList() {
		return mapper.adminMemberList();
	}

	@Override
	public List<BoardVO> adminBoardList() {
		return mapper.adminBoardList();
	}
	@Override
	public BoardVO adminBoardInfo(int bno) {
		return mapper.adminBoardInfo(bno);

	}
}
