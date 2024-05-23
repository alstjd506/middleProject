package com.shop.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.shop.admin.mapper.AdminMapper;
import com.shop.common.DataSource;
import com.shop.vo.BoardVO;
import com.shop.vo.CategoryVO;
import com.shop.vo.MemberVO;
import com.shop.vo.OrderVO;
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

	@Override
	public List<OrderVO> adminOrderList() {
		return mapper.adminOrderList();
	}

	@Override
	public List<OrderVO> adminCancleList() {
		return mapper.adminCancleList();
	}
	@Override
	public boolean adminCancleAgree(int ono) {
		return mapper.adminCancleAgree(ono)==1;
	}
	@Override
	public List<OrderVO> adminReturnList() {
		return mapper.adminReturnList();
	}
	@Override
	public boolean adminReturnAgree(int rno) {
		return mapper.adminReturnAgree(rno)==1;
	}
	@Override
	public List<CategoryVO> topAdminCategoryList() {
		return mapper.topAdminCategoryList();
	}
	@Override
	public List<CategoryVO> adminCategoryList(int cno) {
		return mapper.adminCategoryList(cno);
	}
	@Override
	public boolean adminAddProductControl(ProductVO pvo) {
		return mapper.adminAddProductControl(pvo)==1;
	}
}
