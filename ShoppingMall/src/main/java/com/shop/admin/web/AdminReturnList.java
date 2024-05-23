package com.shop.admin.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.admin.service.AdminService;
import com.shop.admin.service.AdminServiceImpl;
import com.shop.common.Control;
import com.shop.vo.OrderVO;

public class AdminReturnList implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AdminService svc = new AdminServiceImpl();
		
		List<String> olist = new ArrayList<>();
		olist.add("주문번호");
		olist.add("주문자 ID");
		olist.add("반품일자");
		olist.add("반품상태");
		
		List<OrderVO> list = svc.adminReturnList();

		String path = "admin/adminMain.tiles";
		req.setAttribute("returnTitle", olist);
		req.setAttribute("orderReturn", list);
		req.getRequestDispatcher(path).forward(req, resp);

	}

}
