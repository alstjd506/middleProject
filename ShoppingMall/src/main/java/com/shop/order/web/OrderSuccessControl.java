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

public class OrderSuccessControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "/order/orderSuccess.tiles";
		
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		String prodNo = req.getParameter("prodNo");
		
		OrderService svc = new OrderServiceImpl();
		
		String[] prodNoList = prodNo.split(",");
		
		for(int i = 0; i < prodNoList.length; i++) {
			CartVO cvo = new CartVO();
			cvo.setUserId(userId);
			cvo.setProdNo(Integer.parseInt(prodNoList[i]));
			
			svc.removeCart(cvo);
		}
		
		req.getRequestDispatcher(path).forward(req, resp);

	}

}
