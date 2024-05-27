package com.shop.common;

import org.apache.ibatis.session.SqlSession;

import com.shop.admin.mapper.AdminMapper;

public class ProductTest {
	public static void main(String[] args) {
		SqlSession session = DataSource.getInstance().openSession(true);
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		int cno = mapper.adminPopulaReview();
		//System.out.println(cno);
		
		//mapper.adminUnprocessedCancle().forEach(list -> System.out.println("123"+list));
		System.out.println(mapper.adminProductInfo(4));
	}
}
