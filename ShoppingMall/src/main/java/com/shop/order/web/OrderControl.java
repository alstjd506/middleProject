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
		
		String prodNo = req.getParameter("prodNo");
		req.setAttribute("prodNo", prodNo);
		String prodCnt = req.getParameter("prodCnt");
		req.setAttribute("prodCnt", prodCnt);

		req.getRequestDispatcher(path).forward(req, resp);
	}

}
