package com.shop.admin.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpUtils;

import com.shop.admin.service.AdminService;
import com.shop.admin.service.AdminServiceImpl;
import com.shop.common.Control;
import com.shop.vo.ProductVO;

public class AdminProductList implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AdminService svc = new AdminServiceImpl();
		
		List<ProductVO> list = svc.adminProductList();
		
		List<String> olist = new ArrayList<>();
		olist.add("상품명");
		olist.add("상품설명");
		olist.add("가격");
		olist.add("판매수량");
		olist.add("상품 등록일");
		olist.add("카테고리");
		
		req.setAttribute("productTitle", olist);
		req.setAttribute("productList", list);
		String path = "admin/adminMain.tiles";
		req.getRequestDispatcher(path).forward(req, resp);

	}

}
