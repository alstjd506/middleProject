package com.shop.order.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;

public class OrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "/order/order.tiles";
		
		String prodNoList = req.getParameter("prodNo");
		System.out.println(prodNoList);
		
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
