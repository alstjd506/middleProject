package com.shop.product.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;
import com.shop.product.service.ProductService;
import com.shop.product.service.ProductServiceImpl;

public class updateProductAvgScore implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=UTF-8");
		
		int prodNo = Integer.parseInt(req.getParameter("prodNo"));
		
		
        ProductService svc = new ProductServiceImpl();
        
        
        svc.updateProductAvgScore(prodNo);
        
        resp.getWriter().print("{\"result\":\"OK\"}");

	}

}
