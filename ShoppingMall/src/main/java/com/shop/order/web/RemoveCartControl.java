package com.shop.order.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;
import com.shop.order.service.OrderService;
import com.shop.order.service.OrderServiceImpl;
import com.shop.vo.CartVO;

public class RemoveCartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		String prodNo = req.getParameter("prodNo");
		
		CartVO cvo = new CartVO();
		cvo.setUserId(userId);
		cvo.setProdNo(Integer.parseInt(prodNo));
		
		OrderService svc = new OrderServiceImpl();
		if(svc.removeCart(cvo)) {
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		} else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
		
	}

}
