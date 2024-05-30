package com.shop.order.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;
import com.shop.order.service.OrderService;
import com.shop.order.service.OrderServiceImpl;
import com.shop.vo.CartVO;

public class checkCartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		resp.setContentType("text/json;charset=utf-8");
		
		String userId = req.getParameter("userId");
		String prodNo = req.getParameter("prodNo");
		
		CartVO cart = new CartVO();
		cart.setProdNo(Integer.parseInt(prodNo));
		cart.setUserId(userId);
		
		OrderService svc = new OrderServiceImpl();
		if(svc.checkCart(cart)) {
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		}else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
		

	}
}
