package com.shop.product.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;
import com.shop.product.service.ReviewService;
import com.shop.product.service.ReviewServiceImpl;

public class TotalCountControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String prodNo = req.getParameter("prodNo");
		
		ReviewService svc = new ReviewServiceImpl();
		int cnt = svc.TotalCount(Integer.parseInt(prodNo));
		
		resp.getWriter().print("{\"totalCount\":" + cnt + "}");
		
		
	}

}
