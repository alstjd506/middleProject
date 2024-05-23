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

public class AdminCancleList implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String path = "admin/adminMain.tiles";
		
		AdminService svc= new AdminServiceImpl();
		
		List<OrderVO> list = svc.adminCancleList();
		

		List<String> olist = new ArrayList<>();
		olist.add("주문번호");
		olist.add("주문자 ID");
		olist.add("취소일자");
		olist.add("취소상태");
		
		req.setAttribute("cancleTitle", olist);
		req.setAttribute("cancleList", list);
		req.getRequestDispatcher(path).forward(req, resp);
		
	}

}
