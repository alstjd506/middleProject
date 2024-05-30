package com.shop.order.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.common.Control;
import com.shop.order.service.OrderService;
import com.shop.order.service.OrderServiceImpl;
import com.shop.vo.CartVO;

public class checkCartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		
		if(userId == null) {
			resp.getWriter().print("{\"retCode\": \"NG\"}");			
		} else {
			String prodNo = req.getParameter("prodNo");
			
			CartVO cart = new CartVO();
			cart.setUserId(userId);
			cart.setProdNo(Integer.parseInt(prodNo));
			
			OrderService svc = new OrderServiceImpl();
			if(svc.checkCart(cart)) {
				resp.getWriter().print("{\"retCode\": \"OK\"}");
			} else {
				resp.getWriter().print("{\"retCode\": \"NG\"}");
			}
		}
		
		

	}
}
