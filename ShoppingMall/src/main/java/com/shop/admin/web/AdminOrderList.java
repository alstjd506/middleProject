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

public class AdminOrderList implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = "admin/adminMain.tiles";
		
		AdminService svc = new AdminServiceImpl();
		
		List<String> olist = new ArrayList<>();
		olist.add("주문번호");
		olist.add("주문자 ID");
		olist.add("주문자 주소");
		olist.add("주문자 상세주소");
		olist.add("주문일자");
		olist.add("주문상태");
		
		List<OrderVO> list = svc.adminOrderList();
		req.setAttribute("orderTitle", olist);
		req.setAttribute("orderList", list);
		req.getRequestDispatcher(path).forward(req, resp);
		
	}

}
