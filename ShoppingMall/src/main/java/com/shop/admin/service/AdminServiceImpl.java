package com.shop.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.shop.admin.mapper.AdminMapper;
import com.shop.common.DataSource;
import com.shop.vo.ProductVO;

public class AdminServiceImpl implements AdminService {

	SqlSession session = DataSource.getInstance().openSession(true);
	AdminMapper mapper = session.getMapper(AdminMapper.class);

	public List<ProductVO> adminProductList() {
		return mapper.adminProductList();
	}
}
