package com.shop.order.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.shop.common.Control;
import com.shop.order.service.OrderService;
import com.shop.order.service.OrderServiceImpl;

public class CartListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		String userId = req.getParameter("userId");
		
		OrderService svc = new OrderServiceImpl();
		List<Map<String, Object>> list = svc.cartList(userId);
		
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(list));
	}

}
