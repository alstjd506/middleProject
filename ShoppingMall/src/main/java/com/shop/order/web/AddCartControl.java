package com.shop.order.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;
import com.shop.order.service.OrderService;
import com.shop.order.service.OrderServiceImpl;
import com.shop.vo.CartVO;

public class AddCartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		String prodNo = req.getParameter("prodNo");
		String cartCnt = req.getParameter("cartCnt");
		
		CartVO cvo = new CartVO();
		cvo.setUserId(userId);
		cvo.setProdNo(Integer.parseInt(prodNo));
		cvo.setCartCnt(Integer.parseInt(cartCnt));
		
		OrderService svc = new OrderServiceImpl();
		if(svc.addCart(cvo)) {
			// {"retCode": "OK"}
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		} else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");			
		}		

	}

}
