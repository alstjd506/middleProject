package com.shop.order.web;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.shop.common.Control;
import com.shop.order.service.OrderService;
import com.shop.order.service.OrderServiceImpl;
import com.shop.vo.ProductVO;

public class OrderDirectControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		String prodNo = req.getParameter("prodNo");
				
		OrderService svc = new OrderServiceImpl();
		ProductVO pvo = svc.getProduct(Integer.parseInt(prodNo));
		
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(pvo));		
	}

}
